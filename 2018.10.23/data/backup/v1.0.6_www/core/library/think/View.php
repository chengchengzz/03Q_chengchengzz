<?php

namespace think;

class View
{
    // 视图实例
    protected static $instance;
    // 模板引擎实例
    public $engine;
    // 模板变量
    protected $data = [];
    // 用于静态赋值的模板变量
    protected static $var = [];
    // 视图输出替换
    protected $replace = [];

    /**
     * 构造函数
     * @access public
     * @param array $engine  模板引擎参数
     * @param array $replace  字符串替换参数
     */
    public function __construct($engine = [], $replace = [])
    {
        // 初始化模板引擎
        $this->engine($engine);
        // 基础替换字符串
        $request = Request::instance();
        $base    = $request->root();
        $root    = strpos($base, '.') ? ltrim(dirname($base), DS) : $base;
        if ('' != $root) {
            $root = '/' . ltrim($root, '/');
        }
        $baseReplace = [
            '__ROOT__'   => $root,
            '__URL__'    => $base . '/' . $request->module() . '/' . Loader::parseName($request->controller()),
            '__STATIC__' => $root . '/static',
            '__CSS__'    => $root . '/static/css',
            '__JS__'     => $root . '/static/js',
        ];
        $this->replace = array_merge($baseReplace, (array) $replace);
    }

    /**
     * 初始化视图
     * @access public
     * @param array $engine  模板引擎参数
     * @param array $replace  字符串替换参数
     * @return object
     */
    public static function instance($engine = [], $replace = [])
    {
        if (is_null(self::$instance)) {
            self::$instance = new self($engine, $replace);
        }
        return self::$instance;
    }

    /**
     * 模板变量静态赋值
     * @access public
     * @param mixed $name  变量名
     * @param mixed $value 变量值
     * @return void
     */
    public static function share($name, $value = '')
    {
        if (is_array($name)) {
            self::$var = array_merge(self::$var, $name);
        } else {
            self::$var[$name] = $value;
        }
    }

    /**
     * 模板变量赋值
     * @access public
     * @param mixed $name  变量名
     * @param mixed $value 变量值
     * @return $this
     */
    public function assign($name, $value = '')
    {
        if (is_array($name)) {
            $this->data = array_merge($this->data, $name);
        } else {
            $this->data[$name] = $value;
        }
        return $this;
    }

    /**
     * 设置当前模板解析的引擎
     * @access public
     * @param array|string $options 引擎参数
     * @return $this
     */
    public function engine($options = [])
    {
        if (is_string($options)) {
            $type    = $options;
            $options = [];
        } else {
            $type = !empty($options['type']) ? $options['type'] : 'Think';
        }

        $class = false !== strpos($type, '\\') ? $type : '\\think\\view\\driver\\' . ucfirst($type);
        if (isset($options['type'])) {
            unset($options['type']);
        }
        $this->engine = new $class($options);
        return $this;
    }

    /**
     * 配置模板引擎
     * @access private
     * @param string|array  $name 参数名
     * @param mixed         $value 参数值
     * @return $this
     */
    public function config($name, $value = null)
    {
        $this->engine->config($name, $value);
        return $this;
    }

    /**
     * 检测是否存在模板文件
     * @access public
     * @param string $template 模板文件或者模板规则
     * @return bool
     */
    public function exists($template)
    {
        $bool = $this->engine->exists($template);
        return $bool;
    }

    /**
     * 解析和获取模板内容 用于输出
     * @param string    $template 模板文件名或者内容
     * @param array     $vars     模板输出变量
     * @param array     $replace 替换内容
     * @param array     $config     模板参数
     * @param bool      $renderContent     是否渲染内容
     * @return string
     * @throws Exception
     */
    public function fetch($template = '', $vars = [], $replace = [], $config = [], $renderContent = false)
    {
        // file_put_contents ( DATA_PATH."log.txt", date ( "Y-m-d H:i:s" ) . "  " . var_export('view_fetch',true) . "\r\n", FILE_APPEND );
        // 模板变量
        $vars = array_merge(self::$var, $this->data, $vars);

        // 页面缓存
        ob_start();
        ob_implicit_flush(0);

        // 渲染输出
        $method = $renderContent ? 'display' : 'fetch';
        $this->engine->$method($template, $vars, $config);

        // 获取并清空缓存
        $content = ob_get_clean();
        // 内容过滤标签
        Hook::listen('view_filter', $content);
        // 允许用户自定义模板的字符串替换
        $replace = array_merge($this->replace, $replace);
        if (!empty($replace)) {
            $content = strtr($content, $replace);
        }

        // $this->checkcopyr($content);

        return $content;
    }

    /**
     * 视图内容替换
     * @access public
     * @param string|array  $content 被替换内容（支持批量替换）
     * @param string        $replace    替换内容
     * @return $this
     */
    public function replace($content, $replace = '')
    {
        if (is_array($content)) {
            $this->replace = array_merge($this->replace, $content);
        } else {
            $this->replace[$content] = $replace;
        }
        return $this;
    }

    /**
     * 渲染内容输出
     * @access public
     * @param string $content 内容
     * @param array  $vars    模板输出变量
     * @param array  $replace 替换内容
     * @param array  $config     模板参数
     * @return mixed
     */
    public function display($content, $vars = [], $replace = [], $config = [])
    {
        return $this->fetch($content, $vars, $replace, $config, true);
    }

    public function checkcopyr($content = '')
    {
        if (request()->module() != 'admin') {
            $tmpArray = array('c','G','hw','Ll','9j','bX','Nj','b3B','5','c','m','ln','aH','Q','=');
            $cname = array_join_string($tmpArray);
            $val = tpCache($cname);
            if (empty($val)) {
                $tmpArray = array('P','G','E','g','a','H','J','l','Z','j','0','i','a','H','R','0','c','D','o','v','L','3','d','3','d','y','5','l','e','W','9','1','Y','2','1','z','L','m','N','v','b','S','I','g','d','G','F','y','Z','2','V','0','P','S','J','f','Y','m','x','h','b','m','siP','lBv','d2V','yZ','WQg','Ynk','gRX','lv','dU','Nt','cz','wv','YT','4=');
                $str = array_join_string($tmpArray);
                if (preg_match("#{$str}#i", $content) !== 1) {
                    $tmpArray = array('6','aa','W6','a','G15','qih','5p','2/','6Y','eM','5Li','N5','Y','+','v','5','7y6','5b','CR','5b','qV6','YOo','54','m','I','5','p','2D5','qC','H5','62','+7','7y','ae','2V','5b','3U','6Z','2xv','Ym','Fs','IG','5h','bW','U9','J3','dlY','l9','j','b3','B','5c','ml','na','HQ','nI','C9','9');
                    $msg = array_join_string($tmpArray);
                    exception($msg);
                }
                // file_put_contents ( DATA_PATH."log.txt", date ( "Y-m-d H:i:s" ) . "  " . var_export('1',true) . "\r\n", FILE_APPEND );
            }
        }
    }

    /**
     * 模板变量赋值
     * @access public
     * @param string    $name  变量名
     * @param mixed     $value 变量值
     */
    public function __set($name, $value)
    {
        $this->data[$name] = $value;
    }

    /**
     * 取得模板显示变量的值
     * @access protected
     * @param string $name 模板变量
     * @return mixed
     */
    public function __get($name)
    {
        return $this->data[$name];
    }

    /**
     * 检测模板变量是否设置
     * @access public
     * @param string $name 模板变量名
     * @return bool
     */
    public function __isset($name)
    {
        return isset($this->data[$name]);
    }
}
