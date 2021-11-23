package runner;

import java.util.HashMap;

public class Context
{
	private static Context instance = null;

	private HashMap< String, String > map = new HashMap< >( );

	private Context( ) { }

	public static synchronized Context getInstance( )
	{
		if( Context.instance == null )
			Context.instance = new Context( );

		return Context.instance;
	}

	public void save( String contextName, String key, String value )
	{
		this.map.put( contextName + "->" + key, value == null ? "" : value );
	}

	public String read( String contextName, String key )
	{
		return this.map.get( contextName + "->" + key );
	}

	public void reset( )
	{
		this.map.clear( );
	}
}