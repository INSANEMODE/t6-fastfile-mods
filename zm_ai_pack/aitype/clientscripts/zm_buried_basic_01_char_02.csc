// T6 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool
#include character\clientscripts\c_zom_zombie_buried_civilian2;
#include character\clientscripts\c_zom_zombie_buried_civilian2_nohat;

main()
{
    switch ( self getcharacterindex() )
    {
        case 0:
            character\clientscripts\c_zom_zombie_buried_civilian2::main();
            break;
        case 1:
            character\clientscripts\c_zom_zombie_buried_civilian2_nohat::main();
            break;
        case 2:
            character\clientscripts\c_zom_zombie_buried_civilian2_nohat::main();
            break;
    }

    self._aitype = "zm_buried_basic_01_char_02";
}

#using_animtree("zm_buried_basic");

precache( ai_index )
{
    character\clientscripts\c_zom_zombie_buried_civilian2::precache();
    character\clientscripts\c_zom_zombie_buried_civilian2_nohat::precache();
    character\clientscripts\c_zom_zombie_buried_civilian2_nohat::precache();
    usefootsteptable( ai_index, "default_ai" );
    precacheanimstatedef( ai_index, #animtree, "zm_buried_basic" );
    setdemolockonvalues( ai_index, 100, 60, -15, 60, 30, -5, 60 );
}
