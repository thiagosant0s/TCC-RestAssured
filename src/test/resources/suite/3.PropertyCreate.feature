Feature: Property Create

Background:
	Given I login an owner with values 
	"""
	{
  	"email": "user@outlook.com",
  	"password": "Password123*"
	}
	"""

Scenario Outline: p0.Success to create a property
	When I create a property with values 
	"""
	{
  	"type": "<type>",
		"availableTo": "<avaliableTo>",
		"price": "<price>",
		"condominium": "<condominium>",
		"iptu": "<iptu>",
		"cep": "<cep>",
		"state": "<state>",
		"city": "<city>",
		"neighborhood": "<neighborhood>",
		"street": "<street>",
		"number": "<number>",
		"complement": "<complement>",
		"description": "<description>",
		"dimensions": "<dimensions>",
		"numberOfBedrooms": "<numberOfBedrooms>",
		"numberOfBathrooms": "<numberOfBathrooms>",
		"numberOfParkingSpaces": "<numberOfParkingSpaces>",
		"images": [
			"<images>"
		],
		"additionalInformation": "<additionalInformation>"
	}
	"""
	Then the create property status code should be "200"
	And the property type should be "<type>"
	And the property price should be "<price>"
	And the property iptu should be "<iptu>"
	And the property cep should be "<cep>"
	And the property state should be "<state>"

	Examples:
	| type  | avaliableTo | price  | condominium | iptu 	| cep 			| state | city       | neighborhood 	 | street 			 | number | complement | description | dimensions | numberOfBedrooms | numberOfBathrooms | numberOfParkingSpaces | images 		 | additionalInformation       |
	| House | Rent        | 890.00 | 65.00       | 200.00 | 37540-000 | MG    | Santa Rita | Familia Andrade | Jayme Rezende | 60     | APTO 302   | Cozy House  | 15m²       | 4                | 2                 | 1                     | string.jpeg | Near the business incubator | 
	
Scenario Outline: p1.Failed to create a propertie with an invalid CEP
	When I create a property with values 
	"""
	{
  	"type": "<type>",
		"availableTo": "<avaliableTo>",
		"price": "<price>",
		"condominium": "<condominium>",
		"iptu": "<iptu>",
		"cep": "<cep>",
		"state": "<state>",
		"city": "<city>",
		"neighborhood": "<neighborhood>",
		"street": "<street>",
		"number": "<number>",
		"complement": "<complement>",
		"description": "<description>",
		"dimensions": "<dimensions>",
		"numberOfBedrooms": "<numberOfBedrooms>",
		"numberOfBathrooms": "<numberOfBathrooms>",
		"numberOfParkingSpaces": "<numberOfParkingSpaces>",
		"images": [
			"<images>"
		],
		"additionalInformation": "<additionalInformation>"
	}
	"""
	Then the create property status code should be "400"

	Examples:
	| type  | avaliableTo | price  | condominium | iptu 	| cep 			| state | city       | neighborhood 	 | street 			 | number | complement | description | dimensions | numberOfBedrooms | numberOfBathrooms | numberOfParkingSpaces | images 		 | additionalInformation       |
	| House | Rent        | 890.00 | 65.00       | 200.00 | 99999-999 | MG    | Santa Rita | Familia Andrade | Jayme Rezende | 60     | APTO 302   | Cozy House  | 15m²       | 4                | 2                 | 1                     | string.jpeg | Near the business incubator |     