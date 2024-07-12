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
curl -X DELETE "http://localhost:80/gilhari/v1/Book" >> curl.log
echo "" >> curl.log

echo "** Delete all Publisherobjects to start fresh" >> curl.log
curl -X DELETE "http://localhost:80/gilhari/v1/Publisher" >> curl.log
echo "" >> curl.log

echo -e "** Insert one Publisher Object \n" >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Publisher"  -H 'Content-Type: application/json' -d '{"entity":{"publisherId":3,"publisherName":"Penguin Classics","phoneNo":"4567890887","email":"hello@gmail.com"}}' >> curl.log
echo -e "" >> curl.log


echo -e "** Insert one Bookobject \n" >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Book"  -H 'Content-Type: application/json' -d '{"entity":{"bookId":5,"bookName":"Crime and Punishment","author":"Fyodor Dostoevsky","description":"Crime and Punishment follows the mental anguish and moral dilemmas of Rodion Raskolnikov, an impoverished ex-student in Saint Petersburg who plans to kill an unscrupulous pawnbroker, an old woman who stores money and valuable objects in her flat.","price":1000,"release_date":381484800390, "publisherId":3}}' >> curl.log
echo -e "" >> curl.log

echo "** Query all Bookobjects" >> curl.log
curl -X GET   "http://localhost:80/gilhari/v1/Book"  -H 'Content-Type: application/json' >> curl.log
echo "" >> curl.log

echo "** Insert multiple (two) Bookobjects" >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Book"  -H 'Content-Type: application/json' -d '{"entity":{"bookId":2,"bookName":"Hobbit2","author":"Tolkien2","description":"The story of hobbit2","price":400,"release_date":381484890390,"publisherId":1}}' >> curl.log
echo "" >> curl.log


echo "** Query the count of all Bookobjects" >> curl.log
curl -X GET   "http://localhost:80/gilhari/v1/Book/getAggregate?attribute=id&aggregateType=COUNT"  -H 'Content-Type: application/json' >> curl.log
echo "" >> curl.log

echo "** END OUTPUT **" >> curl.log
echo "" >> curl.log

cat curl.log



