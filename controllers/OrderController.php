<?php
namespace app\controllers;

class OrderController extends BaseController
{
    public $layout = "layout1";

    public function actionIndex()
    {
        $this->layout = "layout2";
        return $this->render('index');
    }

    public function actionCheck()
    {
        $this->layout = "layout1";
        return $this->render('check');
    }
}
