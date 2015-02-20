Feature: Sonar Rest Api, GET method using the UUID

    Scenario: Getting Sonar Object using the UUID, Sunny Day scenario
        Given that I want to PUT a Sonar object
        Given the parameter "PROVIDER_NAME" is "facebook"
        Given the parameter "PROVIDER_PLACE_ID" is "100473940700"
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 200
        Then I record the "data/id" parameter as UUID
        Given that I want to GET a Sonar object using the UUID
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 200        
        Then the response is a valid JSON
        Then the response has a "data/id" property
        Then the response has a "data/name" property matching "Hyatt at Olive 8"
        Then the response has a "data/url" property matching "https://www.facebook.com/HyattatOlive8"
        Then the response has a "data/geopoint/0" property matching "47.613645"
        Then the response has a "data/source/provider_id" property matching "100473940700"
        Then the response has a "data/source/provider_name" property matching "facebook"