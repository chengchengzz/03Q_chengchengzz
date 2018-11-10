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

class Links extends Base
{
    public function index()
    {
        $list = array();
        $keywords = I('keywords/s');

        $map = array();
        if (!empty($keywords)) {
            $map['title'] = array('LIKE', "%{$keywords}%");
        }

        $linksM =  M('links');
        $count = $linksM->where($map)->count('id');// 查询满足要求的总记录数
        $Page = $pager = new Page($count, config('paginate.list_rows'));// 实例化分页类 传入总记录数和每页显示的记录数
        $list = $linksM->where($map)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();

        $show = $Page->show();// 分页显示输出
        $this->assign('page',$show);// 赋值分页输出
        $this->assign('list',$list);// 赋值数据集
        $this->assign('pager',$pager);// 赋值分页对象
        return $this->fetch();
    }

    /**
     * 添加友情链接
     */
    public function add()
    {
        if (IS_POST) {
            $post = I('post.');

            // 处理LOGO
            $is_remote = !empty($post['is_remote']) ? $post['is_remote'] : 0;
            $logo = '';
            if ($is_remote == 1) {
                $logo = $post['logo_remote'];
            } else {
                $logo = $post['logo_local'];
            }
            $post['logo'] = $logo;
            // --存储数据
            $nowData = array(
                'typeid'    => empty($post['typeid']) ? 1 : $post['typeid'],
                'url'    => trim($post['url']),
                'add_time'    => getTime(),
                'update_time'    => getTime(),
            );
            $data = array_merge($post, $nowData);
            $insertId = M('links')->insertGetId($data);
            if ($insertId) {
                \think\Cache::clear('links');
                adminLog('新增友情链接：'.$post['title']);
                $this->success("操作成功!", U('Links/index'));
            }else{
                $this->error("操作失败!", U('Links/index'));
            }
            exit;
        }

        return $this->fetch();
    }
    
    /**
     * 编辑友情链接
     */
    public function edit()
    {
        if (IS_POST) {
            $post = I('post.');
            $r = false;
            if(!empty($post['id'])){
                // 处理LOGO
                $is_remote = !empty($post['is_remote']) ? $post['is_remote'] : 0;
                $logo = '';
                if ($is_remote == 1) {
                    $logo = $post['logo_remote'];
                } else {
                    $logo = $post['logo_local'];
                }
                $post['logo'] = $logo;
                // --存储数据
                $nowData = array(
                    'typeid'    => empty($post['typeid']) ? 1 : $post['typeid'],
                    'url'    => trim($post['url']),
                    'update_time'    => getTime(),
                );
                $data = array_merge($post, $nowData);
                $r = M('links')->where(array('id'=>$post['id']))->cache(true,EYOUCMS_CACHE_TIME,"links")->save($data);
            }
            if ($r) {
                adminLog('编辑友情链接：'.$post['title']);
                $this->success("操作成功!",U('Links/index'));
            }else{
                $this->error("操作失败!",U('Links/index'));
            }
            exit;
        }

        $id = I('id/d');
        $info = M('links')->where(array('id'=>$id))->find();
        if (empty($info)) {
            $this->error('数据不存在，请联系管理员！');
            exit;
        }
        if (is_http_url($info['logo'])) {
            $info['is_remote'] = 1;
            $info['logo_remote'] = $info['logo'];
        } else {
            $info['is_remote'] = 0;
            $info['logo_local'] = $info['logo'];
        }
        $this->assign('info',$info);

        return $this->fetch();
    }
    
    /**
     * 删除友情链接
     */
    public function del()
    {
        $id = I('del_id/a');
        if(is_array($id)){
            $id = implode(',', $id); 
        }
        if(!empty($id)){
            $result = M('links')->field('title')->where("id in ($id)")->select();
            $title_list = get_arr_column($result, 'title');

            $r = M('links')->where("id in ($id)")->cache(true,EYOUCMS_CACHE_TIME,"links")->delete();
            if($r){
                adminLog('删除友情链接：'.implode(',', $title_list));
                respose(array('status'=>1, 'msg'=>'删除成功'));
            }else{
                respose(array('status'=>0, 'msg'=>'删除失败'));
            }
        }else{
            respose(array('status'=>0, 'msg'=>'参数有误'));
        }
    }
}