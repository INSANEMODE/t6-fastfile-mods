#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\zombies\_zm_utility;
#include scripts\zm\clientfield_alt_sys;

main()
{
    replacefunc(maps\mp\zombies\_zm_equip_subwoofer::burst_zombie, ::burst_zombie_override);
    replacefunc(maps\mp\zm_buried_ee::delete_ghost_pianist, ::delete_ghost_pianist_override);
    replacefunc(maps\mp\zm_buried_ee::spawn_and_animate_ghost_pianist, ::spawn_and_animate_ghost_pianist_override);

}
///// maps/mp/zombnies/_zm_equip_subwoofer.gsc replacements /////

burst_zombie_override( weapon, player )
{
    if ( !isdefined( self ) || !isalive( self ) )
        return;

    if ( isdefined( self.subwoofer_burst_func ) )
    {
        self thread [[ self.subwoofer_burst_func ]]( weapon );
        return;
    }

    self dodamage( self.health + 666, weapon.origin );
    player notify( "zombie_subwoofer_kill" );

    if ( !( isdefined( self.guts_explosion ) && self.guts_explosion ) )
    {
        self.guts_explosion = 1;
        set_clientfield_alt_allplayers( "zombie_gut_explosion", self, 1 );

        if ( !( isdefined( self.isdog ) && self.isdog ) )
            wait 0.1;

        self ghost();
    }
}

///// end of _zm_equip_subwoofer.gsc replacements /////

delete_ghost_pianist_override()
{
    set_clientfield_alt_allplayers( "ghost_fx",self, 5 );
    self playsound( "zmb_ai_ghost_death" );
    wait_network_frame();
    self delete();
/#
    iprintln( "ghost piano player deleted" );
#/
}

#using_animtree("zm_buried_ghost");
spawn_and_animate_ghost_pianist_override()
{
    s_anim = getstruct( "ee_mansion_piano_anim_struct", "targetname" );
    e_temp = spawn( "script_model", s_anim.origin );
    e_temp.angles = s_anim.angles;
    set_clientfield_alt_allplayers( "ghost_fx",e_temp, 3 );
    e_temp setmodel( "c_zom_zombie_buried_ghost_woman_fb" );
    e_temp useanimtree( #animtree );
    e_temp setanim( %ai_zombie_ghost_playing_piano );
    set_clientfield_alt_allplayers( "sndGhostAudio",e_temp, 1 );
/#
    iprintln( "ghost piano player spawned" );
#/
    return e_temp;
}


