// T6 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool
#include character\clientscripts\c_zom_dlc0_zombie_hazmat_1_beyes;
#include character\clientscripts\c_zom_dlc0_zombie_hazmat_2_beyes;

main()
{
    switch ( self getcharacterindex() )
    {
        case 0:
            character\clientscripts\c_zom_dlc0_zombie_hazmat_1_beyes::main();
            break;
        case 1:
            character\clientscripts\c_zom_dlc0_zombie_hazmat_2_beyes::main();
            break;
    }

    self._aitype = "zm_nuked_basic_01_beyes";
}

#using_animtree("zm_all_basic");

precache( ai_index )
{
    character\clientscripts\c_zom_dlc0_zombie_hazmat_1_beyes::precache();
    character\clientscripts\c_zom_dlc0_zombie_hazmat_2_beyes::precache();
    usefootsteptable( ai_index, "default_ai" );
    precacheanimstatedef( ai_index, #animtree, "zm_nuked_basic" );
    setdemolockonvalues( ai_index, 100, 60, -15, 60, 30, -5, 60 );
}
