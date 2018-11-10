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

namespace app\admin\controller;
use think\Db;
use think\Backup;

class Tools extends Base {

    /**
     * 数据表列表
     */
    public function index()
    {
        $dbtables = DB::query('SHOW TABLE STATUS');
        $total = 0;
        $list = array();
        foreach ($dbtables as $k => $v) {
            $name_arr = explode('_', $v['Name']);
            if ($name_arr[0] == trim(PREFIX, '_')) {
                $v['size'] = format_bytes($v['Data_length'] + $v['Index_length']);
                $list[$k] = $v;
                $total += $v['Data_length'] + $v['Index_length'];
            }
        }
        if (session('?backup_config.path')) {
            //备份完成，清空缓存
            @unlink(session('backup_config.path') . 'backup.lock');
            session('backup_tables', null);
            session('backup_file', null);
            session('backup_config', null);
        }
        $this->assign('list', $list);
        $this->assign('total', format_bytes($total));
        $this->assign('tableNum', count($list));
        return $this->fetch();
    }

    /**
     * 数据备份
     */
    public function export($tables = null, $id = null, $start = null)
    {
        //防止备份数据过程超时
        function_exists('set_time_limit') && set_time_limit(0);

        if(IS_POST && !empty($tables) && is_array($tables)){ //初始化
            $path = tpCache('global.web_sqldatapath');
            $path = !empty($path) ? $path : config('DATA_BACKUP_PATH');
            $path = trim($path, '/');
            if(!is_dir($path)){
                mkdir($path, 0755, true);
            }
            //读取备份配置
            $config = array(
                'path'     => realpath($path) . DS,
                'part'     => config('DATA_BACKUP_PART_SIZE'),
                'compress' => config('DATA_BACKUP_COMPRESS'),
                'level'    => config('DATA_BACKUP_COMPRESS_LEVEL'),
            );
            //检查是否有正在执行的任务
            $lock = "{$config['path']}backup.lock";
            if(is_file($lock)){
                return json(array('info'=>'检测到有一个备份任务正在执行，请稍后再试！', 'status'=>0, 'url'=>''));
            } else {
                //创建锁文件
                file_put_contents($lock, NOW_TIME);
            }

            //检查备份目录是否可写
            if(!is_writeable($config['path'])){
                return json(array('info'=>'备份目录不存在或不可写，请检查后重试！', 'status'=>0, 'url'=>''));
            }
            session('backup_config', $config);

            //生成备份文件信息
            $file = array(
                'name' => date('Ymd-His', $_SERVER['REQUEST_TIME']),
                'part' => 1,
            );
            session('backup_file', $file);
            //缓存要备份的表
            session('backup_tables', $tables);
            //创建备份文件
            $Database = new Backup($file, $config);
            if(false !== $Database->create()){
                $speed = (floor((1/count($tables))*10000)/10000*100).'%';
                $tab = array('id' => 0, 'start' => 0, 'speed'=>$speed, 'table'=>$tables[0]);
                return json(array('tables' => $tables, 'tab' => $tab, 'info'=>'初始化成功！', 'status'=>1, 'url'=>''));
            } else {
                return json(array('info'=>'初始化失败，备份文件创建失败！', 'status'=>0, 'url'=>''));
            }
        } elseif (IS_GET && is_numeric($id) && is_numeric($start)) { //备份数据
            $tables = session('backup_tables');
            //备份指定表
            $Database = new Backup(session('backup_file'), session('backup_config'));
            $start  = $Database->backup($tables[$id], $start);
            if(false === $start){ //出错
                return json(array('info'=>'备份出错！', 'status'=>0, 'url'=>''));
            } elseif (0 === $start) { //下一表
                if(isset($tables[++$id])){
                    $speed = (floor((($id+1)/count($tables))*10000)/10000*100).'%';
                    $tab = array('id' => $id, 'start' => 0, 'speed' => $speed, 'table'=>$tables[$id]);
                    return json(array('tab' => $tab, 'info'=>'备份完成！', 'status'=>1, 'url'=>''));
                } else { //备份完成，清空缓存
                    /*自动覆盖安装目录下的eyoucms.sql*/
                    $install_path = ROOT_PATH.'install';
                    if (file_exists($install_path)) {
                        $srcfile = session('backup_config.path').session('backup_file.name').'-'.session('backup_file.part').'.sql';
                        $dstfile = $install_path.'/eyoucms.sql';
                        @copy($srcfile, $dstfile);
                    }
                    /*--end*/
                    unlink(session('backup_config.path') . 'backup.lock');
                    session('backup_tables', null);
                    session('backup_file', null);
                    session('backup_config', null);
                    return json(array('info'=>'备份完成！', 'status'=>1, 'url'=>''));
                }
            } else {
                $rate = floor(100 * ($start[0] / $start[1]));
                $speed = floor((($id+1)/count($tables))*10000)/10000*100 + ($rate/100);
                $tab  = array('id' => $id, 'start' => $start[0], 'speed' => $speed.'%', 'table'=>$tables[$id]);
                return json(array('tab' => $tab, 'info'=>"正在备份...({$rate}%)", 'status'=>1, 'url'=>''));
            }

        } else {//出错
            return json(array('info'=>'参数错误！', 'status'=>0, 'url'=>''));
        }
    }
        
    /**
     * 优化
     */
    public function optimize()
    {
        $batchFlag = I('get.batchFlag', 0, 'intval');
        //批量删除
        if ($batchFlag) {
            $table = I('key', array());
        }else {
            $table[] = I('tablename' , '');
        }
    
        if (empty($table)) {
            $this->error('请选择要优化的表');
        }

        $strTable = implode(',', $table);
        if (!DB::query("OPTIMIZE TABLE {$strTable} ")) {
            $strTable = '';
        }
        $this->success("优化表成功" . $strTable, U('Tools/index'));
    
    }
    
    /**
     * 修复
     */
    public function repair()
    {
        $batchFlag = I('get.batchFlag', 0, 'intval');
        //批量删除
        if ($batchFlag) {
            $table = I('key', array());
        }else {
            $table[] = I('tablename' , '');
        }
    
        if (empty($table)) {
            $this->error('请选择修复的表');
        }
    
        $strTable = implode(',', $table);
        if (!DB::query("REPAIR TABLE {$strTable} ")) {
            $strTable = '';
        }
    
        $this->success("修复表成功" . $strTable, U('Tools/index'));
  
    }

    /**
     * 数据还原
     */
    public function restore()
    {
        $path = tpCache('global.web_sqldatapath');
        $path = !empty($path) ? $path : config('DATA_BACKUP_PATH');
        $path = trim($path, '/');
        if(!is_dir($path)){
            mkdir($path, 0755, true);
        }
        $path = realpath($path);
        $flag = \FilesystemIterator::KEY_AS_FILENAME;
        $glob = new \FilesystemIterator($path,  $flag);
        $list = array();
        $filenum = $total = 0;
        foreach ($glob as $name => $file) {
            if(preg_match('/^\d{8,8}-\d{6,6}-\d+\.sql(?:\.gz)?$/', $name)){
                $name = sscanf($name, '%4s%2s%2s-%2s%2s%2s-%d');
                $date = "{$name[0]}-{$name[1]}-{$name[2]}";
                $time = "{$name[3]}:{$name[4]}:{$name[5]}";
                $part = $name[6];
                $info = pathinfo($file);
                if(isset($list["{$date} {$time}"])){
                    $info = $list["{$date} {$time}"];
                    $info['part'] = max($info['part'], $part);
                    $info['size'] = $info['size'] + $file->getSize();
                } else {
                    $info['part'] = $part;
                    $info['size'] = $file->getSize();
                }
                $info['compress'] = ($info['extension'] === 'sql') ? '-' : $info['extension'];
                $info['time']  = strtotime("{$date} {$time}");
                $filenum++;
                $total += $info['size'];
                $list["{$date} {$time}"] = $info;
            }
        }
        array_multisort($list, SORT_DESC);
        $this->assign('list', $list);
        $this->assign('filenum',$filenum);
        $this->assign('total',$total);
        return $this->fetch();
    }

    /**
     * 上传sql文件
     */
    public function restoreUpload()
    {
        $fileError = isset($_FILES['sqlfile']['error']) ? $_FILES['sqlfile']['error'] : 0;
        switch ($fileError) {
            case '1':
                $errmsg = '上传的文件超过了 php.ini 中 upload_max_filesize选项限制的值';
                break;
            
            case '2':
                $errmsg = '上传文件的大小超过了 HTML 表单中 MAX_FILE_SIZE 选项指定的值';
                break;
            
            case '3':
                $errmsg = '文件只有部分被上传';
                break;
            
            case '4':
                $errmsg = '请上传sql文件';
                break;
            
            case '5':
                $errmsg = '上传文件大小为0';
                break;

            default:
                # code...
                break;
        }
        if ($fileError > 0) {
            $this->error($errmsg);
            exit;
        }

        $file = request()->file('sqlfile');
        if(empty($file)){
            $this->error('请先上传sql文件');
        }
        // 移动到框架应用根目录/data/sqldata/ 目录下
        $path = tpCache('global.web_sqldatapath');
        $path = !empty($path) ? $path : config('DATA_BACKUP_PATH');
        $path = trim($path, '/');
        $image_upload_limit_size = intval(tpCache('basic.file_size') * 1024 * 1024);
        $info = $file->validate(['size'=>$image_upload_limit_size,'ext'=>'sql,gz'])->move($path, $_FILES['sqlfile']['name']);
        if ($info) {
            //上传成功 获取上传文件信息
            $file_path_full = $info->getPathName();
            if (file_exists($file_path_full)) {
                $sqls = Backup::parseSql($file_path_full);
                if(Backup::install($sqls)){
//                    array_map("unlink", glob($path));
                    /*清除缓存*/
                    delFile(RUNTIME_PATH);
                    /*--end*/
                    $this->success("导入sql还原成功", U('Tools/restore'));
                }else{
                    $this->error('sql文件导入失败');
                }
            } else {
                $this->error('sql文件上传失败');
            }
        } else {
            //上传错误提示错误信息
            $this->error($file->getError());
        }
    }

    /**
     * 执行还原数据库操作
     * @param int $time
     * @param null $part
     * @param null $start
     */
    public function import($time = 0, $part = null, $start = null)
    {
        function_exists('set_time_limit') && set_time_limit(0);

        if(is_numeric($time) && is_null($part) && is_null($start)){ //初始化
            //获取备份文件信息
            $name  = date('Ymd-His', $time) . '-*.sql*';
            $path = tpCache('global.web_sqldatapath');
            $path = !empty($path) ? $path : config('DATA_BACKUP_PATH');
            $path = trim($path, '/');
            $path  = realpath($path) . DS . $name;
            $files = glob($path);
            $list  = array();
            foreach($files as $name){
                $basename = basename($name);
                $match    = sscanf($basename, '%4s%2s%2s-%2s%2s%2s-%d');
                $gz       = preg_match('/^\d{8,8}-\d{6,6}-\d+\.sql.gz$/', $basename);
                $list[$match[6]] = array($match[6], $name, $gz);
            }
            ksort($list);

            //检测文件正确性
            $last = end($list);
            if(count($list) === $last[0]){
                session('backup_list', $list); //缓存备份列表
                $part = 1;
                $start = 0;
                $data = array('part' => $part, 'start' => $start);
                // $this->success('初始化完成！', null, array('part' => $part, 'start' => $start));
                respose(array('code'=>1, 'msg'=>"初始化完成！准备还原#{$part}...", 'rate'=>'', 'data'=>$data));
            } else {
                // $this->error('备份文件可能已经损坏，请检查！');
                respose(array('code'=>0, 'msg'=>"备份文件可能已经损坏，请检查！"));
            }
        } elseif(is_numeric($part) && is_numeric($start)) {
            $list  = session('backup_list');
            $path = tpCache('global.web_sqldatapath');
            $path = !empty($path) ? $path : config('DATA_BACKUP_PATH');
            $path = trim($path, '/');
            $db = new Backup($list[$part], array(
                    'path'     => realpath($path) . DS,
                    'compress' => $list[$part][2]));
            $start = $db->import($start);
            if(false === $start){
                // $this->error('还原数据出错！');
                respose(array('code'=>0, 'msg'=>"还原数据出错！", 'rate'=>'0%'));
            } elseif(0 === $start) { //下一卷
                if(isset($list[++$part])){
                    $data = array('part' => $part, 'start' => 0);
                    // $this->success("正在还g原...#{$part}", null, $data);
                    $rate = (floor((($start+1)/count($list))*10000)/10000*100).'%';
                    respose(array('code'=>1, 'msg'=>"正在还f原#{$part}...", 'rate'=>$rate, 'data'=>$data));
                } else {
                    session('backup_list', null);
                    delFile(RUNTIME_PATH);
                    respose(array('code'=>1, 'msg'=>"还原完成...", 'rate'=>'100%'));
                    // $this->success('还原完成！');
                }
            } else {
                $data = array('part' => $part, 'start' => $start[0]);
                if($start[1]){
                    $rate = floor(100 * ($start[0] / $start[1])).'%';
                    respose(array('code'=>1, 'msg'=>"正在还原#{$part}...", 'rate'=>$rate, 'data'=>$data));
                    // $this->success("正在还d原...#{$part} ({$rate}%)", null, $data);
                } else {
                    $data['gz'] = 1;
                    respose(array('code'=>1, 'msg'=>"正在s还原#{$part}...", 'data'=>$data, 'start'=>$start));
                    // $this->success("正在还s原...#{$part}", null, $data);
                }
            }
        } else {
            // $this->error('参数错误！');
            respose(array('code'=>0, 'msg'=>"参数错误！", 'rate'=>'0%'));
        }
    }

    /**
     * (新)执行还原数据库操作
     * @param int $time
     */
    public function new_import($time = 0)
    {
        function_exists('set_time_limit') && set_time_limit(0);

        if(is_numeric($time) && intval($time) > 0){
            //获取备份文件信息
            $name  = date('Ymd-His', $time) . '-*.sql*';
            $path = tpCache('global.web_sqldatapath');
            $path = !empty($path) ? $path : config('DATA_BACKUP_PATH');
            $path = trim($path, '/');
            $path  = realpath($path) . DS . $name;
            $files = glob($path);
            $list  = array();
            foreach($files as $name){
                $basename = basename($name);
                $match    = sscanf($basename, '%4s%2s%2s-%2s%2s%2s-%d');
                $gz       = preg_match('/^\d{8,8}-\d{6,6}-\d+\.sql.gz$/', $basename);
                $list[$match[6]] = array($match[6], $name, $gz);
            }
            ksort($list);

            //检测文件正确性
            $last = end($list);
            $file_path_full = !empty($last[1]) ? $last[1] : '';
            if (file_exists($file_path_full)) {
                $sqls = Backup::parseSql($file_path_full);
                if(Backup::install($sqls)){
                    /*清除缓存*/
                    delFile(RUNTIME_PATH);
                    /*--end*/
                    $this->success("还原成功！", U('Tools/restore'));
                }else{
                    $this->error('还原失败！', U('Tools/restore'));
                }
            }
        }
        else 
        {
            $this->error("参数错误！", U('Tools/restore'));
        }
        exit;
    }

    /**
     * 下载
     * @param int $time
     */
    public function downFile($time = 0)
    {
        $name  = date('Ymd-His', $time) . '-*.sql*';
        $path = tpCache('global.web_sqldatapath');
        $path = !empty($path) ? $path : config('DATA_BACKUP_PATH');
        $path = trim($path, '/');
        $path  = realpath($path) . DS . $name;
        $files = glob($path);
        if(is_array($files)){
            foreach ($files as $filePath){
                if (!file_exists($filePath)) {
                    $this->error("该文件不存在，可能是被删除");
                }else{
                    $filename = basename($filePath);
                    header("Content-type: application/octet-stream");
                    header('Content-Disposition: attachment; filename="' . $filename . '"');
                    header("Content-Length: " . filesize($filePath));
                    readfile($filePath);
                }
            }
        }
    }

    /**
     * 删除备份文件
     * @param  Integer $time 备份时间
     */
    public function del()
    {
        $time = $time_arr = I('del_id/a');
        if(is_array($time_arr) && !empty($time_arr)){
            foreach ($time_arr as $key => $val) {
                $name  = date('Ymd-His', $val) . '-*.sql*';
                $path = tpCache('global.web_sqldatapath');
                $path = !empty($path) ? $path : config('DATA_BACKUP_PATH');
                $path = trim($path, '/');
                $path  = realpath($path) . DS . $name;
                array_map("unlink", glob($path));
                if(count(glob($path))){
                    respose(array('status'=>0, 'msg'=>'备份文件删除失败，请检查权限！'));
                }
            }
            respose(array('status'=>1, 'msg'=>'备份文件删除成功！'));
        } else {
            respose(array('status'=>0, 'msg'=>'参数错误！'));
        }
    }
}