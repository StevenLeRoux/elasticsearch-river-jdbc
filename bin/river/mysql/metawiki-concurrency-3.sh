#!/bin/sh

curl -XPUT '0:9200/_river/my_mysql_river/_meta' -d '{
    "type" : "jdbc",
    "max_bulk_actions" : 20000,
    "concurrency" : 3,
    "jdbc" : [ {
        "url" : "jdbc:mysql://localhost:3306/test",
        "user" : "",
        "password" : "",
        "sql" :  "select *, page_id as _id from page where page_id < 2000000",
        "fetchsize" : "min",
        "treat_binary_as_string" : true,
        "index" : "metawiki"
    }, {
        "url" : "jdbc:mysql://localhost:3306/test",
        "user" : "",
        "password" : "",
        "sql" :  "select *, page_id as _id from page where page_id >= 2000000 and page_id < 4000000",
        "fetchsize" : "min",
        "treat_binary_as_string" : true,
        "index" : "metawiki"
    }, {
        "url" : "jdbc:mysql://localhost:3306/test",
        "user" : "",
        "password" : "",
        "sql" :  "select *, page_id as _id from page where page_id >= 4000000",
        "fetchsize" : "min",
        "treat_binary_as_string" : true,
        "index" : "metawiki"
    } ]
}'
