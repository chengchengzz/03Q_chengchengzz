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

namespace app\admin\controller;

use think\Page;
use think\Db;
use app\common\logic\ArctypeLogic;

class Article extends Base
{
    // 模型标识
    public $nid = 'article';
    // 模型ID
    public $channeltype = '';
    
    public function _initialize() {
        parent::_initialize();
        $channeltype_list = config('global.channeltype_list');
        $this->channeltype = $channeltype_list[$this->nid];
    }

    /**
     * 文章列表
     */
    public function index()
    {
        $assign_data = array();
        $condition = array();
        // 获取到所有GET参数
        $get = I('get.');
        $flag = I('flag/s');
        $typeid = I('typeid/d', 0);
        $begin = strtotime(I('add_time_begin'));
        $end = strtotime(I('add_time_end'));

        // 应用搜索条件
        foreach (['keywords','typeid','flag'] as $key) {
            if (isset($get[$key]) && $get[$key] !== '') {
                if ($key == 'keywords') {
                    $condition['a.title'] = array('LIKE', "%{$get[$key]}%");
                } else if ($key == 'typeid') {
                    $result = model('Arctype')->getHasChildren($get[$key]);
                    $condition['a.typeid'] = array('IN', array_keys($result));
                } else if ($key == 'flag') {
                    $condition['a.'.$get[$key]] = array('eq', 1);
                } else {
                    $condition['a.'.$key] = array('eq', $get[$key]);
                }
            }
        }

        // 时间检索
        if ($begin > 0 && $end > 0) {
            $condition['a.add_time'] = array('between',"$begin,$end");
        } else if ($begin > 0) {
            $condition['a.add_time'] = array('egt', $begin);
        } else if ($end > 0) {
            $condition['a.add_time'] = array('elt', $end);
        }

        // 模型ID
        $condition['a.channel'] = array('eq', $this->channeltype);

        /**
         * 数据查询，搜索出主键ID的值
         */
        $count = DB::name('archives')->alias('a')->where($condition)->count('aid');// 查询满足要求的总记录数
        $Page = new Page($count, config('paginate.list_rows'));// 实例化分页类 传入总记录数和每页显示的记录数
        $list = DB::name('archives')
            ->field("a.aid")
            ->alias('a')
            ->where($condition)
            ->order('a.aid desc')
            ->limit($Page->firstRow.','.$Page->listRows)
            ->getAllWithIndex('aid');

        /**
         * 完善数据集信息
         * 在数据量大的情况下，经过优化的搜索逻辑，先搜索出主键ID，再通过ID将其他信息补充完整；
         */
        if ($list) {
            $aids = array_keys($list);
            $fields = "b.*, a.*, a.aid as aid";
            $row = DB::name('archives')
                ->field($fields)
                ->alias('a')
                ->join('__ARCTYPE__ b', 'a.typeid = b.id', 'LEFT')
                ->where('a.aid', 'in', $aids)
                ->getAllWithIndex('aid');
            foreach ($list as $key => $val) {
                $row[$val['aid']]['arcurl'] = arcurl('home/Article/view', $row[$val['aid']]);
                $list[$key] = $row[$val['aid']];
            }
        }
        $show = $Page->show(); // 分页显示输出
        $assign_data['page'] = $show; // 赋值分页输出
        $assign_data['list'] = $list; // 赋值数据集
        $assign_data['pager'] = $Page; // 赋值分页对象

        /*获取当前模型栏目*/
/*        $selected = 0;
        if ($typeid > 0) {
            $selected = $typeid;
        }
        $arctypeLogic = new ArctypeLogic();
        $map = array(
            'channeltype'    => $this->channeltype,
        );
        $arctype_max_level = intval(config('global.arctype_max_level'));
        $select_html = $arctypeLogic->arctype_list(0, $selected, true, $arctype_max_level, $map);
        $assign_data['select_html'] = $select_html; */
        /*--end*/

        // 栏目ID
        $assign_data['typeid'] = $typeid; // 栏目ID
        /*当前栏目信息*/
        $arctype_info = array();
        if ($typeid > 0) {
            $arctype_info = M('arctype')->field('typename')->find($typeid);
        }
        $assign_data['arctype_info'] = $arctype_info;
        /*--end*/

        /*选项卡*/
        $tab = I('param.tab/d', 3);
        $assign_data['tab'] = $tab;
        /*--end*/

        $this->assign($assign_data);
        return $this->fetch();
    }

    /**
     * 添加
     */
    public function add()
    {
        if (IS_POST) {
            $post = I('post.');
            $content = I('content', '', null);

            // 根据标题自动提取相关的关键字
            $seo_keywords = $post['seo_keywords'];
            // if (empty($seo_keywords)) {
            //     $seo_keywords = get_split_word($post['title'], $content);
            // }

            // 自动获取内容第一张图片作为封面图
            $is_remote = !empty($post['is_remote']) ? $post['is_remote'] : 0;
            $litpic = '';
            if ($is_remote == 1) {
                $litpic = $post['litpic_remote'];
            } else {
                $litpic = $post['litpic_local'];
            }
            if (empty($litpic)) {
                $litpic = get_html_first_imgurl($content);
            }
            $post['litpic'] = $litpic;

            // SEO描述
            $seo_description = '';
            if (empty($post['seo_description']) && !empty($content)) {
                $seo_description = @msubstr(checkStrHtml($content), 0, 500, false);
            } else {
                $seo_description = $post['seo_description'];
            }
            // $seo_description = filter_line_return($seo_description);

            // --外部链接
            $jumplinks = '';
            $is_jump = isset($post['is_jump']) ? $post['is_jump'] : 0;
            if (intval($is_jump) > 0) {
                $jumplinks = $post['jumplinks'];
            }
            // --存储数据
            $newData = array(
                'is_b'      => empty($post['is_b']) ? 0 : $post['is_b'],
                'typeid'=> empty($post['typeid']) ? 0 : $post['typeid'],
                'channel'   => $this->channeltype,
                'is_recom'     => isset($post['is_recom']) ? $post['is_recom'] : 0,
                'is_jump'     => $is_jump,
                'jumplinks' => $jumplinks,
                'seo_keywords'     => $seo_keywords,
                'seo_description'     => $seo_description,
                'add_time'     => strtotime($post['add_time']),
                'update_time'  => strtotime($post['add_time']),
            );
            $data = array_merge($post, $newData);

            $aid = M('archives')->insertGetId($data);
            if ($aid) {
                // ---------后置操作
                model('Article')->afterSave($aid, $data);
                // ---------end
                adminLog('新增普通文章：'.$data['title']);
                $this->success("操作成功!",U('Article/index', array('typeid'=>$post['typeid'])));
                exit;
            }

            $this->error("操作失败!");
            exit;
        }

        $typeid = I('param.typeid/d', 0);

        // 文章栏目
        if ($typeid > 0) {
            $select_html = M('arctype')->where('id', $typeid)->getField('typename');
            $select_html = !empty($select_html) ? $select_html : '该栏目不存在';
        } else {
            $arctypeLogic = new ArctypeLogic();
            $map = array(
                'channeltype'    => $this->channeltype,
                'current_channel'   => $this->channeltype,
            );
            $select_html = $arctypeLogic->arctype_list(0, $typeid, true, config('global.arctype_max_level'), $map);
        }
        $assign_data['select_html'] = $select_html; // 
        $assign_data['typeid'] = $typeid; // 栏目ID

        // 阅读权限
        $arcrank_list = get_arcrank_list();
        $assign_data['arcrank_list'] = $arcrank_list; // 

        $this->assign($assign_data);
        return $this->fetch();
    }
    
    /**
     * 编辑
     */
    public function edit()
    {
        if (IS_POST) {
            $post = I('post.');
            $content = I('content', '', null);

            // 根据标题自动提取相关的关键字
            $seo_keywords = $post['seo_keywords'];
            // if (empty($seo_keywords)) {
            //     $seo_keywords = get_split_word($post['title'], $content);
            // }

            // 自动获取内容第一张图片作为封面图
            $is_remote = !empty($post['is_remote']) ? $post['is_remote'] : 0;
            $litpic = '';
            if ($is_remote == 1) {
                $litpic = $post['litpic_remote'];
            } else {
                $litpic = $post['litpic_local'];
            }
            if (empty($litpic)) {
                $litpic = get_html_first_imgurl($content);
            }
            $post['litpic'] = $litpic;

            // 描述
            $seo_description = '';
            if (empty($post['seo_description']) && !empty($content)) {
                $seo_description = @msubstr(checkStrHtml($content), 0, 500, false);
            } else {
                $seo_description = $post['seo_description'];
            }
            // $seo_description = filter_line_return($seo_description);

            // --外部链接
            $jumplinks = '';
            $is_jump = isset($post['is_jump']) ? $post['is_jump'] : 0;
            if (intval($is_jump) > 0) {
                $jumplinks = $post['jumplinks'];
            }
            // --存储数据
            $newData = array(
                'is_b'      => empty($post['is_b']) ? 0 : $post['is_b'],
                'typeid'=> empty($post['typeid']) ? 0 : $post['typeid'],
                'channel'   => $this->channeltype,
                'is_recom'     => isset($post['is_recom']) ? $post['is_recom'] : 0,
                'is_jump'   => $is_jump,
                'jumplinks' => $jumplinks,
                'seo_keywords'     => $seo_keywords,
                'seo_description'     => $seo_description,
                'add_time'     => strtotime($post['add_time']),
                'update_time'     => getTime(),
            );
            $data = array_merge($post, $newData);

            $r = M('archives')->where(array('aid'=>$data['aid']))->update($data);
            
            if ($r) {
                // ---------后置操作
                model('Article')->afterSave($data['aid'], $data);
                // ---------end
                adminLog('编辑普通文章：'.$data['title']);
                $this->success("操作成功!",U('Article/index', array('typeid'=>$post['typeid'])));
                exit;
            }

            $this->error("操作失败!");
            exit;
        }

        $assign_data = array();

        $id = I('id/d');
        $info = model('Article')->getInfo($id);
        if (empty($info)) {
            $this->error('文章不存在，请联系管理员！');
            exit;
        }
        if (is_http_url($info['litpic'])) {
            $info['is_remote'] = 1;
            $info['litpic_remote'] = $info['litpic'];
        } else {
            $info['is_remote'] = 0;
            $info['litpic_local'] = $info['litpic'];
        }
        $assign_data['field'] = $info;

        // 文章栏目
        $select_html = M('arctype')->where('id', $info['typeid'])->getField('typename');
        $select_html = !empty($select_html) ? $select_html : '该栏目不存在';
/*        $arctypeLogic = new ArctypeLogic();
        $map = array(
            'channeltype'    => $this->channeltype,
        );
        $select_html = $arctypeLogic->arctype_list(0, $info['typeid'], true, config('global.arctype_max_level'), $map);*/
        $assign_data['select_html'] = $select_html;

        // 阅读权限
        $arcrank_list = get_arcrank_list();
        $assign_data['arcrank_list'] = $arcrank_list;

        $this->assign($assign_data);
        return $this->fetch();
    }
    
    /**
     * 删除
     */
    public function del()
    {
        $id = $id_arr = I('del_id/a');
        if(is_array($id)){
            $id = implode(',', $id); 
        }
        if(!empty($id)){
            $r = M('archives')->where("aid in ($id)")->delete();
            if($r){
                // ---------后置操作
                model('Article')->afterDel($id_arr);
                // ---------end
                adminLog('删除普通文章-id：'.$id);
                respose(array('status'=>1, 'msg'=>'删除成功'));
            }else{
                respose(array('status'=>0, 'msg'=>'删除失败'));
            }
        }else{
            respose(array('status'=>0, 'msg'=>'参数有误'));
        }
    }
    
    /**
     * 移动
     */
    public function move()
    {
        if (IS_POST) {
            $post = I('post.');
            $typeid = !empty($post['typeid']) ? $post['typeid'] : '';
            $aids = !empty($post['aids']) ? $post['aids'] : '';

            if (empty($typeid) || empty($aids)) {
                respose(array('status'=>0, 'msg'=>'参数有误'));
            }

            $update_data = array(
                'typeid'    => $typeid,
                'update_time'   => getTime(),
            );
            $r = M('archives')->where("aid in ($aids)")->update($update_data);
            if($r){
                adminLog('移动文档-id：'.$aids);
                respose(array('status'=>1, 'msg'=>'移动成功'));
            }else{
                respose(array('status'=>0, 'msg'=>'移动失败'));
            }
        }

        $typeid = I('param.typeid/d', 0);
        $allowReleaseChannel = array(1);

        /*允许发布文档列表的栏目*/
        $arctype_html = allow_release_arctype($typeid, $allowReleaseChannel);
        $this->assign('arctype_html', $arctype_html);
        /*--end*/

        /*不允许发布文档的模型ID，用于JS判断*/
        $js_allow_channel_arr = '[';
        foreach ($allowReleaseChannel as $key => $val) {
            if ($key > 0) {
                $js_allow_channel_arr .= ',';
            }
            $js_allow_channel_arr .= $val;
        }
        $js_allow_channel_arr = $js_allow_channel_arr.']';
        $this->assign('js_allow_channel_arr', $js_allow_channel_arr);
        /*--end*/

        /*表单提交URL*/
        $form_action = url('Article/move');
        $this->assign('form_action', $form_action);
        /*--end*/

        return $this->fetch('article/move');
    }
}