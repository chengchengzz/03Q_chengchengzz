<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2018/9/28
 * Time: 15:03
 */
namespace app\controllers;

use fastphp\base\Controller;
use app\models\ItemModel;

class GoodsController extends Controller{

    public function index()
    {
        $keyword = isset($_GET['keyword']) ? $_GET['keyword'] : '';

        if ($keyword) {
            $items = (new ItemModel())->search($keyword);
        } else {
            // 查询所有内容，并按倒序排列输出
            // where()方法可不传入参数，或者省略
            $items = (new ItemModel)->where()->order(['id DESC'])->fetchAll();
        }

        $this->assign('title', '全部条目');
        $this->assign('keyword', $keyword);
        $this->assign('items', $items);
        $this->render();
    }
}