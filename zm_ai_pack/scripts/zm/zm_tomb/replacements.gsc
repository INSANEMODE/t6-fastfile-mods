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

main()
{
    replacefunc(maps\mp\zm_tomb_ee_main_step_4::ee_mechz_do_jump, ::ee_mechz_do_jump_override);

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

