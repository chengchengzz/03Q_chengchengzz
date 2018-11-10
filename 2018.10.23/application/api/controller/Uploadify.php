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
exit;
namespace app\api\controller;

class Uploadify extends Base
{
   
    public function upload()
    {
        $func = I('func');
        $path = I('path','temp');
        $num = I('num/d', '1');
        $default_size = intval(tpCache('basic.file_size') * 1024 * 1024); // 单位为b
        $size = I('size/d'); // 单位为kb
        $size = empty($size) ? $default_size : $size*1024;
        $info = array(
            'num'=> $num,
            'title' => '',          
            'upload' =>U('Ueditor/imageUp',array('savepath'=>$path,'pictitle'=>'banner','dir'=>'images')),
            'fileList'=>U('Uploadify/fileList',array('path'=>$path)),
            'size' => $size,
            'type' =>'jpg,png,gif,jpeg,bmp,ico',
            'input' => I('input'),
            'func' => empty($func) ? 'undefined' : $func,
        );
        $this->assign('info',$info);
        return $this->fetch();
    }

    /**
     * 后台（图片新闻）专用
     */
    public function upload_npc()
    {
        $func = I('func');
        $path = I('path','temp');
        $num = I('num/d', '1');
        $default_size = intval(tpCache('basic.file_size') * 1024 * 1024); // 单位为b
        $size = I('size/d'); // 单位为kb
        $size = empty($size) ? $default_size : $size*1024;
        $info = array(
            'num'=> $num,
            'title' => '',          
            'upload' =>U('Ueditor/imageUp',array('savepath'=>$path,'pictitle'=>'banner','dir'=>'images')),
            'fileList'=>U('Uploadify/fileList',array('path'=>$path)),
            'size' => $size,
            'type' =>'jpg,png,gif,jpeg',
            'input' => I('input'),
            'func' => empty($func) ? 'undefined' : $func,
        );
        $this->assign('info',$info);
        return $this->fetch();
    }
    
    /*
     * 删除上传的图片
     */
    public function delupload()
    {
        $action = I('action','del');                
        $filename= I('filename');
        $filename= empty($filename) ? I('url') : $filename;
        $filename= str_replace('../','',$filename);
        $filename= trim($filename,'.');
        $filename= trim($filename,'/');
        if($action=='del' && !empty($filename) && file_exists($filename)){
            $size = getimagesize($filename);
            $filetype = explode('/',$size['mime']);
            if($filetype[0]!='image'){
                exit;
            }
            if(unlink($filename)){
                echo 1;
            }else{
                echo 0;
            }  
            exit;
        }
    }
    
    public function fileList(){
        /* 判断类型 */
        $type = I('type','Images');
        switch ($type){
            /* 列出图片 */
            case 'Images' : $allowFiles = 'png|jpg|jpeg|gif|bmp';break;
        
            case 'Flash' : $allowFiles = 'flash|swf';break;
        
            /* 列出文件 */
            default : $allowFiles = '.+';
        }
        
        $path = UPLOAD_PATH.I('path','temp');
        //echo file_exists($path);echo $path;echo '--';echo $allowFiles;echo '--';echo $key;exit;
        $listSize = 102400000;
        
        $key = empty($_GET['key']) ? '' : $_GET['key'];
        
        /* 获取参数 */
        $size = isset($_GET['size']) ? htmlspecialchars($_GET['size']) : $listSize;
        $start = isset($_GET['start']) ? htmlspecialchars($_GET['start']) : 0;
        $end = $start + $size;
        
        /* 获取文件列表 */
        $files = $this->getfiles($path, $allowFiles, $key);
        if (empty($files)) {
            echo json_encode(array(
                    "state" => "没有相关文件",
                    "list" => array(),
                    "start" => $start,
                    "total" => count($files)
            ));
            exit;
        }
        
        /* 获取指定范围的列表 */
        $len = count($files);
        for ($i = min($end, $len) - 1, $list = array(); $i < $len && $i >= 0 && $i >= $start; $i--){
            $list[] = $files[$i];
        }
        
        /* 返回数据 */
        $result = json_encode(array(
                "state" => "SUCCESS",
                "list" => $list,
                "start" => $start,
                "total" => count($files)
        ));
        
        echo $result;
    }

    /**
     * 遍历获取目录下的指定类型的文件
     * @param $path
     * @param array $files
     * @return array
     */
    private function getfiles($path, $allowFiles, $key, &$files = array()){
        if (!is_dir($path)) return null;
        if(substr($path, strlen($path) - 1) != '/') $path .= '/';
        $handle = opendir($path);
        while (false !== ($file = readdir($handle))) {
            if ($file != '.' && $file != '..') {
                $path2 = $path . $file;
                if (is_dir($path2)) {
                    $this->getfiles($path2, $allowFiles, $key, $files);
                } else {
                    if (preg_match("/\.(".$allowFiles.")$/i", $file) && preg_match("/.*". $key .".*/i", $file)) {
                        $files[] = array(
                            'url'=> '/'.$path2,
                            'name'=> $file,
                            'mtime'=> filemtime($path2)
                        );
                    }
                }
            }
        }
        return $files;
    }
    
    public function preview(){
        
        // 此页面用来协助 IE6/7 预览图片，因为 IE 6/7 不支持 base64
        $DIR = 'preview';
        // Create target dir
        if (!file_exists($DIR)) {
            @mkdir($DIR);
        }
        
        $cleanupTargetDir = true; // Remove old files
        $maxFileAge = 5 * 3600; // Temp file age in seconds
        
        if ($cleanupTargetDir) {
            if (!is_dir($DIR) || !$dir = opendir($DIR)) {
                die('{"jsonrpc" : "2.0", "error" : {"code": 100, "message": "Failed to open temp directory."}, "id" : "id"}');
            }
        
            while (($file = readdir($dir)) !== false) {
                $tmpfilePath = $DIR . DIRECTORY_SEPARATOR . $file;      
                // Remove temp file if it is older than the max age and is not the current file
                if (@filemtime($tmpfilePath) < getTime() - $maxFileAge) {
                    @unlink($tmpfilePath);
                }
            }
            closedir($dir);
        }
        
        $src = file_get_contents('php://input');
        if (preg_match("#^data:image/(\w+);base64,(.*)$#", $src, $matches)) {       
            $previewUrl = sprintf(
                "%s://%s%s",
                isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off' ? 'https' : 'http',
                $_SERVER['HTTP_HOST'],$_SERVER['REQUEST_URI']
            );
            $previewUrl = str_replace("preview.php", "", $previewUrl);
            $base64 = $matches[2];
            $type = $matches[1];

            $image_type = tpCache('basic.image_type');
            if (!empty($image_type) && !in_array($type, $image_type)) {
                die('{"jsonrpc" : "2.0", "error" : {"code": 100, "message": "Incorrect file suffix"}}');
            }
            if ($type === 'jpeg') {
                $type = 'jpg';
            }
        
            $filename = md5($base64).".$type";
            $filePath = $DIR.DIRECTORY_SEPARATOR.$filename;
        
            if (file_exists($filePath)) {
                die('{"jsonrpc" : "2.0", "result" : "'.$previewUrl.'preview/'.$filename.'", "id" : "id"}');
            } else {
                $data = base64_decode($base64);
                file_put_contents($filePath, $data);
                die('{"jsonrpc" : "2.0", "result" : "'.$previewUrl.'preview/'.$filename.'", "id" : "id"}');
            }
        } else {
            die('{"jsonrpc" : "2.0", "error" : {"code": 100, "message": "un recoginized source"}}');
        }
    }
}