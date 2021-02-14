 #!/bin/sh

#if [ -f /app/.env ]
#then
#  export $(cat /app/.env | sed 's/#.*//g' | xargs)
#fi

#echo "helo!"
#echo "oops"

#echo $RUN_SERVER

if [ $RUN_SERVER ] ; then
    echo "is true";
    java -Xms1G -Xmx1G -XX:+UseG1GC -jar /app/server/spigot-1.16.5.jar nogui
else
    echo "is false";
    tail -f /dev/null
fi

rm -rf /app/server/.git



