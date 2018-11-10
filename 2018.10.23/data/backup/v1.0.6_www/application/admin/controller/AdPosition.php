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

class AdPosition extends Base
{
    private $ad_position_system_id = array(); // 系统默认位置ID，不可删除

    public function index()
    {
        $list = array();
        $get = I('get.');
        $keywords = I('keywords/s');
        $condition = array();
        // 应用搜索条件
        foreach (['keywords'] as $key) {
            if (isset($get[$key]) && $get[$key] !== '') {
                if ($key == 'keywords') {
                    $condition['a.title'] = array('LIKE', "%{$get[$key]}%");
                } else {
                    $tmp_key = 'a.'.$key;
                    $condition[$tmp_key] = array('eq', $get[$key]);
                }
            }
        }

        $adPositionM =  M('ad_position');
        $count = $adPositionM->alias('a')->where($condition)->count();// 查询满足要求的总记录数
        $Page = new Page($count, config('paginate.list_rows'));// 实例化分页类 传入总记录数和每页显示的记录数
        $list = $adPositionM->alias('a')->where($condition)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();

        // 获取指定位置的广告数目
        $cid = get_arr_column($list, 'id');
        $ad_list = M('ad')->field('pid, count(id) AS has_children')->where('pid', 'in', $cid)->group('pid')->getAllWithIndex('pid');
        $this->assign('ad_list', $ad_list);

        $show = $Page->show();// 分页显示输出
        $this->assign('page',$show);// 赋值分页输出
        $this->assign('list',$list);// 赋值数据集
        $this->assign('pager',$Page);// 赋值分页对象
        return $this->fetch();
    }
    
    /**
     * 新增
     */
    public function add()
    {
        if (IS_POST) {
            $post = I('post.');

            $map = array(
                'title' => trim($post['title']),
            );
            if(M('ad_position')->where($map)->count() > 0){
                $this->error('该广告位名称已添加，请检查', U('AdPosition/index'));
            }

            $data = array(
                'title'    => trim($post['title']),
                'width' => $post['width'],
                'height' => $post['height'],
                'intro' => $post['intro'],
                'add_time'           => getTime(),
                'update_time'           => getTime(),
            );
            $r = M('ad_position')->insert($data);

            if ($r) {
                adminLog('新增广告位：'.$post['title']);
                $this->success("操作成功", U('AdPosition/index'));
            } else {
                $this->error("操作失败", U('AdPosition/index'));
            }
            exit;
        }

        return $this->fetch();
    }

    
    /**
     * 编辑
     */
    public function edit()
    {
        if (IS_POST) {
            $post = I('post.');
            if(!empty($post['id'])){

                if(array_key_exists($post['id'], $this->ad_position_system_id)){
                    $this->error("不可更改系统预定义位置", U('AdPosition/edit',array('id'=>$post['id'])));
                }
                $map = array(
                    'id' => array('NEQ', $post['id']),
                    'title' => trim($post['title']),
                );
                if(M('ad_position')->where($map)->count() > 0){
                    $this->error('该广告位名称已添加，请检查', U('AdPosition/index'));
                }

                $data = array(
                    'id'       => $post['id'],
                    'title'    => trim($post['title']),
                    'width' => $post['width'],
                    'height' => $post['height'],
                    'intro' => $post['intro'],
                    'update_time'       => getTime(),
                );
                $r = M('ad_position')->update($data);
            }
            if ($r) {
                adminLog('编辑广告位：'.$post['title']);
                $this->success("操作成功", U('AdPosition/index'));
            } else {
                $this->error("操作失败");
            }
        }

        $assign_data = array();

        $id = I('id/d');
        $field = M('ad_position')->field('a.*')
            ->alias('a')
            ->where(array('a.id'=>$id))
            ->find();
        if (empty($field)) {
            $this->error('广告位不存在，请联系管理员！');
            exit;
        }
        $assign_data['field'] = $field;

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
            foreach ($id_arr as $key => $val) {
                if(array_key_exists($val, $this->ad_position_system_id)){
                    respose(array('status'=>0, 'msg'=>'系统预定义的位置不能删除'));
                }
            }

            $ad_count = M('ad')->where("pid in ($id)")->count();
            if ($ad_count > 0){
                respose(array('status'=>0, 'msg'=>'该位置下有广告，不允许删除，请先删除该位置下的广告'));
            }  

            $r = M('ad_position')->where("id in ($id)")->delete();
            if ($r) {
                adminLog('删除广告位-id：'.$id);
                respose(array('status'=>1, 'msg'=>'删除成功'));
            } else {
                respose(array('status'=>0, 'msg'=>'删除失败'));
            }
        }else{
            respose(array('status'=>0, 'msg'=>'参数有误'));
        }
    }
}