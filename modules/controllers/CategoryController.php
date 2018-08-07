<?php 
namespace app\modules\controllers;

use Yii;
use app\modules\models\Category;

class CategoryController extends CommonController
{
    public function actionList()
    {
        $list = [];
        $this->layout = 'layout1';
        $model = new Category;
        return $this->render('cates', ['cates' => $list, 'model' => $model]);
    }

    public function actionAdd()
    {
        $model = new Category;
        $list = $model->getOptions();
        $this->layout = 'layout1';
        if (Yii::$app->request->isPost) {
            $post = Yii::$app->request->post();
            if ($model->add($post)) {
                Yii::$app->session->setFlash('info', '分类添加成功');
            }
        }
        return $this->render('add', ['list' => $list, 'model' => $model]);
    }

    

}