## Start docker container shard1 shard2 config1
  docker-compose up -d shard1 shard2 config1

## Set replica rs1-shard
### connect mongo
 * mongo --port 27021
 *  rs.initiate()
 *  rs.add("rs1_shard1_2:27017")
 *  rs.addAbr("rs1_shard1_3:27017")

## Set replica rs2-shard
### connect mongo
 * mongo --port 27031
 * rs.initiate()
 * rs.add("rs2_shard2_2:27017")
 * rs.addAbr("rs2_shard2_3:27017")

## Set replica rs1-cfgsrv
### connect mongo
 * mongo --port 27041
 * rs.initiate()

## Start docker container router1 apache2 nginx php
### connect mongo
 * mongo --port 27017
 * sh.addShard("rs-shard1/shard1:27017")
 * sh.addShard("rs-shard2/shard2:27017")

## Set data shard
 * use core
 * sh.enableSharding("core")
 * db.users.ensureIndex({ _id: "hashed" })
 * sh.shardCollection("core.users",{ "_id": "hashed" })

## Add user
  http://localhost:8080/insert_users.php or http://localhost:8081/insert_users

## Get users
  http://localhost:8080/get_users.php or http://localhost:8081/get_users

# Test concurrency
## Apache2
  ab -n 1000 -c 1000 http://localhost:8080/get_users.php/

## Nginx
  ab -n 1000 -c 1000 http://localhost:8081/get_users.php/

# Error case

## replica primary dead
  rs.remove("rs1_shard1_1:27017") /* Impact WriteConcern */
