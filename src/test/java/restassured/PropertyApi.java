package restassured;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import runner.Context;

public class PropertyApi extends RestAssured
{
	private static final String ENDPOINT_CREATE = "https://imobiliaria-digital-api.herokuapp.com/api/owners/properties/add";
	private static final String ENDPOINT_READ = "https://imobiliaria-digital-api.herokuapp.com/api/owners/properties/";
	private static final String ENDPOINT_UPDATE = "https://imobiliaria-digital-api.herokuapp.com/api/owners/properties/";
	private static final String ENDPOINT_DELETE = "https://imobiliaria-digital-api.herokuapp.com/api/owners/properties/";
	
	@When( "I create a property with values$" )
	public void create( String payload )
	{
		Context context = Context.getInstance( );
		
		super.post( PropertyApi.ENDPOINT_CREATE, payload, Context.getInstance( ).read( "Login", "accessToken" ) );
		
		context.save( "Property", "id", super.response.jsonPath( ).getString( "id" ) );
	}
	
	@And( "I read a property$" )
	public void read( )
	{
		super.get( PropertyApi.ENDPOINT_READ + Context.getInstance( ).read( "Property", "id" ), Context.getInstance( ).read( "Login", "accessToken" ) );
	}
	
	@And( "I read a property without performing the login validation$" )
	public void readInvalidtoken( )
	{	
		super.get( PropertyApi.ENDPOINT_READ + Context.getInstance( ).read( "Property", "id" ), "" );
	}
	
	@And( "I read an invalid property$" )
	public void readInvalidId( )
	{
		super.get( PropertyApi.ENDPOINT_READ + "99999", Context.getInstance( ).read( "Login", "accessToken" ) );
	}
	
	@And( "I update a property with values$" )
	public void update( String payload )
	{
		super.put( PropertyApi.ENDPOINT_UPDATE + Context.getInstance( ).read( "Property", "id" ), payload, Context.getInstance( ).read( "Login", "accessToken" ) );
	}
	
	@And( "I update an invalid property with values$" )
	public void updateInvalid( String payload )
	{
		super.put( PropertyApi.ENDPOINT_UPDATE + "99999", payload, Context.getInstance( ).read( "Login", "accessToken" ) );
	}
	
	@And( "I delete a property$" )
	public void delete( )
	{
		super.delete( PropertyApi.ENDPOINT_DELETE + Context.getInstance( ).read( "Property", "id" ), Context.getInstance( ).read( "Login", "accessToken" ) );
	}
	
	@And( "I delete an invalid property$" )
	public void deleteInvalid( )
	{
		super.delete( PropertyApi.ENDPOINT_UPDATE + "99999", Context.getInstance( ).read( "Login", "accessToken" ) );
	}
	
	@Then( "the create property status code should be \"([^\"]*)\"$" )
	public void validateCreateStatusCode( int statusCode )
	{
		org.junit.Assert.assertEquals( statusCode, super.response.getStatusCode( ) );
	}
	
	@Then( "the read property status code should be \"([^\"]*)\"$" )
	public void validateReadStatusCode( int statusCode )
	{
		org.junit.Assert.assertEquals( statusCode, super.response.getStatusCode( ) );
	}
	
	@Then( "the update property status code should be \"([^\"]*)\"$" )
	public void validateUpdateStatusCode( int statusCode )
	{
		org.junit.Assert.assertEquals( statusCode, super.response.getStatusCode( ) );
	}
	
	@Then( "the delete property status code should be \"([^\"]*)\"$" )
	public void validateDeleteStatusCode( int statusCode )
	{
		org.junit.Assert.assertEquals( statusCode, super.response.getStatusCode( ) );
	}
	
	@And( "the property type should be \"([^\"]*)\"$" )
	public void validateType( String propertyType )
	{
		org.junit.Assert.assertEquals( propertyType, super.response.jsonPath( ).getString( "type" ) );
	}
	
	@And( "the property price should be \"([^\"]*)\"$" )
	public void validatePrice( String propertyPrice )
	{
		org.junit.Assert.assertEquals( propertyPrice, super.response.jsonPath( ).getString( "price" ) );
	}
	
	@And( "the property iptu should be \"([^\"]*)\"$" )
	public void validateIptu( String propertyIptu )
	{
		org.junit.Assert.assertEquals( propertyIptu, super.response.jsonPath( ).getString( "iptu" ) );
	}
	
	@And( "the property cep should be \"([^\"]*)\"$" )
	public void validateCep( String propertyCep )
	{
		org.junit.Assert.assertEquals( propertyCep, super.response.jsonPath( ).getString( "address.cep" ) );
	}
	
	@And( "the property state should be \"([^\"]*)\"$" )
	public void validateState( String propertyState )
	{
		org.junit.Assert.assertEquals( propertyState, super.response.jsonPath( ).getString( "address.state" ) );
	}
}