Feature: Owner Login

Scenario Outline: o3.Success to login an owner
	Given I login an owner with values 
	"""
	{
  	"email": "<email>",
  	"password": "<password>"
	}
	"""
	Then the login owner status code should be "200"

	Examples:
	| email            | password   |
	| user@outllok.com | Lalala123* |
	
Scenario Outline: o4.Failed to login with an invalid owner
	Given I login an owner with values 
	"""
	{
  	"email": "<email>",
  	"password": "<password>"
	}
	"""
	Then the login owner status code should be "403"

	Examples:
	| email         | password |
	| test@test.com | Test123* |