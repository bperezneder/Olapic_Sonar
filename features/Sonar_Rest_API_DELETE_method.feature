Feature: Sonar Rest Api, DELETE method

    Scenario: Deletting Sonar Object, Sunny Day scenario, facebook
        Given that I want to PUT a Sonar object
        Given the parameter "PROVIDER_NAME" is "facebook"
        Given the parameter "PROVIDER_PLACE_ID" is "100473940700"
        When I perform the request to "/v1/places"
        Given that I want to DELETE a Sonar object
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 200        
        Then the response is a valid JSON
        Then the response has a "data/instagram_deleted" property
        Then the response has a "data/source_deleted" property
        Then the response has a "data/sonar_deleted" property
        
    Scenario: Deletting Sonar Object, Sunny Day scenario, foursquare
        Given that I want to PUT a Sonar object
        Given the parameter "PROVIDER_NAME" is "foursquare"
        Given the parameter "PROVIDER_PLACE_ID" is "4b7755f5f964a5200f932ee3"
        When I perform the request to "/v1/places"
        Given that I want to DELETE a Sonar object
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 200        
        Then the response is a valid JSON
        Then the response has a "data/instagram_deleted" property
        Then the response has a "data/source_deleted" property
        Then the response has a "data/sonar_deleted" property
		
    Scenario: Deletting Sonar Object, Empty PROVIDER_NAME
        Given that I want to DELETE a Sonar object
		Given the parameter "PROVIDER_NAME" is ""
        Given the parameter "PROVIDER_PLACE_ID" is "100473940700"
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 200        
        Then the response is a valid JSON
        Then the response has a "data/instagram_deleted" property
        Then the response has a "data/source_deleted" property
        Then the response has a "data/sonar_deleted" property		
		
    Scenario: Deletting Sonar Object, Empty PROVIDER_PLACE_ID
        Given that I want to DELETE a Sonar object
		Given the parameter "PROVIDER_NAME" is "facebook"
        Given the parameter "PROVIDER_PLACE_ID" is ""
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 200        
        Then the response is a valid JSON
        Then the response has a "data/instagram_deleted" property
        Then the response has a "data/source_deleted" property
        Then the response has a "data/sonar_deleted" property		

    Scenario: Deletting Sonar Object, Invalid PROVIDER_NAME
        Given that I want to DELETE a Sonar object
		Given the parameter "PROVIDER_NAME" is "xxxxxxxx"
        Given the parameter "PROVIDER_PLACE_ID" is "100473940700"
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 200        
        Then the response is a valid JSON
        Then the response has a "data/instagram_deleted" property
        Then the response has a "data/source_deleted" property
        Then the response has a "data/sonar_deleted" property		
		
    Scenario: Deletting Sonar Object, Invalid PROVIDER_PLACE_ID
        Given that I want to DELETE a Sonar object
		Given the parameter "PROVIDER_NAME" is "foursquare"
        Given the parameter "PROVIDER_PLACE_ID" is "4x7755f5x964x5200x932xx3"
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 200        
        Then the response is a valid JSON
        Then the response has a "data/instagram_deleted" property
        Then the response has a "data/source_deleted" property
        Then the response has a "data/sonar_deleted" property			
		
    Scenario: Deletting Sonar Object, Non-Existent PROVIDER_NAME
        Given that I want to DELETE a Sonar object
		Given the parameter "PROVIDER_NAME" is "myspace"
        Given the parameter "PROVIDER_PLACE_ID" is "100473940700"
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 200        
        Then the response is a valid JSON
        Then the response has a "data/instagram_deleted" property
        Then the response has a "data/source_deleted" property
        Then the response has a "data/sonar_deleted" property		
		
    Scenario: Deletting Sonar Object, Non-Existent PROVIDER_PLACE_ID
        Given that I want to DELETE a Sonar object
		Given the parameter "PROVIDER_NAME" is "facebook"
        Given the parameter "PROVIDER_PLACE_ID" is "999999999999"
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 200        
        Then the response is a valid JSON
        Then the response has a "data/instagram_deleted" property
        Then the response has a "data/source_deleted" property
        Then the response has a "data/sonar_deleted" property	
		
    Scenario: Deletting Sonar Object, Deletig the same object twice
        Given that I want to PUT a Sonar object
        Given the parameter "PROVIDER_NAME" is "facebook"
        Given the parameter "PROVIDER_PLACE_ID" is "100473940700"
        When I perform the request to "/v1/places"
        Given that I want to DELETE a Sonar object
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 200  
        When I perform the request to "/v1/places"
        Given that I want to DELETE a Sonar object
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 200  		
        Then the response is a valid JSON
        Then the response has a "data/instagram_deleted" property
        Then the response has a "data/source_deleted" property
        Then the response has a "data/sonar_deleted" property		
