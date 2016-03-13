# Radio Gatling setup CI and Docker

This is repo running load test with gattling and generate reports. It does following things

 * Get Gatling Setup into your WORKSPACE or local directory

 * Take your config and simulations(scenario class) and runs load tests against it

 * Generate report in HTML. Default gatling

 * We can run it locally or on CI



# Usage

 * Download this Change directory to 'load'

 * Record your load test simulations and put your class in the 'user-files/simulations'

 * Running it locally

         sh gatling_local.sh



At the end you will see link to HTML report. Open it into browser and enjoy !!

# Docker

Not Tested and Not recommended
