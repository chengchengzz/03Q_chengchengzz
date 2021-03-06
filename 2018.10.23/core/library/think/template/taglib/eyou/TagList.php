<?php
/**
 * 易优CMS
 * ============================================================================
 * 版权所有 2016-2028 海南赞赞网络科技有限公司，并保留所有权利。
 * 网站地址: http://www.eyoucms.com
 * ----------------------------------------------------------------------------
 * 如果商业用途务必到官方购买正版授权, 以免引起不必要的法律纠纷.
 * ============================================================================
 * Author: 小虎哥 <1105415366@qq.com>
 * Date: 2018-4-3
 */

namespace think\template\taglib\eyou;

use think\Page;
use think\Request;
use app\home\logic\FieldLogic;

/**
 * 文章分页列表
 */
class TagList extends Base
{
    public $tid = '';
    public $fieldLogic;
    
    //初始化
    protected function _initialize()
    {
        parent::_initialize();
        $this->fieldLogic = new FieldLogic();
        $this->tid = I('param.tid/s', '');
        /*应用于文档列表*/
        $aid = I('param.aid/d', 0);
        if ($aid > 0) {
            $this->tid = M('archives')->where('aid', $aid)->getField('typeid');
        }
        /*--end*/
        /*typeid|tid为目录名称的情况下*/
        $this->tid = $this->getTrueTypeid($this->tid);
        /*--end*/
    }

    /**
     * 获取分页列表
     * @author wengxianhu by 2018-4-20
     */
    public function getList($param = array(), $pagesize = 10, $orderby = '', $addfields = '')
    {
        $module_name_tmp = strtolower(request()->module());
        $ctl_name_tmp = strtolower(request()->controller());
        $action_name_tmp = strtolower(request()->action());

        /*搜索、标签搜索*/
        if (in_array($ctl_name_tmp, array('search','tags'))) {
            return $this->getSearchList($pagesize, $orderby);
        }
        /*--end*/

        $result = false;

        $channeltype = !empty($param['channel']) ? $param['channel'] : '';
        $typeid = $param['typeid'] = !empty($param['typeid']) ? $param['typeid'] : $this->tid;
        /*不指定模型ID、栏目ID，默认显示所有可以发布文档的模型ID下的文档*/
        if (empty($channeltype) && empty($typeid)) {
            $allow_release_channel = config('global.allow_release_channel');
            $channeltype = $param['channel'] = implode(',', $allow_release_channel);
        }
        /*--end*/

        // 如果指定了频道ID，则频道下的所有文档都展示
        if (!empty($channeltype)) { // 优先展示模型下的文章
            unset($param['typeid']);
        } elseif (!empty($typeid)) { // 其次展示栏目下的文章
            unset($param['channel']);
            $typeidArr = explode(',', $typeid);
            if (count($typeidArr) == 1) {
                $channel_info = M('Arctype')->field('id,current_channel')->where(array('id'=>$typeid))->find();
                if (empty($channel_info)) {
                    echo '标签list报错：指定属性 typeid 的栏目ID不存在。';
                    return false;
                }
                $channeltype = !empty($channel_info) ? $channel_info["current_channel"] : '';

                /*获取当前栏目下的所有子孙栏目*/
                $arctype_list = model("Arctype")->getHasChildren($channel_info['id'], $channeltype);
                foreach ($arctype_list as $key => $val) {
                    if ($channeltype != $val['current_channel']) {
                        unset($arctype_list[$key]);
                    }
                }
                $typeids = get_arr_column($arctype_list, "id");
                $typeid = implode(",", $typeids);
                /*--end*/
            } elseif (count($typeidArr) > 1) {
/*                $firstTypeid = $typeidArr[0];
                $firstTypeid = M('Arctype')->where(array('id|dirname'=>array('eq', $firstTypeid)))->getField('id');
                $channeltype = M('Arctype')->where(array('id'=>array('eq', $firstTypeid)))->getField('current_channel');*/
            }
        } else { // 再次展示控制器对应的模型文章
            $controller_name = request()->controller();
            $channeltype_info = model('Channeltype')->getInfoByWhere(array('ctl_name'=>$controller_name), 'id');
            if (!empty($channeltype_info)) {
                $channeltype = $channeltype_info['id'];
                $param['channel'] = $channeltype;
            }
        }
        
/*        if (empty($typeid) && empty($channeltype)) {
            echo '标签list报错：至少指定属性 typeid | channelid 任何一个。';
            return $result;
        }*/

        // 查询条件
        $condition = array();
        foreach (array('keywords','typeid','notypeid','flag','noflag','channel') as $key) {
            if (isset($param[$key]) && $param[$key] !== '') {
                if ($key == 'keywords') {
                    array_push($condition, "a.title LIKE %{$param[$key]}%");
                } elseif ($key == 'channel') {
                    array_push($condition, "a.channel IN ({$channeltype})");
                } elseif ($key == 'typeid') {
                    array_push($condition, "a.typeid IN ({$typeid})");
                } elseif ($key == 'notypeid') {
                    $param[$key] = str_replace('，', ',', $param[$key]);
                    array_push($condition, "a.typeid NOT IN (".$param[$key].")");
                } elseif ($key == 'flag') {
                    $flag_arr = explode(",", $param[$key]);
                    $where_or_flag = array();
                    foreach ($flag_arr as $k2 => $v2) {
                        if ($v2 == "c") {
                            array_push($where_or_flag, "a.is_recom = 1");
                        } elseif ($v2 == "h") {
                            array_push($where_or_flag, "a.is_head = 1");
                        } elseif ($v2 == "a") {
                            array_push($where_or_flag, "a.is_special = 1");
                        } elseif ($v2 == "j") {
                            array_push($where_or_flag, "a.is_jump = 1");
                        }
                    }
                    if (!empty($where_or_flag)) {
                        $where_flag_str = " (".implode(" OR ", $where_or_flag).") ";
                        array_push($condition, $where_flag_str);
                    } 
                } elseif ($key == 'noflag') {
                    $flag_arr = explode(",", $param[$key]);
                    $where_or_flag = array();
                    foreach ($flag_arr as $nk2 => $nv2) {
                        if ($nv2 == "c") {
                            array_push($where_or_flag, "a.is_recom <> 1");
                        } elseif ($nv2 == "h") {
                            array_push($where_or_flag, "a.is_head <> 1");
                        } elseif ($nv2 == "a") {
                            array_push($where_or_flag, "a.is_special <> 1");
                        } elseif ($nv2 == "j") {
                            array_push($where_or_flag, "a.is_jump <> 1");
                        }
                    }
                    if (!empty($where_or_flag)) {
                        $where_flag_str = " (".implode(" OR ", $where_or_flag).") ";
                        array_push($condition, $where_flag_str);
                    }
                } else {
                    array_push($condition, "a.{$key} = '".$param[$key]."'");
                }
            }
        }
        array_push($condition, "a.arcrank > -1");
        array_push($condition, "a.status = 1");
        $where_str = "";
        if (0 < count($condition)) {
            $where_str = implode(" AND ", $condition);
        }

        // 给排序字段加上表别名
        switch ($orderby) {
            case 'hot':
            case 'click':
                $orderby = 'a.click desc';
                break;

            case 'now':
            case 'aid':
            case 'sortrank':
            case 'pubdate':
                $orderby = 'a.aid desc';
                break;

            case 'scores':
            case 'sort_order':
                $orderby = 'a.sort_order asc';
                
            case 'rand':
                $orderby = 'rand()';
            
            default:
                {
                    if (empty($orderby)) {
                        $orderby = 'a.sort_order asc, a.aid desc';
                    } elseif (trim($orderby) != 'rand()') {
                        $orderbyArr = explode(',', $orderby);
                        foreach ($orderbyArr as $key => $val) {
                            $val = trim($val);
                            if (preg_match('/^([a-z]+)\./i', $val) == 0) {
                                $val = 'a.'.$val;
                                $orderbyArr[$key] = $val;
                            }
                        }
                        $orderby = implode(',', $orderbyArr);
                    }
                }
                break;
        }

        // 获取查询的表名
        $channeltype_info = model('Channeltype')->getInfo($channeltype, 'id,table,ctl_name');
        $controller_name = $channeltype_info['ctl_name'];
        $channeltype_table = $channeltype_info['table'];

        switch ($channeltype) {
            case '-1':
            {
                break;
            }
            
            default:
            {
                $list = array();
                $query_get = array();

                /*列表分页URL问号的查询部分*/
                $get_arr = I('get.');
                foreach ($get_arr as $key => $val) {
                    if (empty($val) || stristr($key, '/')) {
                        unset($get_arr[$key]);
                    }
                }
                $param_arr = I('param.');
                foreach ($param_arr as $key => $val) {
                    if (empty($val) || stristr($key, '/')) {
                        unset($param_arr[$key]);
                    }
                }
                $seo_pseudo = tpCache('seo.seo_pseudo');
                if ($seo_pseudo == 1) { // 动态URL模式
                    $query_get = $get_arr;
                } elseif ($seo_pseudo == 3) { // 伪静态URL模式
                    $uiset = I('param.uiset/s', 'off');
                    $uiset = trim($uiset, '/');
                    if ($uiset == 'on') {// 装修模式下的分类URL
                        $query_get = $get_arr;
                    } else {
                        /*正常模式下的分页链接*/
/*                        $diff_arr = array_diff_key($param_arr, $get_arr);
                        if (empty($diff_arr)) {
                            $query_get = array();
                        } else {
                            $query_get = $get_arr;
                        }*/
                        /*--end*/
                        $query_get = array();
                    }
                } elseif ($seo_pseudo == 2) {
                    $query_get = array();
                }
                /*--end*/

                $paginate_type = config('paginate.type');
                if (THEME_STYLE == 'mobile') {
                    $paginate_type = 'mobile';
                }
                $paginate = array(
                    'type'  => $paginate_type,
                    'var_page' => config('paginate.var_page'),
                    'query' => $query_get,
                );
                $field = "b.*, a.*";
                $pages = db('archives')
                    ->field($field)
                    ->alias('a')
                    ->join('__ARCTYPE__ b', 'b.id = a.typeid', 'LEFT')
                    ->where($where_str)
                    ->order($orderby)
                    ->paginate($pagesize, false, $paginate);
                // $cacheKey = strtolower('taglist_lastPage_'.$module_name_tmp.$ctl_name_tmp.$action_name_tmp.$this->tid);
                // cache($cacheKey, $pages->lastPage()); // 用于静态页面的分页生成

                $aidArr = array();
                foreach ($pages->items() as $key => $val) {
                    /*获取指定路由模式下的URL*/
                    if ($val['is_part'] == 1) {
                        $val['typeurl'] = $val['typelink'];
                    } else {
                        $val['typeurl'] = typeurl(MODULE_NAME.'/'.$controller_name."/lists", $val);
                    }
                    /*--end*/
                    /*文档链接*/
                    if ($val['is_jump'] == 1) {
                        $val['arcurl'] = $val['jumplinks'];
                    } else {
                        $val['arcurl'] = arcurl(MODULE_NAME.'/'.$controller_name.'/view', $val);
                    }
                    /*--end*/
                    /*封面图*/
                    if (empty($val['litpic'])) {
                        $val['is_litpic'] = 0; // 无封面图
                    } else {
                        $val['is_litpic'] = 1; // 有封面图
                    }
                    $val['litpic'] = get_default_pic($val['litpic']); // 默认封面图
                    /*--end*/
                    
                    $list[$key] = $val;

                    array_push($aidArr, $val['aid']); // 文档ID数组
                }

                /*附加表*/
                if (!empty($addfields) && !empty($aidArr)) {
                    $addfields = str_replace('，', ',', $addfields); // 替换中文逗号
                    $addfields = trim($addfields, ',');
                    $tableContent = $channeltype_table.'_content';
                    $rowExt = M($tableContent)->field("aid,$addfields")->where('aid','in',$aidArr)->getAllWithIndex('aid');
                    /*自定义字段的数据格式处理*/
                    $rowExt = $this->fieldLogic->getChannelFieldList($rowExt, $channeltype);
                    /*--end*/
                    foreach ($list as $key => $val) {
                        $valExt = !empty($rowExt[$val['aid']]) ? $rowExt[$val['aid']] : array();
                        $val = array_merge($valExt, $val);
                        $list[$key] = $val;
                    }
                }
                /*--end*/

                /*针对下载列表*/
                if (!empty($aidArr) && strtolower($controller_name) == 'download') {
                    $result = M('download_file')->where(array('aid'=>array('IN', $aidArr)))
                        ->order('aid asc, sort_order asc')
                        ->select();
                    $downloadFileArr = array();
                    if (!empty($result)) {
                        /*获取指定文档ID的下载文件列表*/
                        foreach ($result as $key => $val) {
                            if (!isset($downloadFileArr[$val['aid']]) || empty($downloadFileArr[$val['aid']])) {
                                $downloadFileArr[$val['aid']] = array();
                            }
                            $val['downurl'] = url("home/{$controller_name}/downfile", array('id'=>$val['file_id'], 'uhash'=>$val['uhash']));
                            $downloadFileArr[$val['aid']][] = $val;
                        }
                        /*--end*/
                        /*将组装好的文件列表与文档相关联*/
                        foreach ($list as $key => $val) {
                            $list[$key]['file_list'] = $downloadFileArr[$val['aid']];
                        }
                        /*--end*/
                    }
                }
                /*--end*/

                $result['pages'] = $pages; // 分页显示输出
                $result['list'] = $list; // 赋值数据集

                break;
            }
        }

        return $result;
    }

    /**
     * 获取搜索分页列表
     * @author wengxianhu by 2018-4-20
     */
    public function getSearchList($pagesize = 10, $orderby = '', $addfields = '')
    {
        $result = false;

        $condition = array();
        // 获取到所有URL参数
        $param = I('param.');

        if (strtolower(request()->controller()) == 'tags') {
            $tag = I('param.tag/s', '');
            $tagid = I('param.tagid/d', 0);
            if (!empty($tag)) {
                $tagidArr = M('tagindex')->where(array('tag'=>array('LIKE', "%{$tag}%")))->column('id', 'id');
                $aidArr = M('taglist')->field('aid')->where(array('tid'=>array('in', $tagidArr)))->column('aid', 'aid');
                $condition['aid'] = array('in', $aidArr);
            } elseif ($tagid > 0) {
                $aidArr = M('taglist')->field('aid')->where(array('tid'=>array('eq', $tagid)))->column('aid', 'aid');
                $condition['aid'] = array('in', $aidArr);
            }
        }

        // 应用搜索条件
        foreach (['keywords','typeid','notypeid','channel'] as $key) {
            if (isset($param[$key]) && $param[$key] !== '') {
                if ('keywords' == $key) {
                    $keywords = trim($param[$key]);
                    $condition['a.title'] = array('LIKE', "%{$keywords}%");
                } else if (in_array($key, array('typeid','channel'))) {
                    $param[$key] = str_replace('，', ',', $param[$key]);
                    $condition['a.'.$key] = array('in', $param[$key]);
                } elseif ($key == 'notypeid') {
                    $param[$key] = str_replace('，', ',', $param[$key]);
                    $condition['a.typeid'] = array('not in', $param[$key]);
                } else {
                    $condition['a.'.$key] = array('eq', $param[$key]);
                }
            }
        }
        $condition['a.arcrank'] = array('gt', -1);
        $condition['a.status'] = array('eq', 1);

        // 给排序字段加上表别名
        if (empty($orderby)) {
            $orderby = 'a.sort_order asc, a.aid desc';
        } else {
            $orderbyArr = explode(',', $orderby);
            foreach ($orderbyArr as $key => $val) {
                $val = trim($val);
                if (preg_match('/^([a-z]+)\./i', $val) == 0) {
                    $val = 'a.'.$val;
                    $orderbyArr[$key] = $val;
                }
            }
            $orderby = implode(',', $orderbyArr);
        }

        /**
         * 数据查询，搜索出主键ID的值
         */
        $list = array();
        $query_get = I('get.');
        $paginate_type = config('paginate.type');
        if (THEME_STYLE == 'mobile') {
            $paginate_type = 'mobile';
        }
        $paginate = array(
            'type'  => $paginate_type,
            'var_page' => config('paginate.var_page'),
            'query' => $query_get,
        );
        $pages = db('archives')
            ->field("a.aid")
            ->alias('a')
            ->join('__ARCTYPE__ b', 'b.id = a.typeid', 'LEFT')
            ->where($condition)
            ->order($orderby)
            ->paginate($pagesize, false, $paginate);

        /**
         * 完善数据集信息
         * 在数据量大的情况下，经过优化的搜索逻辑，先搜索出主键ID，再通过ID将其他信息补充完整；
         */
        if ($pages->total() > 0) {
            $list = $pages->items();
            $aids = get_arr_column($list, 'aid');
            $fields = "b.*, a.*";
            $row = db('archives')
                ->field($fields)
                ->alias('a')
                ->join('__ARCTYPE__ b', 'a.typeid = b.id', 'LEFT')
                ->where('a.aid', 'in', $aids)
                ->getAllWithIndex('aid');
            // 获取模型对应的控制器名称
            $channel_list = model('Channeltype')->getAll('id, ctl_name', array(), 'id');

            foreach ($list as $key => $val) {
                $arcval = $row[$val['aid']];
                $controller_name = $channel_list[$arcval['channel']]['ctl_name'];
                /*获取指定路由模式下的URL*/
                if ($arcval['is_part'] == 1) {
                    $arcval['typeurl'] = $arcval['typelink'];
                } else {
                    $arcval['typeurl'] = typeurl(MODULE_NAME.'/'.$controller_name."/lists", $arcval);
                }
                /*--end*/
                /*文档链接*/
                if ($arcval['is_jump'] == 1) {
                    $arcval['arcurl'] = $arcval['jumplinks'];
                } else {
                    $arcval['arcurl'] = arcurl(MODULE_NAME.'/'.$controller_name."/view", $arcval);
                }
                /*--end*/
                /*封面图*/
                if (empty($arcval['litpic'])) {
                    $arcval['is_litpic'] = 0; // 无封面图
                } else {
                    $arcval['is_litpic'] = 1; // 有封面图
                }
                $arcval['litpic'] = get_default_pic($arcval['litpic']); // 默认封面图
                /*--end*/

                $list[$key] = $arcval;
            }
        }
        $result['pages'] = $pages; // 分页显示输出
        $result['list'] = $list; // 赋值数据集

        return $result;
    }
}