#!/bin/sh

#if [ -f /app/.env ]
#then
#  export $(cat /app/.env | sed 's/#.*//g' | xargs)
#fi

#echo "helo!"
#echo "oops"

rm -rf /app/.git

if [ $RUN_SERVER = "true" ] ; then
    echo "is true";
    java -Xms4G -Xmx4G -XX:+UseG1GC -jar /app/spigot-1.19.3.jar nogui
else
    echo "is false";
    tail -f /dev/null
fi



