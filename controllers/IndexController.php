<?php
namespace app\controllers;

class IndexController extends BaseController
{
    public $layout = "layout1";
    
    public function actionIndex()
    {
        return $this->render('index');
    }
}
