<?php

namespace app\modules\models;

use yii\db\ActiveRecord;
use Yii;

class Admin extends ActiveRecord
{
    public $rememberMe = true;

    public static function tableName()
    {
        return "{{%admin}}";
    }

    public function rules()
    {
        return [
            ['adminuser', 'required', 'message' => '管理员账号不能为空'],
            ['adminpass', 'required', 'message' => '管理员密码不能为空'],
            ['rememberMe', 'boolean'],
            ['adminpass', 'validatePass'],
        ];
    }

    public function validatePass()
    {
        if (!$this->hasErrors()) {
            $data = self::find()->where('adminuser=:user and adminpass=:pass', ["user" => $this->adminuser, "pass" => md5($this->adminpass)])->one();
            if (is_null($data)) {
                $this->addError("adminpass", "用户名或密码错误");
            }
        }
    }

    public function login($data)
    {
        if ($this->load($data) && $this->validate()) {
            //to do sth
        }
        return false;
    }
}
