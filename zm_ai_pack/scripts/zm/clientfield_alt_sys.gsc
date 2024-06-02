#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\zombies\_zm_utility;
main()
{
	level thread on_player_connecting();
	if ( !isDefined( level.clientfield_alts ) )
	{
		level.clientfield_alts = [];
	}
	initialize_clientfield_alt_storage_for_level();

}

init()
{
	keys = getarraykeys( level.clientfield_alts );
	for ( i = 0; isdefined(keys) && i < keys.size; i++ )
	{
		if ( keys[ i ] == "toplayer" )
		{
			continue;
		}
		if(isdefined(level.clientfield_alts))
		{
			fields = level.clientfield_alts[ keys[ i ] ];
			for ( j = 0; isdefined(fields) && j < fields.size; j++ )
			{
				initialize_clientfield_alt_storage_for_level( fields[ j ] );
				level thread send_clientdvar_messages_allplayers( fields[ j ] );
			}
		}

	}
}

on_player_connecting()
{
	for (;;)
	{
		level waittill( "connecting", player );
		if(isdefined(level.clientfield_alts) && isdefined(player))
		{
			fields = level.clientfield_alts[ "toplayer" ];
			for ( i = 0; isdefined(fields) && isdefined(player) && i < fields.size; i++ )
			{
				player initialize_clientfield_alt_storage_for_player( fields[ i ] );
				player send_clientdvar_messages_toplayer( fields[ i ] );
			}
		}

	}
}

set_clientfield_alt_toplayer( field_name, ent, value )
{
	entnum = ent getEntityNumber();
	if(!isdefined(self.clientfield_alt_storage[ field_name ]))
	{
		self.clientfield_alt_storage[ field_name ]= "";
	}
	self.clientfield_alt_storage[ field_name ] += entnum + " " + value + "|";
}

send_clientdvar_messages_toplayer( field_name )
{
	self endon( "disconnect" );
	for (;;)
	{
		wait 0.05;

		if ( self.clientfield_alt_storage[ field_name ] == "" )
		{
			continue;
		}
		self setclientdvar( field_name, self.clientfield_alt_storage[ field_name ] );
		self.clientfield_alt_storage[ field_name ] = "";
	}
}

set_clientfield_alt_allplayers( field_name, ent, value )
{
	shouldReturn=false;
	if(!isdefined(ent))
	{
		print("^2set_clientfield_alt_allplayers: ent not defined");
		shouldReturn=true;
	}
	if(!isdefined(field_name))
	{
		print("^2set_clientfield_alt_allplayers: field_name not defined");
		shouldReturn=true;
	}
	if(!isdefined(value))
	{
		print("^2set_clientfield_alt_allplayers: value not defined");
		shouldReturn=true;
	}
	if(is_true(shouldReturn))
	{
		print("^2set_clientfield_alt_allplayers: shouldReturn is true");
		return;
	}
	entnum = ent getEntityNumber();
	if(!isdefined(level.clientfield_alt_storage[ field_name ]))
	{
		level.clientfield_alt_storage[ field_name ]= "";
	}
	level.clientfield_alt_storage[ field_name ] += entnum + " " + value + "|";
}

send_clientdvar_messages_allplayers( field_name )
{
	for (;;)
	{
		wait 0.05;

		if (isdefined(field_name) && isdefined(level.clientfield_alt_storage) && isdefined(level.clientfield_alt_storage[ field_name ]) && level.clientfield_alt_storage[ field_name ] == "" )
		{
			continue;
		}
		for ( i = 0; isdefined(field_name) && isdefined(level.clientfield_alt_storage[ field_name ]) && isdefined(level.players) && i < level.players.size; i++ )
		{
			level.players[ i ] setclientdvar( field_name, level.clientfield_alt_storage[ field_name ] );
		}
		if(isdefined(field_name) )
		{
			level.clientfield_alt_storage[ field_name ] = "";

		}
	}
}

initialize_clientfield_alt_storage_for_player( field_name )
{
	if ( !isdefined( self.clientfield_alt_storage ) )
	{
		self.clientfield_alt_storage = [];
	}
	if(isdefined(field_name)) {
		self.clientfield_alt_storage[ field_name ] = "";

	}
}

initialize_clientfield_alt_storage_for_level( field_name )
{
	if ( !isdefined( level.clientfield_alt_storage ) )
	{
		level.clientfield_alt_storage = [];
	}
	if(isdefined(field_name))
	{
		level.clientfield_alt_storage[ field_name ] = "";
	}
}

register_clientfield_alt( field_type, field_name )
{
	if ( !isDefined( level.clientfield_alts ) )
	{
		level.clientfield_alts = [];
	}
	if(isdefined(field_type))
	{
		if ( !isDefined( level.clientfield_alts[ field_type ] ) )
		{
			level.clientfield_alts[ field_type ] = [];
		}

		level.clientfield_alts[ field_type ][ level.clientfield_alts[ field_type ].size ] = field_name;
	}

}