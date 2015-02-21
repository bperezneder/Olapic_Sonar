Feature: Sonar Rest Api, GET method using the UUID

    Scenario: Getting Sonar Object using the UUID, Sunny Day scenario, facebook
        Given that I want to PUT a Sonar object
        Given the parameter "PROVIDER_NAME" is "facebook"
        Given the parameter "PROVIDER_PLACE_ID" is "100473940700"
        When I perform the request to "/v1/places"
        Then I record the "data/id" parameter as UUID
        Then I wait 3 seconds
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
		
    Scenario: Getting Sonar Object using the UUID, Sunny Day scenario, foursquare
        Given that I want to PUT a Sonar object
        Given the parameter "PROVIDER_NAME" is "foursquare"
        Given the parameter "PROVIDER_PLACE_ID" is "4b7755f5f964a5200f932ee3"
        When I perform the request to "/v1/places"
        Then I record the "data/id" parameter as UUID
        Then I wait 3 seconds
        Given that I want to GET a Sonar object using the UUID
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 200
        Then the response is a valid JSON
        Then the response has a "data/id" property
        Then the response has a "data/name" property matching "Waikiki Beach Marriott Resort & Spa"
        Then the response has a "data/url" property matching "https://foursquare.com/v/waikiki-beach-marriott-resort--spa/4b7755f5f964a5200f932ee3"
        Then the response has a "data/geopoint/0" property matching "21.27397281"
        Then the response has a "data/source/provider_id" property matching "4b7755f5f964a5200f932ee3"
        Then the response has a "data/source/provider_name" property matching "foursquare"
		
    Scenario: Getting Sonar Object using the UUID, Empty UUID
        Given that I want to GET a Sonar object using the UUID
		Given that the UUID is ""
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 404
        Then the response is a valid JSON
        Then the response has a "meta/error" property matching "NotFoundHttpException"
        Then the response has a "meta/error_message" property matching "No route found for"
        		
    Scenario: Getting Sonar Object using the UUID, Ivalid UUID
        Given that I want to GET a Sonar object using the UUID
		Given that the UUID is "xx5c8892-7597-45x5-9xxf-8x7xx2x7848x"
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 404
        Then the response is a valid JSON
        Then the response has a "meta/error" property matching "NotFoundHttpException"
        Then the response has a "meta/error_message" property matching "No route found for"
        
    Scenario: Getting Sonar Object using the UUID, Non-Existent UUID
        Given that I want to GET a Sonar object using the UUID
		Given that the UUID is "ffffffff-ffff-ffff-ffff-ffffffffffff"
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 404
        Then the response is a valid JSON
        Then the response has a "meta/error" property matching "NotFoundHttpException"
        Then the response has a "meta/error_message" property matching "No route found for"
		
    Scenario: Getting Sonar Object using the UUID, Deleted Object, facebook
        Given that I want to PUT a Sonar object
        Given the parameter "PROVIDER_NAME" is "facebook"
        Given the parameter "PROVIDER_PLACE_ID" is "100473940700"
        When I perform the request to "/v1/places"
        Then I record the "data/id" parameter as UUID
        Then I wait 3 seconds
        Given that I want to DELETE a Sonar object
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 200      
        Then I wait 3 seconds
        Given that I want to GET a Sonar object using the UUID
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 404
        Then the response is a valid JSON
        Then the response has a "meta/error" property matching "NotFoundHttpException"
        Then the response has a "meta/error_message" property matching "No route found for"
		
    Scenario: Getting Sonar Object using the UUID, Deleted Object, foursquare
        Given that I want to PUT a Sonar object
        Given the parameter "PROVIDER_NAME" is "foursquare"
        Given the parameter "PROVIDER_PLACE_ID" is "4b7755f5f964a5200f932ee3"
        When I perform the request to "/v1/places"
        Then I record the "data/id" parameter as UUID
        Then I wait 3 seconds
        Given that I want to DELETE a Sonar object
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 200      
        Then I wait 3 seconds
        Given that I want to GET a Sonar object using the UUID
        When I perform the request to "/v1/places"
        Then I expect the response status code to be 404
        Then the response is a valid JSON
        Then the response has a "meta/error" property matching "NotFoundHttpException"
        Then the response has a "meta/error_message" property matching "No route found for"
				