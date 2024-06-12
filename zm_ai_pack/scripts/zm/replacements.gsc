#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\zombies\_zm_utility;
#include scripts\zm\clientfield_alt_sys;


main()
{
	//replacefunc(maps\mp\zombies\_zm_spawner::init, ::init_override);
	//replacefunc(maps\mp\zombies\_zm_spawner::zombie_gut_explosion, ::zombie_gut_explosion_override);
	//replacefunc(maps\mp\zombies\_zm::actor_damage_override, ::actor_damage_override_override);
	//replacefunc(maps\mp\zombies\_zm::player_damage_override, ::player_damage_override_override);
}

// actor_damage_override_override(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex)
// {

// 	if (is_true(self.is_sloth))
// 	{
// 		return 0;
// 	}

// 	if (issubstr(weapon, "one_inch_punch") && damage <= 5)
// 	{
// 		return 0;
// 	}

// 	if (!isDefined(self) || !isDefined(attacker))
// 	{
// 		return damage;
// 	}

// 	if (is_tazer_weapon(weapon) || weapon == "jetgun_zm" || weapon == "riotshield_zm")
// 	{
// 		self.knuckles_extinguish_flames = 1;
// 	}
// 	else if (weapon != "none")
// 	{
// 		self.knuckles_extinguish_flames = undefined;
// 	}

// 	if (isDefined(attacker.animname) && attacker.animname == "quad_zombie")
// 	{
// 		if (isDefined(self.animname) && self.animname == "quad_zombie")
// 		{
// 			return 0;
// 		}
// 	}

// 	if (!isplayer(attacker) && isDefined(self.non_attacker_func))
// 	{
// 		if (is_true(self.non_attack_func_takes_attacker))
// 		{
// 			return self [[self.non_attacker_func]](damage, weapon, attacker);
// 		}
// 		else
// 		{
// 			return self [[self.non_attacker_func]](damage, weapon);
// 		}
// 	}

// 	if (weapon == "zombie_bullet_crouch_zm" && meansofdeath == "MOD_RIFLE_BULLET")
// 	{
// 		damage = scale_damage(damage, 600);
// 	}

// 	if (weapon == "willy_pete2_zm")
// 	{
// 		if (!is_true(self.is_brutus))
// 		{
// 			if (is_true(self.real_willy_pete_damage))
// 			{
// 				self.real_willy_pete_damage = undefined;
// 			}
// 			else
// 			{
// 				// hack to make Smoke Grenade use MOD_UNKNOWN so zombies don't gib
// 				self.real_willy_pete_damage = 1;
// 				self dodamage(self.health, inflictor.origin, attacker, self, "none", "MOD_UNKNOWN", 0, weapon);
// 				return 0;
// 			}
// 		}
// 	}

// 	if (weapon == "tower_trap_zm")
// 	{
// 		if (!is_true(self.is_brutus))
// 		{
// 			damage = level.zombie_health;
// 		}
// 	}

// 	if (weapon == "tower_trap_upgraded_zm")
// 	{
// 		if (!is_true(self.is_brutus))
// 		{
// 			damage = scale_damage(damage, 200);
// 		}
// 	}

// 	if (weapon == "quadrotorturret_zm" && meansofdeath == "MOD_PISTOL_BULLET")
// 	{
// 		if (!is_true(self.is_mechz))
// 		{
// 			damage = scale_damage(damage, 6000);
// 		}
// 	}

// 	if (!isplayer(attacker) && !isplayer(self))
// 	{
// 		return damage;
// 	}

// 	if (!isDefined(damage) || !isDefined(meansofdeath))
// 	{
// 		return damage;
// 	}

// 	if (meansofdeath == "")
// 	{
// 		return damage;
// 	}

// 	old_damage = damage;
// 	final_damage = damage;

// 	if (isDefined(self.actor_damage_func))
// 	{
// 		final_damage = [[self.actor_damage_func]](inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex);
// 	}

// 	if (attacker.classname == "script_vehicle" && isDefined(attacker.owner))
// 	{
// 		attacker = attacker.owner;
// 	}

// 	if (is_true(self.in_water))
// 	{
// 		if (int(final_damage) >= self.health)
// 		{
// 			self.water_damage = 1;
// 		}
// 	}

// 	attacker thread maps\mp\gametypes_zm\_weapons::checkhit(weapon);

// 	if (weapon == "blundergat_zm")
// 	{
// 		if (!is_true(self.is_brutus))
// 		{
// 			final_damage = scale_damage(final_damage, 500);
// 		}
// 	}

// 	if (weapon == "blundergat_upgraded_zm")
// 	{
// 		if (!is_true(self.is_brutus))
// 		{
// 			final_damage = scale_damage(final_damage, 1000);
// 		}
// 	}

// 	if (weapon == "blundersplat_explosive_dart_zm")
// 	{
// 		if (!is_true(self.is_brutus))
// 		{
// 			final_damage = scale_damage(final_damage, 4000);
// 		}
// 	}

// 	if (weapon == "blundersplat_explosive_dart_upgraded_zm")
// 	{
// 		if (!is_true(self.is_brutus))
// 		{
// 			final_damage = scale_damage(final_damage, 8000);
// 		}
// 	}

// 	if (issubstr(weapon, "metalstorm"))
// 	{
// 		if (issubstr(weapon, "upgraded"))
// 		{
// 			// do same damage through penetration
// 			if (isdefined(attacker.chargeshotlevel))
// 			{
// 				final_damage = 2000 * attacker.chargeshotlevel;

// 				if (is_headshot(weapon, shitloc, meansofdeath))
// 				{
// 					final_damage = int(final_damage * 1.5);
// 				}
// 			}

// 			final_damage = scale_damage(final_damage, 10000);
// 		}
// 		else
// 		{
// 			// do same damage through penetration
// 			if (isdefined(attacker.chargeshotlevel))
// 			{
// 				final_damage = 1000 * attacker.chargeshotlevel;

// 				if (is_headshot(weapon, shitloc, meansofdeath))
// 				{
// 					final_damage = int(final_damage * 1.5);
// 				}
// 			}

// 			final_damage = scale_damage(final_damage, 5000);
// 		}
// 	}

// 	if (weapon == "titus6_explosive_dart_zm")
// 	{
// 		final_damage = scale_damage(final_damage, 3000);
// 	}

// 	if (weapon == "titus6_explosive_dart_upgraded_zm")
// 	{
// 		final_damage = scale_damage(final_damage, 6000);
// 	}

// 	if (weapon == "mk_titus6_zm")
// 	{
// 		final_damage = scale_damage(final_damage, 1000);
// 	}

// 	if (weapon == "mk_titus6_upgraded_zm")
// 	{
// 		final_damage = scale_damage(final_damage, 2000);
// 	}

// 	if (weapon == "staff_revive_zm")
// 	{
// 		if (!is_true(self.is_mechz))
// 		{
// 			final_damage = level.zombie_health;
// 		}
// 	}

// 	if (attacker HasPerk("specialty_rof"))
// 	{
// 		if (meansofdeath == "MOD_PISTOL_BULLET" || meansofdeath == "MOD_RIFLE_BULLET")
// 		{
// 			if (!issubstr(weapon, "metalstorm"))
// 			{
// 				final_damage *= 1.5;
// 			}
// 		}
// 	}

// 	if (attacker HasPerk("specialty_deadshot"))
// 	{
// 		if (is_headshot(weapon, shitloc, meansofdeath))
// 		{
// 			if (meansofdeath == "MOD_PISTOL_BULLET" || meansofdeath == "MOD_RIFLE_BULLET")
// 			{
// 				if (!isSubStr(weaponClass(weapon), "spread") || maps\mp\zombies\_zm_weapons::get_base_weapon_name(weapon, 1) == "ksg_zm")
// 				{
// 					if (!issubstr(weapon, "metalstorm"))
// 					{
// 						final_damage *= 2;
// 					}
// 				}
// 			}
// 		}
// 	}

// 	if (attacker maps\mp\zombies\_zm_pers_upgrades_functions::pers_mulit_kill_headshot_active() && is_headshot(weapon, shitloc, meansofdeath))
// 	{
// 		final_damage *= 2;
// 	}

// 	if (is_true(level.zombie_vars[attacker.team]["zombie_half_damage"]) && !is_true(self.marked_for_death))
// 	{
// 		final_damage /= 2;
// 	}

// 	if (is_true(level.headshots_only) && isDefined(attacker) && isplayer(attacker))
// 	{
// 		if (meansofdeath == "MOD_MELEE" && shitloc == "head" || meansofdeath == "MOD_MELEE" && shitloc == "helmet")
// 		{
// 			return int(final_damage);
// 		}

// 		if (is_explosive_damage(meansofdeath))
// 		{
// 			return int(final_damage);
// 		}
// 		else if (!is_headshot(weapon, shitloc, meansofdeath))
// 		{
// 			return 0;
// 		}
// 	}

// 	return int(final_damage);
// }



// player_damage_override_override(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, psoffsettime)
// {
// 	if (isDefined(level._game_module_player_damage_callback))
// 	{
// 		new_damage = self [[level._game_module_player_damage_callback]](einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, psoffsettime);

// 		if (isDefined(new_damage))
// 		{
// 			idamage = new_damage;
// 		}
// 	}

// 	idamage = self maps\mp\zombies\_zm::check_player_damage_callbacks(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, psoffsettime);

// 	if (is_true(self.use_adjusted_grenade_damage))
// 	{
// 		self.use_adjusted_grenade_damage = undefined;

// 		if (self.health > idamage)
// 		{
// 			return idamage;
// 		}
// 	}

// 	if (!idamage)
// 	{
// 		return 0;
// 	}

// 	if (self maps\mp\zombies\_zm_laststand::player_is_in_laststand())
// 	{
// 		return 0;
// 	}

// 	if (isDefined(einflictor))
// 	{
// 		if (is_true(einflictor.water_damage))
// 		{
// 			return 0;
// 		}
// 	}

// 	if (isDefined(eattacker) && is_true(eattacker.is_zombie) || isplayer(eattacker))
// 	{
// 		if (is_true(self.hasriotshield) && isDefined(vdir))
// 		{
// 			if (is_true(self.hasriotshieldequipped))
// 			{
// 				if (self maps\mp\zombies\_zm::player_shield_facing_attacker(vdir, 0.2) && isDefined(self.player_shield_apply_damage))
// 				{
// 					self [[self.player_shield_apply_damage]](100, 0);
// 					return 0;
// 				}
// 			}
// 			else if (!isDefined(self.riotshieldentity))
// 			{
// 				if (!self maps\mp\zombies\_zm::player_shield_facing_attacker(vdir, -0.2) && isDefined(self.player_shield_apply_damage))
// 				{
// 					self [[self.player_shield_apply_damage]](100, 0);
// 					return 0;
// 				}
// 			}
// 		}
// 	}

// 	if (isDefined(eattacker))
// 	{
// 		if (isDefined(self.ignoreattacker) && self.ignoreattacker == eattacker)
// 		{
// 			return 0;
// 		}

// 		if (is_true(self.is_zombie) && is_true(eattacker.is_zombie))
// 		{
// 			return 0;
// 		}

// 		if (is_true(eattacker.is_zombie))
// 		{
// 			self.ignoreattacker = eattacker;
// 			self thread maps\mp\zombies\_zm::remove_ignore_attacker();

// 			if (isDefined(eattacker.custom_damage_func))
// 			{
// 				idamage = eattacker [[eattacker.custom_damage_func]](self);
// 			}
// 			else if (isDefined(eattacker.meleedamage))
// 			{
// 				idamage = eattacker.meleedamage;
// 			}
// 			else
// 			{
// 				idamage = 50;
// 			}
// 		}

// 		eattacker notify("hit_player");

// 		if (smeansofdeath != "MOD_FALLING")
// 		{
// 			self thread maps\mp\zombies\_zm::playswipesound(smeansofdeath, eattacker);

// 			if (is_true(eattacker.is_zombie) || isplayer(eattacker))
// 			{
// 				self playrumbleonentity("damage_heavy");
// 			}

// 			canexert = 1;

// 			if (is_true(level.pers_upgrade_flopper))
// 			{
// 				if (is_true(self.pers_upgrades_awarded["flopper"]))
// 				{
// 					if (smeansofdeath != "MOD_PROJECTILE_SPLASH" && smeansofdeath != "MOD_GRENADE" && smeansofdeath != "MOD_GRENADE_SPLASH")
// 					{
// 						canexert = smeansofdeath;
// 					}
// 				}
// 			}

// 			if (is_true(canexert))
// 			{
// 				if (randomintrange(0, 1) == 0)
// 				{
// 					self thread maps\mp\zombies\_zm_audio::playerexert("hitmed");
// 				}
// 				else
// 				{
// 					self thread maps\mp\zombies\_zm_audio::playerexert("hitlrg");
// 				}
// 			}
// 		}
// 	}

// 	finaldamage = idamage;

// 	if (is_placeable_mine(sweapon) || sweapon == "freezegun_zm" || sweapon == "freezegun_upgraded_zm")
// 	{
// 		return 0;
// 	}

// 	// fix turrets damaging players
// 	if (sweapon == "zombie_bullet_crouch_zm" && smeansofdeath == "MOD_RIFLE_BULLET")
// 	{
// 		return 0;
// 	}

// 	if (isDefined(self.player_damage_override))
// 	{
// 		self thread [[self.player_damage_override]](einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, psoffsettime);
// 	}

// 	if (smeansofdeath == "MOD_FALLING")
// 	{
// 		if (self hasperk("specialty_flakjacket"))
// 		{
// 			if (is_true(self.divetoprone))
// 			{
// 				if (isDefined(level.zombiemode_divetonuke_perk_func))
// 				{
// 					[[level.zombiemode_divetonuke_perk_func]](self, self.origin);
// 				}
// 			}

// 			return 0;
// 		}

// 		if (is_true(level.pers_upgrade_flopper))
// 		{
// 			if (self maps\mp\zombies\_zm_pers_upgrades_functions::pers_upgrade_flopper_damage_check(smeansofdeath, idamage))
// 			{
// 				return 0;
// 			}
// 		}
// 	}

// 	if (smeansofdeath == "MOD_PROJECTILE" || smeansofdeath == "MOD_PROJECTILE_SPLASH" || smeansofdeath == "MOD_GRENADE" || smeansofdeath == "MOD_GRENADE_SPLASH")
// 	{
// 		if (self hasperk("specialty_flakjacket"))
// 		{
// 			return 0;
// 		}

// 		if (is_true(level.pers_upgrade_flopper))
// 		{
// 			if (is_true(self.pers_upgrades_awarded["flopper"]))
// 			{
// 				return 0;
// 			}
// 		}

// 		if (sweapon == "slip_bolt_zm" || sweapon == "slip_bolt_upgraded_zm")
// 		{
// 			return 0;
// 		}

// 		if (sweapon == "willy_pete2_zm")
// 		{
// 			return 0;
// 		}

// 		exp_damage = 75;

// 		if (sweapon == "titus6_explosive_dart_zm" || sweapon == "titus6_explosive_dart_upgraded_zm")
// 		{
// 			exp_damage = 15;
// 		}

// 		if (self.health > exp_damage && !is_true(self.is_zombie))
// 		{
// 			return exp_damage;
// 		}
// 	}

// 	if (idamage < self.health)
// 	{
// 		if (isDefined(eattacker))
// 		{
// 			if (isDefined(level.custom_kill_damaged_vo))
// 			{
// 				eattacker thread [[level.custom_kill_damaged_vo]](self);
// 			}
// 			else
// 			{
// 				eattacker.sound_damage_player = self;
// 			}

// 			if (!is_true(eattacker.has_legs))
// 			{
// 				self maps\mp\zombies\_zm_audio::create_and_play_dialog("general", "crawl_hit");
// 			}
// 			else if (isDefined(eattacker.animname) && eattacker.animname == "monkey_zombie")
// 			{
// 				self maps\mp\zombies\_zm_audio::create_and_play_dialog("general", "monkey_hit");
// 			}
// 		}

// 		return finaldamage;
// 	}

// 	if (isDefined(eattacker))
// 	{
// 		if (isDefined(eattacker.animname) && eattacker.animname == "zombie_dog")
// 		{
// 			self maps\mp\zombies\_zm_stats::increment_client_stat("killed_by_zdog");
// 			self maps\mp\zombies\_zm_stats::increment_player_stat("killed_by_zdog");
// 		}
// 		else if (isDefined(eattacker.is_avogadro) && eattacker.is_avogadro)
// 		{
// 			self maps\mp\zombies\_zm_stats::increment_client_stat("killed_by_avogadro", 0);
// 			self maps\mp\zombies\_zm_stats::increment_player_stat("killed_by_avogadro");
// 		}
// 	}

// 	self thread maps\mp\zombies\_zm::clear_path_timers();

// 	if (level.intermission)
// 	{
// 		level waittill("forever");
// 	}

// 	if (level.scr_zm_ui_gametype == "zcleansed" && idamage > 0)
// 	{
// 		if ((!is_true(self.laststand) && !self maps\mp\zombies\_zm_laststand::player_is_in_laststand()) || !isDefined(self.last_player_attacker))
// 		{
// 			if (isDefined(eattacker) && isplayer(eattacker) && eattacker.team != self.team)
// 			{
// 				if (isDefined(eattacker.maxhealth) && is_true(eattacker.is_zombie))
// 				{
// 					eattacker.health = eattacker.maxhealth;
// 				}

// 				if (isDefined(level.player_kills_player))
// 				{
// 					self thread [[level.player_kills_player]](einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, psoffsettime);
// 				}
// 			}
// 		}
// 	}

// 	if (self hasperk("specialty_finalstand"))
// 	{
// 		if (isDefined(level.chugabud_laststand_func))
// 		{
// 			self thread [[level.chugabud_laststand_func]]();
// 			return 0;
// 		}
// 	}

// 	players = get_players();
// 	count = 0;

// 	for (i = 0; i < players.size; i++)
// 	{
// 		if (players[i] == self || players[i].is_zombie || players[i] maps\mp\zombies\_zm_laststand::player_is_in_laststand() || players[i].sessionstate == "spectator")
// 		{
// 			count++;
// 		}
// 	}

// 	if (count < players.size || isDefined(level._game_module_game_end_check) && ![[level._game_module_game_end_check]]())
// 	{
// 		if (isDefined(self.solo_lives_given) && self.solo_lives_given < 3 && is_true(level.force_solo_quick_revive) && self hasperk("specialty_quickrevive"))
// 		{
// 			self thread maps\mp\zombies\_zm::wait_and_revive();
// 		}

// 		return finaldamage;
// 	}

// 	solo_death = self is_solo_death(players);
// 	non_solo_death = self is_non_solo_death(players, count);

// 	if ((solo_death || non_solo_death) && !is_true(level.no_end_game_check))
// 	{
// 		level notify("stop_suicide_trigger");
// 		self thread maps\mp\zombies\_zm_laststand::playerlaststand(einflictor, eattacker, idamage, smeansofdeath, sweapon, vdir, shitloc, psoffsettime);

// 		if (!isDefined(vdir))
// 		{
// 			vdir = (1, 0, 0);
// 		}

// 		self fakedamagefrom(vdir);

// 		if (isDefined(level.custom_player_fake_death))
// 		{
// 			self thread [[level.custom_player_fake_death]](vdir, smeansofdeath);
// 		}
// 		else
// 		{
// 			self thread maps\mp\zombies\_zm::player_fake_death();
// 		}
// 	}

// 	if (count == players.size && !is_true(level.no_end_game_check))
// 	{
// 		if (players.size == 1 && flag("solo_game"))
// 		{
// 			if (solo_death)
// 			{
// 				self.lives = 0;
// 				level notify("pre_end_game");
// 				wait_network_frame();

// 				if (flag("dog_round"))
// 				{
// 					maps\mp\zombies\_zm::increment_dog_round_stat("lost");
// 				}

// 				level notify("end_game");
// 			}
// 			else
// 			{
// 				return finaldamage;
// 			}
// 		}
// 		else
// 		{
// 			level notify("pre_end_game");
// 			wait_network_frame();

// 			if (flag("dog_round"))
// 			{
// 				maps\mp\zombies\_zm::increment_dog_round_stat("lost");
// 			}

// 			level notify("end_game");
// 		}

// 		return 0;
// 	}
// 	else
// 	{
// 		surface = "flesh";
// 		return finaldamage;
// 	}
// }


// is_tazer_weapon(weapon)
// {
// 	return issubstr(weapon, "tazer_knuckles") || issubstr(weapon, "knife_ballistic_no_melee");
// }


// scale_damage(damage, damage_to_kill)
// {
// 	scalar = damage / damage_to_kill;
// 	scaled_damage = int(scalar * level.zombie_health) + 1;

// 	if (damage < scaled_damage)
// 	{
// 		return scaled_damage;
// 	}

// 	return damage;
// }

// is_solo_death(players)
// {
// 	if (players.size == 1 && flag("solo_game"))
// 	{
// 		if (self.solo_lives_given >= 3)
// 		{
// 			return 1;
// 		}

// 		if (isDefined(self.e_chugabud_corpse))
// 		{
// 			return 0;
// 		}

// 		active_perks = 0;

// 		if (isDefined(self.perks_active))
// 		{
// 			active_perks = self.perks_active.size;
// 		}

// 		disabled_perks = 0;

// 		if (isDefined(self.disabled_perks))
// 		{
// 			disabled_perks = self.disabled_perks.size;
// 		}

// 		if (active_perks <= disabled_perks)
// 		{
// 			return 1;
// 		}
// 	}

// 	return 0;
// }

// is_non_solo_death(players, count)
// {
// 	if (count > 1 || players.size == 1 && !flag("solo_game"))
// 	{
// 		return 1;
// 	}

// 	return 0;
// }