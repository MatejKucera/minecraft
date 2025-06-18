#!/bin/sh

echo "eula=true" > eula.txt

if [ $RUN_SERVER = "true" ] ; then
    echo "is true";
    java -Xms8G -Xmx8G -jar /app/spigot-1.21.6.jar nogui
else
    echo "is false";
    tail -f /dev/null
fi



