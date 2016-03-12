#!/bin/bash
CLASS=$1
CONTAINER_NAME="gatling-jenkins-docker"
IMAGE_NAME="gatling-jenkins-docker"


function check_image_exist {
  echo -e "\n*** Checking if docker image exists for the web-scraper... ***\n"

  if docker images | grep -w ${IMAGE_NAME}
  then
  echo -e "\n*** Image already exists. We can run container... ***\n"

  else
  build_image
  fi
}

function delete_old_reports {
rm -rf $WORKSPACE/results/
docker exec $CONTAINER_NAME rm -rf /opt/gatling/results/*
}

function build_image {

  echo -e "\n*** Building the image ***\n"
   docker build -t ${IMAGE_NAME} .
   echo -e "\n*** Finished building the image ***\n"

}

function check_container_exist {

   echo -e "\n *** Deleting old unused containers"

   docker rm $(docker ps -a | grep 'gatling-jenkins-docker' | awk '{print $3}')

  echo -e "\n*** Checking if the container exists ***\n"

    if docker ps -a | grep ${CONTAINER_NAME}
    then
        echo -e "\n*** Container already exists ***\n"
        docker start ${CONTAINER_NAME}
    else
        echo -e "\n*** Running the container ***\n"
        start_container_with_Gatling
    fi
}

function start_container_with_Gatling {
  docker run -t --rm -v $WORKSPACE/conf:/opt/gatling/conf \
  -v $WORKSPACE/user-files:/opt/gatling/user-files \
  -v $WORKSPACE/results:/opt/gatling/results \
  --name $CONTAINER_NAME $IMAGE_NAME
}

function stop_container {
docker stop ${CONTAINER_NAME} /opt/gatling/bin/gatling.sh
}

function run_gatling_test {
docker exec ${CONTAINER_NAME} /opt/gatling/bin/gatling.sh -s $CLASS
}

function copy_gatling_reports_to_workspace {
docker cp ${CONTAINER_NAME}:/opt/gatling/results $WORKSPACE/
}



check_image_exist
check_container_exist
delete_old_reports
start_container_with_Gatling
run_gatling_test
copy_gatling_reports_to_workspace
stop_container
