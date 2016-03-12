#!/bin/sh

ROOT_DIRECTORY=$(pwd)
CONTAINER_NAME="bddfire_local"
IMAGE_NAME="bddfire_local"
CUCUMBER_COMMAND=$1


function check_image_exist {
  if docker images | grep -w ${IMAGE_NAME}
  then
  echo -e "BDDfire Docker image found.
  \n If you think we need to rebuild then delete and build it again"
  else
  build_image
  fi
}

function build_image {

  echo -e "\n*** Building the image ***\n"
   docker build -t ${IMAGE_NAME} .
   echo -e "\n*** Finished building the image ***\n"

}

function check_container_exist {
    echo -e "\n*** Checking if the container exists ***\n"

    if docker ps -a | grep ${CONTAINER_NAME}
    then
        echo -e "\n*** Container already exists ***\n"
        docker start ${CONTAINER_NAME}
    else
        echo -e "\n*** Running the container ***\n"
        docker run -it -d -v $ROOT_DIRECTORY/:/opt/bddfire --name ${CONTAINER_NAME} ${IMAGE_NAME}
    fi
}

function delete_old_reports {
  docker exec ${CONTAINER_NAME}  rm -rf /opt/bddfire/reports/
}

function run_cucumber_tests {
  echo "\n Running Bundler"
  docker exec ${CONTAINER_NAME} bundle install --path vendor/
  echo "Now running cucumber tests"
  docker exec ${CONTAINER_NAME} bundle exec rake poltergeist
}

function stop_container {
docker stop ${CONTAINER_NAME}
}

check_image_exist
check_container_exist
delete_old_reports
run_cucumber_tests
stop_container
