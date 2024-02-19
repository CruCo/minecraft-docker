#!/bin/bash
java -Xms${MIN_RAM} -Xmx${MAX_RAM} -XX:+UseG1GC -jar ${FILENAME} nogui