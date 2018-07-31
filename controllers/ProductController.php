<?php
namespace app\controllers;

class ProductController extends BaseController
{
    public function actionIndex()
    {
        $this->layout = "layout2";
        return $this->render('index');
    }

    public function actionDetail()
    {
        $this->layout = "layout1";
        return $this->render('detail');
    }
}
