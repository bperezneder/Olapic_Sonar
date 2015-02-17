Feature: Sonar Service API. PUT method

  Scenario: Sunny Day Scenario
    GIVEN webservice API with URL http://uk9c0jvb9f6nvxvhursp.olapic.com	
	WHEN I call the PUT method with the parameters /v1/places/<PROVIDER_NAME>/<PROVIDER_PLACE_ID>
	  |PROVIDER_NAME|PROVIDER_PLACE_ID       |NAME                                    |URL                                                                                      |GEOPOINT                         |
	  |facebook     |100473940700            |Hyatt at Olive 8                        |https:\/\/www.facebook.com\/HyattatOlive8                                                |[47.613645|-122.334061]          |
	  |foursquare   |4b7755f5f964a5200f932ee3|Waikiki Beach Marriott Resort \u0026 Spa|https:\/\/foursquare.com\/v\/waikiki-beach-marriott-resort--spa\/4b7755f5f964a5200f932ee3|[21.273972810985,-157.8223950981]|
	THEN I expect a JSON object matching "code":200
	AND matching "data":
	AND matching "id":
	AND matching "name":"<NAME>"
	AND matching "url":"<URL>"
	AND matching "geopoint":<GEOPOINT>
	AND matching "source":
	AND matching "provider_hash":
	AND matching "provider_id":"<PROVIDER_PLACE_ID>"
	AND matching "provider_name":"<PROVIDER_NAME>"
	AND matching "instagram_location":
	AND matching "id":
	AND matching "hash":

  Scenario: Invalid PROVIDER_NAME
    GIVEN webservice API with URL http://uk9c0jvb9f6nvxvhursp.olapic.com	
	WHEN I call the PUT method with the parameters /v1/places/faceboox/100473940700
	THEN I expect a JSON object matching "code":404
	AND matching "error":"SourcePlaceNotFound"
	AND matching "error_message":"Unknown provider with name: <PROVIDER_NAME>"
	  
  Scenario: Invalid PROVIDER_PLACE_ID
    GIVEN webservice API with URL http://uk9c0jvb9f6nvxvhursp.olapic.com	
	WHEN I call the PUT method with the parameters /v1/places/facebook/1004739407xx
	THEN I expect a JSON object matching "code":404
	AND matching "error":"SourcePlaceNotFound"
	AND matching "error_message":"No SourcePlace found for \u0022facebook\u0022 with \u0022id\u0022: 1004739407xx"

  Scenario: Blank PROVIDER_NAME
    GIVEN webservice API with URL http://uk9c0jvb9f6nvxvhursp.olapic.com	
	WHEN I call the PUT method with the parameters /v1/places//100473940700
	THEN I expect a JSON object matching "code":404
	AND a JSON object matching "error":"NotFoundHttpException","error_message":"No route found for \u0022PUT \/v1\/places\/\/100473940700\u0022"
	  
  Scenario: Blank PROVIDER_PLACE_ID
    GIVEN webservice API with URL http://uk9c0jvb9f6nvxvhursp.olapic.com	
	WHEN I call the PUT method with the parameters /v1/places/facebook/
	THEN I expect a JSON object matching "code":404
	AND a JSON object matching "error":"NotFoundHttpException","error_message":"No route found for \u0022PUT \/v1\/places\/facebook\/\/\u0022"

	