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

// 应用公共文件

use think\Db;

/**
 * 前台检验登陆
 * @param
 * @return bool
 */
function is_home_login(){
    if(cookie('user_id') && cookie('user_id') > 0){
        return cookie('user_id');
    }else{
        return false;
    }
}

/**
 * ajax请求时，检测到未登录时返回json
 * 参数 is_jsonp 为true，表示跨域ajax请求的返回值
 */
function ajax_notLogin_return($res = array(), $is_jsonp = false){
    if (!is_home_login()) {
        if ($res) {
            respose($res, $is_jsonp);
        } else {
            $login_url = U('index/User/login', array(), 'html', SITE_URL);
            respose(array('status'=>-100, 'msg'=>'请先登录', 'login_url'=>$login_url), $is_jsonp);
        }
    }
}

/**
 * 获取用户信息
 * @param $user_id_or_name  用户id 邮箱 手机 第三方id
 * @param int $type  类型 0 user_id查找 1 邮箱查找 2 手机查找 3 第三方唯一标识查找
 * @param string $oauth  第三方来源
 * @return mixed
 */
function get_user_info($user_id_or_name,$type = 0,$oauth=''){
    $map = array();
    switch ($type) {
        case 0:
            $map['user_id'] = $user_id_or_name;
            break;

        case 1:
            $map['email'] = $user_id_or_name;
            break;
            
        case 2:
            $map['mobile'] = $user_id_or_name;
            break;
            
        case 3: // QQ登录
            $map['openid'] = $user_id_or_name;
            $map['oauth'] = $oauth;
            break;
            
        case 4: // 微信登录
            $map['unionid'] = $user_id_or_name;
            $map['oauth'] = $oauth;
            break;
            
        case 5:
            $map['username'] = $user_id_or_name;
            break;
        
        default:
            # code...
            break;
    }

    switch ($type) {
        case 3:
        case 4:
            $user_oauth = M('user_oauth')->where($map)->find();
            $user = array();
            if (!empty($user_oauth)) {
                $user = M('user')->find($user_oauth['user_id']);
            }
            break;
        
        default:
            $user = M('user')->where($map)->find();
            break;
    }
    
    return $user;
}

/**
 * 邮件发送
 * @param $to    接收人
 * @param string $subject   邮件标题
 * @param string $content   邮件内容(html模板渲染后的内容)
 * @param string $scene   使用场景
 * @throws Exception
 * @throws phpmailerException
 */
function send_email($to,$subject='',$content='',$scene=0){
    vendor('phpmailer.PHPMailerAutoload'); ////require_once vendor/phpmailer/PHPMailerAutoload.php';
    //判断openssl是否开启
    $openssl_funcs = get_extension_funcs('openssl');
    if(!$openssl_funcs){
        return array('status'=>-1 , 'msg'=>'请先开启openssl扩展');
    }
    $mail = new PHPMailer;
    $config = tpCache('smtp');
    $mail->CharSet  = 'UTF-8'; //设定邮件编码，默认ISO-8859-1，如果发中文此项必须设置，否则乱码
    $mail->isSMTP();
    //Enable SMTP debugging
    // 0 = off (for production use)
    // 1 = client messages
    // 2 = client and server messages
    $mail->SMTPDebug = 0;
    //调试输出格式
    //$mail->Debugoutput = 'html';
    //smtp服务器
    $mail->Host = $config['smtp_server'];
    //端口 - likely to be 25, 465 or 587
    $mail->Port = $config['smtp_port'];

    if($mail->Port == 465) $mail->SMTPSecure = 'ssl';// 使用安全协议
    //Whether to use SMTP authentication
    $mail->SMTPAuth = true;
    //用户名
    $mail->Username = $config['smtp_user'];
    //密码
    $mail->Password = $config['smtp_pwd'];
    //Set who the message is to be sent from
    $mail->setFrom($config['smtp_user']);
    //回复地址
    //$mail->addReplyTo('replyto@example.com', 'First Last');
    //接收邮件方
    if(is_array($to)){
        foreach ($to as $v){
            $mail->addAddress($v);
        }
    }else{
        $mail->addAddress($to);
    }

    $mail->isHTML(true);// send as HTML

    //邮件场景模板
    if ($scene > 0) {
        $emailLogic = new \app\common\logic\EmailLogic;
        $email_data = $emailLogic->replaceContent($scene, array('content'=>$content));
        $subject = $email_data['title'];
        $content = $email_data['msg'];
    }
    //标题
    $mail->Subject = $subject;
    //内容
    $mail->msgHTML($content);
    //Replace the plain text body with one created manually
    //$mail->AltBody = 'This is a plain-text message body';
    //添加附件
    //$mail->addAttachment('images/phpmailer_mini.png');
    //send the message, check for errors
    if (!$mail->send()) {
        return array('status'=>-1 , 'msg'=>'发送失败: '.$mail->ErrorInfo);
    } else {
        return array('status'=>1 , 'msg'=>'发送成功');
    }
}

/**
 * 检测是否能够发送短信
 * @param unknown $scene
 * @return multitype:number string
 */
function checkEnableSendSms($scene)
{
    $scenes = config('SEND_SCENE');
    $sceneItem = $scenes[$scene];
    if (!$sceneItem) {
        return array("status" => -1, "msg" => "场景参数'scene'错误!");
    }
    $key = $sceneItem[2];
    $sceneName = $sceneItem[0];
    $config = tpCache('sms');
    $smsEnable = $config[$key];

    if (!$smsEnable) {
        return array("status" => -1, "msg" => "['$sceneName']发送短信被关闭'");
    }
    //判断是否添加"注册模板"
    $size = M('sms_template')->where("send_scene", $scene)->count('tpl_id');
    if (!$size) {
        return array("status" => -1, "msg" => "请先添加['$sceneName']短信模板");
    }

    return array("status"=>1,"msg"=>"可以发送短信");
}

/**
 * 发送短信逻辑
 * @param unknown $scene
 */
function sendSms($scene, $sender, $params,$unique_id=0)
{
    $smsLogic = new \app\common\logic\SmsLogic;
    return $smsLogic->sendSms($scene, $sender, $params, $unique_id);
}

/**
 * 查询快递
 * @param $postcom  快递公司编码
 * @param $getNu  快递单号
 * @return array  物流跟踪信息数组
 */
function queryExpress($postcom , $getNu) {
    /*    $url = "http://wap.kuaidi100.com/wap_result.jsp?rand=".getTime()."&id={$postcom}&fromWeb=null&postid={$getNu}";
        //$resp = httpRequest($url,'GET');
        $resp = file_get_contents($url);
        if (empty($resp)) {
            return array('status'=>0, 'message'=>'物流公司网络异常，请稍后查询');
        }
        preg_match_all('/\\<p\\>&middot;(.*)\\<\\/p\\>/U', $resp, $arr);
        if (!isset($arr[1])) {
            return array( 'status'=>0, 'message'=>'查询失败，参数有误' );
        }else{
            foreach ($arr[1] as $key => $value) {
                $a = array();
                $a = explode('<br /> ', $value);
                $data[$key]['time'] = $a[0];
                $data[$key]['context'] = $a[1];
            }
            return array( 'status'=>1, 'message'=>'1','data'=> array_reverse($data));
        }*/
    $url = "https://m.kuaidi100.com/query?type=".$postcom."&postid=".$getNu."&id=1&valicode=&temp=0.49738534969422676";
    $resp = httpRequest($url,"GET");
    return json_decode($resp,true);
}

/**
 * 获取缓存或者更新缓存，只适用于config表
 * @param string $config_key 缓存文件名称
 * @param array $data 缓存数据  array('k1'=>'v1','k2'=>'v3')
 * @return array or string or bool
 */
function tpCache($config_key,$data = array()){
    $param = explode('.', $config_key);
    // $request = think\Request::instance();
    // $module_name = $request->module();
    // $controller_name = $request->controller();
    // $action_name = $request->action();
    if(empty($data)){
        //如$config_key=shop_info则获取网站信息数组
        //如$config_key=shop_info.logo则获取网站logo字符串
        $config = F($param[0],'',TEMP_PATH);//直接获取缓存文件
        if(empty($config)){
            //缓存文件不存在就读取数据库
            if ($param[0] == 'global') {
                $param[0] = 'global';
                $res = M('config')->select();
            } else {
                $res = M('config')->where("inc_type",$param[0])->select();
            }
            if($res){
                foreach($res as $k=>$val){
                    $config[$val['name']] = $val['value'];
                }
                F($param[0],$config,TEMP_PATH);
            }
            write_global_params();
        }
        if(!empty($param) && count($param)>1){
            $newKey = strtolower($param[1]);
            return isset($config[$newKey]) ? $config[$newKey] : '';
        }else{
            return $config;
        }
    }else{
        //更新缓存
        $result =  M('config')->where("inc_type", $param[0])->select();
        if($result){
            foreach($result as $val){
                $temp[$val['name']] = $val['value'];
            }
            $add_data = array();
            foreach ($data as $k=>$v){
                $newK = strtolower($k);
                $newArr = array('name'=>$newK,'value'=>trim($v),'inc_type'=>$param[0]);
                if(!isset($temp[$newK])){
                    array_push($add_data, $newArr); //新key数据插入数据库
                    // M('config')->add($newArr);//新key数据插入数据库
                }else{
                    if($v!=$temp[$newK])
                        M('config')->where("name", $newK)->save($newArr);//缓存key存在且值有变更新此项
                }
            }
            if (!empty($add_data)) {
                M('config')->insertAll($add_data);
            }
            //更新后的数据库记录
            $newRes = M('config')->where("inc_type", $param[0])->select();
            foreach ($newRes as $rs){
                $newData[$rs['name']] = $rs['value'];
            }
        }else{
            if ($param[0] != 'global') {
                foreach($data as $k=>$v){
                    $newK = strtolower($k);
                    $newArr[] = array('name'=>$newK,'value'=>trim($v),'inc_type'=>$param[0]);
                }
                M('config')->insertAll($newArr);
            }
            $newData = $data;
        }

        $result = false;
        // $global = F('global','',TEMP_PATH);
        // if (!empty($global)) {
        //     $global = array_merge($global, $newData);
        //     $result = F('global',$global,TEMP_PATH);
        // } else {
            $res = M('config')->select();
            if($res){
                $global = array();
                foreach($res as $k=>$val){
                    $global[$val['name']] = $val['value'];
                }
                $result = F('global',$global,TEMP_PATH);
            } 
        // }

        if ($param[0] != 'global') {
            $result = F($param[0],$newData,TEMP_PATH);
        }
        
        return $result;
    }
}

/**
 * 写入全局内置参数
 * @return array
 */
function write_global_params()
{
    $globalParams = tpCache('global'); // 全局变量
    $web_basehost = !empty($globalParams['web_basehost']) ? $globalParams['web_basehost'] : ''; // 网站根网址
    $web_cmspath = !empty($globalParams['web_cmspath']) ? $globalParams['web_cmspath'] : ''; // EyouCMS安装目录
    /*启用绝对网址，开启此项后附件、栏目连接、arclist内容等都使用http路径*/
    $web_multi_site = !empty($globalParams['web_multi_site']) ? $globalParams['web_multi_site'] : '';
    if($web_multi_site == 1)
    {
        $web_mainsite = $web_basehost;
    }
    else
    {
        $web_mainsite = '';
    }
    /*--end*/
    /*CMS安装目录的网址*/
    $param['web_cmsurl'] = $web_mainsite.$web_cmspath;
    /*--end*/
    $param['web_templets_dir'] = $web_cmspath.'/template'; // 前台模板根目录
    $param['web_templeturl'] = $web_mainsite.$param['web_templets_dir']; // 前台模板根目录的网址
    $param['web_templets_pc'] = $web_mainsite.$param['web_templets_dir'].'/pc'; // 前台PC模板主题
    $param['web_templets_m'] = $web_mainsite.$param['web_templets_dir'].'/mobile'; // 前台手机模板主题
    $param['web_eyoucms'] = str_replace('#', '', '#h#t#t#p#:#/#/#w#w#w#.#e#y#o#u#c#m#s#.#c#o#m#'); // eyou网址

    /*将内置的全局变量(页面上没有入口更改的全局变量)存储到web版块里*/
    $inc_type = 'web';
    foreach ($param as $key => $val) {
        if (preg_match("/^".$inc_type."_(.)+/i", $key) !== 1) {
            $nowKey = strtolower($inc_type.'_'.$key);
            $param[$nowKey] = $val;
        }
    }
    tpCache($inc_type, $param);
    $globalParams = array_merge($globalParams, $param);
    /*--end*/

    return $globalParams;
}

/**
 * 写入静态页面缓存
 */
function write_html_cache($html){
    $html_cache_status = config('HTML_CACHE_STATUS');
    $html_cache_arr = config('HTML_CACHE_ARR');
    if ($html_cache_status) {
        $request = think\Request::instance();
        $m_c_a_str = $request->module().'_'.$request->controller().'_'.$request->action(); // 模块_控制器_方法
        $m_c_a_str = strtolower($m_c_a_str);
        //exit('write_html_cache写入缓存<br/>');
        foreach($html_cache_arr as $key=>$val)
        {
            $val['mca'] = strtolower($val['mca']);
            if($val['mca'] != $m_c_a_str) //不是当前 模块 控制器 方法 直接跳过
                continue;

            if (empty($val['filename'])) {
                continue;
            }

            $filename = $val['filename'];
            // 组合参数  
            if(isset($val['p']))
            {
                foreach ($val['p'] as $k=>$v) {
                    if (isset($_GET[$v])) {
                        if (preg_match('/\/$/i', $filename)) {
                            $filename.=$_GET[$v];
                        } else {
                            $filename.='_'.$_GET[$v];
                        }
                    }
                }
            }

            if ($val['cache'] == 'html') {
                if (isMobile()) {
                    $filename = "mobile/{$filename}.html";
                } else {
                    $filename = "pc/{$filename}.html";
                }
                $filename = HTML_PATH.$filename;
                tp_mkdir(dirname($filename));
                file_put_contents($filename, $html);
            } else {
                if (isMobile()) {
                    $path = HTML_PATH."mobile/cache/";
                } else {
                    $path = HTML_PATH."pc/cache/";
                }
                $path = dirname($path.$val['filename']).'/';
                $options = array(
                    'path'  => $path,
                    'expire'=> intval($val['cache']),
                );
                html_cache($filename,$html,$options);
            }
        }
    }
}

/**
 * 读取静态页面缓存
 */
function read_html_cache(){
    $html_cache_status = config('HTML_CACHE_STATUS');
    $html_cache_arr = config('HTML_CACHE_ARR');
    if ($html_cache_status) {
        $request = think\Request::instance();
        $m_c_a_str = $request->module().'_'.$request->controller().'_'.$request->action(); // 模块_控制器_方法
        $m_c_a_str = strtolower($m_c_a_str);
        //exit('read_html_cache读取缓存<br/>');
        foreach($html_cache_arr as $key=>$val)
        {
            $val['mca'] = strtolower($val['mca']);
            if($val['mca'] != $m_c_a_str) //不是当前 模块 控制器 方法 直接跳过
                continue;

            if (empty($val['filename'])) {
                continue;
            }

            $filename =  $val['filename'];
            // 组合参数  
            if(isset($val['p']))
            {
                foreach ($val['p'] as $k=>$v) {
                    if (isset($_GET[$v])) {
                        if (preg_match('/\/$/i', $filename)) {
                            $filename.=$_GET[$v];
                        } else {
                            $filename.='_'.$_GET[$v];
                        }
                    }
                }
            }

            if ($val['cache'] == 'html') {
                if (isMobile()) {
                    $filename = "mobile/{$filename}.html";
                } else {
                    $filename = "pc/{$filename}.html";
                }
                $filename = HTML_PATH.$filename;
                if(is_file($filename) && file_exists($filename))
                {
                    echo file_get_contents($filename);
                    exit();
                }
            } else {
                if (isMobile()) {
                    $path = HTML_PATH."mobile/cache/";
                } else {
                    $path = HTML_PATH."pc/cache/";
                }
                $path = dirname($path.$val['filename']).'/';
                $options = array(
                    'path'  => $path,
                    'expire'=> $val['cache'],
                );
                $html_cache = html_cache($options);
                $html = $html_cache->get($filename);
                // $html = \think\Cache::get($filename);
                if($html)
                {
                    echo $html;
                    exit();
                }
            }
        }
    }
}

/**
 * 清除静态页面缓存
 */
function clear_html_cache($filename = ''){

}

/**
 * 链接前缀
 */
function prefix_http($domain)
{
    $http = config('is_https') ? 'https://' : 'http://';
    return $http.$domain;
}

/**
 * 获得全部省份列表
 */
function get_province_list()
{
    $result = extra_cache('global_get_province_list');
    if ($result == false) {
        $result = M('region')->field('id, name')
            ->where('level',1)
            ->getAllWithIndex('id');
        extra_cache('global_get_province_list', $result);
    }

    return $result;
}

/**
 * 获得全部城市列表
 */
function get_city_list()
{
    $result = extra_cache('global_get_city_list');
    if ($result == false) {
        $result = M('region')->field('id, name')
            ->where('level',2)
            ->getAllWithIndex('id');
        extra_cache('global_get_city_list', $result);
    }

    return $result;
}

/**
 * 获得全部地区列表
 */
function get_area_list()
{
    $result = extra_cache('global_get_area_list');
    if ($result == false) {
        $result = M('region')->field('id, name')
            ->where('level',3)
            ->getAllWithIndex('id');
        extra_cache('global_get_area_list', $result);
    }

    return $result;
}

/**
 * 根据地区ID获得省份名称
 */
function get_province_name($id)
{
    $result = get_province_list();
    return empty($result[$id]) ? '银河系' : $result[$id]['name'];
}

/**
 * 根据地区ID获得城市名称
 */
function get_city_name($id)
{
    $result = get_city_list();
    return empty($result[$id]) ? '火星' : $result[$id]['name'];
}

/**
 * 根据地区ID获得县区名称
 */
function get_area_name($id)
{
    $result = get_area_list();
    return empty($result[$id]) ? '部落' : $result[$id]['name'];
}

/**
 * 默认头像
 */
function get_head_pic($pic_url = '')
{
    $default_pic = SITE_URL . '/public/static/common/images/bag-imgB.jpg';
    return empty($pic_url) ? $default_pic : $pic_url;
}

/**
 * 默认无图封面
 */
function get_default_pic($pic_url = '')
{
    $default_pic = SITE_URL . '/public/static/common/images/not_adv.jpg';
    return empty($pic_url) ? $default_pic : $pic_url;
}

/**
 * 关键字显眼
 */
function show_keywords($keywords, $title)
{
    $str = str_replace($keywords, "<strong style='color:red;'>{$keywords}</strong>", $title);
    return $str;
}

/**
 * 文章内容替换为内链
 * @param $content
 * @return mixed
 */
function get_glo_keywords($content)
{
    /* 这里可以改为读取数据表，然后缓存起来 */
    $keywords_list = array(
        ['title'=>'易优CMS', 'url'=>'http://www.eyoucms.com'],
        ['title'=>'易优', 'url'=>'http://www.eyoucms.com'],
    );
    if($keywords_list){
        $readnum = 0;
        foreach ($keywords_list as $key => $val) {
            $title = $val['title'];
            $len = strlen($title);
            $str = '<a href="'.$val['url'].'" target="_blank">'.$title.'</a>';
            $str_index = mb_strpos($content, $title);
            $content = preg_replace('/(?!<[^>]*)'.$title.'(?![^<]*>)/', $str, $content, 1);
            if(is_numeric($str_index)){
                $readnum += 1;
                //$content = substr_replace($content,$str,$str_index,$len);
                //$content = $this->str_replace_limit($title,$str,$content,$this->limit);
            }
            if($readnum == 8) return $content; //匹配到8个关键词就退出
        }
    }
    return $content;
}

/**
 * 获取阅读权限
 */
if ( ! function_exists('get_arcrank_list'))
{
    function get_arcrank_list()
    {
        $result = extra_cache('global_get_arcrank_list');
        if ($result === false)
        {
            $result = M('arcrank')->getAllWithIndex('rank');
            extra_cache('global_get_arcrank_list', $result);
        }

        return $result;
    }
}

/**
 *  产品缩略图 给于标签调用 拿出商品表的 original_img 原始图来裁切出来的
 * @param type $aid  商品id
 * @param type $width     生成缩略图的宽度
 * @param type $height    生成缩略图的高度
 */
function product_thum_images($aid, $width, $height)
{
    if (empty($aid)) return '';
    
    //判断缩略图是否存在
    $path = "public/upload/product/thumb/$aid/";
    $product_thumb_name = "product_thumb_{$aid}_{$width}_{$height}";

    // 这个商品 已经生成过这个比例的图片就直接返回了
    if (is_file($path . $product_thumb_name . '.jpg')) return '/' . $path . $product_thumb_name . '.jpg';
    if (is_file($path . $product_thumb_name . '.jpeg')) return '/' . $path . $product_thumb_name . '.jpeg';
    if (is_file($path . $product_thumb_name . '.gif')) return '/' . $path . $product_thumb_name . '.gif';
    if (is_file($path . $product_thumb_name . '.png')) return '/' . $path . $product_thumb_name . '.png';

    $original_img = M('archives')->cache(true,EYOUCMS_CACHE_TIME,"product")->where("aid", $aid)->getField('litpic');
    if (empty($original_img)) {
        return '/public/static/common/images/not_adv.jpg';
    }
    
    $ossClient = new \app\common\logic\OssLogic;
    if (($ossUrl = $ossClient->getProductThumbImageUrl($original_img, $width, $height))) {
        return $ossUrl;
    }

    $original_img = '.' . $original_img; // 相对路径
    if (!is_file($original_img)) {
        return '/public/static/common/images/not_adv.jpg';
    }

    try {
        vendor('topthink.think-image.src.Image');
        if(strstr(strtolower($original_img),'.gif'))
        {
            vendor('topthink.think-image.src.image.gif.Encoder');
            vendor('topthink.think-image.src.image.gif.Decoder');
            vendor('topthink.think-image.src.image.gif.Gif');               
        }           
        $image = \think\Image::open($original_img);

        $product_thumb_name = $product_thumb_name . '.' . $image->type();
        // 生成缩略图
        !is_dir($path) && mkdir($path, 0777, true);
        // 参考文章 http://www.mb5u.com/biancheng/php/php_84533.html  改动参考 http://www.thinkphp.cn/topic/13542.html
        $image->thumb($width, $height, 2)->save($path . $product_thumb_name, NULL, 100); //按照原图的比例生成一个最大为$width*$height的缩略图并保存
        //图片水印处理
        $water = tpCache('water');
        if ($water['is_mark'] == 1) {
            $imgresource = './' . $path . $goods_thumb_name;
            if ($width > $water['mark_width'] && $height > $water['mark_height']) {
                if ($water['mark_type'] == 'img') {
                    //检查水印图片是否存在
                    $waterPath = "." . $water['mark_img'];
                    if (is_file($waterPath)) {
                        $quality = $water['mark_quality'] ?: 80;
                        $waterTempPath = dirname($waterPath).'/temp_'.basename($waterPath);
                        $image->open($waterPath)->save($waterTempPath, null, $quality);
                        $image->open($imgresource)->water($waterTempPath, $water['mark_sel'], $water['mark_degree'])->save($imgresource);
                        @unlink($waterTempPath);
                    }
                } else {
                    //检查字体文件是否存在,注意是否有字体文件
                    $ttf = ROOT_PATH.'public/static/common/font/hgzb.ttf';
                    if (file_exists($ttf)) {
                        $size = $water['mark_txt_size'] ?: 30;
                        $color = $water['mark_txt_color'] ?: '#000000';
                        if (!preg_match('/^#[0-9a-fA-F]{6}$/', $color)) {
                            $color = '#000000';
                        }
                        $transparency = intval((100 - $water['mark_degree']) * (127/100));
                        $color .= dechex($transparency);
                        $image->open($imgresource)->text($water['mark_txt'], $ttf, $size, $color, $water['mark_sel'])->save($imgresource);
                    }
                }
            }
        }
        $img_url = '/' . $path . $product_thumb_name;

        return $img_url;
    } catch (think\Exception $e) {

        return $original_img;
    }
}

/**
 * 产品相册缩略图
 */
function get_product_sub_images($sub_img, $aid, $width, $height)
{
    //判断缩略图是否存在
    $path = "public/upload/product/thumb/$aid/";
    $product_thumb_name = "product_sub_thumb_{$sub_img['img_id']}_{$width}_{$height}";
    
    //这个缩略图 已经生成过这个比例的图片就直接返回了
    if (is_file($path . $product_thumb_name . '.jpg')) return '/' . $path . $product_thumb_name . '.jpg';
    if (is_file($path . $product_thumb_name . '.jpeg')) return '/' . $path . $product_thumb_name . '.jpeg';
    if (is_file($path . $product_thumb_name . '.gif')) return '/' . $path . $product_thumb_name . '.gif';
    if (is_file($path . $product_thumb_name . '.png')) return '/' . $path . $product_thumb_name . '.png';

    $ossClient = new \app\common\logic\OssLogic;
    if (($ossUrl = $ossClient->getProductAlbumThumbUrl($sub_img['image_url'], $width, $height))) {
        return $ossUrl;
    }
    
    $original_img = '.' . $sub_img['image_url']; //相对路径
    if (!is_file($original_img)) {
        return '/public/static/common/images/not_adv.jpg';
    }

    try {
        vendor('topthink.think-image.src.Image');
        if(strstr(strtolower($original_img),'.gif'))
        {
            vendor('topthink.think-image.src.image.gif.Encoder');
            vendor('topthink.think-image.src.image.gif.Decoder');
            vendor('topthink.think-image.src.image.gif.Gif');
        }
        $image = \think\Image::open($original_img);

        $product_thumb_name = $product_thumb_name . '.' . $image->type();
        // 生成缩略图
        !is_dir($path) && mkdir($path, 0777, true);
        // 参考文章 http://www.mb5u.com/biancheng/php/php_84533.html  改动参考 http://www.thinkphp.cn/topic/13542.html
        $image->thumb($width, $height, 2)->save($path . $product_thumb_name, NULL, 100); //按照原图的比例生成一个最大为$width*$height的缩略图并保存
        //图片水印处理
        $water = tpCache('water');
        if ($water['is_mark'] == 1) {
            $imgresource = './' . $path . $product_thumb_name;
            if ($width > $water['mark_width'] && $height > $water['mark_height']) {
                if ($water['mark_type'] == 'img') {
                    //检查水印图片是否存在
                    $waterPath = "." . $water['mark_img'];
                    if (is_file($waterPath)) {
                        $quality = $water['mark_quality'] ?: 80;
                        $waterTempPath = dirname($waterPath).'/temp_'.basename($waterPath);
                        $image->open($waterPath)->save($waterTempPath, null, $quality);
                        $image->open($imgresource)->water($waterTempPath, $water['mark_sel'], $water['mark_degree'])->save($imgresource);
                        @unlink($waterTempPath);
                    }
                } else {
                    //检查字体文件是否存在,注意是否有字体文件
                    $ttf = ROOT_PATH.'public/static/common/font/hgzb.ttf';
                    if (file_exists($ttf)) {
                        $size = $water['mark_txt_size'] ?: 30;
                        $color = $water['mark_txt_color'] ?: '#000000';
                        if (!preg_match('/^#[0-9a-fA-F]{6}$/', $color)) {
                            $color = '#000000';
                        }
                        $transparency = intval((100 - $water['mark_degree']) * (127/100));
                        $color .= dechex($transparency);
                        $image->open($imgresource)->text($water['mark_txt'], $ttf, $size, $color, $water['mark_sel'])->save($imgresource);
                    }
                }
            }
        }
        $img_url = '/' . $path . $product_thumb_name;

        return $img_url;
    } catch (think\Exception $e) {

        return $original_img;
    }
}


if (!function_exists('ui_read_bidden_inc')) {
/**
 * 读取被禁止外部访问的配置文件
 * @param string $filename 文件路径
 * @return mixed
 */
    function ui_read_bidden_inc($filename)
    {
        $data = false;
        if (file_exists($filename)) {
            $data = @file($filename);
            $data = json_decode($data[1], true);
        }

        if (empty($data)) {
            // -------------优先读取配置文件，不存在才读取数据表
            $params = explode('/', $filename);
            $page = $params[count($params) - 1];
            $pagearr = explode('.', $page);
            reset($pagearr);
            $page = current($pagearr);
            $map = array(
                'theme_style'   => THEME_STYLE,
                'page'   => $page,
            );
            $result = M('ui_config')->where($map)->select();
            if ($result) {
                $dataArr = array();
                foreach ($result as $key => $val) {
                    $k = "{$val['type']}_{$val['name']}";
                    $dataArr[$k] = $val['value'];
                }
                $data = $dataArr;
            } else {
                $data = false;
            }
            //---------------end

            if (!empty($data)) {
                // ----------文件不存在，并写入文件缓存
                tp_mkdir(dirname($filename));
                $nowData = $data;
                $setting = "<?php die('forbidden'); ?>\n";
                $setting .= json_encode($nowData);
                $setting = str_replace("\/", "/",$setting);
                $incFile = fopen($filename, "w+");
                if ($incFile != false && fwrite($incFile, $setting)) {
                    fclose($incFile);
                }
                //---------------end
            }
        }
        
        return $data;
    }
}

if (!function_exists('ui_write_bidden_inc')) {
/**
 * 写入被禁止外部访问的配置文件
 * @param array $arr 配置变量
 * @param string $filename 文件路径
 * @param bool $is_append false
 * @return mixed
 */
    function ui_write_bidden_inc($data, $filename, $is_append = false)
    {
        $data2 = $data;
        if (!empty($filename)) {

            // -------------写入数据表，同时写入配置文件
            reset($data2);
            $value = current($data2);
            $tmp_val = json_decode($value, true);
            $name = $tmp_val['id'];
            $type = $tmp_val['type'];
            $page = $tmp_val['page'];
            $theme_style = THEME_STYLE;
            $md5key = md5($theme_style.$page.$name);
            $savedata = array(
                'md5key'    => $md5key,
                'theme_style'  => $theme_style,
                'page'  => $page,
                'type'  => $type,
                'name'  => $name,
                'value' => $value,
            );
            $map = array(
                'md5key'   => $md5key,
            );
            $count = M('ui_config')->where($map)->count('id');
            if ($count > 0) {
                $savedata['update_time'] = getTime();
                $r = M('ui_config')->where(array('md5key'=>$md5key))->cache(true,EYOUCMS_CACHE_TIME,'ui_config')->update($savedata);
            } else {
                $savedata['add_time'] = getTime();
                $savedata['update_time'] = getTime();
                $r = M('ui_config')->insert($savedata);
                \think\Cache::clear('ui_config');
            }

            if ($r) {

                // ----------同时写入文件缓存
                tp_mkdir(dirname($filename));

                // 追加
                if ($is_append) {
                    $inc = ui_read_bidden_inc($filename);
                    if ($inc) {
                        $oldarr = (array)$inc;
                        $data = array_merge($oldarr, $data);
                    }
                }

                $setting = "<?php die('forbidden'); ?>\n";
                $setting .= json_encode($data);
                $setting = str_replace("\/", "/",$setting);
                $incFile = fopen($filename, "w+");
                if ($incFile != false && fwrite($incFile, $setting)) {
                    fclose($incFile);
                }
                //---------------end

                return true;
            }
        }

        return false;
    }
}

if (!function_exists('get_controller_byct')) {
/**
 * 根据模型ID获取控制器的名称
 * @return mixed
 */
    function get_controller_byct($current_channel)
    {
        $channeltype_info = model('Channeltype')->getInfo($current_channel, 'id,ctl_name');
        return $channeltype_info['ctl_name'];
    }
}

if (!function_exists('get_ui_inc_params')) {
/**
 * 获取模板主题的美化配置参数
 * @return mixed
 */
    function get_ui_inc_params($page)
    {
        $e_page = $page;
        $filename = RUNTIME_PATH.'ui/'.THEME_STYLE.'/'.$e_page.'.inc.php';
        $inc = ui_read_bidden_inc($filename);

        return $inc;
    }
}

/**
 * 生成静态页面
 */
function write_html_page($html, $htmlfile, $htmlpath){
    $seo_pseudo = tpCache('global.seo_pseudo');
    if ($seo_pseudo == 2) {
        if (empty($htmlfile) || empty($htmlpath)) {
            return '';
        }
        tp_mkdir($htmlpath);
        $filename = "{$htmlpath}/{$htmlfile}.html";
        file_put_contents($filename, $html);
    }
}

// 设置前台URL模式
function set_home_url_mode() {
    $uiset = I('param.uiset/s', 'off');
    $uiset = trim($uiset, '/');
    $seo_pseudo = tpCache('seo.seo_pseudo');
    if ($seo_pseudo == 1 || $uiset == 'on') {
        config('url_common_param', true);
        config('url_route_on', false);
    } elseif ($seo_pseudo == 2 && $uiset != 'on') {
        config('url_common_param', false);
        config('url_route_on', true);
    } elseif ($seo_pseudo == 3 && $uiset != 'on') {
        config('url_common_param', false);
        config('url_route_on', true);
    }
}

/**
 * 自动隐藏index.php入口文件
 */
function auto_hide_index($url) {
    $seo_inlet = tpCache('seo.seo_inlet');
    if ($seo_inlet == 1) {
        $url = str_replace('/index.php/', '/', $url);
    }
    return $url;
}

/**
 * 允许发布文档的栏目
 */
function allow_release_arctype($selected = 0, $allow_release_channel = array())
{
    $select_html = false;//extra_cache('admin_archives_release');
    if (empty($select_html)) {
        /*允许发布文档的模型*/
        $allow_release_channel = !empty($allow_release_channel) ? $allow_release_channel : config('global.allow_release_channel');

        /*所有栏目分类*/
        $arctype_max_level = intval(config('global.arctype_max_level'));
        $map = array(
            'c.status'  => 1,
        );
        $fields = "c.id, c.parent_id, c.current_channel, c.typename, c.grade, count(s.id) as has_children, '' as children";
        $res = db('arctype')
            ->field($fields)
            ->alias('c')
            ->join('__ARCTYPE__ s','s.parent_id = c.id','LEFT')
            ->where($map)
            ->group('c.id')
            ->order('c.parent_id asc, c.sort_order asc, c.id')
            ->cache(true,EYOUCMS_CACHE_TIME,"arctype")
            ->select();
        /*--end*/
        if (empty($res)) {
            return '';
        }

        /*过滤掉第三级栏目属于不允许发布的模型下*/
        foreach ($res as $key => $val) {
            if ($val['grade'] == ($arctype_max_level - 1) && !in_array($val['current_channel'], $allow_release_channel)) {
                unset($res[$key]);
            }
        }
        /*--end*/

        /*所有栏目列表进行层次归类*/
        $arr = group_same_key($res, 'parent_id');
        for ($i=0; $i < $arctype_max_level; $i++) {
            foreach ($arr as $key => $val) {
                foreach ($arr[$key] as $key2 => $val2) {
                    if (!isset($arr[$val2['id']])) {
                        $arr[$key][$key2]['has_children'] = 0;
                        continue;
                    }
                    $val2['children'] = $arr[$val2['id']];
                    $arr[$key][$key2] = $val2;
                }
            }
        }
        /*--end*/

        /*过滤掉第二级栏目属于不允许发布的模型下*/
        $nowArr = $arr[0];
        foreach ($nowArr as $key => $val) {
            if (!empty($nowArr[$key]['children'])) {
                foreach ($nowArr[$key]['children'] as $key2 => $val2) {
                    if (!in_array($nowArr[$key]['children'][$key2]['current_channel'], $allow_release_channel)) {
                        unset($nowArr[$key]['children'][$key2]);
                    }
                }
            }
            if (empty($nowArr[$key]['children']) && !in_array($nowArr[$key]['current_channel'], $allow_release_channel)) {
                unset($nowArr[$key]);
                continue;
            }
        }
        /*--end*/

        /*组装成层级下拉列表框*/
        $select_html = '';
        foreach ($nowArr AS $key => $val)
        {
            $select_html .= '<option value="' . $val['id'] . '" data-grade="' . $val['grade'] . '" data-current_channel="' . $val['current_channel'] . '"';
            $select_html .= ($selected == $val['id']) ? " selected='ture'" : '';
            $select_html .= '>';
            if ($val['grade'] > 0)
            {
                $select_html .= str_repeat('&nbsp;', $val['grade'] * 4);
            }
            $select_html .= htmlspecialchars(addslashes($val['typename'])) . '</option>';

            if (empty($val['children'])) {
                continue;
            }
            foreach ($nowArr[$key]['children'] as $key2 => $val2) {
                $select_html .= '<option value="' . $val2['id'] . '" data-grade="' . $val2['grade'] . '" data-current_channel="' . $val2['current_channel'] . '"';
                $select_html .= ($selected == $val2['id']) ? " selected='ture'" : '';
                $select_html .= '>';
                if ($val2['grade'] > 0)
                {
                    $select_html .= str_repeat('&nbsp;', $val2['grade'] * 4);
                }
                $select_html .= htmlspecialchars(addslashes($val2['typename'])) . '</option>';

                if (empty($val2['children'])) {
                    continue;
                }
                foreach ($nowArr[$key]['children'][$key2]['children'] as $key3 => $val3) {
                    $select_html .= '<option value="' . $val3['id'] . '" data-grade="' . $val3['grade'] . '" data-current_channel="' . $val3['current_channel'] . '"';
                    $select_html .= ($selected == $val3['id']) ? " selected='ture'" : '';
                    $select_html .= '>';
                    if ($val3['grade'] > 0)
                    {
                        $select_html .= str_repeat('&nbsp;', $val3['grade'] * 4);
                    }
                    $select_html .= htmlspecialchars(addslashes($val3['typename'])) . '</option>';
                }
            }
        }

        extra_cache('admin_archives_release', $select_html);
    }

    return $select_html;
}