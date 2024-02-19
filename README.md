# minecraft-docker
A quick and dirty setup for a spigot minecraft server running as docker container

## Basic information
Sometime you are in a hurry and need a minecraft server up and running in a couple of minutes. This happend to a friend of mine and he asked me, if I could assist and show him how to run a vanilla minecraft server quickly.

This is the result. A super basic spigot setup.
Feel free to use this as you need.

## Prerequisites
Make sure docker and docker compose is up to date and running on your machine.

## Run mc server
Use the command
> docker-compose up -d --build

to run the minecraft server. The first run takes some time.

## Settings
|Variablename| Default value| Description|
|---|---|---|
|FILENAME| mc-server.jar| Used to set the server jar filename. Change if you need a more meaningful name|
|MC_VERSION| 1.20.4 | Used to build a specific version of minecraft. Change this if you need another version |
|MIN_RAM | 1G | Used to set the -xms for the JVM inside of docker. Change this if you need more or less RAM on startup|
|MAX_RAM | 8G | Used to set the -xmx for the JVM inside of docker. Change this if you need a higher maxmimum RAM during runtime|

## Server config and backup
For configuration and backup purposes the docker-compose creates two local folders in your filesystem outside of your docker container. This has a little performance impact but is easier to make changes to the server configuration on the fly.

World data is saved into /world folder. Add any plugin you need to /plugin folder.

## Important
By running the command you are automatically accepting the EULA of Mojang AB and Microsoft Corporation. This is set to default and needs to be set to true in order to run it.