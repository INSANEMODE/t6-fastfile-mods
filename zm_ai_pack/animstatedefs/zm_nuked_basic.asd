zm_inert : aliased notify inert_anim
{
	inert1 ai_zombie_inert_look_v1
	inert2 ai_zombie_inert_look_v2
	inert3 ai_zombie_inert_stagger_v1
	inert4 ai_zombie_inert_stagger_v2
	inert5 ai_zombie_inert_stagger_v3
	inert6 ai_zombie_inert_stagger_v4
	inert7 ai_zombie_inert_circle_v1
}

zm_inert_trans : aliased notify inert_trans_anim
{
	inert_2_walk_1 ai_zombie_inert_2_walk_v11
	inert_2_walk_2 ai_zombie_inert_2_walk_v12
	inert_2_walk_3 ai_zombie_inert_2_walk_v13
	inert_2_walk_4 ai_zombie_inert_2_walk_v14
	inert_2_run_1 ai_zombie_inert_2_run_v1
	inert_2_run_2 ai_zombie_inert_2_run_v2
	inert_2_sprint_1 ai_zombie_inert_2_sprint_v1
	inert_2_sprint_2 ai_zombie_inert_2_sprint_v2
}

zm_inert_crawl : aliased missing_legs notify inert_anim
{
	inert1 ai_zombie_crawl_inert_v1
	inert2 ai_zombie_crawl_inert_v2
	inert3 ai_zombie_crawl_inert_v3
	inert4 ai_zombie_crawl_inert_v4
	inert5 ai_zombie_crawl_inert_v5
	inert6 ai_zombie_crawl_inert_v6
	inert7 ai_zombie_crawl_inert_v7
}

zm_inert_crawl_trans : aliased missing_legs notify inert_trans_anim
{
	inert_2_walk_1 ai_zombie_crawl_inert_2_walk_v1
	inert_2_run_1 ai_zombie_crawl_inert_2_run_v1
	inert_2_run_2 ai_zombie_crawl_inert_2_run_v2
	inert_2_sprint_1 ai_zombie_crawl_inert_2_sprint_v1
	inert_2_sprint_2 ai_zombie_crawl_inert_2_sprint_v2
}

zm_idle : notify idle_anim
{
	ai_zombie_idle_v1_delta
}

zm_idle_crawl : notify idle_anim
{
	ai_zombie_idle_crawl_delta
}

zm_move_walk : notify move_anim
{
	ai_zombie_walk_fast_v1
	ai_zombie_walk_fast_v2
	ai_zombie_walk_fast_v3
	ai_zombie_run_v2
	ai_zombie_run_v4
	ai_zombie_run_v3
}

zm_move_walk_crawl : missing_legs notify move_anim
{
	ai_zombie_crawl
	ai_zombie_crawl_v1
	ai_zombie_crawl_v2
	ai_zombie_crawl_v3
	ai_zombie_crawl_v4
	ai_zombie_crawl_v5
}

zm_move_run : notify move_anim
{
	ai_zombie_sprint_v1
	ai_zombie_sprint_v2
}

zm_move_run_crawl : missing_legs notify move_anim
{
	ai_zombie_crawl
	ai_zombie_crawl_v1
	ai_zombie_crawl_v2
	ai_zombie_crawl_v3
	ai_zombie_crawl_v4
	ai_zombie_crawl_v5
}

zm_move_sprint : notify move_anim
{
	ai_zombie_fast_sprint_01
	ai_zombie_fast_sprint_02
}

zm_move_sprint_crawl : missing_legs notify move_anim
{
	ai_zombie_crawl_sprint
	ai_zombie_crawl_sprint_1
	ai_zombie_crawl_sprint_2
}

zm_move_super_sprint : notify move_anim
{
	ai_hazmat_sprint
	ai_zombie_base_supersprint_bo4_v1
	ai_zombie_base_supersprint_bo4_v2
	ai_zombie_base_supersprint_tranzit_fair_v1
	ai_zombie_fast_sprint_01
	ai_zombie_fast_sprint_02
	ai_zombie_sprint_v4
	ai_zombie_sprint_v5
}

zm_move_super_sprint_crawl : missing_legs notify move_anim
{
	ai_zombie_crawl_sprint
	ai_zombie_crawl_sprint_1
	ai_zombie_crawl_sprint_2
}

zm_move_stumpy : missing_legs notify move_anim
{
	ai_zombie_walk_on_hands_a
	ai_zombie_walk_on_hands_b
}

zm_step_left : restart notify step_anim
{
	ai_zombie_spets_sidestep_left_a
	ai_zombie_spets_sidestep_left_b
}

zm_step_right : restart notify step_anim
{
	ai_zombie_spets_sidestep_right_a
	ai_zombie_spets_sidestep_right_b
}

zm_roll_forward : restart notify step_anim
{
	ai_zombie_spets_roll_a
	ai_zombie_spets_roll_b
	ai_zombie_spets_roll_c
}

zm_walk_melee : restart notify melee_anim
{
	ai_zombie_attack_v2
	ai_zombie_attack_v4
	ai_zombie_attack_v6
	ai_zombie_attack_v1
	ai_zombie_attack_forward_v1
	ai_zombie_attack_forward_v2
	ai_zombie_walk_attack_v1
	ai_zombie_walk_attack_v2
	ai_zombie_walk_attack_v3
	ai_zombie_walk_attack_v4
}

zm_walk_melee_crawl : restart missing_legs notify melee_anim
{
	ai_zombie_attack_crawl
	ai_zombie_attack_crawl_lunge
}

zm_run_melee : restart notify melee_anim
{
	ai_zombie_attack_v2
	ai_zombie_attack_v4
	ai_zombie_attack_v6
	ai_zombie_attack_v1
	ai_zombie_attack_forward_v1
	ai_zombie_attack_forward_v2
	ai_zombie_run_attack_v1
	ai_zombie_run_attack_v2
	ai_zombie_run_attack_v3
}

zm_run_melee_crawl : restart missing_legs notify melee_anim
{
	ai_zombie_attack_crawl
	ai_zombie_attack_crawl_lunge
}

zm_stumpy_melee : restart missing_legs notify melee_anim
{
	ai_zombie_walk_on_hands_shot_a
	ai_zombie_walk_on_hands_shot_b
}

zm_taunt : restart notify taunt_anim
{
	ai_zombie_taunts_4
	ai_zombie_taunts_7
	ai_zombie_taunts_9
	ai_zombie_taunts_5b
	ai_zombie_taunts_5c
	ai_zombie_taunts_5d
	ai_zombie_taunts_5e
	ai_zombie_taunts_5f
}

zm_zbarrier_board_tear_in : aliased restart notify tear_anim
{
	spot_0_piece_horz_1 ai_zombie_boardtear_aligned_m_1_grab
	spot_0_piece_vert_1 ai_zombie_boardtear_aligned_m_2_grab
	spot_0_piece_vert_2 ai_zombie_boardtear_aligned_m_3_grab
	spot_0_piece_horz_2 ai_zombie_boardtear_aligned_m_4_grab
	spot_0_piece_horz_3 ai_zombie_boardtear_aligned_m_5_grab
	spot_0_piece_horz_4 ai_zombie_boardtear_aligned_m_6_grab
	spot_1_piece_horz_1 ai_zombie_boardtear_aligned_r_1_grab
	spot_1_piece_vert_1 ai_zombie_boardtear_aligned_r_2_grab
	spot_1_piece_vert_2 ai_zombie_boardtear_aligned_r_3_grab
	spot_1_piece_horz_2 ai_zombie_boardtear_aligned_r_4_grab
	spot_1_piece_horz_3 ai_zombie_boardtear_aligned_r_5_grab
	spot_1_piece_horz_4 ai_zombie_boardtear_aligned_r_6_grab
	spot_2_piece_horz_1 ai_zombie_boardtear_aligned_l_1_grab
	spot_2_piece_vert_1 ai_zombie_boardtear_aligned_l_2_grab
	spot_2_piece_vert_2 ai_zombie_boardtear_aligned_l_3_grab
	spot_2_piece_horz_2 ai_zombie_boardtear_aligned_l_4_grab
	spot_2_piece_horz_3 ai_zombie_boardtear_aligned_l_5_grab
	spot_2_piece_horz_4 ai_zombie_boardtear_aligned_l_6_grab
}

zm_zbarrier_board_tear_loop : aliased restart notify tear_anim
{
	spot_0_piece_horz_1 ai_zombie_boardtear_aligned_m_1_hold
	spot_0_piece_vert_1 ai_zombie_boardtear_aligned_m_2_hold
	spot_0_piece_vert_2 ai_zombie_boardtear_aligned_m_3_hold
	spot_0_piece_horz_2 ai_zombie_boardtear_aligned_m_4_hold
	spot_0_piece_horz_3 ai_zombie_boardtear_aligned_m_5_hold
	spot_0_piece_horz_4 ai_zombie_boardtear_aligned_m_6_hold
	spot_1_piece_horz_1 ai_zombie_boardtear_aligned_r_1_hold
	spot_1_piece_vert_1 ai_zombie_boardtear_aligned_r_2_hold
	spot_1_piece_vert_2 ai_zombie_boardtear_aligned_r_3_hold
	spot_1_piece_horz_2 ai_zombie_boardtear_aligned_r_4_hold
	spot_1_piece_horz_3 ai_zombie_boardtear_aligned_r_5_hold
	spot_1_piece_horz_4 ai_zombie_boardtear_aligned_r_6_hold
	spot_2_piece_horz_1 ai_zombie_boardtear_aligned_l_1_hold
	spot_2_piece_vert_1 ai_zombie_boardtear_aligned_l_2_hold
	spot_2_piece_vert_2 ai_zombie_boardtear_aligned_l_3_hold
	spot_2_piece_horz_2 ai_zombie_boardtear_aligned_l_4_hold
	spot_2_piece_horz_3 ai_zombie_boardtear_aligned_l_5_hold
	spot_2_piece_horz_4 ai_zombie_boardtear_aligned_l_6_hold
}

zm_zbarrier_board_tear_out : aliased restart notify tear_anim
{
	spot_0_piece_horz_1 ai_zombie_boardtear_aligned_m_1_pull
	spot_0_piece_vert_1 ai_zombie_boardtear_aligned_m_2_pull
	spot_0_piece_vert_2 ai_zombie_boardtear_aligned_m_3_pull
	spot_0_piece_horz_2 ai_zombie_boardtear_aligned_m_4_pull
	spot_0_piece_horz_3 ai_zombie_boardtear_aligned_m_5_pull
	spot_0_piece_horz_4 ai_zombie_boardtear_aligned_m_6_pull
	spot_1_piece_horz_1 ai_zombie_boardtear_aligned_r_1_pull
	spot_1_piece_vert_1 ai_zombie_boardtear_aligned_r_2_pull
	spot_1_piece_vert_2 ai_zombie_boardtear_aligned_r_3_pull
	spot_1_piece_horz_2 ai_zombie_boardtear_aligned_r_4_pull
	spot_1_piece_horz_3 ai_zombie_boardtear_aligned_r_5_pull
	spot_1_piece_horz_4 ai_zombie_boardtear_aligned_r_6_pull
	spot_2_piece_horz_1 ai_zombie_boardtear_aligned_l_1_pull
	spot_2_piece_vert_1 ai_zombie_boardtear_aligned_l_2_pull
	spot_2_piece_vert_2 ai_zombie_boardtear_aligned_l_3_pull
	spot_2_piece_horz_2 ai_zombie_boardtear_aligned_l_4_pull
	spot_2_piece_horz_3 ai_zombie_boardtear_aligned_l_5_pull
	spot_2_piece_horz_4 ai_zombie_boardtear_aligned_l_6_pull
}

zm_zbarrier_board_tear_in_crawl : aliased restart missing_legs notify tear_anim
{
	spot_0_piece_horz_1 ai_zombie_crawl_boardtear_aligned_m_1_grab
	spot_0_piece_vert_1 ai_zombie_crawl_boardtear_aligned_m_2_grab
	spot_0_piece_vert_2 ai_zombie_crawl_boardtear_aligned_m_3_grab
	spot_0_piece_horz_2 ai_zombie_crawl_boardtear_aligned_m_4_grab
	spot_0_piece_horz_3 ai_zombie_crawl_boardtear_aligned_m_5_grab
	spot_0_piece_horz_4 ai_zombie_crawl_boardtear_aligned_m_6_grab
	spot_1_piece_horz_1 ai_zombie_crawl_boardtear_aligned_r_1_grab
	spot_1_piece_vert_1 ai_zombie_crawl_boardtear_aligned_r_2_grab
	spot_1_piece_vert_2 ai_zombie_crawl_boardtear_aligned_r_3_grab
	spot_1_piece_horz_2 ai_zombie_crawl_boardtear_aligned_r_4_grab
	spot_1_piece_horz_3 ai_zombie_crawl_boardtear_aligned_r_5_grab
	spot_1_piece_horz_4 ai_zombie_crawl_boardtear_aligned_r_6_grab
	spot_2_piece_horz_1 ai_zombie_crawl_boardtear_aligned_l_1_grab
	spot_2_piece_vert_1 ai_zombie_crawl_boardtear_aligned_l_2_grab
	spot_2_piece_vert_2 ai_zombie_crawl_boardtear_aligned_l_3_grab
	spot_2_piece_horz_2 ai_zombie_crawl_boardtear_aligned_l_4_grab
	spot_2_piece_horz_3 ai_zombie_crawl_boardtear_aligned_l_5_grab
	spot_2_piece_horz_4 ai_zombie_crawl_boardtear_aligned_l_6_grab
}

zm_zbarrier_board_tear_loop_crawl : aliased restart missing_legs notify tear_anim
{
	spot_0_piece_horz_1 ai_zombie_crawl_boardtear_aligned_m_1_hold
	spot_0_piece_vert_1 ai_zombie_crawl_boardtear_aligned_m_2_hold
	spot_0_piece_vert_2 ai_zombie_crawl_boardtear_aligned_m_3_hold
	spot_0_piece_horz_2 ai_zombie_crawl_boardtear_aligned_m_4_hold
	spot_0_piece_horz_3 ai_zombie_crawl_boardtear_aligned_m_5_hold
	spot_0_piece_horz_4 ai_zombie_crawl_boardtear_aligned_m_6_hold
	spot_1_piece_horz_1 ai_zombie_crawl_boardtear_aligned_r_1_hold
	spot_1_piece_vert_1 ai_zombie_crawl_boardtear_aligned_r_2_hold
	spot_1_piece_vert_2 ai_zombie_crawl_boardtear_aligned_r_3_hold
	spot_1_piece_horz_2 ai_zombie_crawl_boardtear_aligned_r_4_hold
	spot_1_piece_horz_3 ai_zombie_crawl_boardtear_aligned_r_5_hold
	spot_1_piece_horz_4 ai_zombie_crawl_boardtear_aligned_r_6_hold
	spot_2_piece_horz_1 ai_zombie_crawl_boardtear_aligned_l_1_hold
	spot_2_piece_vert_1 ai_zombie_crawl_boardtear_aligned_l_2_hold
	spot_2_piece_vert_2 ai_zombie_crawl_boardtear_aligned_l_3_hold
	spot_2_piece_horz_2 ai_zombie_crawl_boardtear_aligned_l_4_hold
	spot_2_piece_horz_3 ai_zombie_crawl_boardtear_aligned_l_5_hold
	spot_2_piece_horz_4 ai_zombie_crawl_boardtear_aligned_l_6_hold
}

zm_zbarrier_board_tear_out_crawl : aliased restart missing_legs notify tear_anim
{
	spot_0_piece_horz_1 ai_zombie_crawl_boardtear_aligned_m_1_pull
	spot_0_piece_vert_1 ai_zombie_crawl_boardtear_aligned_m_2_pull
	spot_0_piece_vert_2 ai_zombie_crawl_boardtear_aligned_m_3_pull
	spot_0_piece_horz_2 ai_zombie_crawl_boardtear_aligned_m_4_pull
	spot_0_piece_horz_3 ai_zombie_crawl_boardtear_aligned_m_5_pull
	spot_0_piece_horz_4 ai_zombie_crawl_boardtear_aligned_m_6_pull
	spot_1_piece_horz_1 ai_zombie_crawl_boardtear_aligned_r_1_pull
	spot_1_piece_vert_1 ai_zombie_crawl_boardtear_aligned_r_2_pull
	spot_1_piece_vert_2 ai_zombie_crawl_boardtear_aligned_r_3_pull
	spot_1_piece_horz_2 ai_zombie_crawl_boardtear_aligned_r_4_pull
	spot_1_piece_horz_3 ai_zombie_crawl_boardtear_aligned_r_5_pull
	spot_1_piece_horz_4 ai_zombie_crawl_boardtear_aligned_r_6_pull
	spot_2_piece_horz_1 ai_zombie_crawl_boardtear_aligned_l_1_pull
	spot_2_piece_vert_1 ai_zombie_crawl_boardtear_aligned_l_2_pull
	spot_2_piece_vert_2 ai_zombie_crawl_boardtear_aligned_l_3_pull
	spot_2_piece_horz_2 ai_zombie_crawl_boardtear_aligned_l_4_pull
	spot_2_piece_horz_3 ai_zombie_crawl_boardtear_aligned_l_5_pull
	spot_2_piece_horz_4 ai_zombie_crawl_boardtear_aligned_l_6_pull
}

zm_window_melee : restart notify window_melee_anim
{
	ai_zombie_window_attack_arm_l_out
	ai_zombie_window_attack_arm_r_out
}

zm_rise : restart notify rise_anim
{
	ai_zombie_traverse_ground_v1_walk
	ai_zombie_traverse_ground_v2_walk_altA
	ai_zombie_traverse_ground_v1_run
	ai_zombie_traverse_ground_climbout_fast
}

zm_rise_death_in : restart notify death_anim
{
	ai_zombie_traverse_ground_v1_deathinside
	ai_zombie_traverse_ground_v1_deathinside_alt
}

zm_rise_death_out : restart notify death_anim
{
	ai_zombie_traverse_ground_v1_deathoutside
	ai_zombie_traverse_ground_v1_deathoutside_alt
}

zm_faller_attack : restart notify attack_anim
{
	ai_zombie_ceiling_attack_01
	ai_zombie_ceiling_attack_02
}

zm_faller_emerge : restart notify emerge_anim
{
	ai_zombie_ceiling_emerge_01
}

zm_faller_emerge_death : restart notify death_anim
{
	ai_zombie_ceiling_death
}

zm_faller_fall : restart notify fall_anim
{
	ai_zombie_ceiling_dropdown_01
}

zm_faller_fall_loop : notify fall_anim
{
	ai_zombie_ceiling_fall_loop
}

zm_faller_land : restart notify land_anim
{
	ai_zombie_ceiling_fall_land
	ai_zombie_ceiling_fall_land_02
}

zm_death : restart notify death_anim
{
	ch_dazed_a_death
	ch_dazed_b_death
	ch_dazed_c_death
	ch_dazed_d_death
}

zm_death_crawl : restart missing_legs notify death_anim
{
	ai_zombie_crawl_death_v1
	ai_zombie_crawl_death_v2
}

zm_traverse_barrier : aliased restart notify traverse_anim
{
	barrier_walk	ai_zombie_traverse_v1
	barrier_walk	ai_zombie_traverse_v2
	barrier_run		ai_zombie_traverse_v5
	barrier_sprint	ai_zombie_traverse_v6
	barrier_sprint	ai_zombie_traverse_v7
}

zm_traverse_barrier_crawl : aliased restart missing_legs notify traverse_anim
{
	barrier_crawl	ai_zombie_traverse_crawl_v1
	barrier_crawl	ai_zombie_traverse_v4
}

zm_barricade_enter : aliased restart notify barricade_enter_anim
{
	barrier_walk_m		ai_zombie_barricade_enter_m_v1
	barrier_walk_m		ai_zombie_barricade_enter_m_v2
	barrier_run_m		ai_zombie_barricade_enter_m_v5
	barrier_sprint_m	ai_zombie_barricade_enter_m_v6
	barrier_sprint_m	ai_zombie_barricade_enter_m_v7

	barrier_walk_r		ai_zombie_barricade_enter_r
	barrier_run_r		ai_zombie_barricade_enter_run_r
	barrier_sprint_r	ai_zombie_barricade_enter_sprint_r

	barrier_walk_l		ai_zombie_barricade_enter_l
	barrier_run_l		ai_zombie_barricade_enter_run_l
	barrier_sprint_l	ai_zombie_barricade_enter_sprint_l
}

zm_barricade_enter_crawl : aliased restart missing_legs notify barricade_enter_anim
{
	barrier_walk_m		ai_zombie_barricade_enter_m_nolegs
	barrier_walk_m		ai_zombie_barricade_enter_m_v4
	barrier_run_m		ai_zombie_barricade_enter_m_nolegs
	barrier_sprint_m	ai_zombie_barricade_enter_m_nolegs

	barrier_walk_r		ai_zombie_crawl_barricade_enter_r
	barrier_run_r		ai_zombie_crawl_barricade_enter_run_r
	barrier_sprint_r	ai_zombie_crawl_barricade_enter_sprint_r

	barrier_walk_l		ai_zombie_crawl_barricade_enter_l
	barrier_run_l		ai_zombie_crawl_barricade_enter_run_l
	barrier_sprint_l	ai_zombie_crawl_barricade_enter_sprint_l
}

////traverse anims, not all necessarily used on every level
zm_traverse : aliased restart notify traverse_anim
{
	jump_down_40					ai_zombie_jump_down_40
	jump_down_fast_40				ai_zombie_jump_down_fast_40
//	jump_down_48					ai_zombie_jump_down_48
	jump_down_72					ai_zombie_jump_down_72
	jump_down_96					ai_zombie_jump_down_96
//	jump_down_120					ai_zombie_jump_down_120
	jump_down_127					ai_zombie_jump_down_127
//	jump_down_184					ai_zombie_jump_down_184
	jump_down_176					ai_zombie_jump_down_176
//	jump_down_190					ai_zombie_jump_down_190
//	jump_down_222					ai_zombie_jump_down_222
//	jump_down_240					ai_zombie_jump_down_240
//	jump_down_286					ai_zombie_jump_down_286
//	jump_down_386					ai_zombie_jump_down_386
	jump_up_72						ai_zombie_jump_up_72
	jump_up_96						ai_zombie_jump_up_96
	jump_up_154						ai_zombie_jump_up_154
	jump_up_127						ai_zombie_jump_up_127
	jump_up_222						ai_zombie_jump_up_222
	jump_up_to_climb				ai_zombie_jump_up_2_climb
//	jump_up_to_climb_coast			ai_zombie_jump_up_2_climb_coast
//	mantle_over_40_hurdle			ai_zombie_traverse_v6
	traverse_garage_door			ai_zombie_traverse_garage_roll	
}
//
////traverse anims, not all necessarily used on every level
zm_traverse_crawl : aliased restart missing_legs notify traverse_anim
{
	jump_down_40_crawl				ai_zombie_crawl_jump_down_40
	jump_down_fast_40_crawl			ai_zombie_crawl_jump_down_40
//	jump_down_48_crawl				ai_zombie_crawl_jump_down_48
	jump_down_72_crawl				ai_zombie_crawl_jump_down_72
	jump_down_96_crawl				ai_zombie_crawl_jump_down_96
//	jump_down_120_crawl				ai_zombie_crawl_jump_down_120
	jump_down_127_crawl				ai_zombie_crawl_jump_down_127
	jump_down_176_crawl				ai_zombie_crawl_jump_down_176
//	jump_down_184_crawl				ai_zombie_crawl_jump_down_184
//	jump_down_190_crawl				ai_zombie_crawl_jump_down_189
//	jump_down_222_crawl				ai_zombie_crawl_jump_down_222
//	jump_down_240_crawl				ai_zombie_crawl_jump_down_240
//	jump_down_286_crawl				ai_zombie_crawl_jump_down_286
//	jump_down_386_crawl				ai_zombie_crawl_jump_down_386
	jump_up_72_crawl				ai_zombie_crawl_jump_up_72
	jump_up_96_crawl				ai_zombie_crawl_jump_up_96
	jump_up_154_crawl				ai_zombie_crawl_jump_up_154
	jump_up_127_crawl				ai_zombie_crawl_jump_up_127
	jump_up_222_crawl				ai_zombie_crawl_jump_up_222
	jump_up_to_climb_crawl			ai_zombie_crawl_jump_up_2_climb
//	jump_up_to_climb_coast_crawl	ai_zombie_crawl_jump_up_2_climb_coast
//	mantle_over_40_hurdle_crawl		ai_zombie_traverse_crawl_v1
	traverse_garage_door_crawl		ai_zombie_crawl
}

