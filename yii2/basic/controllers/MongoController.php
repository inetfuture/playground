<?php

namespace app\controllers;

use yii\rest\ActiveController;
use yii\mongodb\Query;
use yii\data\ActiveDataProvider;
use app\models\Customer;

class MongoController extends ActiveController
{
    public $modelClass = 'app\models\Customer';
    public $serializer = [
        'class' => 'yii\rest\Serializer',
        'collectionEnvelope' => 'items',
    ];

    public function actionIndex()
    {
        $collection = \Yii::$app->mongodb->getCollection('customer');
        $collection->insert(['name' => 'aaron', 'email' => 'inetfuture@gmail.com']);

        $query = new Query;
        $query->select(['name', 'aaron'])
            ->from('customer')
            ->limit(10);
        $rows = $query->all();
        return $rows;
    }

    public function actionActiverecord()
    {
        $customer = new Customer;
        $customer->name = 'BAaron';
        $suctomer->email = 'inetfuture@qq.com';
        $customer->save();

        $provider = new ActiveDataProvider([
            'query' => Customer::find(),
            'pagination' => [
                'pageSize' => 5
            ],
            'sort' => [
                'defaultOrder' => 'name DESC'
            ]
        ]);

        $customers = $provider->getModels();
        return $customers;
    }
}
