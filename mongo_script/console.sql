//python_db 생성
use python_db

//people collection 생성
db.createCollection('people')

//isCapped()
db.people.isCapped() //false

//collection stats 정보
db.people.stats()

//emp collection 생성하고 drop
db.createCollection('emp')
//emp -> employees로 rename
//db.emp.renameCollection('employees')
db.emp.drop()

//document(row) 1개 insert : insertOne()
db.people.insertOne({user_id:'bcd001',age:45, status:'A'})

//select * from people
db.people.find()
db.people.find({})

//select _id, user_id, age from people
db.people.find({},{user_id:1,age:1})

//select user_id, status from people
db.people.find({},{user_id:1,age:1,_id:0})

//document 여러개insert : insertMany()
db.people.insertMany([
    { user_id: "bcd002", age:25,status:"B" },
    { user_id: "bcd003", age:50,status:"A" },
    { user_id: "bcd004", age:35,status:"A" },
    { user_id: "abc001", age:28,status:"B" }
])

db.people.find().limit(2)

//select * from people where status = 'A'
db.people.find({status:'A'})

//select user_id, status from people where status = 'A'
db.people.find({status:'A'},{user_id:1,status:1,_id:0})

// select * from people where status != 'A'
db.people.find({status:{$ne:'A'}})

// select user_id, status,age from people where user_id != 'abc001'
db.people.find({user_id:{$ne:'abc001'}},{user_id:1,status:1,age:1,_id:0})

// select * from people where status='A' and age=50
db.people.find({status:'A',age:50})

//select * from people where status='A' and age=50
db.people.find({$or:[{status:'A'},{age:50}]})

//select status, age from people where status='A' or age = 50
db.people.find({$or:[{stauts:'A'},{age:50}]},{status:1,age:50,_id:0})

//select * from people where age>25
db.people.find({age:{$gt:25}})

//select * from people where age < 50
db.people.find({age:{$lt:50}})

//select * from people where age > 25 and age < 50
db.people.find({age:{$gt:25,$lt:50}})

//select * from people where age in (25,15)
db.people.find({age:{$in:[25,15]}})

//status = 'C', user_id = 'sn0716' document 추가 , age필드는 넣지마
db.people.insertOne({'user_id':'sn0716','status':'C'})
db.people.find()

//status가 'A'이거나'C'인 것 조회
db.people.find({status:{$in:['A','C']}})

//select * from people where age not in (5,25)
db.people.find({age:{$nin:[5,25]}})

//select * from people where user_id like '%cd%'
db.people.find({user_id:{$regex:/cd/}})

//select * from people where user_id like 'bc%'
db.people.find({user_id:{$regex:/^bc/}})

//select * from people where user_id like '%01'
db.people.find({user_id:{$regex:/01$/}})

//select * from people status='A' order by user_id asc
db.people.find({status:'A'}).sort({user_id:1})

//select user_id, age, status from people status='A' order by age desc
db.people.find({status:'A'},{_id:0,user_id:1,age:1,status:1}).sort({age:-1})

//select user_id, age from people where user_id like '%cd%' and age > 40 order by user_id asc
db.people.find({user_id:{$regex:/cd/},age:{$gt:40}},{user_id:1,age:1,_id:0}).sort({user_id:1})

//select user_id, status, age from people where age >= 25 and age < 45 and status in('A','B')
db.people.find({age:{$gte:25,$lte:45},status:{$in:['A','B']}},{user_id:1,status:1,age:1,_id:0})

//select count(*) from people
db.people.count()
//db.people.find().count() - 예전엔 됐는데 deplicated돼서 안됨

//select count(*) from people where age > 30
db.people.count({age:{$gt:30}})

//user_id필드의 값이 존재하는 row count
db.people.count({user_id:{$exists:true}})
db.people.find({user_id:{$exists:true}})

//age 필드의 값이 존재하지 않는 row count
db.people.count({age:{$exists:false}})
db.people.find({age:{$exists:true}})

//select distinct(status) from people
db.people.aggregate([{$group:{_id:"$status"}}])

db.people.findOne({age:{$gte:25}})
db.people.find().limit(1)

db.people.find().limit(3).skip(1)

//updateMany
//update people set status='C' where age >= 45
db.people.updateMany({age:{$gte:45}},{$set:{status:'C'}})
db.people.find()

//update people set age = age + 10 where status = 'B'
db.people.updateMany({status:'B'},{$inc:{age:10}})

//updateOne
//update people set age=100 where user_id='bcd001'
db.people.updateOne({user_id:'bcd001'},{$set:{age:100}})

//update people set age = age + 7 where status='B'
db.people.updateOne({status:'B'},{$inc:{age:7}})

//delete from people where status='C'
db.people.deleteMany({status:'C'})
db.people.find()

db.people.updateMany({status:'B'},{$set:{size:100}})