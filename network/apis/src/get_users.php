<?php

    $manager = new MongoDB\Driver\Manager('mongodb://router1,router2');

    //$filter  = ['username' => 'Rgq2yFrxt7'];
    $filter  = [];
    $options = [];
    $query = new MongoDB\Driver\Query($filter, $options);
    $rows = $manager->executeQuery('core.users', $query);

    $result = [];
    foreach($rows as $r){
        $data = [
            'id'       => $r->{_id}->__toString(),
            'username' => $r->username,
        ];
        $result[] = $data;
    }

    echo '<pre>';print_r($result);

    //echo '<pre>';print_r($cursor->toArray());
?>
