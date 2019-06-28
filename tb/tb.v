`timescale 1ns/1ps

module tb(/*AUTOARG*/
   // Outputs
   reg_host_irq, l2h__user_cfg_regs__user_cfg_3_user_cfg_r,
   l2h__user_cfg_regs__user_cfg_2_user_cfg_r,
   l2h__user_cfg_regs__user_cfg_1_user_cfg_r,
   l2h__user_cfg_regs__user_cfg_0_user_cfg_r, host_reg_rdata,
   host_reg_nack, host_reg_ack,
   // Inputs
   reset_n, host_reg_wstrb, host_reg_wen, host_reg_wdata,
   host_reg_ren, host_reg_addr,
   h2l__user_irq_flags__irq_9__user_irq_7_intr,
   h2l__user_irq_flags__irq_9__user_irq_6_intr,
   h2l__user_irq_flags__irq_9__user_irq_5_intr,
   h2l__user_irq_flags__irq_9__user_irq_4_intr,
   h2l__user_irq_flags__irq_9__user_irq_3_intr,
   h2l__user_irq_flags__irq_9__user_irq_2_intr,
   h2l__user_irq_flags__irq_9__user_irq_1_intr,
   h2l__user_irq_flags__irq_9__user_irq_0_intr,
   h2l__user_irq_flags__irq_8__user_irq_7_intr,
   h2l__user_irq_flags__irq_8__user_irq_6_intr,
   h2l__user_irq_flags__irq_8__user_irq_5_intr,
   h2l__user_irq_flags__irq_8__user_irq_4_intr,
   h2l__user_irq_flags__irq_8__user_irq_3_intr,
   h2l__user_irq_flags__irq_8__user_irq_2_intr,
   h2l__user_irq_flags__irq_8__user_irq_1_intr,
   h2l__user_irq_flags__irq_8__user_irq_0_intr,
   h2l__user_irq_flags__irq_7__user_irq_7_intr,
   h2l__user_irq_flags__irq_7__user_irq_6_intr,
   h2l__user_irq_flags__irq_7__user_irq_5_intr,
   h2l__user_irq_flags__irq_7__user_irq_4_intr,
   h2l__user_irq_flags__irq_7__user_irq_3_intr,
   h2l__user_irq_flags__irq_7__user_irq_2_intr,
   h2l__user_irq_flags__irq_7__user_irq_1_intr,
   h2l__user_irq_flags__irq_7__user_irq_0_intr,
   h2l__user_irq_flags__irq_6__user_irq_7_intr,
   h2l__user_irq_flags__irq_6__user_irq_6_intr,
   h2l__user_irq_flags__irq_6__user_irq_5_intr,
   h2l__user_irq_flags__irq_6__user_irq_4_intr,
   h2l__user_irq_flags__irq_6__user_irq_3_intr,
   h2l__user_irq_flags__irq_6__user_irq_2_intr,
   h2l__user_irq_flags__irq_6__user_irq_1_intr,
   h2l__user_irq_flags__irq_6__user_irq_0_intr,
   h2l__user_irq_flags__irq_5__user_irq_7_intr,
   h2l__user_irq_flags__irq_5__user_irq_6_intr,
   h2l__user_irq_flags__irq_5__user_irq_5_intr,
   h2l__user_irq_flags__irq_5__user_irq_4_intr,
   h2l__user_irq_flags__irq_5__user_irq_3_intr,
   h2l__user_irq_flags__irq_5__user_irq_2_intr,
   h2l__user_irq_flags__irq_5__user_irq_1_intr,
   h2l__user_irq_flags__irq_5__user_irq_0_intr,
   h2l__user_irq_flags__irq_4__user_irq_7_intr,
   h2l__user_irq_flags__irq_4__user_irq_6_intr,
   h2l__user_irq_flags__irq_4__user_irq_5_intr,
   h2l__user_irq_flags__irq_4__user_irq_4_intr,
   h2l__user_irq_flags__irq_4__user_irq_3_intr,
   h2l__user_irq_flags__irq_4__user_irq_2_intr,
   h2l__user_irq_flags__irq_4__user_irq_1_intr,
   h2l__user_irq_flags__irq_4__user_irq_0_intr,
   h2l__user_irq_flags__irq_3__user_irq_7_intr,
   h2l__user_irq_flags__irq_3__user_irq_6_intr,
   h2l__user_irq_flags__irq_3__user_irq_5_intr,
   h2l__user_irq_flags__irq_3__user_irq_4_intr,
   h2l__user_irq_flags__irq_3__user_irq_3_intr,
   h2l__user_irq_flags__irq_3__user_irq_2_intr,
   h2l__user_irq_flags__irq_3__user_irq_1_intr,
   h2l__user_irq_flags__irq_3__user_irq_0_intr,
   h2l__user_irq_flags__irq_2__user_irq_7_intr,
   h2l__user_irq_flags__irq_2__user_irq_6_intr,
   h2l__user_irq_flags__irq_2__user_irq_5_intr,
   h2l__user_irq_flags__irq_2__user_irq_4_intr,
   h2l__user_irq_flags__irq_2__user_irq_3_intr,
   h2l__user_irq_flags__irq_2__user_irq_2_intr,
   h2l__user_irq_flags__irq_2__user_irq_1_intr,
   h2l__user_irq_flags__irq_2__user_irq_0_intr,
   h2l__user_irq_flags__irq_1__user_irq_7_intr,
   h2l__user_irq_flags__irq_1__user_irq_6_intr,
   h2l__user_irq_flags__irq_1__user_irq_5_intr,
   h2l__user_irq_flags__irq_1__user_irq_4_intr,
   h2l__user_irq_flags__irq_1__user_irq_3_intr,
   h2l__user_irq_flags__irq_1__user_irq_2_intr,
   h2l__user_irq_flags__irq_1__user_irq_1_intr,
   h2l__user_irq_flags__irq_1__user_irq_0_intr,
   h2l__user_irq_flags__irq_15__user_irq_7_intr,
   h2l__user_irq_flags__irq_15__user_irq_6_intr,
   h2l__user_irq_flags__irq_15__user_irq_5_intr,
   h2l__user_irq_flags__irq_15__user_irq_4_intr,
   h2l__user_irq_flags__irq_15__user_irq_3_intr,
   h2l__user_irq_flags__irq_15__user_irq_2_intr,
   h2l__user_irq_flags__irq_15__user_irq_1_intr,
   h2l__user_irq_flags__irq_15__user_irq_0_intr,
   h2l__user_irq_flags__irq_14__user_irq_7_intr,
   h2l__user_irq_flags__irq_14__user_irq_6_intr,
   h2l__user_irq_flags__irq_14__user_irq_5_intr,
   h2l__user_irq_flags__irq_14__user_irq_4_intr,
   h2l__user_irq_flags__irq_14__user_irq_3_intr,
   h2l__user_irq_flags__irq_14__user_irq_2_intr,
   h2l__user_irq_flags__irq_14__user_irq_1_intr,
   h2l__user_irq_flags__irq_14__user_irq_0_intr,
   h2l__user_irq_flags__irq_13__user_irq_7_intr,
   h2l__user_irq_flags__irq_13__user_irq_6_intr,
   h2l__user_irq_flags__irq_13__user_irq_5_intr,
   h2l__user_irq_flags__irq_13__user_irq_4_intr,
   h2l__user_irq_flags__irq_13__user_irq_3_intr,
   h2l__user_irq_flags__irq_13__user_irq_2_intr,
   h2l__user_irq_flags__irq_13__user_irq_1_intr,
   h2l__user_irq_flags__irq_13__user_irq_0_intr,
   h2l__user_irq_flags__irq_12__user_irq_7_intr,
   h2l__user_irq_flags__irq_12__user_irq_6_intr,
   h2l__user_irq_flags__irq_12__user_irq_5_intr,
   h2l__user_irq_flags__irq_12__user_irq_4_intr,
   h2l__user_irq_flags__irq_12__user_irq_3_intr,
   h2l__user_irq_flags__irq_12__user_irq_2_intr,
   h2l__user_irq_flags__irq_12__user_irq_1_intr,
   h2l__user_irq_flags__irq_12__user_irq_0_intr,
   h2l__user_irq_flags__irq_11__user_irq_7_intr,
   h2l__user_irq_flags__irq_11__user_irq_6_intr,
   h2l__user_irq_flags__irq_11__user_irq_5_intr,
   h2l__user_irq_flags__irq_11__user_irq_4_intr,
   h2l__user_irq_flags__irq_11__user_irq_3_intr,
   h2l__user_irq_flags__irq_11__user_irq_2_intr,
   h2l__user_irq_flags__irq_11__user_irq_1_intr,
   h2l__user_irq_flags__irq_11__user_irq_0_intr,
   h2l__user_irq_flags__irq_10__user_irq_7_intr,
   h2l__user_irq_flags__irq_10__user_irq_6_intr,
   h2l__user_irq_flags__irq_10__user_irq_5_intr,
   h2l__user_irq_flags__irq_10__user_irq_4_intr,
   h2l__user_irq_flags__irq_10__user_irq_3_intr,
   h2l__user_irq_flags__irq_10__user_irq_2_intr,
   h2l__user_irq_flags__irq_10__user_irq_1_intr,
   h2l__user_irq_flags__irq_10__user_irq_0_intr,
   h2l__user_irq_flags__irq_0__user_irq_7_intr,
   h2l__user_irq_flags__irq_0__user_irq_6_intr,
   h2l__user_irq_flags__irq_0__user_irq_5_intr,
   h2l__user_irq_flags__irq_0__user_irq_4_intr,
   h2l__user_irq_flags__irq_0__user_irq_3_intr,
   h2l__user_irq_flags__irq_0__user_irq_2_intr,
   h2l__user_irq_flags__irq_0__user_irq_1_intr,
   h2l__user_irq_flags__irq_0__user_irq_0_intr, clk
   );

   /*AUTOINPUT*/
   // Beginning of automatic inputs (from unused autoinst inputs)
   input		clk;			// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_0__user_irq_0_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_0__user_irq_1_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_0__user_irq_2_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_0__user_irq_3_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_0__user_irq_4_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_0__user_irq_5_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_0__user_irq_6_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_0__user_irq_7_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_10__user_irq_0_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_10__user_irq_1_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_10__user_irq_2_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_10__user_irq_3_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_10__user_irq_4_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_10__user_irq_5_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_10__user_irq_6_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_10__user_irq_7_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_11__user_irq_0_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_11__user_irq_1_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_11__user_irq_2_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_11__user_irq_3_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_11__user_irq_4_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_11__user_irq_5_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_11__user_irq_6_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_11__user_irq_7_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_12__user_irq_0_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_12__user_irq_1_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_12__user_irq_2_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_12__user_irq_3_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_12__user_irq_4_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_12__user_irq_5_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_12__user_irq_6_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_12__user_irq_7_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_13__user_irq_0_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_13__user_irq_1_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_13__user_irq_2_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_13__user_irq_3_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_13__user_irq_4_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_13__user_irq_5_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_13__user_irq_6_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_13__user_irq_7_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_14__user_irq_0_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_14__user_irq_1_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_14__user_irq_2_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_14__user_irq_3_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_14__user_irq_4_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_14__user_irq_5_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_14__user_irq_6_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_14__user_irq_7_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_15__user_irq_0_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_15__user_irq_1_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_15__user_irq_2_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_15__user_irq_3_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_15__user_irq_4_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_15__user_irq_5_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_15__user_irq_6_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_15__user_irq_7_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_1__user_irq_0_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_1__user_irq_1_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_1__user_irq_2_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_1__user_irq_3_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_1__user_irq_4_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_1__user_irq_5_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_1__user_irq_6_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_1__user_irq_7_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_2__user_irq_0_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_2__user_irq_1_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_2__user_irq_2_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_2__user_irq_3_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_2__user_irq_4_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_2__user_irq_5_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_2__user_irq_6_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_2__user_irq_7_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_3__user_irq_0_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_3__user_irq_1_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_3__user_irq_2_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_3__user_irq_3_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_3__user_irq_4_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_3__user_irq_5_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_3__user_irq_6_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_3__user_irq_7_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_4__user_irq_0_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_4__user_irq_1_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_4__user_irq_2_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_4__user_irq_3_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_4__user_irq_4_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_4__user_irq_5_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_4__user_irq_6_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_4__user_irq_7_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_5__user_irq_0_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_5__user_irq_1_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_5__user_irq_2_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_5__user_irq_3_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_5__user_irq_4_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_5__user_irq_5_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_5__user_irq_6_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_5__user_irq_7_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_6__user_irq_0_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_6__user_irq_1_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_6__user_irq_2_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_6__user_irq_3_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_6__user_irq_4_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_6__user_irq_5_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_6__user_irq_6_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_6__user_irq_7_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_7__user_irq_0_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_7__user_irq_1_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_7__user_irq_2_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_7__user_irq_3_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_7__user_irq_4_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_7__user_irq_5_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_7__user_irq_6_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_7__user_irq_7_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_8__user_irq_0_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_8__user_irq_1_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_8__user_irq_2_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_8__user_irq_3_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_8__user_irq_4_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_8__user_irq_5_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_8__user_irq_6_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_8__user_irq_7_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_9__user_irq_0_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_9__user_irq_1_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_9__user_irq_2_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_9__user_irq_3_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_9__user_irq_4_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_9__user_irq_5_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_9__user_irq_6_intr;// To u_regfile of regfile.v
   input		h2l__user_irq_flags__irq_9__user_irq_7_intr;// To u_regfile of regfile.v
   input [9:0]		host_reg_addr;		// To u_regfile of regfile.v
   input		host_reg_ren;		// To u_regfile of regfile.v
   input [15:0]		host_reg_wdata;		// To u_regfile of regfile.v
   input		host_reg_wen;		// To u_regfile of regfile.v
   input [1:0]		host_reg_wstrb;		// To u_regfile of regfile.v
   input		reset_n;		// To u_regfile of regfile.v
   // End of automatics

   /*AUTOOUTPUT*/
   // Beginning of automatic outputs (from unused autoinst outputs)
   output		host_reg_ack;		// From u_regfile of regfile.v
   output		host_reg_nack;		// From u_regfile of regfile.v
   output [15:0]	host_reg_rdata;		// From u_regfile of regfile.v
   output [15:0]	l2h__user_cfg_regs__user_cfg_0_user_cfg_r;// From u_regfile of regfile.v
   output [15:0]	l2h__user_cfg_regs__user_cfg_1_user_cfg_r;// From u_regfile of regfile.v
   output [15:0]	l2h__user_cfg_regs__user_cfg_2_user_cfg_r;// From u_regfile of regfile.v
   output [15:0]	l2h__user_cfg_regs__user_cfg_3_user_cfg_r;// From u_regfile of regfile.v
   output		reg_host_irq;		// From u_regfile of regfile.v
   // End of automatics

   /*AUTOWIRE*/

   wire [15:0] h2l__user_stat_regs__user_stat_0_user_stat_w = 16'd0;
   wire [15:0] h2l__user_stat_regs__user_stat_1_user_stat_w = 16'd0;
   wire [15:0] h2l__user_stat_regs__user_stat_2_user_stat_w = 16'd0;
   wire [15:0] h2l__user_stat_regs__user_stat_3_user_stat_w = 16'd0;
   wire [15:0] h2l__user_stat_regs__user_stat_4_user_stat_w = 16'd0;
   wire [15:0] h2l__user_stat_regs__user_stat_5_user_stat_w = 16'd0;

   wire h2l__user_stat_regs__user_stat_0_user_stat_we = 1'b0;
   wire h2l__user_stat_regs__user_stat_1_user_stat_we = 1'b0;
   wire h2l__user_stat_regs__user_stat_2_user_stat_we = 1'b0;
   wire h2l__user_stat_regs__user_stat_3_user_stat_we = 1'b0;
   wire h2l__user_stat_regs__user_stat_4_user_stat_we = 1'b0;
   wire h2l__user_stat_regs__user_stat_5_user_stat_we = 1'b0;
   
   // ----------------------------------------------------------------------
   // DUT
   // ----------------------------------------------------------------------
   
   regfile
     u_regfile (/*AUTOINST*/
		// Outputs
		.host_reg_rdata		(host_reg_rdata[15:0]),
		.host_reg_ack		(host_reg_ack),
		.host_reg_nack		(host_reg_nack),
		.reg_host_irq		(reg_host_irq),
		.l2h__user_cfg_regs__user_cfg_0_user_cfg_r(l2h__user_cfg_regs__user_cfg_0_user_cfg_r[15:0]),
		.l2h__user_cfg_regs__user_cfg_1_user_cfg_r(l2h__user_cfg_regs__user_cfg_1_user_cfg_r[15:0]),
		.l2h__user_cfg_regs__user_cfg_2_user_cfg_r(l2h__user_cfg_regs__user_cfg_2_user_cfg_r[15:0]),
		.l2h__user_cfg_regs__user_cfg_3_user_cfg_r(l2h__user_cfg_regs__user_cfg_3_user_cfg_r[15:0]),
		// Inputs
		.clk			(clk),
		.reset_n		(reset_n),
		.host_reg_ren		(host_reg_ren),
		.host_reg_wen		(host_reg_wen),
		.host_reg_addr		(host_reg_addr[9:0]),
		.host_reg_wdata		(host_reg_wdata[15:0]),
		.host_reg_wstrb		(host_reg_wstrb[1:0]),
		.h2l__user_irq_flags__irq_0__user_irq_0_intr(h2l__user_irq_flags__irq_0__user_irq_0_intr),
		.h2l__user_irq_flags__irq_0__user_irq_1_intr(h2l__user_irq_flags__irq_0__user_irq_1_intr),
		.h2l__user_irq_flags__irq_0__user_irq_2_intr(h2l__user_irq_flags__irq_0__user_irq_2_intr),
		.h2l__user_irq_flags__irq_0__user_irq_3_intr(h2l__user_irq_flags__irq_0__user_irq_3_intr),
		.h2l__user_irq_flags__irq_0__user_irq_4_intr(h2l__user_irq_flags__irq_0__user_irq_4_intr),
		.h2l__user_irq_flags__irq_0__user_irq_5_intr(h2l__user_irq_flags__irq_0__user_irq_5_intr),
		.h2l__user_irq_flags__irq_0__user_irq_6_intr(h2l__user_irq_flags__irq_0__user_irq_6_intr),
		.h2l__user_irq_flags__irq_0__user_irq_7_intr(h2l__user_irq_flags__irq_0__user_irq_7_intr),
		.h2l__user_irq_flags__irq_10__user_irq_0_intr(h2l__user_irq_flags__irq_10__user_irq_0_intr),
		.h2l__user_irq_flags__irq_10__user_irq_1_intr(h2l__user_irq_flags__irq_10__user_irq_1_intr),
		.h2l__user_irq_flags__irq_10__user_irq_2_intr(h2l__user_irq_flags__irq_10__user_irq_2_intr),
		.h2l__user_irq_flags__irq_10__user_irq_3_intr(h2l__user_irq_flags__irq_10__user_irq_3_intr),
		.h2l__user_irq_flags__irq_10__user_irq_4_intr(h2l__user_irq_flags__irq_10__user_irq_4_intr),
		.h2l__user_irq_flags__irq_10__user_irq_5_intr(h2l__user_irq_flags__irq_10__user_irq_5_intr),
		.h2l__user_irq_flags__irq_10__user_irq_6_intr(h2l__user_irq_flags__irq_10__user_irq_6_intr),
		.h2l__user_irq_flags__irq_10__user_irq_7_intr(h2l__user_irq_flags__irq_10__user_irq_7_intr),
		.h2l__user_irq_flags__irq_11__user_irq_0_intr(h2l__user_irq_flags__irq_11__user_irq_0_intr),
		.h2l__user_irq_flags__irq_11__user_irq_1_intr(h2l__user_irq_flags__irq_11__user_irq_1_intr),
		.h2l__user_irq_flags__irq_11__user_irq_2_intr(h2l__user_irq_flags__irq_11__user_irq_2_intr),
		.h2l__user_irq_flags__irq_11__user_irq_3_intr(h2l__user_irq_flags__irq_11__user_irq_3_intr),
		.h2l__user_irq_flags__irq_11__user_irq_4_intr(h2l__user_irq_flags__irq_11__user_irq_4_intr),
		.h2l__user_irq_flags__irq_11__user_irq_5_intr(h2l__user_irq_flags__irq_11__user_irq_5_intr),
		.h2l__user_irq_flags__irq_11__user_irq_6_intr(h2l__user_irq_flags__irq_11__user_irq_6_intr),
		.h2l__user_irq_flags__irq_11__user_irq_7_intr(h2l__user_irq_flags__irq_11__user_irq_7_intr),
		.h2l__user_irq_flags__irq_12__user_irq_0_intr(h2l__user_irq_flags__irq_12__user_irq_0_intr),
		.h2l__user_irq_flags__irq_12__user_irq_1_intr(h2l__user_irq_flags__irq_12__user_irq_1_intr),
		.h2l__user_irq_flags__irq_12__user_irq_2_intr(h2l__user_irq_flags__irq_12__user_irq_2_intr),
		.h2l__user_irq_flags__irq_12__user_irq_3_intr(h2l__user_irq_flags__irq_12__user_irq_3_intr),
		.h2l__user_irq_flags__irq_12__user_irq_4_intr(h2l__user_irq_flags__irq_12__user_irq_4_intr),
		.h2l__user_irq_flags__irq_12__user_irq_5_intr(h2l__user_irq_flags__irq_12__user_irq_5_intr),
		.h2l__user_irq_flags__irq_12__user_irq_6_intr(h2l__user_irq_flags__irq_12__user_irq_6_intr),
		.h2l__user_irq_flags__irq_12__user_irq_7_intr(h2l__user_irq_flags__irq_12__user_irq_7_intr),
		.h2l__user_irq_flags__irq_13__user_irq_0_intr(h2l__user_irq_flags__irq_13__user_irq_0_intr),
		.h2l__user_irq_flags__irq_13__user_irq_1_intr(h2l__user_irq_flags__irq_13__user_irq_1_intr),
		.h2l__user_irq_flags__irq_13__user_irq_2_intr(h2l__user_irq_flags__irq_13__user_irq_2_intr),
		.h2l__user_irq_flags__irq_13__user_irq_3_intr(h2l__user_irq_flags__irq_13__user_irq_3_intr),
		.h2l__user_irq_flags__irq_13__user_irq_4_intr(h2l__user_irq_flags__irq_13__user_irq_4_intr),
		.h2l__user_irq_flags__irq_13__user_irq_5_intr(h2l__user_irq_flags__irq_13__user_irq_5_intr),
		.h2l__user_irq_flags__irq_13__user_irq_6_intr(h2l__user_irq_flags__irq_13__user_irq_6_intr),
		.h2l__user_irq_flags__irq_13__user_irq_7_intr(h2l__user_irq_flags__irq_13__user_irq_7_intr),
		.h2l__user_irq_flags__irq_14__user_irq_0_intr(h2l__user_irq_flags__irq_14__user_irq_0_intr),
		.h2l__user_irq_flags__irq_14__user_irq_1_intr(h2l__user_irq_flags__irq_14__user_irq_1_intr),
		.h2l__user_irq_flags__irq_14__user_irq_2_intr(h2l__user_irq_flags__irq_14__user_irq_2_intr),
		.h2l__user_irq_flags__irq_14__user_irq_3_intr(h2l__user_irq_flags__irq_14__user_irq_3_intr),
		.h2l__user_irq_flags__irq_14__user_irq_4_intr(h2l__user_irq_flags__irq_14__user_irq_4_intr),
		.h2l__user_irq_flags__irq_14__user_irq_5_intr(h2l__user_irq_flags__irq_14__user_irq_5_intr),
		.h2l__user_irq_flags__irq_14__user_irq_6_intr(h2l__user_irq_flags__irq_14__user_irq_6_intr),
		.h2l__user_irq_flags__irq_14__user_irq_7_intr(h2l__user_irq_flags__irq_14__user_irq_7_intr),
		.h2l__user_irq_flags__irq_15__user_irq_0_intr(h2l__user_irq_flags__irq_15__user_irq_0_intr),
		.h2l__user_irq_flags__irq_15__user_irq_1_intr(h2l__user_irq_flags__irq_15__user_irq_1_intr),
		.h2l__user_irq_flags__irq_15__user_irq_2_intr(h2l__user_irq_flags__irq_15__user_irq_2_intr),
		.h2l__user_irq_flags__irq_15__user_irq_3_intr(h2l__user_irq_flags__irq_15__user_irq_3_intr),
		.h2l__user_irq_flags__irq_15__user_irq_4_intr(h2l__user_irq_flags__irq_15__user_irq_4_intr),
		.h2l__user_irq_flags__irq_15__user_irq_5_intr(h2l__user_irq_flags__irq_15__user_irq_5_intr),
		.h2l__user_irq_flags__irq_15__user_irq_6_intr(h2l__user_irq_flags__irq_15__user_irq_6_intr),
		.h2l__user_irq_flags__irq_15__user_irq_7_intr(h2l__user_irq_flags__irq_15__user_irq_7_intr),
		.h2l__user_irq_flags__irq_1__user_irq_0_intr(h2l__user_irq_flags__irq_1__user_irq_0_intr),
		.h2l__user_irq_flags__irq_1__user_irq_1_intr(h2l__user_irq_flags__irq_1__user_irq_1_intr),
		.h2l__user_irq_flags__irq_1__user_irq_2_intr(h2l__user_irq_flags__irq_1__user_irq_2_intr),
		.h2l__user_irq_flags__irq_1__user_irq_3_intr(h2l__user_irq_flags__irq_1__user_irq_3_intr),
		.h2l__user_irq_flags__irq_1__user_irq_4_intr(h2l__user_irq_flags__irq_1__user_irq_4_intr),
		.h2l__user_irq_flags__irq_1__user_irq_5_intr(h2l__user_irq_flags__irq_1__user_irq_5_intr),
		.h2l__user_irq_flags__irq_1__user_irq_6_intr(h2l__user_irq_flags__irq_1__user_irq_6_intr),
		.h2l__user_irq_flags__irq_1__user_irq_7_intr(h2l__user_irq_flags__irq_1__user_irq_7_intr),
		.h2l__user_irq_flags__irq_2__user_irq_0_intr(h2l__user_irq_flags__irq_2__user_irq_0_intr),
		.h2l__user_irq_flags__irq_2__user_irq_1_intr(h2l__user_irq_flags__irq_2__user_irq_1_intr),
		.h2l__user_irq_flags__irq_2__user_irq_2_intr(h2l__user_irq_flags__irq_2__user_irq_2_intr),
		.h2l__user_irq_flags__irq_2__user_irq_3_intr(h2l__user_irq_flags__irq_2__user_irq_3_intr),
		.h2l__user_irq_flags__irq_2__user_irq_4_intr(h2l__user_irq_flags__irq_2__user_irq_4_intr),
		.h2l__user_irq_flags__irq_2__user_irq_5_intr(h2l__user_irq_flags__irq_2__user_irq_5_intr),
		.h2l__user_irq_flags__irq_2__user_irq_6_intr(h2l__user_irq_flags__irq_2__user_irq_6_intr),
		.h2l__user_irq_flags__irq_2__user_irq_7_intr(h2l__user_irq_flags__irq_2__user_irq_7_intr),
		.h2l__user_irq_flags__irq_3__user_irq_0_intr(h2l__user_irq_flags__irq_3__user_irq_0_intr),
		.h2l__user_irq_flags__irq_3__user_irq_1_intr(h2l__user_irq_flags__irq_3__user_irq_1_intr),
		.h2l__user_irq_flags__irq_3__user_irq_2_intr(h2l__user_irq_flags__irq_3__user_irq_2_intr),
		.h2l__user_irq_flags__irq_3__user_irq_3_intr(h2l__user_irq_flags__irq_3__user_irq_3_intr),
		.h2l__user_irq_flags__irq_3__user_irq_4_intr(h2l__user_irq_flags__irq_3__user_irq_4_intr),
		.h2l__user_irq_flags__irq_3__user_irq_5_intr(h2l__user_irq_flags__irq_3__user_irq_5_intr),
		.h2l__user_irq_flags__irq_3__user_irq_6_intr(h2l__user_irq_flags__irq_3__user_irq_6_intr),
		.h2l__user_irq_flags__irq_3__user_irq_7_intr(h2l__user_irq_flags__irq_3__user_irq_7_intr),
		.h2l__user_irq_flags__irq_4__user_irq_0_intr(h2l__user_irq_flags__irq_4__user_irq_0_intr),
		.h2l__user_irq_flags__irq_4__user_irq_1_intr(h2l__user_irq_flags__irq_4__user_irq_1_intr),
		.h2l__user_irq_flags__irq_4__user_irq_2_intr(h2l__user_irq_flags__irq_4__user_irq_2_intr),
		.h2l__user_irq_flags__irq_4__user_irq_3_intr(h2l__user_irq_flags__irq_4__user_irq_3_intr),
		.h2l__user_irq_flags__irq_4__user_irq_4_intr(h2l__user_irq_flags__irq_4__user_irq_4_intr),
		.h2l__user_irq_flags__irq_4__user_irq_5_intr(h2l__user_irq_flags__irq_4__user_irq_5_intr),
		.h2l__user_irq_flags__irq_4__user_irq_6_intr(h2l__user_irq_flags__irq_4__user_irq_6_intr),
		.h2l__user_irq_flags__irq_4__user_irq_7_intr(h2l__user_irq_flags__irq_4__user_irq_7_intr),
		.h2l__user_irq_flags__irq_5__user_irq_0_intr(h2l__user_irq_flags__irq_5__user_irq_0_intr),
		.h2l__user_irq_flags__irq_5__user_irq_1_intr(h2l__user_irq_flags__irq_5__user_irq_1_intr),
		.h2l__user_irq_flags__irq_5__user_irq_2_intr(h2l__user_irq_flags__irq_5__user_irq_2_intr),
		.h2l__user_irq_flags__irq_5__user_irq_3_intr(h2l__user_irq_flags__irq_5__user_irq_3_intr),
		.h2l__user_irq_flags__irq_5__user_irq_4_intr(h2l__user_irq_flags__irq_5__user_irq_4_intr),
		.h2l__user_irq_flags__irq_5__user_irq_5_intr(h2l__user_irq_flags__irq_5__user_irq_5_intr),
		.h2l__user_irq_flags__irq_5__user_irq_6_intr(h2l__user_irq_flags__irq_5__user_irq_6_intr),
		.h2l__user_irq_flags__irq_5__user_irq_7_intr(h2l__user_irq_flags__irq_5__user_irq_7_intr),
		.h2l__user_irq_flags__irq_6__user_irq_0_intr(h2l__user_irq_flags__irq_6__user_irq_0_intr),
		.h2l__user_irq_flags__irq_6__user_irq_1_intr(h2l__user_irq_flags__irq_6__user_irq_1_intr),
		.h2l__user_irq_flags__irq_6__user_irq_2_intr(h2l__user_irq_flags__irq_6__user_irq_2_intr),
		.h2l__user_irq_flags__irq_6__user_irq_3_intr(h2l__user_irq_flags__irq_6__user_irq_3_intr),
		.h2l__user_irq_flags__irq_6__user_irq_4_intr(h2l__user_irq_flags__irq_6__user_irq_4_intr),
		.h2l__user_irq_flags__irq_6__user_irq_5_intr(h2l__user_irq_flags__irq_6__user_irq_5_intr),
		.h2l__user_irq_flags__irq_6__user_irq_6_intr(h2l__user_irq_flags__irq_6__user_irq_6_intr),
		.h2l__user_irq_flags__irq_6__user_irq_7_intr(h2l__user_irq_flags__irq_6__user_irq_7_intr),
		.h2l__user_irq_flags__irq_7__user_irq_0_intr(h2l__user_irq_flags__irq_7__user_irq_0_intr),
		.h2l__user_irq_flags__irq_7__user_irq_1_intr(h2l__user_irq_flags__irq_7__user_irq_1_intr),
		.h2l__user_irq_flags__irq_7__user_irq_2_intr(h2l__user_irq_flags__irq_7__user_irq_2_intr),
		.h2l__user_irq_flags__irq_7__user_irq_3_intr(h2l__user_irq_flags__irq_7__user_irq_3_intr),
		.h2l__user_irq_flags__irq_7__user_irq_4_intr(h2l__user_irq_flags__irq_7__user_irq_4_intr),
		.h2l__user_irq_flags__irq_7__user_irq_5_intr(h2l__user_irq_flags__irq_7__user_irq_5_intr),
		.h2l__user_irq_flags__irq_7__user_irq_6_intr(h2l__user_irq_flags__irq_7__user_irq_6_intr),
		.h2l__user_irq_flags__irq_7__user_irq_7_intr(h2l__user_irq_flags__irq_7__user_irq_7_intr),
		.h2l__user_irq_flags__irq_8__user_irq_0_intr(h2l__user_irq_flags__irq_8__user_irq_0_intr),
		.h2l__user_irq_flags__irq_8__user_irq_1_intr(h2l__user_irq_flags__irq_8__user_irq_1_intr),
		.h2l__user_irq_flags__irq_8__user_irq_2_intr(h2l__user_irq_flags__irq_8__user_irq_2_intr),
		.h2l__user_irq_flags__irq_8__user_irq_3_intr(h2l__user_irq_flags__irq_8__user_irq_3_intr),
		.h2l__user_irq_flags__irq_8__user_irq_4_intr(h2l__user_irq_flags__irq_8__user_irq_4_intr),
		.h2l__user_irq_flags__irq_8__user_irq_5_intr(h2l__user_irq_flags__irq_8__user_irq_5_intr),
		.h2l__user_irq_flags__irq_8__user_irq_6_intr(h2l__user_irq_flags__irq_8__user_irq_6_intr),
		.h2l__user_irq_flags__irq_8__user_irq_7_intr(h2l__user_irq_flags__irq_8__user_irq_7_intr),
		.h2l__user_irq_flags__irq_9__user_irq_0_intr(h2l__user_irq_flags__irq_9__user_irq_0_intr),
		.h2l__user_irq_flags__irq_9__user_irq_1_intr(h2l__user_irq_flags__irq_9__user_irq_1_intr),
		.h2l__user_irq_flags__irq_9__user_irq_2_intr(h2l__user_irq_flags__irq_9__user_irq_2_intr),
		.h2l__user_irq_flags__irq_9__user_irq_3_intr(h2l__user_irq_flags__irq_9__user_irq_3_intr),
		.h2l__user_irq_flags__irq_9__user_irq_4_intr(h2l__user_irq_flags__irq_9__user_irq_4_intr),
		.h2l__user_irq_flags__irq_9__user_irq_5_intr(h2l__user_irq_flags__irq_9__user_irq_5_intr),
		.h2l__user_irq_flags__irq_9__user_irq_6_intr(h2l__user_irq_flags__irq_9__user_irq_6_intr),
		.h2l__user_irq_flags__irq_9__user_irq_7_intr(h2l__user_irq_flags__irq_9__user_irq_7_intr),
		.h2l__user_stat_regs__user_stat_0_user_stat_w(h2l__user_stat_regs__user_stat_0_user_stat_w[15:0]),
		.h2l__user_stat_regs__user_stat_0_user_stat_we(h2l__user_stat_regs__user_stat_0_user_stat_we),
		.h2l__user_stat_regs__user_stat_1_user_stat_w(h2l__user_stat_regs__user_stat_1_user_stat_w[15:0]),
		.h2l__user_stat_regs__user_stat_1_user_stat_we(h2l__user_stat_regs__user_stat_1_user_stat_we),
		.h2l__user_stat_regs__user_stat_2_user_stat_w(h2l__user_stat_regs__user_stat_2_user_stat_w[15:0]),
		.h2l__user_stat_regs__user_stat_2_user_stat_we(h2l__user_stat_regs__user_stat_2_user_stat_we),
		.h2l__user_stat_regs__user_stat_3_user_stat_w(h2l__user_stat_regs__user_stat_3_user_stat_w[15:0]),
		.h2l__user_stat_regs__user_stat_3_user_stat_we(h2l__user_stat_regs__user_stat_3_user_stat_we),
		.h2l__user_stat_regs__user_stat_4_user_stat_w(h2l__user_stat_regs__user_stat_4_user_stat_w[15:0]),
		.h2l__user_stat_regs__user_stat_4_user_stat_we(h2l__user_stat_regs__user_stat_4_user_stat_we),
		.h2l__user_stat_regs__user_stat_5_user_stat_w(h2l__user_stat_regs__user_stat_5_user_stat_w[15:0]),
		.h2l__user_stat_regs__user_stat_5_user_stat_we(h2l__user_stat_regs__user_stat_5_user_stat_we));


   initial
     begin
	$dumpfile("regfile.vcd");
	$dumpvars(0, tb);
     end
   
endmodule // tb

// Local Variables:
// verilog-library-directories:("./" "../verilog")
// End:
