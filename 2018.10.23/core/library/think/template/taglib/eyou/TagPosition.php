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
 * 栏目位置
 */
class TagPosition extends Base
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
     * 获取面包屑位置
     * @author wengxianhu by 2018-4-20
     */
    public function getPosition($typeid, $symbol = '&gt;', $style = 'crumb')
    {
        $typeid = !empty($typeid) ? $typeid : $this->tid;

        $symbol = htmlspecialchars_decode($symbol);
        $str = '<a href="'.tpCache('global.core_cmsurl').'/" class="crumb">首页</a>';
        $result = model('Arctype')->getAllPid($typeid);
        $i = 1;
        foreach ($result as $key => $val) {
            if ($i < count($result)) {
                $str .= " {$symbol} ".'<a href="'.$val['typeurl'].'" class="crumb">'.$val['typename'].'</a>';
            } else {
                $str .= " {$symbol} ".$val['typename'];
            }
            ++$i;
        }

        return $str;
    }
}