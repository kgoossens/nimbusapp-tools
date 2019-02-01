#!/bin/bash
function usage()
{
   echo "Usage: app <appname> <command>"
   echo -e ""
   echo -e "Options:"
   echo -e "  appname    Must exist in directory ./nimbus-dockerapp/ and end with .dockerapp"
   echo -e ""
   echo -e "Commands:"
   echo -e "  down     Stop and remove containers"
   echo -e "  inspect  Shows metadata and settings for a given application"
   echo -e "  logs     Shows logs for containers"
   echo -e "  ps       Lists containers"
   echo -e "  render   Render the Compose file for the application"
   echo -e "  rm       Remove stopped containers"
   echo -e "  start    Start existing containers"
   echo -e "  stop     Stop existing containers"
   echo -e "  up       Creates and start containers"
}

if [ "$#" -ne 2 ]; then
  usage()
else
  docker-app render "./nimbus-dockerapp/$1.dockerapp" | docker-compose -p ${filename%.*} -f - $2
fi
