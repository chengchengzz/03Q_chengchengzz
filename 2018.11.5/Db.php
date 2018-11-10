<?php 

//封装一个Db类
class DB{
	//属性
    private $shost;
    private $port;
    private $user;
    private $pass;
    private $dbname;
    private $charset;
    //表前缀
    private $prefix;
    //连接资源(连接数据库，一般会返回一个资源，所以需要定义一个link属性)
    private $link;
    //构造函数
    public function __construct($arr = array()){
        //初始化
      	$this->port = isset($arr['port']) ? $arr['port'] : '3306';
      	$this->user = isset($arr['user']) ? $arr['user'] : 'root';
      	$this->pass = isset($arr['pass']) ? $arr['pass'] : 'root';
        $this->dbname = isset($arr['dbname']) ? $arr['dbname'] : '2018.11.5';
        $this->charset = isset($arr['charset']) ? $arr['charset'] : 'utf8';
        $this->prefix = isset($arr['prefix']) ? $arr['prefix'] : '';
        //连接数据库
        $this->connect();
        //设置字符集
        $this->setCharset();
        //选择数据库
        $this->setDbname();
    }
    //连接数据库
    private function connect(){
    	//musql扩张连接
    	$this->link = mysql_connect($this->host . ':' . $this->port,$this->user,$this->pass);
    	//判断结果
    	if(!$this->link){
    		 echo '连接数据库错误';
    		 echo '错误编号' . mysql_errno() . '<br/>';
    		 echo '错误内容' . mysql_error() . '<br/>';
              exit();
    	   }
      }
         //设置字符集
         private function setCharset(){
      	 //设置
        $this->db_query("set name {$this->charset}");
       }
       /*
         * 选择数据库
        */
        private function setDbname(){
        	$this->db_query("use {$this->dbname}");
        }
        //增加数据
        public function db_insert($sql){
            //发送数据
            $this->db_query($sql);
            //返回首页
            return mysql_affected_rows() ? mysql_insert_id() : FALSE;
        }
            //删除数据
        public function dba_delete($sql){
            //发送sql
            $this->db_query($sql);
            //判断结果
            return mysql_affected_rows() ? mysql_affected_rows() : FALSE;
        }
            //更新数据
        public function db_getRow($sql){
            //发送sql
            $res = $this->db_query($sql);
            //判断返回
            retuen mysql_affected_rows() ? mysql_affected_rows() : FALSE;
          }
         public function db_getAll($sql){
             //发送SQL
             $res = $this->db_query($sql);
              //判断返回
              if(mysql_num_rows($res)){
                //循环遍历
                  $list = array();
                  //遍历
                   while($row = mysql_fetch_assoc($res)){
                    $list[] = $row;
                   }
                   //返回
                   return $list;
               }
               //返回FALSE
               return FALSE;
          }
          //musql_query错误处理
          private function db_query($sql){
            //发送sql
            $res = mysql_query($sql);
            //判断结果
            if($res){
                //结果出错了
                echo '语句出现错误：<br/>';
                echo '错误编号' . mysql_errno() . '<br/>';
                echo '错误内容' . mysql_error() . '<br/>';
                exit;          
             }
             //没有错误
             return $res;
          }
           //__seleep发送
          public function __sleep(){
           //返回需要保存的属性的数组
           return array('host','port','user','pass','dbname','charset','prefix');  
          }
          //__wakeup方法
          public function __wakeup(){
             //连接资源
             $this->connect();
             //设置字符集和选中数据库
              $this->setCharset();
              $this->setDbname();
          }
               /*
             * 获取完整的表名
            */
       protected function getTableName(){
        //完整表名：前缀+表名
         return $this->prefix . $this->table;
       }
   }








