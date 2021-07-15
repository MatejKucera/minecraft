#!/bin/sh

#if [ -f /app/.env ]
#then
#  export $(cat /app/.env | sed 's/#.*//g' | xargs)
#fi

#echo "helo!"
#echo "oops"

echo $RUN_SERVER

if [ $RUN_SERVER = "true" ] ; then
    echo "is true";
    java -Xms4G -Xmx4G -XX:+UseG1GC -jar /app/server/spigot-1.17.1.jar nogui
else
    echo "is false";
    tail -f /dev/null
fi

rm -rf /app/server/.git



