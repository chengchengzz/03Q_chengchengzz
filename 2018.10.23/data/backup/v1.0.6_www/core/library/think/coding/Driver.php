<?php

namespace think\coding;

use think\App;
use think\Cookie;

class Driver
{
    protected static $actionName;
    protected static $controllerName;
    protected static $moduleName;
    protected static $incType;

    /**
     * 构造函数 取得模板对象实例
     * @access public
     */
    public function __construct()
    {
        self::$moduleName = request()->module();
        self::$controllerName = request()->controller();
        self::$actionName = request()->action();
        self::$incType = 'php';
    }

    /**
     * @access public
     */
    static public function check_service_domain() {
        // file_put_contents ( DATA_PATH."log.txt", date ( "Y-m-d H:i:s" ) . "  " . var_export('checkServiceDomain',true) . "\r\n", FILE_APPEND );
        $keys_token = array_join_string(array('f','n','N','l','c','n','Z','p','Y','2','V','f','Z','X','l','f','d','G','9','r','Z','W','5','+'));
        $keys_token = msubstr($keys_token, 1, strlen($keys_token) - 2);
        $token = config($keys_token);

        $keys = array_join_string(array('f','n','N','l','c','n','Z','p','Y','2','V','f','Z','X','l','+'));
        $keys = msubstr($keys, 1, strlen($keys) - 2);
        $domain = config($keys);
        $domainMd5 = md5('~'.base64_decode($domain).'~');

        if ($token != $domainMd5) {
            $msg = array_join_string(array('f','u','a','g','u','O','W','/','g','+','e','o','i','+','W','6','j','+','i','i','q','+','e','v','o','e','a','U','u','e','+','8','j','O','i','v','t','+','W','w','v','e','W','/','q','+','i','/','m','O','W','O','n','+','+','8','j','O','a','E','n','+','i','w','o','u','S','6','q','+','e','U','q','O','W','8','g','O','a','6','k','O','W','F','j','e','i','0','u','U','V','5','b','3','V','D','b','X','P','k','v','I','H','k','u','J','r','l','u','7','r','n','q','5','n','n','s','7','v','n','u','5','8','u','f','g','=','='));
            $msg = msubstr($msg, 1, -1);
            die($msg);
        }

        return false;
    }

    static public function reset_copy_right()
    {
        if (self::$moduleName == 'home' && self::$controllerName == 'Index' && self::$actionName == 'index') {
            // file_put_contents ( DATA_PATH."log.txt", date ( "Y-m-d H:i:s" ) . "  " . var_export('reset_copy_right',true) . "\r\n", FILE_APPEND );
            $tmpArray = array('I1','9','D','TV','ND','T1','BZ','U','k','l','H','S','F','R+');
            $cname = array_join_string($tmpArray);
            $cname = msubstr($cname, 1, strlen($cname) - 2);
            tpCache(self::$incType, array($cname=>''));
            // Cookie::forever(strtoupper($cname), null);
        }
    }

    static public function set_copy_right($name, $globalTpCache = array())
    {
        $value = isset($globalTpCache[$name]) ? $globalTpCache[$name] : '';

        $tmpArray = array('f','n','d','l','Y','l','9','j','b','3','B','5','c','m','l','n','a','H','R','+');
        $tmpName = array_join_string($tmpArray);
        $tmpName = msubstr($tmpName, 1, strlen($tmpName) - 2);

        if ($name == $tmpName) {

            if (self::$moduleName == 'home' && self::$controllerName == 'Index' && self::$actionName == 'index') {
                $tmpArray = array('I1','9','D','TV','ND','T1','BZ','U','k','l','H','S','F','R+');
                $cname = array_join_string($tmpArray);
                $cname = msubstr($cname, 1, strlen($cname) - 2);
                $is_cr = tpCache(self::$incType.'.'.$cname);
                // $is_cr = Cookie::get(strtoupper($cname));
                if ($name == $tmpName && empty($is_cr)) {
                    // file_put_contents ( DATA_PATH."log.txt", date ( "Y-m-d H:i:s" ) . "  " . var_export('tagglobalcopayright',true) . "\r\n", FILE_APPEND );
                    tpCache(self::$incType, array($cname=>get_rand_str(24, 0, 1)));
                    // Cookie::forever(strtoupper($cname), get_rand_str(24, 0, 1));
                }
            }

            $tmpArray = array('f','md','sb','2J','h','bF','9pc','19le','W91X','2F1','dG','hv','cnR','va2V','uf','g=','=');
            $is_author_key = array_join_string($tmpArray);
            $is_author_key = msubstr($is_author_key, 1, strlen($is_author_key) - 2);
            $is_author = extra_cache($is_author_key);
            if (-1 == $is_author) {
                $tmp_array = array('I','D','x','h','I','G','h','y','Z','W','Y','9','I','m','h','0','d','H','A','6','L','y','9','3','d','3','c','u','Z','X','l','v','d','W','N','t','c','y','5','j','b','2','0','i','I','H','R','h','c','m','d','l','d','D','0','i','X','2','J','s','Y','W','5','r','I','j','5','Q','b','3','d','l','c','m','V','k','I','G','J','5','I','E','V','5','b','3','V','D','b','X','M','8','L','2','E','+');
                $value .= array_join_string($tmp_array);
            }
        }

        return $value;
    }

    static public function check_copy_right()
    {
        // file_put_contents ( DATA_PATH."log.txt", date ( "Y-m-d H:i:s" ) . "  " . var_export('check_copy_right',true) . "\r\n", FILE_APPEND );
        if (self::$moduleName != 'admin') {
            $tmpArray = array('I1','9','D','TV','ND','T1','BZ','U','k','l','H','S','F','R+');
            $cname = array_join_string($tmpArray);
            $cname = msubstr($cname, 1, strlen($cname) - 2);
            $val = tpCache(self::$incType.'.'.$cname);
            // $val = Cookie::get(strtoupper($cname));
            if (empty($val)) {
                $tmpArray = array('I','+','m','m','l','u','m','h','t','e','a','o','o','e','a','d','v','+','m','H','j','O','S','4','j','e','W','P','r','+','e','8','u','u','W','w','k','e','W','6','l','e','m','D','q','O','e','J','i','O','a','d','g','+','a','g','h','+','e','t','v','u','+','8','m','n','t','l','e','W','9','1','O','m','d','s','b','2','J','h','b','C','B','u','Y','W','1','l','P','S','d','3','Z','W','J','f','Y','2','9','w','e','X','J','p','Z','2','h','0','J','y','A','v','f','S','M','=');
                $msg = array_join_string($tmpArray);
                $msg = msubstr($msg, 1, -1);
                exception($msg);
            }
        }
    }

    /**
     * 检!测!码
     * @access public
     */
    static public function check_author_ization()
    {
        $isset_author = session('isset_author');
        if(!empty($isset_author)) {
            return false;
        }
        session('isset_author', 1);

        $tokenKey = array_join_string(array('f','m','d','s','b','2','J','h','b','C','5','3','Z','W','J','f','Y','X','V','0','a','G','9','y','d','G','9','r','Z','W','5','+'));
        $tokenKey = msubstr($tokenKey, 1, strlen($tokenKey) - 2);
        $codeStr = tpCache($tokenKey);

        $keys = array_join_string(array('f','n','N','l','c','n','Z','p','Y','2','V','f','Z','X','l','+'));
        $keys = msubstr($keys, 1, strlen($keys) - 2);
        $domain = config($keys);
        $domian = base64_decode($domain);
        /*数组键名*/
        $arrKey = array_join_string(array('fm','N','sa','WV','udF','9k','b2','1','h','a','W','5+'));
        $arrKey = msubstr($arrKey, 1, strlen($arrKey) - 2);
        /*--end*/
        $vaules = array(
            $arrKey => urldecode($_SERVER['HTTP_HOST']),
        );
        $query_str = array_join_string(array('f','i','9','p','b','m','R','l','e','C','5','w','a','H','A','/','b','T','1','h','c','G','k','m','Y','z','1','T','Z','X','J','2','a','W','N','l','J','m','E','9','Z','2','V','0','X','2','F','1','d','G','h','v','c','n','R','v','a','2','V','u','J','n','4','='));
        $query_str = msubstr($query_str, 1, strlen($query_str) - 2);
        $url = $domian.$query_str.http_build_query($vaules);
        $context = stream_context_set_default(array('http' => array('timeout' => 3,'method'=>'GET')));
        $response = @file_get_contents($url,false,$context);
        $params = json_decode($response,true);

        $iseyKey = array_join_string(array('f','m','l','z','X','2','V','5','b','3','V','f','Y','X','V','0','a','G','9','y','d','G','9','r','Z','W','5','+'));
        $iseyKey = msubstr($iseyKey, 1, strlen($iseyKey) - 2);
        session($iseyKey, 1); // 是
        if (is_array($params) && $params['errcode'] == 0) {
            if (empty($params['info']['code']) || $codeStr != $params['info']['code']) {
                session($iseyKey, -1);
                return true;
            }
        }
        if (is_array($params) && $params['errcode'] == 10002) {
            $ctl_act_list = array(
                // 'index_index',
                // 'index_welcome',
                // 'upgrade_welcome',
                // 'system_index',
            );
            $ctl_act_str = strtolower(self::$controllerName).'_'.strtolower(self::$actionName);
            if(in_array($ctl_act_str, $ctl_act_list))  
            {

            } else {
                session('isset_author', null);
                die($params['errmsg']);
            }
        }

        return true;
    }
}
