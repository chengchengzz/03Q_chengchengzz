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

namespace app\admin\logic;

use think\Model;
use think\db;
/**
 * 文件管理逻辑定义
 * Class CatsLogic
 * @package admin\Logic
 */
class FilemanagerLogic extends Model
{
    public $globalTpCache = array();
    public $baseDir = ''; // 服务器站点根目录绝对路径
    public $maxDir = '';
    public $editOpArr = array(); // 编辑权限
    public $renameOpArr = array(); // 改名权限
    public $delOpArr = array(); // 删除权限
    public $moveOpArr = array(); // 移动权限
    public $editExt = array(); // 允许新增/编辑扩展名文件

    /**
     * 析构函数
     */
    function  __construct() {
        $this->globalTpCache = tpCache('global');
        $this->baseDir = realpath(dirname($_SERVER['SCRIPT_FILENAME'])); // 服务器站点根目录绝对路径
        $this->maxDir = $this->globalTpCache['web_templets_dir']; // 默认文件管理的最大级别目录
        // 编辑权限
        $this->editOpArr = array('txt','htm','php','js','css');
        // 改名权限
        $this->renameOpArr = array('dir','gif','jpg','flash','zip','exe','mp3','wmv','rm','txt','htm','php','js','css','other');
        // 删除权限
        $this->delOpArr = array('dir','gif','jpg','flash','zip','exe','mp3','wmv','rm','txt','htm','php','js','css','other');
        // 移动权限
        $this->moveOpArr = array('gif','jpg','flash','zip','exe','mp3','wmv','rm','txt','htm','php','js','css','other');
        // 允许新增/编辑扩展名文件
        $this->editExt = array('htm','js','css','txt');
    }

    /**
     * 编辑文件
     *
     * @access    public
     * @param     string  $filename  文件名
     * @param     string  $activepath  当前路径
     * @param     string  $content  文件内容
     * @return    string
     */
    public function editFile($filename, $activepath = '', $content = '')
    {
        $fileinfo = pathinfo($filename);
        $ext = $fileinfo['extension'];

        /*不允许越过指定最大级目录的文件编辑*/
        $tmp_max_dir = preg_replace("#\/#i", "\/", $this->maxDir);
        if (!preg_match("#^".$tmp_max_dir."#i", $activepath)) {
            return '没有操作权限！';
        }
        /*--end*/

        /*允许编辑的文件类型*/
        if (!in_array($ext, $this->editExt)) {
            return '只允许操作文件类型如下：'.implode('|', $this->editExt);
        }
        /*--end*/

        $filename = str_replace("..", "", $filename);
        $file = $this->baseDir."$activepath/$filename";
        $content = stripslashes($content);
        $fp = fopen($file, "w");
        fputs($fp, $content);
        fclose($fp);
        return true;
    }

    /**
     * 当前目录下的文件列表
     */
    public function getDirFile($directory, $activepath = '',  &$arr_file = array()) {

        if (!file_exists($directory)) {
            return false;
        }

        $fileArr = $dirArr = $parentArr = array();

        $filesize = $filetime = $intro = '';

        $mydir = dir($directory);
        while($file = $mydir->read())
        {
            if($file != "." && $file != ".." && !is_dir("$directory/$file"))
            {
                @$filesize = filesize("$directory/$file");
                @$filesize = format_bytes($filesize);
                @$filetime = filemtime("$directory/$file");
            }

            if ($file == '.') 
            {
                continue;
            } 
            else if($file == "..") 
            {
                if($activepath == "" || $activepath == $this->maxDir) {
                    continue;
                }
                $parentArr = array(
                    array(
                        'filepath'  => preg_replace("#[\/][^\/]*$#i", "", $activepath),
                        'filename'  => '上级目录',
                        'filesize'  => '',
                        'filetime'  => '',
                        'filetype'  => 'dir2',
                        'icon'      => 'file_topdir.gif',
                        'intro'  => '（当前目录：'.$activepath.'）',
                    ),
                );
                continue;
            } 
            else if(is_dir("$directory/$file"))
            {
                if(preg_match("#^_(.*)$#i", $file)) continue; #屏蔽FrontPage扩展目录和linux隐蔽目录
                if(preg_match("#^\.(.*)$#i", $file)) continue;
                $file_info = array(
                    'filepath'  => $activepath.'/'.$file,
                    'filename'  => $file,
                    'filesize'  => '',
                    'filetime'  => '',
                    'filetype'  => 'dir',
                    'icon'      => 'dir.gif',
                    'intro'     => '',
                );
                array_push($dirArr, $file_info);
                continue;
            }
            else if(preg_match("#\.(gif|png)#i",$file))
            {
                $filetype = 'gif';
                $icon = 'gif.gif';
            }
            else if(preg_match("#\.(jpg)#i",$file))
            {
                $filetype = 'jpg';
                $icon = 'jpg.gif';
            }
            else if(preg_match("#\.(swf|fla|fly)#i",$file))
            {
                $filetype = 'flash';
                $icon = 'flash.gif';
            }
            else if(preg_match("#\.(zip|rar|tar.gz)#i",$file))
            {
                $filetype = 'zip';
                $icon = 'zip.gif';
            }
            else if(preg_match("#\.(exe)#i",$file))
            {
                $filetype = 'exe';
                $icon = 'exe.gif';
            }
            else if(preg_match("#\.(mp3|wma)#i",$file))
            {
                $filetype = 'mp3';
                $icon = 'mp3.gif';
            }
            else if(preg_match("#\.(wmv|api)#i",$file))
            {
                $filetype = 'wmv';
                $icon = 'wmv.gif';
            }
            else if(preg_match("#\.(rm|rmvb)#i",$file))
            {
                $filetype = 'rm';
                $icon = 'rm.gif';
            }
            else if(preg_match("#\.(txt|inc|pl|cgi|asp|xml|xsl|aspx|cfm)#",$file))
            {
                $filetype = 'txt';
                $icon = 'txt.gif';
            }
            else if(preg_match("#\.(htm|html)#i",$file))
            {
                $filetype = 'htm';
                $icon = 'htm.gif';
            }
            else if(preg_match("#\.(php)#i",$file))
            {
                $filetype = 'php';
                $icon = 'php.gif';
            }
            else if(preg_match("#\.(js)#i",$file))
            {
                $filetype = 'js';
                $icon = 'js.gif';
            }
            else if(preg_match("#\.(css)#i",$file))
            {
                $filetype = 'css';
                $icon = 'css.gif';
            }
            else
            {
                $filetype = 'other';
                $icon = '';
            }

            $file_info = array(
                'filepath'  => $activepath.'/'.$file,
                'filename'  => $file,
                'filesize'  => $filesize,
                'filetime'  => $filetime,
                'filetype'  => $filetype,
                'icon'      => $icon,
                'intro'     => $intro,
            );
            array_push($fileArr, $file_info);
        }
        $mydir->close();

        $arr_file = array_merge($parentArr, $dirArr, $fileArr);

        return $arr_file;
    }
}