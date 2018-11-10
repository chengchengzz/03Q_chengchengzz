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

/**
 * 文章列表
 */
class TagArclist extends Base
{
    public $tid = '';

    //初始化
    protected function _initialize()
    {
        parent::_initialize();
        $this->tid = I("param.tid/s", ''); // 应用于栏目列表
        /*应用于文档列表*/
        $aid = I('param.aid/d', 0);
        if ($aid > 0) {
            $this->tid = M('archives')->where('aid', $aid)->getField('typeid');
        }
        /*--end*/
        /*tid为目录名称的情况下*/
        $this->tid = $this->getTrueTypeid($this->tid);
        /*--end*/
    }

    /**
     * 获取多条记录
     * @author wengxianhu by 2018-4-20
     */
    public function getArclist($param = array(),  $limit = 15, $orderby = '')
    {
        $result = false;

        $channeltype = !empty($param['channel']) ? $param['channel'] : '';
        $typeid = $param['typeid'] = !empty($param['typeid']) ? $param['typeid'] : $this->tid;

        if (!empty($channeltype)) { // 如果指定了频道ID，则频道下的所有文档都展示
            unset($param['typeid']);
        } else {
            unset($param['channel']);
            if (!empty($typeid)) {
                $typeidArr = explode(',', $typeid);
                if (count($typeidArr) == 1) {
                    $channel_info = M('Arctype')->field('id,current_channel')->where(array('id'=>array('eq', $typeid)))->find();
                    if (empty($channel_info)) {
                        echo '标签arclist报错：指定属性 typeid 的栏目ID不存在。';
                        return false;
                    }
                    $channeltype = !empty($channel_info) ? $channel_info["current_channel"] : ''; // 当前栏目ID所属模型ID

                    /*获取当前栏目下的所有同模型的子孙栏目*/
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
/*                    $firstTypeid = $typeidArr[0];
                    $firstTypeid = M('Arctype')->where(array('id|dirname'=>array('eq', $firstTypeid)))->getField('id');
                    $channeltype = M('Arctype')->where(array('id'=>array('eq', $firstTypeid)))->getField('current_channel');*/
                }
            }
        }

/*        if (empty($typeid) && empty($channeltype)) {
            echo '标签arclist报错：至少指定属性 typeid | channelid 任何一个。';
            return $result;
        }*/

        // 查询条件
        $condition = array();
        foreach (array('keywords','typeid','flag','noflag','channel') as $key) {
            if (isset($param[$key]) && $param[$key] !== '') {
                if ($key == 'keywords') {
                    array_push($condition, "a.title LIKE %{$param[$key]}%");
                } elseif ($key == 'typeid') {
                    array_push($condition, "a.typeid IN ({$typeid})");
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
        // array_push($condition, "a.channel = {$channeltype}");
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

        // 获取查询的控制器名
        $channeltype_info = model('Channeltype')->getInfo($channeltype, 'id,table,ctl_name');
        $controller_name = $channeltype_info['ctl_name'];

        switch ($channeltype) {
            case '-1':
            {
                break;
            }
            
            default:
            {
                $field = "b.*, a.*";
                $result = db('archives')
                    ->field($field)
                    ->alias('a')
                    ->join('__ARCTYPE__ b', 'b.id = a.typeid', 'LEFT')
                    ->where($where_str)
                    ->order($orderby)
                    ->limit($limit)
                    ->select();
                foreach ($result as $key => $val) {
                    /*栏目链接*/
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
                        $val['litpic'] = get_default_pic($val['litpic']); // 默认封面图
                        $val['is_litpic'] = 0; // 无封面图
                    } else {
                        $val['is_litpic'] = 1; // 有封面图
                    }
                    /*--end*/

                    $result[$key] = $val;
                }

                break;
            }
        }

        return $result;
    }
}