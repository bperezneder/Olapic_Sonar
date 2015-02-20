Feature: Sonar Rest Api, GET method

	Background:
		Given that I want to PUT a Sonar object
        Given the parameter "PROVIDER_NAME" is "facebook"
        Given the parameter "PROVIDER_PLACE_ID" is "100473940700"
        When I perform the request to "/v1/places"
        Given that I want to PUT a Sonar object
        Given the parameter "PROVIDER_NAME" is "foursquare"
        Given the parameter "PROVIDER_PLACE_ID" is "4b7755f5f964a5200f932ee3"
        When I perform the request to "/v1/places"


    Scenario: Getting Sonar Object, Sunny Day scenario
        Given that I want to GET a Sonar object
        Given the parameter "PROVIDER_NAME" is "facebook"
        Given the parameter "PROVIDER_PLACE_ID" is "100473940700"
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 200        
        Then the response is a valid JSON
        Then the response has a "data/provider_id" property matching "100473940700"
        Then the response has a "data/provider_name" property matching "facebook"
        Then the response has a "data/name" property matching "Hyatt at Olive 8"
        Then the response has a "data/url" property matching "https://www.facebook.com/HyattatOlive8"