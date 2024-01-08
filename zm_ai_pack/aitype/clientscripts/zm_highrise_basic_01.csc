// T6 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool
#include character\clientscripts\c_zom_zombie_civ_shorts;
#include character\clientscripts\c_zom_zombie_civ_shorts2;
#include character\clientscripts\c_zom_zombie_civ_shorts3;
#include character\clientscripts\c_zom_zombie_civ_shorts4;
#include character\clientscripts\c_zom_zombie_civ_shorts5;
#include character\clientscripts\c_zom_zombie_civ_shorts6;

main()
{
    switch ( self getcharacterindex() )
    {
        case 0:
            character\clientscripts\c_zom_zombie_civ_shorts::main();
            break;
        case 1:
            character\clientscripts\c_zom_zombie_civ_shorts2::main();
            break;
        case 2:
            character\clientscripts\c_zom_zombie_civ_shorts3::main();
            break;
        case 3:
            character\clientscripts\c_zom_zombie_civ_shorts4::main();
            break;
        case 4:
            character\clientscripts\c_zom_zombie_civ_shorts5::main();
            break;
        case 5:
            character\clientscripts\c_zom_zombie_civ_shorts6::main();
            break;
    }

    self._aitype = "zm_highrise_basic_01";
}

#using_animtree("zm_highrise_basic");

precache( ai_index )
{
    character\clientscripts\c_zom_zombie_civ_shorts::precache();
    character\clientscripts\c_zom_zombie_civ_shorts2::precache();
    character\clientscripts\c_zom_zombie_civ_shorts3::precache();
    character\clientscripts\c_zom_zombie_civ_shorts4::precache();
    character\clientscripts\c_zom_zombie_civ_shorts5::precache();
    character\clientscripts\c_zom_zombie_civ_shorts6::precache();
    usefootsteptable( ai_index, "default_ai" );
    precacheanimstatedef( ai_index, #animtree, "zm_highrise_basic" );
    setdemolockonvalues( ai_index, 100, 60, -15, 60, 30, -5, 60 );
}
