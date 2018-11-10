<?php
namespace app\index\model;
use think\Db;
class Index extends \think\Model
{
    /*登录验证*/
    public static function change($id,$data)
    {
        $changedata=Db::name('auth')->where($id)->update($data);
        if ($changedata) {
            return true;
        }else{
            return false;
        }
    }

}
