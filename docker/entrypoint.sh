#!/bin/sh

echo "eula=true" > eula.txt

if [ $RUN_SERVER = "true" ] ; then
    echo "is true";
    java -Xms4G -Xmx4G -jar /app/spigot-1.21.6.jar nogui
else
    echo "is false";
    tail -f /dev/null
fi



