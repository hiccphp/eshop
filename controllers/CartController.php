<?php
namespace app\controllers;

class CartController extends BaseController
{
    public $layout = "layout1";

    public function actionIndex()
    {
        return $this->render('index');
    }
}
