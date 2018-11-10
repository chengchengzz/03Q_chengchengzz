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

namespace app\admin\model;

use think\Model;

/**
 * 单页
 */
class Single extends Model
{
    //初始化
    protected function initialize()
    {
        // 需要调用`Model`的`initialize`方法
        parent::initialize();
    }

    /**
     * 后置操作方法
     * 自定义的一个函数 用于数据保存后做的相应处理操作, 使用时手动调用
     * @param int $aid 产品id
     */
    public function afterSave($aid, $post)
    {
        if (isset($post['aid']) && intval($post['aid']) > 0) {
            M('single_content')->where('aid', $post['aid'])->update($post);
        } else {
            $post['aid'] = $aid;
            M('single_content')->insert($post);
        }
    }

    /**
     * 获取单条记录
     * @author wengxianhu by 2017-7-26
     */
    public function getInfoByTypeid($typeid, $isshowbody = true)
    {
        $result = array();
        if ($isshowbody) {
            $result = db('Arctype')->field('c.*, b.*, a.*, a.id as typeid')
                ->alias('a')
                ->join('__ARCHIVES__ b', 'b.typeid = a.id', 'LEFT')
                ->join('__SINGLE_CONTENT__ c', 'c.aid = b.aid', 'LEFT')
                ->find($typeid);
        } else {
            $result = db('Arctype')->field('b.*, a.*, a.id as typeid')
                ->alias('a')
                ->join('__ARCHIVES__ b', 'b.typeid = a.id', 'LEFT')
                ->find($typeid);
        }

        return $result;
    }

    /**
     * 删除的后置操作方法
     * 自定义的一个函数 用于数据删除后做的相应处理操作, 使用时手动调用
     * @param int $aid
     */
    public function afterDel($typeidArr = array())
    {
        if (is_string($typeidArr)) {
            $typeidArr = explode(',', $typeidArr);
        }

        // 同时删除单页文档表
        M('archives')->where(
                array(
                    'typeid'=>array('IN', $typeidArr)
                )
            )
            ->delete();
        // 同时删除内容
        M('single_content')->where(
                array(
                    'typeid'=>array('IN', $typeidArr)
                )
            )
            ->delete();
        // 清除缓存
        \think\Cache::clear('arctype');
        extra_cache('admin_all_menu', NULL);
        extra_cache('admin_archives_release', NULL);
    }
}