<?php

namespace app\controllers;

use Yii;
use yii\web\Response;
use app\models\User;
use app\models\LoginForm;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;

class MemberController extends BaseController
{
    public $layout = "layout2";

    public function actions()
    {
        return [
            'oauth' => [
                'class' => 'yii\authclient\AuthAction',
                'successCallback' => [$this, 'onAuthSuccess'],
            ],
        ];
    }

    //登录成功回调的内容
    public function onAuthSuccess($client)
    {
        $userInfo = $client->getUserAttributes();
        $session = \Yii::$app->session;
        $session['userinfo'] = $userInfo;
        //保存特殊的唯一数据，用于注册的时候能够进行获取，如果不放到session的地方，就不知道放到哪里才能看到
        $session['openid'] = $client->getTitle() . '-' . ArrayHelper::getValue($userInfo, 'id');
        //查询是否存在这个唯一标识的用户内容，github就是id
        if ($model = User::find()->where('openid = :openid', [':openid' => $session['openid']])->one()) {
            $session['loginname'] = $model->username;
            $session['isLogin'] = 1;
            return $this->redirect(['index/index']);
        }
        return $this->redirect(['member/authreg']);
    }

    public function actionAuth()
    {
        $this->layout = 'layout2';
        if (Yii::$app->request->isGet) {
            $url = Yii::$app->request->referrer;
            if (empty($url)) {
                $url = "/";
            }
            Yii::$app->session->setFlash('referrer', $url);
        }
        $model = new User;
        if (Yii::$app->request->isPost) {
            $post = Yii::$app->request->post();
            if ($model->login($post)) {
                $url = Yii::$app->session->getFlash('referrer');
                return $this->redirect($url);
            }
        }
        return $this->render('auth', ['model' => $model]);
    }

    public function actionLogout()
    {
        Yii::$app->session->remove('loginname');
        Yii::$app->session->remove('isLogin');
        if (!isset(Yii::$app->session['isLogin'])) {
            return $this->goback(Yii::$app->request->referrer);
        }
    }

    public function actionReg()
    {
        $model = new User;
        if (Yii::$app->request->isPost) {
            $post = Yii::$app->request->post();
            if ($model->regByMail($post)) {
                Yii::$app->session->setFlash('info', '电子邮件发送成功！');
            }
        }
        $this->layout = 'layout2';
        return $this->render('auth', ['model' => $model]);
    }

    public function actionAuthreg()
    {
        $this->layout = 'layout2';
        $model = new User;
        if (Yii::$app->request->isPost) {
            $post = Yii::$app->request->post();
            $session = Yii::$app->session;            
            $post['User']['openid'] = $session['openid'];
            if($model->reg($post, 'qqreg')) {
                $session['loginname'] = $post['User']['username'];
                $session['isLogin'] = 1;
                return $this->redirect(['index/index']);
            }
            
        }
        return $this->render('qqreg', ['model' => $model]);
    }
}













