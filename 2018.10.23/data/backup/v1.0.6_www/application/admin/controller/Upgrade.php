<?php
/**
 * eyoucms
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
use think\Controller;
use think\Db;
use think\response\Json;
use app\admin\model;
class Upgrade extends Controller {

    /**
     * 析构函数
     */
    function __construct() {
        parent::__construct();
        @ini_set('memory_limit', '1024M'); // 设置内存大小
        @ini_set("max_execution_time", "0"); // 请求超时时间 0 为不限时
        @ini_set('default_socket_timeout', 3600); // 设置 file_get_contents 请求超时时间 官方的说明，似乎没有不限时间的选项，也就是不能填0，你如果填0，那么socket就会立即返回失败，
        $this->assign('version', getCmsVersion());
    }

    public function welcome()
    {
      $sys_info['os']             = PHP_OS;
      $sys_info['zlib']           = function_exists('gzclose') ? 'YES' : 'NO';//zlib
      $sys_info['safe_mode']      = (boolean) ini_get('safe_mode') ? 'YES' : 'NO';//safe_mode = Off       
      $sys_info['timezone']       = function_exists("date_default_timezone_get") ? date_default_timezone_get() : "no_timezone";
      $sys_info['curl']           = function_exists('curl_init') ? 'YES' : 'NO';  
      $sys_info['web_server']     = $_SERVER['SERVER_SOFTWARE'];
      $sys_info['phpv']           = phpversion();
      $sys_info['ip']             = GetHostByName($_SERVER['SERVER_NAME']);
      $sys_info['fileupload']     = @ini_get('file_uploads') ? ini_get('upload_max_filesize') :'unknown';
      $sys_info['max_ex_time']    = @ini_get("max_execution_time").'s'; //脚本最大执行时间
      $sys_info['set_time_limit'] = function_exists("set_time_limit") ? true : false;
      $sys_info['domain']         = $_SERVER['HTTP_HOST'];
      $sys_info['memory_limit']   = ini_get('memory_limit');                                  
      $sys_info['version']        = file_get_contents(DATA_PATH.'conf/version.txt');
      $mysqlinfo = Db::query("SELECT VERSION() as version");
      $sys_info['mysql_version']  = $mysqlinfo[0]['version'];
      if(function_exists("gd_info")){
          $gd = gd_info();
          $sys_info['gdinfo']     = $gd['GD Version'];
      }else {
          $sys_info['gdinfo']     = "未知";
      }

      $upgradeLogic = new \app\admin\logic\UpgradeLogic();
      $sys_info['curent_version'] = $upgradeLogic->curent_version; //当前程序版本
      $sys_info['web_name'] = tpCache('global.web_name');
      $this->assign('sys_info', $sys_info);
      
      $upgradeMsg = $upgradeLogic->checkVersion(); //升级包消息     
      $this->assign('upgradeMsg',$upgradeMsg);

      $is_eyou_authortoken = extra_cache('global_is_eyou_authortoken');
      $this->assign('is_eyou_authortoken', $is_eyou_authortoken);
      $this->assign('global', tpCache('global'));

      return $this->fetch();
    }

   /**
    * 一键升级
    */
   public function OneKeyUpgrade(){
      // sleep(3);
      header('Content-Type:application/json; charset=utf-8');
      $upgradeLogic = new \app\admin\logic\UpgradeLogic();
      $upgradeMsg = $upgradeLogic->OneKeyUpgrade(); //升级包消息
      respose($upgradeMsg);
   }

   /**
    * 设置弹窗更新-不再提醒
    */
   public function setPopupUpgrade()
   {
      $show_popup_upgrade = I('param.show_popup_upgrade/s', '1');
      $inc_type = 'web';
      tpCache($inc_type, array($inc_type.'_show_popup_upgrade'=>$show_popup_upgrade));
      respose(1);
   }
}