Feature: Sonar Service API. GET method

  Background:
    GIVEN webservice API with URL http://uk9c0jvb9f6nvxvhursp.olapic.com	
	WHEN I call the PUT method with the parameters /v1/places/<PROVIDER_NAME>/<PROVIDER_PLACE_ID>
	  |PROVIDER_NAME|PROVIDER_PLACE_ID       |INVALID_PROVIDER_PLACE_ID|ID                                  |NAME                                    |URL                                                                                      |
	  |facebook     |100473940700            |1004739407xx             |1b1b7e79-9464-404c-b2b8-0d24e11329bf|Hyatt at Olive 8                        |https:\/\/www.facebook.com\/HyattatOlive8                                                |
	  |foursquare   |4b7755f5f964a5200f932ee3|4x7755x5x964x5200x932xx3 |ca5c8892-7597-45c5-9ecf-8c7ad2f7848c|Waikiki Beach Marriott Resort \u0026 Spa|https:\/\/foursquare.com\/v\/waikiki-beach-marriott-resort--spa\/4b7755f5f964a5200f932ee3|

  Scenario: Sunny Day Scenario
    GIVEN webservice API with URL http://uk9c0jvb9f6nvxvhursp.olapic.com	
	WHEN I call the GET method with the parameters /v1/places/<PROVIDER_NAME>/<PROVIDER_PLACE_ID>
	THEN I expect a JSON object matching "code":200
	AND matching "provider_id":"<PROVIDER_PLACE_ID>"
	AND matching "provider_name":"<PROVIDER_NAME>"
	AND matching "name":"<NAME>"
	AND matching "url":"<URL>"

  Scenario: Invalid PROVIDER_PLACE_ID
    GIVEN webservice API with URL http://uk9c0jvb9f6nvxvhursp.olapic.com	
	WHEN I call the GET method with the parameters /v1/places/<PROVIDER_NAME>/<INVALID_PROVIDER_PLACE_ID>
	THEN I expect a JSON object matching "code":404
	AND matching "error":"SourcePlaceNotFound"
	AND matching "error_message":"No SourcePlace found for \u0022<PROVIDER_NAME>\u0022 with \u0022id\u0022: <INVALID_PROVIDER_PLACE_ID>"
	
  Scenario: Blank PROVIDER_NAME
    GIVEN webservice API with URL http://uk9c0jvb9f6nvxvhursp.olapic.com	
	WHEN I call the GET method with the parameters /v1/places//<PROVIDER_PLACE_ID>
	THEN I expect a JSON object matching "code":404
	AND matching "error":"NotFoundHttpException"
	AND matching "error_message":"No route found for \u0022PUT \/v1\/places\/\/<PROVIDER_PLACE_ID>\u0022"
	  
  Scenario: Blank PROVIDER_PLACE_ID
    GIVEN webservice API with URL http://uk9c0jvb9f6nvxvhursp.olapic.com	
	WHEN I call the GET method with the parameters /v1/places/<PROVIDER_NAME>/
	THEN I expect a JSON object matching "code":404
	AND matching "error":"NotFoundHttpException"
	AND matching "error_message":"No route found for \u0022GET \/v1\/places\/<PROVIDER_NAME>\/\/\u0022"
	
  Scenario: Inexistent PROVIDER_NAME
    GIVEN webservice API with URL http://uk9c0jvb9f6nvxvhursp.olapic.com	
	WHEN I call the GET method with the parameters /v1/places/sonar/100473940700
	THEN I expect a JSON object matching "code":404
	AND matching "error":"SourcePlaceNotFound"
	AND matching "error_message":"Unknown provider with name: sonar"
	
  Scenario: Inexistent PROVIDER_PLACE_ID
    GIVEN webservice API with URL http://uk9c0jvb9f6nvxvhursp.olapic.com	
	AND I have executed the DELETE method with parameters /v1/places/<PROVIDER_NAME>/<PROVIDER_PLACE_ID>
	WHEN I call the GET method with the parameters /v1/places/<PROVIDER_NAME>/<PROVIDER_PLACE_ID>
	THEN I expect a JSON object matching "code":404
    AND matching "error":"SourcePlaceNotFound"
	AND matching "error_message":"No SourcePlace found for \u0022<PROVIDER_NAME>\u0022 with \u0022id\u0022: <PROVIDER_PLACE_ID>"
