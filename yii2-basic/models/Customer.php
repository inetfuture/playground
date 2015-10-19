<?php

namespace app\models;

use yii\mongodb\ActiveRecord;

class Customer extends ActiveRecord
{
    public static function collectionName()
    {
        return 'customer';
    }

    public function attributes()
    {
        return ['_id', 'name', 'email'];
    }

    public function fields()
    {
        return ['name', 'email'];
    }
}
