Feature: Property Read

Background: 
	Given I login an owner with values 
	"""
	{
  	"email": "user@outlook.com",
  	"password": "Password123*"
	}
	"""
	
Scenario: p2.Success to read a property (by id)
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
	And I read a property 
	Then the read property status code should be "200"
	And the property type should be "House"
	And the property price should be "890.00"
	And the property iptu should be "200.00"
	And the property cep should be "37540-000"
	And the property state should be "MG"

Scenario: p3.Failed to read a property by an invalid id
	And I read an invalid property 
	Then the read property status code should be "400"
	
Scenario: p4.Failed to read a property without performing the login validation (by id)
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
	And I read a property without performing the login validation
	Then the read property status code should be "401"