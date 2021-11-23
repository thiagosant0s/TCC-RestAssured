package restassured;

import io.restassured.response.Response;
import net.serenitybdd.rest.SerenityRest;

public class RestAssured
{
	protected Response response;

	protected Response post( String endpoint, String payload, String accessToken )
	{
		this.response = SerenityRest
			.given( ).contentType( "application/json" ).header( "x-access-token", accessToken ).body( payload )
			.when( ).post( endpoint )
			.then( ).extract( ).response( )
		;

		return this.response;
	}
	
	protected Response get( String endpoint, String accessToken )
	{
		this.response = SerenityRest
			.given( ).contentType( "application/json" ).header( "x-access-token", accessToken )
			.when( ).get( endpoint )
			.then( ).extract( ).response( )
		;
		
		return this.response;
	}

	protected Response put( String endpoint, String payload, String accessToken )
	{
		this.response = SerenityRest
		    .given( ).contentType( "application/json" ).header( "x-access-token", accessToken ).body( payload )
		    .when( ).put( endpoint )
		    .then( ).extract( ).response( )
		;

		return response;
	}

	protected Response delete( String endpoint, String accessToken )
	{
		this.response = SerenityRest
			.given( ).contentType( "application/json" ).header( "x-access-token", accessToken )
			.when( ).delete( endpoint )
			.then( ).extract( ).response( )
		;

		return this.response;
	}
}