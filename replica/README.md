## Mongo Replication

```bash
$ mongo --port 27021 --eval 'rs.initiate()'
$ mongo --port 27021 --eval 'rs.add("mongo1_2:27017")'
$ mongo --port 27021 --eval 'rs.addArb("arbiter_mongo1:27017")'
```
