#include clientscripts\mp\zombies\_zm_ai_avogadro;
#include clientscripts\mp\zombies\_zm_ai_screecher;
//#include clientscripts\mp\zombies\_zm_ai_ghost;
#include clientscripts\mp\zombies\_zm_ai_brutus;
#include clientscripts\mp\zombies\_zm_ai_mechz;
#include clientscripts\mp\_utility;
#include clientscripts\mp\zombies\_zm_weapons;
#include clientscripts\mp\zombies\_zm_utility;
#include clientscripts\mp\zombies\_zm;
#include clientscripts\mp\zombies\_zm_game_mode_objects;
main()
{
	replaceFunc( clientscripts\mp\_visionset_mgr::init, ::visionset_mgr_init_override );
	level.script = toLower( getDvar( "mapname" ) );
	level.gametype = toLower( getDvar( "g_gametype" ) );

	level.ai_data = [];
	// level.ai_data[ "avogadro" ] = spawnStruct();
	// level.ai_data[ "avogadro" ].main = clientscripts\mp\zombies\_zm_ai_avogadro::main;
	// level.ai_data[ "avogadro" ].should_execute = !( level.script == "zm_transit" && level.gametype == "zclassic" );
	// level.ai_data[ "screecher" ] = spawnStruct();
	// level.ai_data[ "screecher" ].main = clientscripts\mp\zombies\_zm_ai_screecher::main;
	// level.ai_data[ "screecher" ].should_execute = !( level.script == "zm_transit" && level.gametype == "zclassic" );
	level.ai_data[ "ghost" ] = spawnStruct();
	level.ai_data[ "ghost" ].main = clientscripts\mp\zombies\_zm_ai_ghost::main;
	level.ai_data[ "ghost" ].should_execute = !( level.script == "zm_buried" && level.gametype == "zclassic" );
	level.ai_data[ "brutus" ] = spawnStruct();
	level.ai_data[ "brutus" ].main = clientscripts\mp\zombies\_zm_ai_brutus::main;
	level.ai_data[ "brutus" ].should_execute = level.script != "zm_prison";
	level.ai_data[ "mechz" ] = spawnStruct();
	level.ai_data[ "mechz" ].main = clientscripts\mp\zombies\_zm_ai_mechz::main;
	level.ai_data[ "mechz" ].should_execute = level.script != "zm_tomb";

	keys = getArrayKeys( level.ai_data );
	for ( i = 0; i < keys.size; i++ )
	{
		if ( isDefined( level.ai_data[ keys[ i ] ].main ) && isDefined( level.ai_data[ keys[ i ] ].should_execute ) 
			&& level.ai_data[ keys[ i ] ].should_execute )
		{
			level [[ level.ai_data[ keys[ i ] ].main ]]();
		}
	}
	level thread fog_start_monitor();
    level thread fog_stop_monitor();
}

init()
{
}

add_visionset_callback( func )
{
	if ( !isDefined( level.visionset_mgr_callbacks ) )
	{
		level.visionset_mgr_callbacks = [];
	}
	level.visionset_mgr_callbacks[ level.visionset_mgr_callbacks.size ] = func;
}

run_visionset_callbacks()
{
	if ( !isDefined( level.visionset_mgr_callbacks ) )
	{
		return;
	}
	for ( i = 0; i < level.visionset_mgr_callbacks.size; i++ )
	{
		[[ level.visionset_mgr_callbacks[ i ] ]]();
	}
}

visionset_mgr_init_override()
{
	if ( isDefined( level.createfx_enabled ) && level.createfx_enabled )
		return;

	level.vsmgr_initializing = 1;
	level.vsmgr_default_info_name = "none";
	level.vsmgr = [];
	level.vsmgr_states_inited = [];
	level.vsmgr_filter_custom_enable = [];
	level thread clientscripts\mp\_visionset_mgr::register_type( "visionset", clientscripts\mp\_visionset_mgr::visionset_slot_cb, clientscripts\mp\_visionset_mgr::visionset_lerp_cb, clientscripts\mp\_visionset_mgr::visionset_update_cb );
	clientscripts\mp\_visionset_mgr::vsmgr_register_visionset_info( level.vsmgr_default_info_name, 1, 1, "undefined", "undefined" );
	level thread clientscripts\mp\_visionset_mgr::register_type( "overlay", clientscripts\mp\_visionset_mgr::overlay_slot_cb, clientscripts\mp\_visionset_mgr::overlay_lerp_cb, clientscripts\mp\_visionset_mgr::overlay_update_cb );
	clientscripts\mp\_visionset_mgr::vsmgr_register_overlay_info_style_none( level.vsmgr_default_info_name, 1, 1 );
	level.vsmgr_is_type_currently_default_func = clientscripts\mp\_visionset_mgr::vsmgr_is_type_currently_default;
	[[ level.on_finalize_initialization_callback ]]( clientscripts\mp\_visionset_mgr::finalize_clientfields );
	level thread clientscripts\mp\_visionset_mgr::monitor();
	run_visionset_callbacks();
}



fog_start_monitor()
{
    while ( true )
    {
        level waittill( "fog_start" );
        players = getlocalplayers();

        for ( i = 0; i < players.size; i++ )
            setworldfogactivebank( i, 2 );
    }
}

fog_stop_monitor()
{
    while ( true )
    {
        level waittill( "fog_stop" );

        if ( !isdefined( level.current_fog ) )
            level.current_fog = 8;

        players = getlocalplayers();

        for ( i = 0; i < players.size; i++ )
            setworldfogactivebank( i, level.current_fog );
    }
}