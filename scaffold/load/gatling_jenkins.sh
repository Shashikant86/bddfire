#!/bin/bash
cd ${WORKSPACE}

# Remove old Gatling reports and version Download New

rm -rf ${WORKSPACE}/gatling-charts-highcharts-bundle-$GATLING_VERSION


curl -sf -o ${WORKSPACE}/gatling-$GATLING_VERSION.zip \
  -L https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/$GATLING_VERSION/gatling-charts-highcharts-bundle-$GATLING_VERSION-bundle.zip
ls
unzip ${WORKSPACE}/gatling-$GATLING_VERSION.zip

chmod +x ${WORKSPACE}/gatling-charts-highcharts-bundle-$GATLING_VERSION/bin/gatling.sh
 # Set GATLING_HOME

export GATLING_HOME=${WORKSPACE}/gatling-charts-highcharts-bundle-$GATLING_VERSION

# Remove default simulations & Config and add our own

rm -rf ${WORKSPACE}/gatling-charts-highcharts-bundle-$GATLING_VERSION/user-files/simulations/
rm -rf ${WORKSPACE}/gatling-charts-highcharts-bundle-$GATLING_VERSION/conf
cp ${WORKSPACE}/user-files/ ${WORKSPACE}/gatling-charts-highcharts-bundle-$GATLING_VERSION/user-files/
cp ${WORKSPACE}/conf ${WORKSPACE}/gatling-charts-highcharts-bundle-$GATLING_VERSION/conf/

# RUN Gatling TEST WITH CLASS CLASS/TEST SCENARIO SPECIFIED

sh ${WORKSPACE}/gatling-charts-highcharts-bundle-$GATLING_VERSION/bin/gatling.sh -sf ${WORKSPACE}/gatling-charts-highcharts-bundle-$GATLING_VERSION/user-files/simulations/ -s SampleLoadTEST -rf ${WORKSPACE}/gatling-charts-highcharts-bundle-$GATLING_VERSION/results/
