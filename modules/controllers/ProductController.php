<?php 
namespace app\modules\controllers;

use app\models\Product;
use app\models\Category;

class ProductController extends CommonController
{

    public function actionList()
    {
        $model = Product::find();
        
    }

    public function actionAdd()
    {
        $this->layout = 'layout1';
        $model = new Product;
        $cate = new Category;  
        $list = $cate->getOptions();
        unset($list[0]);
        if(Yii::$app->request->isPost) {
            $post = Yii::$app->request->post();
            $pics = $this->upload();
        }
    }

    private function upload()
    {
        if($_FILES['Product']['error']['cover'] > 0) {
            //to do sth
        }
    }
}