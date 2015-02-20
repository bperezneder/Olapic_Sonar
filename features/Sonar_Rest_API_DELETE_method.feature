Feature: Sonar Rest Api, DELETE method

    Scenario: Deletting Sonar Object, Sunny Day scenario
        Given that I want to PUT a Sonar object
        Given the parameter "PROVIDER_NAME" is "facebook"
        Given the parameter "PROVIDER_PLACE_ID" is "100473940700"
        When I perform the request to "/v1/places"
        Given that I want to DELETE a Sonar object
        Given the parameter "PROVIDER_NAME" is "facebook"
        Given the parameter "PROVIDER_PLACE_ID" is "100473940700"
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 200        
        Then the response is a valid JSON
        Then the response has a "data/instagram_deleted" property
        Then the response has a "data/source_deleted" property
        Then the response has a "data/sonar_deleted" property
        