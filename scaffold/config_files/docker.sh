#!/bin/sh

WORKSPACE=$(pwd)
CONTAINER_NAME="bddfire-ci"
IMAGE_NAME="bddfire-ci"


function stop_container_if_already_running {

  docker stop ${CONTAINER_NAME}
  docker rm ${CONTAINER_NAME}
}

function check_image_exist {
  echo -e "List of the available images \n"
  docker images
  if docker images | grep -w "bddfire-ci"
  then
  echo -e "\n*** Image already exists. We can run container... ***\n"
  else
  echo -e "\n ** No Image found, please build image"
  build_image
  fi
}

function build_image {

  echo -e "\n*** Building the image ***\n"
   docker build -t ${IMAGE_NAME} .
   echo -e "\n*** Finished building the image ***\n"

}

function check_container_exist {
   echo -e "List of the available containers \n"
   echo docker ps -a
   echo -e "\n*** Checking if the container exists ***\n"

    if docker ps -a | grep ${CONTAINER_NAME}
    then
        echo -e "\n*** Container already exists ***\n"
        docker start ${CONTAINER_NAME}
    else
        echo -e "\n*** Running the container ***\n"
        run_container_with_volume
    fi
}

function run_container_with_volume {
  docker run -it -d -v $WORKSPACE/:/opt/bddfire --name ${CONTAINER_NAME} ${IMAGE_NAME}
  echo -e "Listing directoy structure of the cucumber project inside container"
  docker exec ${CONTAINER_NAME} ls /opt/bddfire/
}

function delete_old_reports_screenshots {
  docker exec ${CONTAINER_NAME}  rm -rf /opt/bddfire/reports
}

function run_cucumber_tests {
  # docker exec ${CONTAINER_NAME}  bundle exec rubocop features
  echo "\n Running Bundler"
  docker exec ${CONTAINER_NAME} bundle install --path vendor/
  echo "Now running cucumber tests"
  docker exec ${CONTAINER_NAME} bundle exec cucumber -p poltergeist
  exit $?
}

function copy_reports_screenshots_to_workspace {
 echo "\n Copying Test Reports back to Workspace"
 docker cp ${CONTAINER_NAME}:/opt/bddfire/reports/ $WORKSPACE/reports/
}

function stop_container {
docker stop ${CONTAINER_NAME}
}

check_image_exist
check_container_exist
delete_old_reports_screenshots
run_cucumber_tests
copy_reports_screenshots_to_workspace
stop_container
