<?php

    function generateRandomString($length = 10)
    {
        $characters       = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString     = '';

        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }

        return $randomString;
    }

    $bulk = new MongoDB\Driver\BulkWrite;

    for ($i = 1; $i <= 10; $i++) {
        $document = [
            'username' => generateRandomString(),
        ];

        $bulk->insert($document);
    }

    $manager = new MongoDB\Driver\Manager('mongodb://router1,router2');
    $writeConcern = new MongoDB\Driver\WriteConcern(MongoDB\Driver\WriteConcern::MAJORITY, 1000);
    $result = $manager->executeBulkWrite('core.users', $bulk, $writeConcern);

    echo 'OK';
?>
