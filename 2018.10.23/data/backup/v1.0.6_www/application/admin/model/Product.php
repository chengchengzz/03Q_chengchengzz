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
use app\admin\logic\ProductLogic;

/**
 * 产品
 */
class Product extends Model
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
        // -----------内容
        if (isset($post['aid']) && intval($post['aid']) > 0) {
            M('product_content')->where('aid', $post['aid'])->update($post);
            // 自动推送链接给蜘蛛
            push_zzbaidu($post['aid'], '', 'update');
        } else {
            $post['aid'] = $aid;
            M('product_content')->insert($post);
            // 自动推送链接给蜘蛛
            push_zzbaidu($post['aid']);
        }
        // ---------产品多图
        model('ProductImg')->saveimg($aid, $post);
        // ---------end

        // 处理产品 属性
        $productLogic = new ProductLogic();
        $productLogic->saveProductAttr($aid, $post['typeid']); 

        // --处理TAG标签
        model('Taglist')->savetags($aid, $post['typeid'], $post['tags']);
    }

    /**
     * 获取单条记录
     * @author wengxianhu by 2017-7-26
     */
    public function getInfo($aid, $field = '', $isshowbody = true)
    {
        $result = array();
        if ($isshowbody) {
            $field = !empty($field) ? $field : 'b.*, a.*, a.aid as aid';
            $result = db('archives')->field($field)
                ->alias('a')
                ->join('__PRODUCT_CONTENT__ b', 'b.aid = a.aid', 'LEFT')
                ->find($aid);
        } else {
            $field = !empty($field) ? $field : 'a.*';
            $result = db('archives')->field($field)
                ->alias('a')
                ->find($aid);
        }

        // 产品TAG标签
        if (!empty($result)) {
            $typeid = isset($result['typeid']) ? $result['typeid'] : 0;
            $tags = model('Taglist')->getListByAid($aid, $typeid);
            $result['tags'] = $tags;
        }

        return $result;
    }

    /**
     * 删除的后置操作方法
     * 自定义的一个函数 用于数据删除后做的相应处理操作, 使用时手动调用
     * @param int $aid
     */
    public function afterDel($aidArr = array())
    {
        if (is_string($aidArr)) {
            $aidArr = explode(',', $aidArr);
        }
        // 同时删除内容
        M('product_content')->where(
                array(
                    'aid'=>array('IN', $aidArr)
                )
            )
            ->delete();
        // 同时删除属性
        M('product_attr')->where(
                array(
                    'aid'=>array('IN', $aidArr)
                )
            )
            ->delete();
        // 同时删除图片
        $result = M('product_img')->field('image_url')
            ->where(
                array(
                    'aid'=>array('IN', $aidArr)
                )
            )
            ->select();
        if (!empty($result)) {
            foreach ($result as $key => $val) {
                if (!is_http_url($val['image_url'])) {
                    @unlink(ROOT_PATH.trim($val['image_url'], '/'));
                }
            }
            M('product_img')->where(
                array(
                    'aid'=>array('IN', $aidArr)
                )
            )
            ->delete();
        }
        // 同时删除TAG标签
        model('Taglist')->delByAids($aidArr);
    }
}