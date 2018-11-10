<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model frontend\models\name */

$this->title = 'Create Name';
$this->params['breadcrumbs'][] = ['label' => 'Names', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="name-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
