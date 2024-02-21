// T6 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool
#include clientscripts\mp\_utility;
#include clientscripts\mp\zombies\_zm_utility;

precache()
{

}

#using_animtree("zm_buried_ghost");

init_animtree()
{
	if ( getDvar( "mapname" ) != "zm_buried" )
	{
		wait 0.1;
	}
	scriptmodelsuseanimtree( #animtree );
}

precache_fx()
{
	if ( !isdefined( level.ghost_effects ) )
	{
		level.ghost_effects = [];
		level.ghost_effects[1] = loadfx( "maps/zombie_buried/fx_buried_ghost_death" );
		level.ghost_effects[2] = loadfx( "maps/zombie_buried/fx_buried_ghost_drain" );
		level.ghost_effects[3] = loadfx( "maps/zombie_buried/fx_buried_ghost_spawn" );
		level.ghost_effects[4] = loadfx( "maps/zombie_buried/fx_buried_ghost_trail" );
		level.ghost_effects[5] = loadfx( "maps/zombie_buried/fx_buried_ghost_evaporation" );
		level.ghost_impact_effects[1] = loadfx( "maps/zombie_buried/fx_buried_ghost_impact" );
	}
}

init()
{
	register_client_fields();
}

main()
{
	precache_fx();
	register_client_fields();
	level thread init_animtree();
}

register_client_fields()
{
	registerclientfield( "actor", "ghost_impact_fx", 12000, 1, "int", ::play_impact_fx_clientfield_cb, 0 );
	registerclientfield( "actor", "ghost_fx", 12000, 3, "int", ::play_fx_clientfield_cb, 0 );
	registerclientfield( "actor", "sndGhostAudio", 12000, 3, "int", ::sndghostaudio, 0 );
	registerclientfield( "scriptmover", "ghost_fx", 12000, 3, "int", ::play_fx_clientfield_cb, 0 );
	registerclientfield( "scriptmover", "sndGhostAudio", 12000, 3, "int", ::sndghostaudio, 0 );
	registerclientfield( "world", "ghost_round_light_state", 12000, 1, "int", ::ghost_round_presentation_light_state_cb, 1 );
}

play_impact_fx_clientfield_cb( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
	if ( !isdefined( newval ) )
		return;

	if ( newval > 0 )
		self thread play_impact_fx_internal( localclientnum, newval );
}

play_impact_fx_internal( localclientnum, newval )
{
	self endon( "entityshutdown" );
	self waittill_dobj( localclientnum );
	effect = level.ghost_impact_effects[newval];

	if ( isdefined( effect ) )
		playfx( localclientnum, effect, self.origin + vectorscale( ( 0, 0, 1 ), 36.0 ) );
}

play_fx_clientfield_cb( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
	if ( !isdefined( newval ) )
		return;

	if ( newval > 0 )
		self play_fx( localclientnum, newval );
	else if ( isdefined( self._fx_array ) && isdefined( self._fx_array[localclientnum] ) )
		deletefx( localclientnum, self._fx_array[localclientnum], 0 );
}

play_fx( localclientnum, newval )
{
	self thread play_fx_internal( localclientnum, newval );
}

play_fx_internal( localclientnum, newval )
{
	self endon( "entityshutdown" );
	self waittill_dobj( localclientnum );

	if ( !isdefined( self._fx_array ) )
		self._fx_array = [];

	linktag = "tag_origin";
	effect = level.ghost_effects[newval];

	if ( isdefined( self._fx_tag_override ) )
		linktag = self._fx_tag_override;

	if ( isdefined( self._fx_array[localclientnum] ) )
		deletefx( localclientnum, self._fx_array[localclientnum], 0 );

	if ( newval == 1 )
		self notify( "sndDeath" );

	if ( newval == 1 || newval == 5 )
		self._fx_array[localclientnum] = playfx( localclientnum, effect, self.origin );
	else
		self._fx_array[localclientnum] = playfxontag( localclientnum, effect, self, linktag );
}

ghost_round_presentation_light_state_cb( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
	if ( !isdefined( newval ) )
		return;

	if ( newval == 1 )
	{
		if ( !is_true( level.ghost_round_presentation_light_flicker_on ) )
		{
			level notify( "ghost_round_flicker" );
			level.ghost_round_presentation_light_flicker_on = 1;
		}
	}
	else if ( is_true( level.ghost_round_presentation_light_flicker_on ) )
	{
		level notify( "ghost_round_flicker" );
		level.ghost_round_presentation_light_flicker_on = 0;
	}
}

sndghostaudio( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
	if ( !isdefined( self.sndent ) )
	{
		self.sndent = spawn( 0, self.origin, "script_origin" );
		self.sndent linkto( self );
		self thread sndghostaudiodeleteent( self.sndent );
	}

	if ( newval == 1 )
	{
		self playsound( 0, "zmb_ai_ghost_apparate" );
		self.sndent playloopsound( "zmb_ai_ghost_loop", 1 );
	}
	else
	{
		self playsound( 0, "zmb_ai_ghost_disapparate" );
		self.sndent playloopsound( "zmb_ai_ghost_loop", 1 );
	}
}

sndghostaudiodeleteent( ent )
{
	self waittill_any( "death", "entityshutdown", "sndDeath" );
	ent delete();
}

sndghostattackaudio()
{
	if ( !isdefined( self.sndattackent ) )
	{
		self.sndattackent = spawn( 0, self.origin, "script_origin" );
		self.sndattackent linkto( self );
		self thread sndghostattackaudiodeleteent( self.sndattackent );
	}

	self.sndattackent playloopsound( "zmb_ai_ghost_attack_loop", 0.1 );
}

sndghostattackaudiodeleteent( ent )
{
	self endon( "sndDoneAttacking" );
	self waittill_any( "death", "entityshutdown" );
	ent delete();
}