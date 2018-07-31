<?php
namespace app\controllers;

class MemberController extends BaseController
{
    public $layout = "layout2";

    public function actionAuth()
    {
        return $this->render('auth.php');
    }
}
