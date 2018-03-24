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

## Remove

```bash
$ db.collection.remove({name: "a"}) // Maths
$ db.collection.remove({name: "a"}, 1) // ล่าสุด 1 อัน
$ db.collection.remove({}) // all
```

## Operator

```
- $eq, $ne
- $in, $nin (Array)
- $gt,$lt, $gte, $lte
- $exists := true, false
```

## Aggregate $group, $sum, $avg, $min, $max, $first, $last

```
$ db.users.aggregate([{$group:{_id: "$role", total_role:{$sum:1}}}])
```

## Distinct

```bash
$ db.users.distinct("role")
```

## Count

```bash
$ db.users.count()
$ db.users.find({age: {$lte: 2}}).count()
```

## Sorting

```bash
$ db.users.find().sort({name: 1}) // 1 asc
$ db.users.find().sort({age: -1}) // -1 desc
$ db.users.find().sort({name: 1, age: -1})
```
