// T6 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool
#include character\clientscripts\c_zom_ally_farmgirl;

main()
{
    character\clientscripts\c_zom_ally_farmgirl::main();
    self._aitype = "zm_ally_farmgirl";
}

#using_animtree("zm_ally");

precache( ai_index )
{
    character\clientscripts\c_zom_ally_farmgirl::precache();
    usefootsteptable( ai_index, "default_ai" );
    precacheanimstatedef( ai_index, #animtree, "zm_ally_basic" );
    setdemolockonvalues( ai_index, 100, 60, -15, 60, 30, -5, 60 );
}