<?php

namespace app\admin\behavior;

/**
 * 系统行为扩展：公共行为
 */
class AppEndBehavior {
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
        self::$actionName = request()->action();
        self::$controllerName = request()->controller();
        self::$moduleName = request()->module();
        // file_put_contents ( DATA_PATH."log.txt", date ( "Y-m-d H:i:s" ) . "  " . var_export('admin_AppEndBehavior',true) . "\r\n", FILE_APPEND );
        $this->_initialize();
    }

    protected function _initialize() {

    }
}
