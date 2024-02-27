// T6 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    self._gib_def = level._gibbing_actor_models["c_zom_zombie_buried_sgirl_body2"];
}

precache()
{
    register_gibs();
}

register_gibs()
{
    if ( !isdefined( level._gibbing_actor_models ) )
        level._gibbing_actor_models = [];

    gib_spawn = spawnstruct();
    gib_spawn.gibspawn1 = "c_zom_buried_g_rarmspawn";
    gib_spawn.gibspawntag1 = "J_Elbow_RI";
    gib_spawn.gibspawn2 = "c_zom_buried_g_larmspawn";
    gib_spawn.gibspawntag2 = "J_Elbow_LE";
    gib_spawn.gibspawn3 = "c_zom_buried_g_rlegspawn";
    gib_spawn.gibspawntag3 = "J_Knee_RI";
    gib_spawn.gibspawn4 = "c_zom_buried_g_llegspawn";
    gib_spawn.gibspawntag4 = "J_Knee_LE";
    level._gibbing_actor_models["c_zom_zombie_buried_sgirl_body2"] = gib_spawn;
}
