// T6 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool
#include character\clientscripts\c_zom_zombie5_01;
#include character\clientscripts\c_zom_zombie5_02;
#include character\clientscripts\c_zom_zombie5_03;

main()
{
    switch ( self getcharacterindex() )
    {
        case 0:
            character\clientscripts\c_zom_zombie5_01::main();
            break;
        case 1:
            character\clientscripts\c_zom_zombie5_02::main();
            break;
        case 2:
            character\clientscripts\c_zom_zombie5_03::main();
            break;
    }

    self._aitype = "zm_transit_basic_05";
}

#using_animtree("zm_all_basic");

precache( ai_index )
{
    character\clientscripts\c_zom_zombie5_01::precache();
    character\clientscripts\c_zom_zombie5_02::precache();
    character\clientscripts\c_zom_zombie5_03::precache();
    usefootsteptable( ai_index, "default_ai" );
    precacheanimstatedef( ai_index, #animtree, "zm_all_basic" );
    setdemolockonvalues( ai_index, 100, 60, -15, 60, 30, -5, 60 );
}
