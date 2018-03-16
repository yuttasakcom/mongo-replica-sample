#!/bin/bash

current_dir=$(pwd)

sudo rm -rf $current_dir/mongo1_1/data \
$current_dir/mongo1_2/data \
$current_dir/arbiter_mongo1/data \
$current_dir/mongo2_1/data \
$current_dir/mongo2_2/data \
$current_dir/arbiter_mongo2/data \
$current_dir/configserver1/data \
$current_dir/router1/data \
$current_dir/router2/data
