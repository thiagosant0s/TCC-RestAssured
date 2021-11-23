@Test
Feature: Property Delete

Background:
	Given I login an owner with values 
	"""
	{
  	"email": "user@outlook.com",
  	"password": "Password123*"
	}
	"""

Scenario: p8.Success to delete a property (by id)
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
	And I delete a property 
	Then the delete property status code should be "204"

Scenario: p9.Failed to delete a property with an invalid id (by id)
	And I delete an invalid property 
	Then the delete property status code should be "400"