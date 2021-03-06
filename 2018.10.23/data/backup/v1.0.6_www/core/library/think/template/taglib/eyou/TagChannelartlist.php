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

use think\Request;

/**
 * 获取当前频道的下级栏目的内容列表标签
 */
class TagChannelartlist extends Base
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
            $cacheKey = 'tagChannelartlist_'.strtolower(MODULE_NAME.'_'.CONTROLLER_NAME.'_'.ACTION_NAME);
            $cacheKey .= "_{$aid}";
            $this->tid = cache($cacheKey);
            if ($this->tid == false) {
                $this->tid = M('archives')->where('aid', $aid)->getField('typeid');
                cache($cacheKey, $this->tid);
            }
        }
        /*--end*/
        /*tid为目录名称的情况下*/
        $this->tid = $this->getTrueTypeid($this->tid);
        /*--end*/
    }

    /**
     * 获取当前频道的下级栏目的内容列表标签
     * @param string type son表示下一级栏目,self表示当前栏目,top顶级栏目
     * @param boolean $self 包括自己本身
     * @author wengxianhu by 2018-4-26
     */
    public function getChannelartlist($typeid, $type = 'self')
    {
        $typeid  = !empty($typeid) ? $typeid : $this->tid;

        if (empty($typeid)) {
            $type = 'top'; // 默认顶级栏目
        }

        $result = $this->getSwitchType($typeid, $type);

        return $result;
    }

    /**
     * 获取指定级别的栏目列表
     * @param string type son表示下一级栏目,self表示同级栏目,top顶级栏目
     * @param boolean $self 包括自己本身
     * @author wengxianhu by 2018-4-26
     */
    public function getSwitchType($typeid = '', $type = 'son')
    {
        $result = array();
        switch ($type) {
            case 'son': // 下级栏目
                $result = $this->getSon($typeid, false);
                break;

            case 'self': // 同级栏目
                $result = $this->getSelf($typeid);
                break;

            case 'top': // 顶级栏目
                $result = $this->getTop();
                break;

            case 'sonself': // 下级、同级栏目
                $result = $this->getSon($typeid, true);
                break;
        }

        return $result;
    }

    /**
     * 获取下一级栏目
     * @param string $self true表示没有子栏目时，获取同级栏目
     * @author wengxianhu by 2017-7-26
     */
    public function getSon($typeid, $self = false)
    {
        $result = array();
        if (empty($typeid)) {
            return $result;
        }

        if ($self) {
            $map['id|parent_id'] = array('IN', $typeid);
        } else {
            $map['parent_id'] = array('IN', $typeid);
        }
        $map['is_hidden'] = 0;
        $map['status'] = 1;
        $result = M('arctype')->field('*, id as typeid')
            ->where($map)
            ->order('sort_order asc')
            ->select();

        if ($result) {
            $ctl_name_list = model('Channeltype')->getAll('id,ctl_name', array(), 'id');
            foreach ($result as $key => $val) {
                if ($val['is_part'] == 1) {
                    $typeurl = $val['typelink'];
                } else {
                    $ctl_name = $ctl_name_list[$val['current_channel']]['ctl_name'];
                    $typeurl = typeurl(MODULE_NAME.'/'.$ctl_name."/lists", $val);
                }
                $result[$key]['typeurl'] = $typeurl;
            }
        }

        return $result;
    }

    /**
     * 获取当前栏目
     * @author wengxianhu by 2017-7-26
     */
    public function getSelf($typeid)
    {
        $result = array();
        if (empty($typeid)) {
            return $result;
        }

        $map = array(
            'id'    => array('IN', $typeid),
            'is_hidden' => 0,
            'status'    => 1,
        );
        $result = M('arctype')->field('*, id as typeid')
            ->where($map)
            ->order('sort_order asc')
            ->select();

        if ($result) {
            $ctl_name_list = model('Channeltype')->getAll('id,ctl_name', array(), 'id');
            foreach ($result as $key => $val) {
                if ($val['is_part'] == 1) {
                    $typeurl = $val['typelink'];
                } else {
                    $ctl_name = $ctl_name_list[$val['current_channel']]['ctl_name'];
                    $typeurl = typeurl(MODULE_NAME.'/'.$ctl_name."/lists", $val);
                }
                $result[$key]['typeurl'] = $typeurl;
            }
        }

        return $result;
    }

    /**
     * 获取顶级栏目
     * @author wengxianhu by 2017-7-26
     */
    public function getTop()
    {
        $map = array(
            'parent_id'    => 0,
            'is_hidden' => 0,
            'status'    => 1,
        );
        $result = M('arctype')->field('*, id as typeid')
            ->where($map)
            ->order('sort_order asc')
            ->select();

        if ($result) {
            $ctl_name_list = model('Channeltype')->getAll('id,ctl_name', array(), 'id');
            foreach ($result as $key => $val) {
                if ($val['is_part'] == 1) {
                    $typeurl = $val['typelink'];
                } else {
                    $ctl_name = $ctl_name_list[$val['current_channel']]['ctl_name'];
                    $typeurl = typeurl(MODULE_NAME.'/'.$ctl_name."/lists", $val);
                }
                $result[$key]['typeurl'] = $typeurl;
            }
        }
        
        return $result;
    }
}