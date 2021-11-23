package restassured;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import runner.Context;

public class OwnerApi extends RestAssured
{
	public static final String ENDPOINT_LOGIN = "https://imobiliaria-digital-api.herokuapp.com/api/owners/login";
	public static final String ENDPOINT_CREATE = "https://imobiliaria-digital-api.herokuapp.com/api/owners/register";

	@When( "I login an owner with values$" )
	public void login( String payload )
	{
		Context context = Context.getInstance( );

		super.post( OwnerApi.ENDPOINT_LOGIN, payload, "" );

		context.save( "Login", "accessToken", super.response.jsonPath( ).getString( "accessToken" ) );
	}
	
	@When( "I create an owner with values$" )
	public void create( String payload )
	{
		super.post( OwnerApi.ENDPOINT_CREATE, payload, "" );
	}
	
	@Then( "the login owner status code should be \"([^\"]*)\"$" )
	public void validateLoginStatusCode( int statusCode )
	{
		org.junit.Assert.assertEquals( statusCode, super.response.getStatusCode( ) );
	}
	
	@And( "the create owner status code should be \"([^\"]*)\"$" )
	public void validateCreateStatusCode( int statusCode )
	{
		org.junit.Assert.assertEquals( statusCode, super.response.getStatusCode( ) );
	}
	
	@And( "the owner name should be \"([^\"]*)\"$" )
	public void validateName( String statusCode )
	{
		org.junit.Assert.assertEquals( statusCode, super.response.jsonPath( ).getString( "name" ) );
	}
}