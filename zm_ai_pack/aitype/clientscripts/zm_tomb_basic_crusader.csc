// T6 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool
#include character\clientscripts\c_zom_tomb_crusader_1a;
#include character\clientscripts\c_zom_tomb_crusader_1a_nohat;
#include character\clientscripts\c_zom_tomb_crusader_2b;
#include character\clientscripts\c_zom_tomb_crusader_2b_nohat;
#include character\clientscripts\c_zom_tomb_crusader_2c;
#include character\clientscripts\c_zom_tomb_crusader_1c;

main()
{
    switch ( self getcharacterindex() )
    {
        case 0:
            character\clientscripts\c_zom_tomb_crusader_1a::main();
            break;
        case 1:
            character\clientscripts\c_zom_tomb_crusader_1a_nohat::main();
            break;
        case 2:
            character\clientscripts\c_zom_tomb_crusader_2b::main();
            break;
        case 3:
            character\clientscripts\c_zom_tomb_crusader_2b_nohat::main();
            break;
        case 4:
            character\clientscripts\c_zom_tomb_crusader_2c::main();
            break;
        case 5:
            character\clientscripts\c_zom_tomb_crusader_1c::main();
            break;
    }

    self._aitype = "zm_tomb_basic_crusader";
}

#using_animtree("zm_tomb_basic");

precache( ai_index )
{
    character\clientscripts\c_zom_tomb_crusader_1a::precache();
    character\clientscripts\c_zom_tomb_crusader_1a_nohat::precache();
    character\clientscripts\c_zom_tomb_crusader_2b::precache();
    character\clientscripts\c_zom_tomb_crusader_2b_nohat::precache();
    character\clientscripts\c_zom_tomb_crusader_2c::precache();
    character\clientscripts\c_zom_tomb_crusader_1c::precache();
    usefootsteptable( ai_index, "fly_step_crusader" );
    precacheanimstatedef( ai_index, #animtree, "zm_tomb_basic" );
    setdemolockonvalues( ai_index, 100, 60, -15, 60, 30, -5, 60 );
}
