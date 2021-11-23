Feature: Owner Create

Scenario Outline: o0.Success to create an owner
	Given I create an owner with values 
	"""
	{
  	"name": "<name>",
		"email": "<email>",
		"emailConfirmation": "<emailConfirmation>",
		"cpf": "<cpf>",
		"phoneNumber": "<phoneNumber>",
		"password": "<password>",
		"passwordConfirmation": "<passwordConfirmation>",
		"cep": "<cep>",
		"state": "<state>",
		"city": "<city>",
		"neighborhood": "<neighborhood>",
		"street": "<street>",
		"number": "<number>",
		"complement": "<complement>"
	}	
	"""	
	Then the create owner status code should be "200"
	And the owner name should be "<name>"

	Examples:
		| name  | email 			  	 | emailConfirmation | cpf     			  | phoneNumber   | password     | passwordConfirmation | cep       | state  | city         | neighborhood    | street        | number | complement |
	  | user  | user@outlook.com | user@outlook.com  | 613.033.060-00 | (35)992712434 | Password123* | Password123*         | 37540-000 | MG 	  | Santa Rita 	 | Familia Andrade | Jayme Rezende | 60 		| APTO 302 	 |
	  
Scenario Outline: o1.Failed to create an owner with an invalid CPF
	Given I create an owner with values 
	"""
	{
  	"name": "<name>",
		"email": "<email>",
		"emailConfirmation": "<emailConfirmation>",
		"cpf": "<cpf>",
		"phoneNumber": "<phoneNumber>",
		"password": "<password>",
		"passwordConfirmation": "<passwordConfirmation>",
		"cep": "<cep>",
		"state": "<state>",
		"city": "<city>",
		"neighborhood": "<neighborhood>",
		"street": "<street>",
		"number": "<number>",
		"complement": "<complement>"
	}	
	"""	
	Then the create owner status code should be "400"

	Examples:
		| name  | email 			  	 | emailConfirmation | cpf     			  | phoneNumber   | password     | passwordConfirmation | cep       | state  | city         | neighborhood    | street        | number | complement |
	  | user  | user@outlook.com | user@outlook.com  | 999.999.999-99 | (35)992712434 | Password123* | Password123*         | 37540-000 | MG 	  | Santa Rita 	 | Familia Andrade | Jayme Rezende | 60 		| APTO 302 	 |
	  
Scenario Outline: o2.Failed to create an owner with an invalid CEP
	Given I create an owner with values 
	"""
	{
  	"name": "<name>",
		"email": "<email>",
		"emailConfirmation": "<emailConfirmation>",
		"cpf": "<cpf>",
		"phoneNumber": "<phoneNumber>",
		"password": "<password>",
		"passwordConfirmation": "<passwordConfirmation>",
		"cep": "<cep>",
		"state": "<state>",
		"city": "<city>",
		"neighborhood": "<neighborhood>",
		"street": "<street>",
		"number": "<number>",
		"complement": "<complement>"
	}	
	"""	
	Then the create owner status code should be "400"

	Examples:
		| name  | email 			  	 | emailConfirmation | cpf     			  | phoneNumber   | password     | passwordConfirmation | cep       | state  | city         | neighborhood    | street        | number | complement |
	  | user  | user@outlook.com | user@outlook.com  | 613.033.060-00 | (35)992712434 | Password123* | Password123*         | 99999-999 | MG 	  | Santa Rita 	 | Familia Andrade | Jayme Rezende | 60 		| APTO 302 	 |