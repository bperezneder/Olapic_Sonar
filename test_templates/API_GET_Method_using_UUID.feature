Feature: Sonar Service API. GET method using UUID

  Background:
    GIVEN webservice API with URL http://uk9c0jvb9f6nvxvhursp.olapic.com	
	WHEN I call the PUT method with the parameters /v1/places/<PROVIDER_NAME>/<PROVIDER_PLACE_ID>
	  |PROVIDER_NAME|PROVIDER_PLACE_ID       |NAME                                    |URL                                                                                      |GEOPOINT                         |
	  |facebook     |100473940700            |Hyatt at Olive 8                        |https:\/\/www.facebook.com\/HyattatOlive8                                                |[47.613645|-122.334061]          |
	  |foursquare   |4b7755f5f964a5200f932ee3|Waikiki Beach Marriott Resort \u0026 Spa|https:\/\/foursquare.com\/v\/waikiki-beach-marriott-resort--spa\/4b7755f5f964a5200f932ee3|[21.273972810985,-157.8223950981]|
	AND I record the <SONAR_PLACE_ID>

  Scenario: Sunny Day Scenario
    GIVEN webservice API with URL http://uk9c0jvb9f6nvxvhursp.olapic.com	
	WHEN I call the GET method with the parameters /v1/places/sonar/<SONAR_PLACE_ID>
	THEN I expect a JSON object matching "code":200
    AND matching "id":"<SONAR_PLACE_ID>"
	AND matching "name":"<NAME>"
	AND matching "url":"<URL>"
	AND matching "geopoint":<GEOPOINT>
	AND matching "provider_id":"<PROVIDER_PLACE_ID>"
	AND matching "provider_name":"<PROVIDER_NAME>"
	
  Scenario: Invalid SONAR_PLACE_ID
    GIVEN webservice API with URL http://uk9c0jvb9f6nvxvhursp.olapic.com	
	WHEN I call the GET method with the parameters /v1/places/sonar/58d0d203-885x-4xd8-bd55-a2829xfe7f98
	THEN I expect a JSON object matching "code":404
    AND matching "error":"SonarPlaceNotFound"
	AND matching "error_message":"Invalid UUID string: 58d0d203-885x-4xd8-bd55-a2829xfe7f98"

  Scenario: Blank SONAR_PLACE_ID
    GIVEN webservice API with URL http://uk9c0jvb9f6nvxvhursp.olapic.com	
	WHEN I call the GET method with the parameters /v1/places/sonar/
	THEN I expect a JSON object matching "code":404
    AND matching "error":"NotFoundHttpException"
	AND matching "error_message":"No route found for \u0022GET \/v1\/places\/sonar\/\u0022"
	
  Scenario: Inexistent SONAR_PLACE_ID
    GIVEN webservice API with URL http://uk9c0jvb9f6nvxvhursp.olapic.com	
	AND I have executed the DELETE method with parameters /v1/places/<PROVIDER_NAME>/<PROVIDER_PLACE_ID>
	WHEN I call the GET method with the parameters /v1/places/sonar/<SONAR_PLACE_ID>
	THEN I expect a JSON object matching "code":404
    AND matching "error":"SonarPlaceNotFound"
	AND matching "error_message":"No SonarPlace found with id: <SONAR_PLACE_ID>"