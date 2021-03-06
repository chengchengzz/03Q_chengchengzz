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
 * 广告
 */
class TagAdv extends Base
{
    //初始化
    protected function _initialize()
    {
        parent::_initialize();
    }

    /**
     * 获取广告
     * @author wengxianhu by 2018-4-20
     */
    public function getAdv($pid, $where = '', $orderby = '')
    {
        if (empty($pid)) {
            echo '标签adv报错：缺少属性 pid 。';
            return false;
        }

        $uiset = I('param.uiset/s', 'off');
        $uiset = trim($uiset, '/');
        $times = time();
        if (empty($where)) {
            $where = "pid={$pid} and start_time < {$times} and (end_time > {$times} OR end_time = 0) and status = 1";
        }

        // 排序
        switch ($orderby) {
            case 'hot':
            case 'click':
                $orderby = 'click desc';
                break;

            case 'now':
            case 'id':
                $orderby = 'id desc';
                break;

            case 'sort_order':
                $orderby = 'sort_order asc';

            case 'rand':
                $orderby = 'rand()';
            
            default:
                if (empty($orderby)) {
                    $orderby = 'sort_order asc, id desc';
                }
                break;
        }

        $result = M("ad")->field("*")->where($where)->order($orderby)->cache(true,EYOUCMS_CACHE_TIME,"ad")->select();
        foreach ($result as $key => $val) {
            $val['target'] = ($val['target'] == 1) ? 'target="_blank"' : 'target="_self"';
            $val['intro'] = htmlspecialchars_decode($val['intro']);
            if ($uiset == 'on') {
                $val['links'] = "javascript:void(0);";
            }
            $result[$key] = $val;
        }

        return $result;
    }
}