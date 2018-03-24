# MongoDB Sample

* [Data Type](#data-types)

## Data Types

```
- ObjectId     - Date
- String       - Boolean
- Integer      - Null
- Double       - Array
- NumberLong
```

## Insert, Save

```bash
$ db.collection.insert({name: "Yo"})
var name = {name: "Yea"}
$ db.collection.save(name)
```

## Find

```bash
$ db.collection.find().pretty()
```

## Update, $set, upsert, multi

```bash
$ db.collection.update({name: "a"}, {name: "updated"}) // replace
$ db.collection.update({name: "a", {$set:{name: "Yo"}}}) // field name only
$ db.users.update({name: "d"},{$set:{name: "d", age: 4}}, {upsert: true}) // ถ้าไม่เจอข้อมูลให้ insert
$ db.collection.update({role: "normal"}, {skill: "js"}, {multi: true}) // multi update
```

## Operator

```
- $eq, $ne
- $in, $nin (Array)
- $gt,$lt, $gte, $lte
- $exists := true, false
```
