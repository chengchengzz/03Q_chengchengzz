<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use common\widgets\file_upload\FileUpload;
$this->title = '创建';
$this->params['breadcrumbs'][] = ['label'=>'文章','url'=>['post/create']];
$this->params['breadcrumbs'][] = $this->title;	
?>
<div class="row">
  <div class="col-lg-9">
  	<div class="panel-title box-title">
      <div>
         <span>文件创建</span>
      </div>
       <div class="panel-body">
       <?php $form = ActiveForm::begin()?>

          <?=$form->field($model,'title')->textinput(['maxlength'=>true])?>
          <?=$form->field($model,'cat_id')->dropDownList($cat)?>
           <?= $form->field($model, 'label_img')->widget('common\widgets\file_upload\FileUpload',[
           'config'=>[
            ]
       ])?>    
           <?= $form->field($model, 'content')->widget('common\widgets\ueditor\Ueditor',[
          'options'=>[
              'initialFrameHeight' =>400,
            ]
        ])?>       

           <?=$form->field($model,'tags')->widget('common\widgets\tags\TagWidget')?>  
            <div class="form-group">
              <?=html::submitButton("发布",['class'=>'btn btn-success'])?>
            </div>           
       <?php ActiveForm::end()?>
       </div>
  	</div>
  </div>
  <div class="col-lg-3"></div>
   
   <div class="panel-title box-title">
      <div>
         <span>注意事项</span>
      </div>
      <div class="panel-body">
       <p>请注意自己的安全</p>
       <p>请注意自己的安全</p>
      </div>
  </div>
</div>



