#!/bin/bash

# Create docker network
docker network create nw_mongo1
docker network create nw_mongo2
docker network create nw_configserver
docker network create nw_sharding
docker network create nw_mongodb
docker network create nw_apis

current_dir=$(pwd)

# Start apis
cd $current_dir/apis/nginx && docker build -t yoprogrammer:nginx .
cd $current_dir/apis/php-fpm && docker build -t yoprogrammer:php-fpm .
cd $current_dir/apis/ && docker-compose up -d

# Start mongo1
cd $current_dir/mongo1_1/ && docker-compose up -d
cd $current_dir/mongo1_2/ && docker-compose up -d
cd $current_dir/arbiter_mongo1/ && docker-compose up -d
mongo --port 27021 --eval 'rs.initiate()'
mongo --port 27021 --eval 'rs.add("mongo1_2:27017")'
mongo --port 27021 --eval 'rs.addArb("arbiter_mongo1:27017")'

# Start mongo2
cd $current_dir/mongo2_1/ && docker-compose up -d
cd $current_dir/mongo2_2/ && docker-compose up -d
cd $current_dir/arbiter_mongo2/ && docker-compose up -d
mongo --port 27031 --eval 'rs.initiate()'
mongo --port 27031 --eval 'rs.add("mongo2_2:27017")'
mongo --port 27031 --eval 'rs.addArb("arbiter_mongo2:27017")'

# Start config server
cd $current_dir/configserver1/ && docker-compose up -d
mongo --port 27041 --eval 'rs.initiate()'

# Start router1
cd $current_dir/router1/ && docker-compose up -d
mongo --port 27017 --eval 'sh.addShard("rs1/mongo1_1:27017")'
mongo --port 27017 --eval 'sh.addShard("rs2/mongo2_1:27017")'

# Start router2
cd $current_dir/router2/ && docker-compose up -d
