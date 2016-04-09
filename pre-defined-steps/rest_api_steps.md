# REST API Testing 

You need to tag your feature/scenario with @api to use

## TEST JSON RESPONSE 

       Given I send a GET request for "<your_uri>"

       Given I send a GET/PUT/POST/DELETE request for "<your_uri>" with the following: 
        """
       <your_payload>
        """

       Then the response should be JSON

       Then the response status code should be '200'

       Then the JSON response should have '<number_of_properties>' properties

       Then the JSON response has a "<id_of_property>" property

       Then the JSON "<id_of_property>" property equals "<value_of_property>" 

       Then the JSON response header has key "<header_name>" with value of "<header_name>" 

       Then /^the JSON response should be:
        """
         <your_json>
        """

## TEST XML RESPONSE

Given I send a GET request for "<your_uri>"

Then the XML response should have "<your_tag>" with text "<your_text>"

Then the response status code should be '200'




