Feature: Sonar Rest Api, GET method    
		        
    Scenario: Getting Sonar Object, Sunny Day scenario, facebook
	    Given that I want to DELETE a Sonar object
        Given the parameter "PROVIDER_NAME" is "facebook"
        Given the parameter "PROVIDER_PLACE_ID" is "100473940700"
        When I perform the request to "/v1/places"
        Then I wait 3 seconds
        Given that I want to PUT a Sonar object
        When I perform the request to "/v1/places"
        Then I wait 3 seconds
        Given that I want to GET a Sonar object
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 200        
        Then the response is a valid JSON
        Then the response has a "data/provider_id" property matching "100473940700"
        Then the response has a "data/provider_name" property matching "facebook"
        Then the response has a "data/name" property matching "Hyatt at Olive 8"
        Then the response has a "data/url" property matching "https://www.facebook.com/HyattatOlive8"
		
    Scenario: Getting Sonar Object, Sunny Day scenario, foursquare
	    Given that I want to DELETE a Sonar object
        Given the parameter "PROVIDER_NAME" is "foursquare"
        Given the parameter "PROVIDER_PLACE_ID" is "4b7755f5f964a5200f932ee3"
        When I perform the request to "/v1/places"
		Then I wait 3 seconds
        Given that I want to PUT a Sonar object
        When I perform the request to "/v1/places"
        Then I wait 3 seconds
        Given that I want to GET a Sonar object
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 200        
        Then the response is a valid JSON
        Then the response has a "data/provider_id" property matching "4b7755f5f964a5200f932ee3"
        Then the response has a "data/provider_name" property matching "foursquare"
        Then the response has a "data/name" property matching "Waikiki Beach Marriott Resort & Spa"
        Then the response has a "data/url" property matching "https://foursquare.com/v/waikiki-beach-marriott-resort--spa/4b7755f5f964a5200f932ee3"
        
    Scenario: Getting Sonar Object, Empty "PROVIDER_NAME"
        Given that I want to GET a Sonar object
        Given the parameter "PROVIDER_NAME" is ""
        Given the parameter "PROVIDER_PLACE_ID" is "100473940700"
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 404
        Then the response is a valid JSON
        Then the response has a "meta/error" property matching "NotFoundHttpException"
        Then the response has a "meta/error_message" property matching "No route found for"
        
    Scenario: Getting Sonar Object, Empty "PROVIDER_PLACE_ID"
        Given that I want to GET a Sonar object
        Given the parameter "PROVIDER_NAME" is "facebook"
        Given the parameter "PROVIDER_PLACE_ID" is ""
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 404
        Then the response is a valid JSON
        Then the response has a "meta/error" property matching "NotFoundHttpException"
        Then the response has a "meta/error_message" property matching "No route found for"
        
    Scenario: Getting Sonar Object, Invalid "PROVIDER_NAME"
        Given that I want to GET a Sonar object
        Given the parameter "PROVIDER_NAME" is "xxxxxxxx"
        Given the parameter "PROVIDER_PLACE_ID" is "100473940700"
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 404
        Then the response is a valid JSON
        Then the response has a "meta/error" property matching "SourcePlaceNotFound"
        Then the response has a "meta/error_message" property matching "Unknown provider with name: xxxxxxx"
        
    Scenario: Getting Sonar Object, Invalid "PROVIDER_PLACE_ID"
        Given that I want to GET a Sonar object
        Given the parameter "PROVIDER_NAME" is "foursquare"
        Given the parameter "PROVIDER_PLACE_ID" is "9x7755x5x964x5200x932xx3"
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 404
        Then the response is a valid JSON
        Then the response has a "meta/error" property matching "SourcePlaceNotFound"
        Then the response has a "meta/error_message" property matching "No SourcePlace found for"
		
    Scenario: Getting Sonar Object, Non-Existent "PROVIDER_NAME"
        Given that I want to GET a Sonar object
        Given the parameter "PROVIDER_NAME" is "telnet"
        Given the parameter "PROVIDER_PLACE_ID" is "100473940700"
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 404
        Then the response is a valid JSON
        Then the response has a "meta/error" property matching "SourcePlaceNotFound"
        Then the response has a "meta/error_message" property matching "Unknown provider with name: telnet"
		
    Scenario: Getting Sonar Object, Non-Existent "PROVIDER_PLACE_ID"
        Given that I want to GET a Sonar object
        Given the parameter "PROVIDER_NAME" is "facebook"
        Given the parameter "PROVIDER_PLACE_ID" is "999999999999"
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 404
        Then the response is a valid JSON
        Then the response has a "meta/error" property matching "SourcePlaceNotFound"
        Then the response has a "meta/error_message" property matching "No SourcePlace found for"

    Scenario: Getting Sonar Object, Deleted Object, facebook
	    Given that I want to PUT a Sonar object
        Given the parameter "PROVIDER_NAME" is "facebook"
        Given the parameter "PROVIDER_PLACE_ID" is "100473940700"
        When I perform the request to "/v1/places"
        Then I wait 3 seconds
        Given that I want to DELETE a Sonar object
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 200        		
        Then I wait 3 seconds
        Given that I want to GET a Sonar object
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 404
        Then the response is a valid JSON
        Then the response has a "meta/error" property matching "SourcePlaceNotFound"
        Then the response has a "meta/error_message" property matching "No SourcePlace found for"

    Scenario: Getting Sonar Object, Deleted Object, foursquare
	    Given that I want to PUT a Sonar object
        Given the parameter "PROVIDER_NAME" is "foursquare"
        Given the parameter "PROVIDER_PLACE_ID" is "4b7755f5f964a5200f932ee3"
        When I perform the request to "/v1/places"
        Then I wait 3 seconds
        Given that I want to DELETE a Sonar object
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 200        		
        Then I wait 3 seconds
        Given that I want to GET a Sonar object
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 404
        Then the response is a valid JSON
        Then the response has a "meta/error" property matching "SourcePlaceNotFound"
        Then the response has a "meta/error_message" property matching "No SourcePlace found for"
        
      