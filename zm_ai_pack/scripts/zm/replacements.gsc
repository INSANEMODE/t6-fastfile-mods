#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\zombies\_zm_utility;
#include scripts\zm\clientfield_alt_sys;


main()
{
    replacefunc(maps\mp\zombies\_zm_spawner::init, ::init_override);
    replacefunc(maps\mp\zombies\_zm_spawner::zombie_gut_explosion, ::zombie_gut_explosion_override);

}
///// maps/mp/zombnies/zm_spawner.gsc replacements /////
zombie_gut_explosion_override()
{
    self.guts_explosion = 1;

    if ( is_mature() )
        set_clientfield_alt_allplayers( "zombie_gut_explosion", self, 1 );


    if ( !( isdefined( self.isdog ) && self.isdog ) )
        wait 0.1;

    if ( isdefined( self ) )
        self ghost();
}

init_override()
{
    level._contextual_grab_lerp_time = 0.3;
    level.zombie_spawners = getentarray( "zombie_spawner", "script_noteworthy" );

    if ( isdefined( level.use_multiple_spawns ) && level.use_multiple_spawns )
    {
        level.zombie_spawn = [];

        for ( i = 0; i < level.zombie_spawners.size; i++ )
        {
            if ( isdefined( level.zombie_spawners[i].script_int ) )
            {
                int = level.zombie_spawners[i].script_int;

                if ( !isdefined( level.zombie_spawn[int] ) )
                    level.zombie_spawn[int] = [];

                level.zombie_spawn[int][level.zombie_spawn[int].size] = level.zombie_spawners[i];
            }
        }
    }

    precachemodel( "p6_anim_zm_barricade_board_01_upgrade" );
    precachemodel( "p6_anim_zm_barricade_board_02_upgrade" );
    precachemodel( "p6_anim_zm_barricade_board_03_upgrade" );
    precachemodel( "p6_anim_zm_barricade_board_04_upgrade" );
    precachemodel( "p6_anim_zm_barricade_board_05_upgrade" );
    precachemodel( "p6_anim_zm_barricade_board_06_upgrade" );

    if ( isdefined( level.ignore_spawner_func ) )
    {
        for ( i = 0; i < level.zombie_spawners.size; i++ )
        {
            ignore = [[ level.ignore_spawner_func ]]( level.zombie_spawners[i] );

            if ( ignore )
                arrayremovevalue( level.zombie_spawners, level.zombie_spawners[i] );
        }
    }

    gametype = getdvar( "ui_gametype" );

    if ( !isdefined( level.attack_player_thru_boards_range ) )
        level.attack_player_thru_boards_range = 109.8;

    if ( isdefined( level._game_module_custom_spawn_init_func ) )
        [[ level._game_module_custom_spawn_init_func ]]();

    //registerclientfield( "actor", "zombie_has_eyes", 1, 1, "int" );
    //registerclientfield( "actor", "zombie_ragdoll_explode", 1, 1, "int" );
    //registerclientfield( "actor", "zombie_gut_explosion", 9000, 1, "int" );
}

///// end of zm_spawner.gsc replacements /////
