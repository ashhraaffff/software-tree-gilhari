#!/bin/sh
# A shell script to invoke some sample curl commands on a Linux machine 
# against a running container image of the app-specific Gilhari microservice 
# gilhari_simple_example:1.0
# 
# The responses are recorded in a log file (curl.log).
#
# Note that these curl commands use a mapped port number of 80
# even though the port number exposed by the app-specific 
# microservice may be different (e.g., 8081) inside the container shell.
# If you want to use these curl commands from inside the
# container shell on the host machine, you may have to use
# the exposed port number (e.g., 8081) instead.

echo -e "** BEGIN OUTPUT **" > curl.log

echo "** Delete all Bookobjects to start fresh" >> curl.log
curl -X DELETE "http://localhost:80/gilhari/v1/Bookstore" >> curl.log
echo "" >> curl.log

echo -e "** Insert one Bookobject \n" >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Bookstore"  -H 'Content-Type: application/json' -d '{"entity":{"bookid":1,"bookname":"Hobbit","author":"Tolkien","description":"The story of hobbit","price":300,"release_date":381484800390}}' >> curl.log
echo -e "" >> curl.log

echo "** Query all Bookobjects" >> curl.log
curl -X GET   "http://localhost:80/gilhari/v1/Bookstore"  -H 'Content-Type: application/json' >> curl.log
echo "" >> curl.log

echo "** Insert multiple (two) Bookobjects" >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Bookstore"  -H 'Content-Type: application/json' -d '{"entity":{"bookid":2,"bookname":"Hobbit2","author":"Tolkien2","description":"The story of hobbit2","price":400,"release_date":381484890390}}' >> curl.log
echo "" >> curl.log

echo "** Query all Bookobjects" >> curl.log
curl -X GET   "http://localhost:80/gilhari/v1/Bookstore"  -H 'Content-Type: application/json' >> curl.log
echo "" >> curl.log

echo "** Query non-exempted Bookobjects" >> curl.log
curl -X GET   "http://localhost:80/gilhari/v1/Bookstore?filter=exempt=0"  -H 'Content-Type: application/json' >> curl.log
echo "" >> curl.log

echo "** Query the count of exempted Bookobjects" >> curl.log
curl -X GET   "http://localhost:80/gilhari/v1/Bookstore/getAggregate?attribute=id&aggregateType=COUNT&filter=exempt=1"  -H 'Content-Type: application/json' >> curl.log
echo "" >> curl.log


echo "** Query the count of all exempted Bookobjects" >> curl.log
curl -X GET   "http://localhost:80/gilhari/v1/Bookstore/getAggregate?attribute=id&aggregateType=COUNT&filter=exempt=1"  -H 'Content-Type: application/json' >> curl.log
echo "" >> curl.log

echo "** Query the count of all Bookobjects" >> curl.log
curl -X GET   "http://localhost:80/gilhari/v1/Bookstore/getAggregate?attribute=id&aggregateType=COUNT"  -H 'Content-Type: application/json' >> curl.log
echo "" >> curl.log

echo "** END OUTPUT **" >> curl.log
echo "" >> curl.log

cat curl.log
