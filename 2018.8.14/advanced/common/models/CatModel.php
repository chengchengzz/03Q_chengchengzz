<?php

namespace common\models;

use Yii;
use common\models\base\BaseModel;

/**
 * This is the model class for table "cats".
 *
 * @property int $id 自增ID
 * @property string $cat_name 分类名称
 */
class CatModel extends BaseModel
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'cats';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cat_name'], 'string', 'max' => 255],
        ];
    }
   public static function getAllCats(){
        $cat = ['0'=>'暂无分类'];
        $res = self::find()->asArray()->all();
        if($res){
            foreach ($res as $k=>$list){
                $cat[$list['id']]=$list['cat_name'];
            }
        }
        //print_r($res);die;
        return $cat;
    }
    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => '自增ID',
            'cat_name' => '分类名称',
        ];
    }
}
