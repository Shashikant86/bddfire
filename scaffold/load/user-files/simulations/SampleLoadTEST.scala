
import scala.concurrent.duration._

import io.gatling.core.Predef._
import io.gatling.http.Predef._
import io.gatling.jdbc.Predef._

class SampleLoadTEST extends Simulation {

	val httpConf = http
    .baseURL("http://www.aol.co.uk")

  val scn = scenario("SampleLoadTEST")
    .exec(http("Sample Load Test")
    .get("/"))
    .pause(2)

  setUp(
    scn.inject(atOnceUsers(1))
  ).protocols(httpConf).assertions(global.responseTime.max.lessThan(1000))

}
