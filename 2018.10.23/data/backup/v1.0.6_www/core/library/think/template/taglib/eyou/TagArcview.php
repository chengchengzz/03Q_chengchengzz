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
 * 文档基本信息
 */
class TagArcview extends Base
{
    public $aid = '';
    
    //初始化
    protected function _initialize()
    {
        parent::_initialize();
        /*应用于文档列表*/
        $this->aid = I('param.aid/d', 0);
        /*--end*/
    }

    /**
     * 获取栏目基本信息
     * @author wengxianhu by 2018-4-20
     */
    public function getArcview($aid = '', $addtable = '')
    {
        $aid = !empty($aid) ? $aid : $this->aid;

        if (empty($aid)) {
            echo '标签arcview报错：缺少属性 aid 值，或文档ID不存在。';
            return false;
        }

        /*文档信息*/
        $result = M("archives")->field('b.*, a.*')
            ->alias('a')
            ->join('__ARCTYPE__ b', 'b.id = a.typeid', 'LEFT')
            ->find($aid);
        if (empty($result)) {
            echo '标签arcview报错：该文档ID('.$aid.')不存在。';
            return false;
        }
        /*--end*/
        $result['litpic'] = get_default_pic($result['litpic']); // 默认封面图

        // 获取查询的控制器名
        $channelInfo = model('Channeltype')->getInfo($result['channel'], 'id,table,ctl_name');
        $controller_name = $channelInfo['ctl_name'];
        $table = $channelInfo['table'];

        /*栏目链接*/
        if ($result['is_part'] == 1) {
            $result['typeurl'] = $result['typelink'];
        } else {
            $result['typeurl'] = typeurl(MODULE_NAME.'/'.$controller_name."/lists", $result);
        }
        /*--end*/

        /*文档链接*/
        if ($result['is_jump'] == 1) {
            $result['arcurl'] = $result['jumplinks'];
        } else {
            $result['arcurl'] = arcurl(MODULE_NAME.'/'.$controller_name.'/view', $result);
        }
        /*--end*/

        if (!empty($addtable)) {
            $addtable = strtolower($addtable);
            $addtableArr = explode('|', $addtable);
            foreach ($addtableArr as $key => $val) {
                /*当前文档的内容信息*/
                if (preg_match("/(content)$/i", $val) == 1) {
                    $tableContent = $table.'_content';
                    $row = M($tableContent)->field('*')->where('aid',$aid)->find();
                    /*内容解码*/
                    foreach ($row as $k2 => $v2) {
                        $row[$k2] = eyou_htmlspecialchars_decode($v2);
                    }
                    /*--end*/
                    $result = array_merge($row, $result);
                }
                /*--end*/
            }
        }

        return $result;
    }
}