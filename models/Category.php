<?php
namespace app\models;

use Yii;
use yii\db\ActiveRecord;
use yii\helpers\ArrayHelper;


class Category extends ActiveRecord
{
    public static function tableName()
    {
        return "{{%category}}";
    }

    public function attributeLabels()
    {
        return [
            'parentid' => '上级分类',
            'title' => '分类名称'
        ];
    }

    public function rules()
    {
        return [
            ['parentid', 'required', 'message' => '上级分类不能为空'],
            ['title', 'required', 'message' => '标题名称不能为空'],
        ];
    }

    public function add($data)
    {
        $data['Category']['createtime'] = time();
        if ($this->load($data) && $this->save($data)) {
            return true;
        }
        return false;
    }

    public function getData()
    {
        $cates = self::find()->all();
        return ArrayHelper::toArray($cates); //arrayHelper可以将对象转为数组，并保留结构
    }

    /**
     * 对二维数组进行级别显示
     */
    public function getTree($cates, $pid = 0)
    {
        $tree = [];
        foreach ($cates as $cate) {
            if ($cate['parentid'] == $pid) {
                $tree[] = $cate;
                $tree = array_merge($tree, $this->getTree($cates, $cate['cateid']));
            }
        }
        return $tree;
    }


    /**
     * 找到一个级别，把该级别所应该拥有的前缀的个数，存到一个数组里面，这个数据就是$prefix这个数组。
     */
    public function setPrefix($data, $p = "|-----")
    {
        $tree = [];
        $num = 1;
        $prefix = [0 => 1]; //parentid为0的，拥有一个个数
        while ($val = current($data)) { //遍历循环$data的值
            $key = key($data);
            if ($key > 0) { //表示第二次循环
                if ($data[$key - 1]['parentid'] != $val['parentid']) { //上一个元素的parentid不等于当前元素的上级id，换言之，分类的级别发生了改变。
                    $num++; //层级加一
                }
            }
            if (array_key_exists($val['parentid'], $prefix)) { //判断该级别是否已有前缀
                $num = $prefix[$val['parentid']]; //这个级别所拥有的前缀个数
            }
            $val['title'] = str_repeat($p, $num) . $val['title']; //拼接title前缀
            $prefix[$val['parentid']] = $num; //把对应级别填充到前缀
            $tree[] = $val;
            next($data); //走到下一个指针，避免死循环
        }
        return $tree;
    }

    public function getOptions()
    {
        $data = $this->getData();
        $tree = $this->getTree($data);
        $tree = $this->setPrefix($tree);
        $options = ['添加顶级分类'];
        foreach ($tree as $cate) {
            $options[$cate['cateid']] = $cate['title'];
        }
        return $options;
    }

    public function getTreeList()
    {
        $data = $this->getData();
        $tree = $this->getTree($data);
        return $this->setPrefix($tree);
    }
}