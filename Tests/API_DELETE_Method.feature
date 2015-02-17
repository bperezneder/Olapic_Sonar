Feature: Sonar Service API. DELETE method

  Background:
    GIVEN webservice API with URL http://uk9c0jvb9f6nvxvhursp.olapic.com	
	WHEN I call the PUT method with the parameters /v1/places/<PROVIDER_NAME>/<PROVIDER_PLACE_ID>
	  |PROVIDER_NAME|PROVIDER_PLACE_ID       |
	  |facebook     |100473940700            |
	  |foursquare   |4b7755f5f964a5200f932ee3|

  Scenario: Sunny Day Scenario
    GIVEN webservice API with URL http://uk9c0jvb9f6nvxvhursp.olapic.com	
	WHEN I call the DELETE method with the parameters /v1/places/<PROVIDER_NAME>/<PROVIDER_PLACE_ID>
	THEN I expect a JSON object matching "code":200
	AND matching "instagram_deleted":true
	AND matching "source_deleted":true
	AND matching "sonar_deleted":true
	
  Scenario: Invalid PROVIDER_NAME
    GIVEN webservice API with URL http://uk9c0jvb9f6nvxvhursp.olapic.com	
	WHEN I call the DELETE method with the parameters /v1/places/faceboox/100473940700
	THEN I expect a JSON object matching "code":404
	AND matching "error":"PlaceNotDeleted"
	AND matching "error_message":"Unknown provider with name: faceboox"

  Scenario: Invalid PROVIDER_PLACE_ID
    GIVEN webservice API with URL http://uk9c0jvb9f6nvxvhursp.olapic.com	
	WHEN I call the DELETE method with the parameters /v1/places/facebook/1004739407xx
	THEN I expect a JSON object matching "code":404
	AND matching "error":"PlaceNotDeleted"
	AND matching "error_message":"No SourcePlace found for \u0022facebook\u0022 with \u0022id\u0022: 1004739407xx"

  Scenario: Blank PROVIDER_NAME
    GIVEN webservice API with URL http://uk9c0jvb9f6nvxvhursp.olapic.com	
	WHEN I call the DELETE method with the parameters /v1/places//100473940700
	THEN I expect a JSON object matching "code":404
	AND matching "error":"NotFoundHttpException"
	AND matching "error_message":"No route found for \u0022DELETE \/v1\/places\/\/100473940700\u0022"
	  
  Scenario: Blank PROVIDER_PLACE_ID
    GIVEN webservice API with URL http://uk9c0jvb9f6nvxvhursp.olapic.com	
	WHEN I call the DELETE method with the parameters /v1/places/facebook/
	THEN I expect a JSON object matching "code":404
	AND matching "error":"NotFoundHttpException"
	AND matching "error_message":"No route found for \u0022PUT \/v1\/places\/facebook\/\/\u0022"
	
  Scenario: Inexistent PROVIDER_PLACE_ID
    GIVEN webservice API with URL http://uk9c0jvb9f6nvxvhursp.olapic.com	
	AND I have executed the DELETE method with parameters /v1/places/<PROVIDER_NAME>/<PROVIDER_PLACE_ID>
	WHEN I call the DELETE method with parameters /v1/places/<PROVIDER_NAME>/<PROVIDER_PLACE_ID>
	THEN I expect a JSON object matching "code":404
	AND matching "error":"PlaceNotDeleted"
	AND matching "error_message":"No SourcePlace found for \u0022<PROVIDER_NAME>\u0022 with \u0022id\u0022: <PROVIDER_PLACE_ID>"
	

