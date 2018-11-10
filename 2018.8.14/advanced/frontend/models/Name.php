<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "name".
 *
 * @property int $id
 * @property string $title
 * @property string $content
 * @property string $sendtime
 * @property string $type
 * @property string $encommend
 */
class Name extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'name';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'content', 'sendtime', 'type', 'encommend'], 'required'],
            [['sendtime'], 'safe'],
            [['title', 'content', 'encommend'], 'string', 'max' => 255],
            [['type'], 'string', 'max' => 20],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Title',
            'content' => 'Content',
            'sendtime' => 'Sendtime',
            'type' => 'Type',
            'encommend' => 'Encommend',
        ];
    }
}
