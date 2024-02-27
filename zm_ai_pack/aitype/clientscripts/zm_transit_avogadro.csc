// T6 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool
#include character\clientscripts\c_zom_avogadro;

main()
{
    character\clientscripts\c_zom_avogadro::main();
    self._aitype = "zm_transit_avogadro";
}

#using_animtree("zm_transit_avogadro");

precache( ai_index )
{
    character\clientscripts\c_zom_avogadro::precache();
    usefootsteptable( ai_index, "default_ai" );
    precacheanimstatedef( ai_index, #animtree, "zm_transit_avogadro" );
    setdemolockonvalues( ai_index, 100, 70, -15, 60, 8, 0, 60 );
}