Feature: Property Update

Background:
	Given I login an owner with values 
	"""
	{
  	"email": "user@outlook.com",
  	"password": "Password123*"
	}
	"""

Scenario Outline: p5.Success to update a property (by id)
	When I create a property with values 
	"""
	{
  	"type": "House",
		"availableTo": "Rent",
		"price": "890.00",
		"condominium": "65.50",
		"iptu": "200.00",
		"cep": "37540-000",
		"state": "MG",
		"city": "Santa Rita do Sapucai",
		"neighborhood": "Familia Andrade",
		"street": "Jayme Rezende",
		"number": "60",
		"complement": "APTO 302",
		"description": "Cozy house",
		"dimensions": "15m²",
		"numberOfBedrooms": "4",
		"numberOfBathrooms": "2",
		"numberOfParkingSpaces": "2",
		"images": [
			"string.jpeg"
		],
		"additionalInformation": "Near the business incubator"
		}
	"""
	And I update a property with values 
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
	Then the update property status code should be "200"
	And the property type should be "<type>"
	And the property price should be "<price>"
	And the property iptu should be "<iptu>"
	And the property cep should be "<cep>"
	And the property state should be "<state>"

	Examples:
	| type  		 | avaliableTo | price   | condominium | iptu 	| cep 			| state | city       | neighborhood 	 | street 			 | number | complement | description 		 | dimensions | numberOfBedrooms | numberOfBathrooms | numberOfParkingSpaces | images 		 | additionalInformation       |
	| Apartament | Sell        | 1200.00 | 100.00      | 260.00 | 37500-002 | MG    | Santa Rita | Familia Andrade | Jayme Rezende | 60     | APTO 100   | Cozy Apartament | 10m²       | 2                | 1                 | 1                     | string.jpeg | Near the business incubator |
	
Scenario Outline: p6.Failed to update a property by an invalid id
	And I update an invalid property with values 
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
	Then the update property status code should be "400"

	Examples:
	| type  		 | avaliableTo | price   | condominium | iptu 	| cep 			| state | city       | neighborhood 	 | street 			 | number | complement | description 		 | dimensions | numberOfBedrooms | numberOfBathrooms | numberOfParkingSpaces | images 		 | additionalInformation       |
	| Apartament | Sell        | 1200.00 | 100.00      | 260.00 | 37500-002 | MG    | Santa Rita | Familia Andrade | Jayme Rezende | 60     | APTO 100   | Cozy Apartament | 10m²       | 2                | 1                 | 1                     | string.jpeg | Near the business incubator |      
	
Scenario Outline: p7.Failed to update a property with invalid CEP (by id)
	When I create a property with values 
	"""
	{
  	"type": "House",
		"availableTo": "Rent",
		"price": "890.00",
		"condominium": "65.50",
		"iptu": "200.00",
		"cep": "37540-000",
		"state": "MG",
		"city": "Santa Rita do Sapucai",
		"neighborhood": "Familia Andrade",
		"street": "Jayme Rezende",
		"number": "60",
		"complement": "APTO 302",
		"description": "Cozy house",
		"dimensions": "15m²",
		"numberOfBedrooms": "4",
		"numberOfBathrooms": "2",
		"numberOfParkingSpaces": "2",
		"images": [
			"string.jpeg"
		],
		"additionalInformation": "Near the business incubator"
		}
	"""
	And I update a property with values 
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
	Then the update property status code should be "400"

	Examples:
	| type  		 | avaliableTo | price   | condominium | iptu 	| cep 			| state | city       | neighborhood 	 | street 			 | number | complement | description 		 | dimensions | numberOfBedrooms | numberOfBathrooms | numberOfParkingSpaces | images 		 | additionalInformation       |
	| Apartament | Sell        | 1200.00 | 100.00      | 260.00 | 99999-999 | MG    | Santa Rita | Familia Andrade | Jayme Rezende | 60     | APTO 100   | Cozy Apartament | 10m²       | 2                | 1                 | 1                     | string.jpeg | Near the business incubator |