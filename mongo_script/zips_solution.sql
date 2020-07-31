//zips.json 데이터를 MongoDB 에 저장하세요
use zip_db

//state 별 인구수의 합계, _id는 출력하지 않고, 출력되는 documet를 10개로 제한한다.
db.zipes.aggregate( [
   { $group: { _id: "$state", totalPop: { $sum: "$pop" } } },
   { $project : { _id : 0, totalPop: 1}},
   { $limit : 10 }
] )

//1. SQL: SELECT COUNT(*) AS count FROM zip
db.zipes.aggregate([
    {'$group' :
        {
            '_id' : 'null',
            'count' : {'$sum' : 1}
        }
    }
])
//2. SQL: SELECT SUM(pop) as total_pop AS count FROM zip
db.zipes.aggregate([
    {'$group' :
        {
            '_id' : 'null',
            'total_pop' : {'$sum' : '$pop'}
        }
    }
])
//3. SQL: SELECT state, SUM(pop) as total_pop FROM zip GROUP BY state
db.zipes.aggregate([
    {'$group' :
        {
            '_id' : '$state',
            'total_pop' : {'$sum' : '$pop'}
        }
    }
])
//4. SQL : select city, sum(pop) as total_pop from zip group by city
db.zipes.aggregate([
    {'$group' :
        {
            '_id' : '$city',
            'total_pop' : {'$sum' : '$pop'}
        }
    }
])
//5. SQL: SELECT state, SUM(pop) as total_pop FROM zip GROUP BY state ORDER BY as total_pop
db.zipes.aggregate([
    {'$group' :
        {
            '_id' : '$state',
            'total_pop' : {'$sum' : '$pop'}
        }
    },
    {'$sort' :
        {'total_pop': 1}
    }
])

//6. # SQL: SELECT COUNT(*) FROM zip WHERE state = 'MA'
db.zipes.aggregate([

    {'$match' : {'state' : 'MA'}},
    {'$group' : {'_id' : 'null', 'count' : {'$sum' : 1}}}

])
//7. select state,sum(pop) as total_pop from zip where state = 'MA' group by state
db.zipes.aggregate([
    { '$match' : { 'state' : 'MA'}},
    { '$group' : { '_id' : '$state',
                   'total_pop' : { '$sum' : '$pop'}}
    }
])
//7.1 select state,sum(pop) as total_pop from zip where state in ('DE', 'MS') group by state
db.zipes.aggregate([
    { '$match' : { 'state' : {'$in':['DE','MS']}}},
    { '$group' : { '_id' : '$state',
                   'total_pop' : { '$sum' : '$pop'}}
    }
])
//8. SELECT state, SUM(pop) as total_pop FROM zip GROUP BY state HAVING SUM(pop) > 10000000
db.zipes.aggregate([
    {'$group' : {'_id' : '$state', 'total_pop' : {'$sum' : '$pop'}}},
    {'$match' : {'total_pop' : {'$gte' : 10*1000*1000}}}
])
//9.1000만 이상의 state 별 총 인구를 state_pop 필드명으로 출력하고 _id는 출력하지 않기
db.zipes.aggregate([
    {'$group' : {'_id' : '$state', 'state_pop' : {'$sum' : '$pop'}}},
    {'$match' : {'state_pop' : {'$gte' : 10*1000*1000}}},
    {'$project' : { '_id' : 0, 'state_pop': 1}}
])
//10. 1000만 이상의 state만 내림차순 정렬하여 3개만 가져오기
db.zipes.aggregate([
             {'$group' : {'_id' : '$state', 'total_pop' : {'$sum' : '$pop'}}},
             {'$match' : {'total_pop' : {'$gte' : 10 * 1000 * 1000}}},
             {'$sort' : {'total_pop' : -1}},
             {'$limit' : 3}
])
//11.1000만 이상의 state 별 총 인구를 state_pop 필드명으로 출력하고,
// _id는 출력하지 않으며, 가장 많은 인구를 가진 3개만 출력하기
db.zipes.aggregate([
    {'$group' : {'_id' : '$state', 'state_pop' : {'$sum' : '$pop'}}},
    {'$match' : {'state_pop' : {'$gte' : 10*1000*1000}}},
    {'$sort' : { 'state_pop' : -1 }},
    {'$project' : { '_id' : 0, 'state_pop': 1}},
    {'$limit' : 3}
])

//12. select state, city, sum(pop) as total_pop from zip group by state,city
db.zipes.aggregate([
    {'$group' : {'_id' : {'state' : '$state', 'city' : '$city'}, 'total_pop' : {'$sum' : '$pop'}}}
])


//13. select state, city, sum(pop) as total_pop from zip GROUP BY state, city HAVING city = 'POINT BAKER'
db.zipes.aggregate([
    {'$group' : {'_id' : {'state' : '$state', 'city' : '$city'}, 'total_pop' : {'$sum' : '$pop'}}}
])

db.zipes.aggregate([
    {'$group' : {'_id' : {'state' : '$state', 'city' : '$city'}, 'total_pop' : {'$sum' : '$pop'}}},
    {'$match' : {'_id.city' : 'POINT BAKER'}}
])

//13.1 select state, city, sum(pop) as total_pop from zip GROUP BY state, city HAVING state = 'TX'
db.zipes.aggregate([
    {'$group' : {'_id' : {'state' : '$state', 'city' : '$city'}, 'total_pop' : {'$sum' : '$pop'}}},
    {'$match' : {'_id.state' : 'TX'}}
])

//14. SELECT AVG(pop) FROM zip GROUP BY state, city
db.zipes.aggregate([
    {'$group' : {'_id' : 'null', 'avg_pop' : {'$avg' : '$pop'}}}
])

//15. select state,city, avg(pop) as avg_pop from zip  GROUP BY state, city  having avg_pop > 30000
//주별 도시 인구 평균이 30000 이 넘는 곳의 state 와 city 이름만 출력하고 평균을 출력하지 않기 (3개만 출력하기)
db.zipes.aggregate([
    {'$group' : {'_id' : {'state' : '$state', 'city' : '$city'}, 'avg_pop' : {'$avg' : '$pop'}}},
    {'$match' : {'avg_pop' : { '$gte' : 30000 } } },
    {'$project' : {'avg_pop' : 0}},
    {'$limit' : 3}
])