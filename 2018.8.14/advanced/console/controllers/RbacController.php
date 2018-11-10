<?php
namespace console\controllers;//命名空间
//引用类
use Yii;
use yii\console\Controller;
use yii\web\ForbiddenHttpException;
	class RbacController extends Controller
	{
		public function actionInit()
		{
			$auth = Yii::$app->authManager;//加载组件

// 添加 "createGoods" 权限 相当于在角色权限表（auth_item）中添加一条数据 createGoods 类型为2（权限）
			$createGoods = $auth->createPermission('createGoods');
			$createGoods->description = '添加一个商品';
			$auth->add($createGoods);

// 添加 "updateGoods" 权限 相当于在角色权限表（auth_item）中添加一条数据 updateGoods 类型为2（权限）
			$updateGoods = $auth->createPermission('updateGoods');
			$updateGoods->description = '修改商品';
			$auth->add($updateGoods);

// 添加 "author" 角色并赋予 "createGoods" 权限
//相当于在角色权限表中添加一条角色数据 author类型为1（角色）
//然后在角色权限关联表（auth_item_child）中添加一条数据 author createGoods 将createGoods的权限赋给author角色
			$author = $auth->createRole('author');
			$auth->add($author);
			$auth->addChild($author, $createGoods);

// 添加 "admin" 角色并赋予 "updateGoods"
// 和 "author" 权限
			$admin = $auth->createRole('admin');
			$auth->add($admin);
			$auth->addChild($admin, $updateGoods);
			$auth->addChild($admin, $author);

// 为用户指派角色。其中 1 和 2 是由 IdentityInterface::getId() 返回的id
// 通常在你的 User 模型中实现这个函数。
//用户1 admin 角色 拥有 修改权限 添加权限（author的）
//用户2 author 角色 拥有 添加权限
			$auth->assign($author, 2);
			$auth->assign($admin, 1);
		}
		
		public function down()
		{
			$auth = Yii::$app->authManager;
			
			$auth->removeAll();
		}

	}