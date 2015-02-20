<?php
use Behat\Behat\Context\BehatContext;
use Symfony\Component\Yaml\Yaml;

/**
 * Rest context.
 */
class RestContext extends BehatContext
{

    private $_restObject        = null;
    private $_restObjectType    = null;
    private $_restObjectMethod  = 'get';
    private $_client            = null;
    private $_response          = null;
    private $_requestUrl        = null;
    private $_uuid				= null;

    private $_parameters			= array();

    public function __construct(array $parameters)
    {
        $this->_restObject  = new stdClass();
        $this->_client      = new Guzzle\Service\Client();
    }

     /**
     * @Given /^that I want to PUT a Sonar object$/
     */
    public function thatIWantToPutASonarObject()
    {
        $this->_restObjectMethod = 'put';
    }

     /**
     * @Given /^that I want to GET a Sonar object$/
     */
    public function thatIWantToGetASonarObject()
    {
        $this->_restObjectMethod = 'get';
    }
    
     /**
     * @Given /^that I want to GET a Sonar object using the UUID$/
     */
    public function thatIWantToGetASonarObjectUsingTheUuid()
    {
    	$this->_restObjectMethod = 'get';
    	$parameters  = array();
    	$parameters['PROVIDER_NAME']  = '/sonar';
    	$parameters['SONAR_PLACE_ID']  = '/'.$this->_uuid;
    	$this->_parameters = $parameters;    	
    }

    /**
     * @Given /^that I want to DELETE a Sonar object$/
     */
    public function thatIWantToDeleteASonarObject()
    {
        $this->_restObjectMethod = 'delete';
    }

    /**
     * @Given /^the parameter "([^"]*)" is "([^"]*)"$/
     */
    public function theParameterIs($parameterName, $parameterValue)
    {
        $this->_parameters[$parameterName] = "/".$parameterValue;
    }
	
	/**
	 * @Given /^that the UUID is "([^"]*)"$/
     */
    public function theParameterIs($uuidValue)
    {
        $parameters  = array();
    	$parameters['PROVIDER_NAME']  = '/sonar';
    	$parameters['SONAR_PLACE_ID']  = '/'.$this->_uuid;
    	$this->_parameters = $parameters;    	
    }

    /**
     * @When /^I perform the request to "([^"]*)"$/
     */
    public function iRequest($pageUrl)
    {
        $baseUrl 			= "http://uk9c0jvb9f6nvxvhursp.olapic.com";
        $this->_requestUrl 	= $baseUrl.$pageUrl;
        foreach($this->_parameters as $parameterName => $parameterValue) {
        	$this->_requestUrl 	.= $parameterValue;
        }

        switch (strtoupper($this->_restObjectMethod)) {
            case 'GET':
                $this->_response = $this->_client
                    ->get($this->_requestUrl)
                    ->send();
                break;
            case 'PUT':
                $postFields = (array)$this->_restObject;
                $this->_response = $this->_client
                    ->put($this->_requestUrl)
                    ->send();
                break;
            case 'DELETE':
            	$this->_response = $this->_client
                    ->delete($this->_requestUrl)
                    ->send();
            	break;
        }
//         echo "Response:".$this->_response;
    }

    /**
     * @Then /^the response is a valid JSON$/
     */
    public function theResponseIsAValidJson()
    {
        $data = json_decode($this->_response->getBody(true));

        if (empty($data)) {
            throw new Exception("Response was not JSON\n" . $this->_response);
        }
    }

    /**
     * @Then /^the response has a "([^"]*)" property$/
     */
    public function theResponseHasAProperty($propertyName)
    {
    	$data = json_decode($this->_response->getBody(true),true);
        $keys = preg_split("/\//",$propertyName);
        if (!empty($data)) {        	
        	foreach($keys as $key){
        		if (isset($data[$key])){
        			$data = $data[$key];
        		} else {
        			throw new Exception("Property '".$key."' is not set!\n");
        		}
        	}        	
        } else {
            throw new Exception("Response was not JSON\n" . $this->_response->getBody(true));
        }
    }

    /**
     * @Then /^the response has a "([^"]*)" property matching "([^"]*)"$/
     */
    public function thePropertyMatches($propertyName, $propertyValue)
    {
        $data = json_decode($this->_response->getBody(true),true);
        $keys = preg_split("/\//",$propertyName);

        if (!empty($data)) {
            foreach($keys as $key){
        		if (isset($data[$key])){
        			$data = $data[$key];
        		} else {
        			throw new Exception("Property '".$key."' is not set!\n".$this->_response);
        		}
        	}   
        	if (!preg_match("#".$propertyValue."#",$data)) {
            	throw new Exception('Property value mismatch! (given: '.$propertyValue.', match: '.$data.')');
            }
        } else {
            throw new Exception("Response was not JSON\n" . $this->_response->getBody(true));
        }
    }

    /**
     * @Given /^the type of the "([^"]*)" property is ([^"]*)$/
     */
    public function theTypeOfThePropertyIsNumeric($propertyName,$typeString)
    {
        $data = json_decode($this->_response->getBody(true));

        if (!empty($data)) {
            if (!isset($data->$propertyName)) {
                throw new Exception("Property '".$propertyName."' is not set!\n");
            }
            // check our type
            switch (strtolower($typeString)) {
                case 'numeric':
                    if (!is_numeric($data->$propertyName)) {
                        throw new Exception("Property '".$propertyName."' is not of the correct type: ".$theTypeOfThePropertyIsNumeric."!\n");
                    }
                    break;
            }

        } else {
            throw new Exception("Response was not JSON\n" . $this->_response->getBody(true));
        }
    }

    /**
     * @Then /^I expect the response status code to be (\d+)$/
     */
    public function theResponseStatusCodeShouldBe($httpStatus)
    {
        if ((string)$this->_response->getStatusCode() !== $httpStatus) {
        	throw new \Exception('HTTP code does not match '.$httpStatus.
        		' (actual: '.$this->_response->getStatusCode().')');
        }
    }
    
    /**
     * @Then /^I record the "([^"]*)" parameter as UUID$/
     */
    public function IRecordTheParameterAsUUID($propertyName)
    {
    	$data = json_decode($this->_response->getBody(true),true);
        $keys = preg_split("/\//",$propertyName);

        if (!empty($data)) {
            foreach($keys as $key){
        		if (isset($data[$key])){
        			$data = $data[$key];
        		} else {
        			throw new Exception("Property '".$key."' is not set!\n".$this->_response);
        		}
        	} 
        	$this->_uuid = $data;  
        } else {
            throw new Exception("Response was not JSON\n" . $this->_response->getBody(true));
        }
    	
    }

     /**
     * @Then /^echo last response$/
     */
    public function echoLastResponse()
    {
        $this->printDebug(
            $this->_requestUrl."\n\n".
            $this->_response
        );
    }
}
