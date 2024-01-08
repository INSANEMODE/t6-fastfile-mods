// T6 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool
#include character\clientscripts\c_zom_zombie_buried_miner1;

main()
{
    character\clientscripts\c_zom_zombie_buried_miner1::main();
    self._aitype = "zm_buried_basic_02_char_01";
}

#using_animtree("zm_buried_basic");

precache( ai_index )
{
    character\clientscripts\c_zom_zombie_buried_miner1::precache();
    usefootsteptable( ai_index, "default_ai" );
    precacheanimstatedef( ai_index, #animtree, "zm_buried_basic" );
    setdemolockonvalues( ai_index, 100, 60, -15, 60, 30, -5, 60 );
}
