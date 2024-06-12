#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\zombies\_zm_utility;
#include scripts\zm\clientfield_alt_sys;
#include maps\mp\zombies\_zm_sidequests;
#include maps\mp\zm_tomb_ee_main;
#include maps\mp\zombies\_zm_ai_mechz;
#include maps\mp\zombies\_zm_ai_mechz_dev;
#include maps\mp\zombies\_zm_ai_mechz_claw;
#include maps\mp\zombies\_zm_ai_mechz_ft;
#include maps\mp\zombies\_zm_ai_mechz_booster;
#include maps\mp\zm_tomb_vo;
#include maps\mp\zombies\_zm_ai_mechz_ffotd;
#include maps\mp\zombies\_zm_spawner;
#include maps\mp\zombies\_zm_powerups;
#include maps\mp\animscripts\zm_shared;



#include maps\mp\zombies\_zm_score;
#include maps\mp\zombies\_zm_laststand;
#include maps\mp\animscripts\zm_death;
#include maps\mp\animscripts\zm_utility;
#include maps\mp\gametypes_zm\_hud_util;
#include maps\mp\gametypes_zm\_hud;
#include maps\mp\zombies\_zm_net;
#include maps\mp\zm_tomb_giant_robot_ffotd;
#include maps\mp\zombies\_zm_weap_one_inch_punch;
#include maps\mp\zm_tomb_teleporter;
#include maps\mp\zombies\_zm_zonemgr;
#include maps\mp\zombies\_zm_stats;
#include maps\mp\zombies\_zm_audio;
#include maps\mp\zombies\_zm_unitrigger;
#include maps\mp\zombies\_zm_clone;
#include maps\mp\zombies\_zm;
#include maps\mp\zm_tomb_giant_robot;


main()
{
	replacefunc(maps\mp\zm_tomb_ee_main_step_4::ee_mechz_do_jump, ::ee_mechz_do_jump_override);
	replacefunc(maps\mp\zm_tomb_giant_robot::activate_kill_trigger, ::activate_kill_trigger_override);

}
///// maps/mp/zombnies/_zm_equip_subwoofer.gsc replacements /////

ee_mechz_do_jump_override( s_spawn_pos )
{
	self endon( "death" );
	self endon( "kill_jump" );
	/#
	if ( getdvarint( #"_id_E7121222" ) > 0 )
		println( "\\nMZ: Doing Jump-Teleport\\n" );
#/
	/#
	if ( getdvarint( #"_id_E7121222" ) > 1 )
		println( "\\nMZ: Jump setting not interruptable\\n" );
#/
	self.not_interruptable = 1;
	self setfreecameralockonallowed( 0 );
	self animscripted( self.origin, self.angles, "zm_fly_out" );
	self maps\mp\animscripts\zm_shared::donotetracks( "jump_anim" );
	self ghost();

	if ( isdefined( self.m_claw ) )
		self.m_claw ghost();

	old_fx = self.fx_field;
	self thread maps\mp\zombies\_zm_spawner::zombie_eye_glow_stop();
	self fx_cleanup();
	self animscripted( self.origin, self.angles, "zm_fly_hover" );
	wait( level.mechz_jump_delay );
	s_landing_point = getstruct( s_spawn_pos.target, "targetname" );

	if ( !isdefined( s_landing_point.angles ) )
		s_landing_point.angles = ( 0, 0, 0 );

	self animscripted( s_landing_point.origin, s_landing_point.angles, "zm_fly_in" );
	self show();
	self.fx_field = old_fx;
	set_clientfield_alt_allplayers( "mechz_fx", self, self.fx_field );
	self thread maps\mp\zombies\_zm_spawner::zombie_eye_glow();

	if ( isdefined( self.m_claw ) )
		self.m_claw show();

	self maps\mp\animscripts\zm_shared::donotetracks( "jump_anim" );
	self.not_interruptable = 0;
	self setfreecameralockonallowed( 1 );
	/#
	if ( getdvarint( #"_id_E7121222" ) > 1 )
		println( "\\nMZ: Jump clearing not interruptable\\n" );
#/
	mechz_jump_cleanup();
	self.closest_jump_point = s_landing_point;
}

activate_kill_trigger_override( robot, foot_side )
{
	level endon( "stop_kill_trig_think" );

	if ( foot_side == "left" )
		str_foot_tag = "TAG_ATTACH_HATCH_LE";
	else if ( foot_side == "right" )
		str_foot_tag = "TAG_ATTACH_HATCH_RI";

	while ( robot ent_flag( "kill_trigger_active" ) )
	{
		a_zombies = getaispeciesarray( level.zombie_team, "all" );
		a_zombies_to_kill = [];

		foreach ( zombie in a_zombies )
		{
			if ( distancesquared( zombie.origin, self.origin ) < 360000 )
			{
				if ( isdefined( zombie.is_giant_robot ) && zombie.is_giant_robot )
					continue;

				if ( isdefined( zombie.marked_for_death ) && zombie.marked_for_death )
					continue;

				if ( isdefined( zombie.robot_stomped ) && zombie.robot_stomped )
					continue;

				if ( zombie istouching( self ) )
				{
					if ( isdefined( zombie.is_mechz ) && zombie.is_mechz )
					{
						zombie thread maps\mp\zombies\_zm_ai_mechz::mechz_robot_stomp_callback();
						continue;
					}
					else if(isdefined( zombie.is_brutus ) && zombie.is_brutus)
					{
						zombie thread maps\mp\zombies\_zm_ai_brutus::brutus_stomp_callback();
						continue;
					}

					zombie setgoalpos( zombie.origin );
					zombie.marked_for_death = 1;
					a_zombies_to_kill[a_zombies_to_kill.size] = zombie;
					continue;
				}

				if ( !( isdefined( zombie.is_mechz ) && zombie.is_mechz ) && ( isdefined( zombie.has_legs ) && zombie.has_legs ) && ( isdefined( zombie.completed_emerging_into_playable_area ) && zombie.completed_emerging_into_playable_area ) )
				{
					n_my_z = zombie.origin[2];
					v_giant_robot = robot gettagorigin( str_foot_tag );
					n_giant_robot_z = v_giant_robot[2];
					z_diff = abs( n_my_z - n_giant_robot_z );

					if ( z_diff <= 100 )
					{
						zombie.v_punched_from = self.origin;
						zombie animcustom( maps\mp\zombies\_zm_weap_one_inch_punch::knockdown_zombie_animate );
					}
				}
			}
		}

		if ( a_zombies_to_kill.size > 0 )
		{
			level thread zombie_stomp_death( robot, a_zombies_to_kill );
			robot thread zombie_stomped_by_gr_vo( foot_side );
		}

		if ( isdefined( level.maxis_quadrotor ) )
		{
			if ( level.maxis_quadrotor istouching( self ) )
				level.maxis_quadrotor thread quadrotor_stomp_death();
		}

		a_boxes = getentarray( "foot_box", "script_noteworthy" );

		foreach ( m_box in a_boxes )
		{
			if ( m_box istouching( self ) )
				m_box notify( "robot_foot_stomp" );
		}

		players = get_players();

		for ( i = 0; i < players.size; i++ )
		{
			if ( is_player_valid( players[i], 0, 1 ) )
			{
				if ( !players[i] istouching( self ) )
					continue;

				if ( players[i] is_in_giant_robot_footstep_safe_spot() )
					continue;

				if ( isdefined( players[i].in_giant_robot_head ) )
					continue;

				if ( isdefined( players[i].is_stomped ) && players[i].is_stomped )
					continue;

				if ( !level.gr_foot_hatch_closed[robot.giant_robot_id] && isdefined( robot.hatch_foot ) && ( isdefined( robot.b_has_hatch ) && robot.b_has_hatch ) && issubstr( self.targetname, robot.hatch_foot ) && !self player_is_in_laststand() )
				{
					players[i].ignoreme = 1;
					players[i].teleport_initial_origin = self.origin;

					if ( robot.giant_robot_id == 0 )
					{
						level thread maps\mp\zm_tomb_teleporter::stargate_teleport_player( "head_0_teleport_player", players[i], 4.0, 0 );
						players[i].in_giant_robot_head = 0;
					}
					else if ( robot.giant_robot_id == 1 )
					{
						level thread maps\mp\zm_tomb_teleporter::stargate_teleport_player( "head_1_teleport_player", players[i], 4.0, 0 );
						players[i].in_giant_robot_head = 1;

						if ( players[i] maps\mp\zombies\_zm_zonemgr::player_in_zone( "zone_bunker_4d" ) || players[i] maps\mp\zombies\_zm_zonemgr::player_in_zone( "zone_bunker_4c" ) )
							players[i].entered_foot_from_tank_bunker = 1;
					}
					else
					{
						level thread maps\mp\zm_tomb_teleporter::stargate_teleport_player( "head_2_teleport_player", players[i], 4.0, 0 );
						players[i].in_giant_robot_head = 2;
					}

					robot ent_flag_set( "robot_head_entered" );
					players[i] maps\mp\zombies\_zm_stats::increment_client_stat( "tomb_giant_robot_accessed", 0 );
					players[i] maps\mp\zombies\_zm_stats::increment_player_stat( "tomb_giant_robot_accessed" );
					players[i] playsoundtoplayer( "zmb_bot_elevator_ride_up", players[i] );
					start_wait = 0.0;
					black_screen_wait = 4.0;
					fade_in_time = 0.01;
					fade_out_time = 0.2;
					players[i] thread fadetoblackforxsec( start_wait, black_screen_wait, fade_in_time, fade_out_time, "white" );
					n_transition_time = start_wait + black_screen_wait + fade_in_time + fade_out_time;
					n_start_time = start_wait + fade_in_time;
					players[i] thread player_transition_into_robot_head_start( n_start_time );
					players[i] thread player_transition_into_robot_head_finish( n_transition_time );
					players[i] thread player_death_watch_on_giant_robot();
					continue;
				}
				else
				{
					if ( isdefined( players[i].dig_vars["has_helmet"] ) && players[i].dig_vars["has_helmet"] )
						players[i] thread player_stomp_fake_death( robot );
					else
						players[i] thread player_stomp_death( robot );

					start_wait = 0.0;
					black_screen_wait = 5.0;
					fade_in_time = 0.01;
					fade_out_time = 0.2;
					players[i] thread fadetoblackforxsec( start_wait, black_screen_wait, fade_in_time, fade_out_time, "black", 1 );
				}
			}
		}

		wait 0.05;
	}
}