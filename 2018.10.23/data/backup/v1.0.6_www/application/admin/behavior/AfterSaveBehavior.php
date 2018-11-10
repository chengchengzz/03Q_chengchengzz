<?php

namespace app\admin\behavior;

/**
 * 系统行为扩展：新增/更新/删除之后的后置操作
 */
class AfterSaveBehavior {
    protected static $actionName;
    protected static $controllerName;
    protected static $moduleName;

    /**
     * 构造方法
     * @param Request $request Request对象
     * @access public
     */
    public function __construct()
    {

    }

    // 行为扩展的执行入口必须是run
    public function run(&$params){
        if (request()->method() == 'POST' && (self::$controllerName != 'Index' && self::$actionName != 'index')) {
            self::$actionName = request()->action();
            self::$controllerName = request()->controller();
            self::$moduleName = request()->module();
            // file_put_contents ( DATA_PATH."log.txt", date ( "Y-m-d H:i:s" ) . "  " . var_export('admin_AfterSaveBehavior',true) . "\r\n", FILE_APPEND );
            $this->_initialize();
        }
    }

    protected function _initialize() {
        $this->sitemap();
    }

    /**
     * 自动生成sitemap
     * @access public
     */
    protected function sitemap()
    {
        $ctlArr = array('Article','Product','Images','Download');
        $actArr = array('add');
        if (in_array(self::$controllerName, $ctlArr) && in_array(self::$actionName, $actArr)) {
            sitemap_auto();
        }
    }
}
