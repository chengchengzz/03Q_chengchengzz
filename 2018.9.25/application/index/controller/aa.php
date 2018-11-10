<?php
namespace app\index\controller;
use think\Controller;
use think\Db;
use think\Request;
 
class Index extends Controller
{
    public function login()
    {
        if(Request::instance()->isGet())
        {
            return view('login');
        }else{
            $name=input('post.name');
            $pwd=input('post.pwd');
            //查找用户登录的信息
            $arr=Db::table('deng3')->where(['name'=>$name])->find();
            //判断状态是否锁定
            if($arr['static'] ==1 )   //锁定时
            {
                //判断时间是否过时
                if(time()-$arr['time']>300)
                {
                    //取消锁定
                    $up['static']=0;
                    //改变状态
                    Db::table('deng3')->where(['name'=>$name])->update($up);
                }
                 else
                 {
                    echo '锁定5分请稍后登录';die;
                 }
            }
            //判断密码
            if($arr['pwd'] == $pwd)
            {
                echo '成功';
            }
            else
            {
                //有三次登录机会
                //小于三次时 次数递增
                if($arr['count']<3)
                {
                    $up['count']=$arr['count']+1;
                    Db::table('deng3')->where(['name'=>$name])->update($up);
                }
                else
                {
                    //次数大于3时   计数变为0
                    $up['count']=0;
                    //当前时间
                    $up['time']=time();
                    //状态锁定
                    $up['static']=1;
                    //更新参数
                    Db::table('deng3')->where(['name'=>$name])->update($up);
                }
                echo '失败';
            }
        }
    }
}
 
 
 