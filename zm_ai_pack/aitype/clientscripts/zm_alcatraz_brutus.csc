// T6 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool
#include character\clientscripts\c_zom_cellbreaker;

main()
{
    character\clientscripts\c_zom_cellbreaker::main();
    self._aitype = "zm_alcatraz_brutus";
}

#using_animtree("zm_alcatraz_brutus");

precache( ai_index )
{
    character\clientscripts\c_zom_cellbreaker::precache();
    usefootsteptable( ai_index, "fly_step_brutus" );
    // usefootstepfxtable( ai_index, "zm_brutus_footstepfxtable" );
    //usefootsteptable( ai_index, "fly_step_mechz" );
    usefootstepfxtable( ai_index, "zm_mechz_footstepfxtable" );
    scriptcallbackonfootstepevent( ai_index );
    precacheanimstatedef( ai_index, #animtree, "zm_alcatraz_brutus" );
    setdemolockonvalues( ai_index, 100, 60, -15, 60, 30, -5, 60 );
}
