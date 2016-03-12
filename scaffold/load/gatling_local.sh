#!/bin/bash
GATLING_VERSION=2.1.7

# Remove old Gatling reports and version Download New

rm -rf gatling-charts-highcharts-bundle-${GATLING_VERSION}/
rm -rf gatling-${GATLING_VERSION}.zip/


curl -sf -o gatling-${GATLING_VERSION}.zip \
  -L https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/${GATLING_VERSION}/gatling-charts-highcharts-bundle-${GATLING_VERSION}-bundle.zip
ls
unzip gatling-${GATLING_VERSION}.zip

chmod +x gatling-charts-highcharts-bundle-${GATLING_VERSION}/bin/gatling.sh
 # Set GATLING_HOME

export GATLING_HOME=gatling-charts-highcharts-bundle-${GATLING_VERSION}

# Remove default simulations and Config and add our own

rm -rf gatling-charts-highcharts-bundle-${GATLING_VERSION}/user-files/
rm -rf gatling-charts-highcharts-bundle-${GATLING_VERSION}/conf
cp -rf user-files/ gatling-charts-highcharts-bundle-${GATLING_VERSION}/user-files/
cp -rf config/ gatling-charts-highcharts-bundle-${GATLING_VERSION}/config

# RUN Gatling TEST WITH CLASS CLASS/TEST SCENARIO SPECIFIED

sh gatling-charts-highcharts-bundle-${GATLING_VERSION}/bin/gatling.sh -sf gatling-charts-highcharts-bundle-${GATLING_VERSION}/user-files/simulations/ -s SampleLoadTest -rf gatling-charts-highcharts-bundle-${GATLING_VERSION}/results/
