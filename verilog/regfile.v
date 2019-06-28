module regfile (/*AUTOARG*/
   // Outputs
   l2h__user_cfg_regs__user_cfg_3_user_cfg_r,
   l2h__user_cfg_regs__user_cfg_2_user_cfg_r,
   l2h__user_cfg_regs__user_cfg_1_user_cfg_r,
   l2h__user_cfg_regs__user_cfg_0_user_cfg_r, host_reg_rdata,
   host_reg_ack, host_reg_nack, reg_host_irq,
   // Inputs
   h2l__user_stat_regs__user_stat_5_user_stat_we,
   h2l__user_stat_regs__user_stat_5_user_stat_w,
   h2l__user_stat_regs__user_stat_4_user_stat_we,
   h2l__user_stat_regs__user_stat_4_user_stat_w,
   h2l__user_stat_regs__user_stat_3_user_stat_we,
   h2l__user_stat_regs__user_stat_3_user_stat_w,
   h2l__user_stat_regs__user_stat_2_user_stat_we,
   h2l__user_stat_regs__user_stat_2_user_stat_w,
   h2l__user_stat_regs__user_stat_1_user_stat_we,
   h2l__user_stat_regs__user_stat_1_user_stat_w,
   h2l__user_stat_regs__user_stat_0_user_stat_we,
   h2l__user_stat_regs__user_stat_0_user_stat_w,
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
   h2l__user_irq_flags__irq_0__user_irq_0_intr, clk, reset_n,
   host_reg_ren, host_reg_wen, host_reg_addr, host_reg_wdata,
   host_reg_wstrb
   );


   // ----------------------------------------------------------------------
   // I/O Declarations
   // ----------------------------------------------------------------------

   input wire 	      clk;
   input wire 	      reset_n;

   /* SPI Slave R/W I/F */
   input wire 	      host_reg_ren;
   input wire 	      host_reg_wen;
   input wire [9:0]   host_reg_addr;
   input wire [15:0]  host_reg_wdata;
   input wire [1:0]   host_reg_wstrb;
   output wire [15:0] host_reg_rdata;
   output wire 	      host_reg_ack;
   output wire 	      host_reg_nack;

   /* Global IRQ to Host */
   output wire 	      reg_host_irq;

   
   /*AUTOINPUT*/
   // Beginning of automatic inputs (from unused autoinst inputs)
   input		h2l__user_irq_flags__irq_0__user_irq_0_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_0__user_irq_1_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_0__user_irq_2_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_0__user_irq_3_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_0__user_irq_4_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_0__user_irq_5_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_0__user_irq_6_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_0__user_irq_7_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_10__user_irq_0_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_10__user_irq_1_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_10__user_irq_2_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_10__user_irq_3_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_10__user_irq_4_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_10__user_irq_5_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_10__user_irq_6_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_10__user_irq_7_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_11__user_irq_0_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_11__user_irq_1_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_11__user_irq_2_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_11__user_irq_3_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_11__user_irq_4_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_11__user_irq_5_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_11__user_irq_6_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_11__user_irq_7_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_12__user_irq_0_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_12__user_irq_1_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_12__user_irq_2_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_12__user_irq_3_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_12__user_irq_4_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_12__user_irq_5_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_12__user_irq_6_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_12__user_irq_7_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_13__user_irq_0_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_13__user_irq_1_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_13__user_irq_2_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_13__user_irq_3_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_13__user_irq_4_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_13__user_irq_5_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_13__user_irq_6_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_13__user_irq_7_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_14__user_irq_0_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_14__user_irq_1_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_14__user_irq_2_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_14__user_irq_3_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_14__user_irq_4_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_14__user_irq_5_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_14__user_irq_6_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_14__user_irq_7_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_15__user_irq_0_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_15__user_irq_1_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_15__user_irq_2_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_15__user_irq_3_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_15__user_irq_4_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_15__user_irq_5_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_15__user_irq_6_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_15__user_irq_7_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_1__user_irq_0_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_1__user_irq_1_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_1__user_irq_2_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_1__user_irq_3_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_1__user_irq_4_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_1__user_irq_5_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_1__user_irq_6_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_1__user_irq_7_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_2__user_irq_0_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_2__user_irq_1_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_2__user_irq_2_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_2__user_irq_3_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_2__user_irq_4_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_2__user_irq_5_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_2__user_irq_6_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_2__user_irq_7_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_3__user_irq_0_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_3__user_irq_1_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_3__user_irq_2_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_3__user_irq_3_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_3__user_irq_4_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_3__user_irq_5_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_3__user_irq_6_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_3__user_irq_7_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_4__user_irq_0_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_4__user_irq_1_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_4__user_irq_2_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_4__user_irq_3_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_4__user_irq_4_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_4__user_irq_5_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_4__user_irq_6_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_4__user_irq_7_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_5__user_irq_0_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_5__user_irq_1_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_5__user_irq_2_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_5__user_irq_3_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_5__user_irq_4_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_5__user_irq_5_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_5__user_irq_6_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_5__user_irq_7_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_6__user_irq_0_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_6__user_irq_1_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_6__user_irq_2_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_6__user_irq_3_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_6__user_irq_4_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_6__user_irq_5_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_6__user_irq_6_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_6__user_irq_7_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_7__user_irq_0_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_7__user_irq_1_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_7__user_irq_2_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_7__user_irq_3_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_7__user_irq_4_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_7__user_irq_5_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_7__user_irq_6_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_7__user_irq_7_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_8__user_irq_0_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_8__user_irq_1_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_8__user_irq_2_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_8__user_irq_3_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_8__user_irq_4_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_8__user_irq_5_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_8__user_irq_6_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_8__user_irq_7_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_9__user_irq_0_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_9__user_irq_1_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_9__user_irq_2_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_9__user_irq_3_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_9__user_irq_4_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_9__user_irq_5_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_9__user_irq_6_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_irq_flags__irq_9__user_irq_7_intr;// To u_regfile_pio of regfile_addr_map_pio.v
   input [15:0]		h2l__user_stat_regs__user_stat_0_user_stat_w;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_stat_regs__user_stat_0_user_stat_we;// To u_regfile_pio of regfile_addr_map_pio.v
   input [15:0]		h2l__user_stat_regs__user_stat_1_user_stat_w;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_stat_regs__user_stat_1_user_stat_we;// To u_regfile_pio of regfile_addr_map_pio.v
   input [15:0]		h2l__user_stat_regs__user_stat_2_user_stat_w;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_stat_regs__user_stat_2_user_stat_we;// To u_regfile_pio of regfile_addr_map_pio.v
   input [15:0]		h2l__user_stat_regs__user_stat_3_user_stat_w;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_stat_regs__user_stat_3_user_stat_we;// To u_regfile_pio of regfile_addr_map_pio.v
   input [15:0]		h2l__user_stat_regs__user_stat_4_user_stat_w;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_stat_regs__user_stat_4_user_stat_we;// To u_regfile_pio of regfile_addr_map_pio.v
   input [15:0]		h2l__user_stat_regs__user_stat_5_user_stat_w;// To u_regfile_pio of regfile_addr_map_pio.v
   input		h2l__user_stat_regs__user_stat_5_user_stat_we;// To u_regfile_pio of regfile_addr_map_pio.v
   // End of automatics
   
   /*AUTOOUTPUT*/
   // Beginning of automatic outputs (from unused autoinst outputs)
   output [15:0]	l2h__user_cfg_regs__user_cfg_0_user_cfg_r;// From u_regfile_pio of regfile_addr_map_pio.v
   output [15:0]	l2h__user_cfg_regs__user_cfg_1_user_cfg_r;// From u_regfile_pio of regfile_addr_map_pio.v
   output [15:0]	l2h__user_cfg_regs__user_cfg_2_user_cfg_r;// From u_regfile_pio of regfile_addr_map_pio.v
   output [15:0]	l2h__user_cfg_regs__user_cfg_3_user_cfg_r;// From u_regfile_pio of regfile_addr_map_pio.v
   // End of automatics

   /*AUTOWIRE*/
   
   // ----------------------------------------------------------------------
   // Reg/Wire Declarations
   // ----------------------------------------------------------------------
   /* The Host bus interface will always request 16-bit */
   wire host_reg_trans_size = 1'b1;

   
   // ----------------------------------------------------------------------
   // Register File Instantiation
   // ----------------------------------------------------------------------

   /*
    *   NOTE: 
    *     These modules are auto-generated from the RDL description of the regs. 
    */

   /* regfile_addr_map_pio AUTO_TEMPLATE (
    .sig_reset_n                            (reset_n),
    
    .l2h__status_intr_o                     (reg_host_irq),
    .l2h_.+_intr_o                          (),

    .h2d_pio_dec_address		    (host_reg_addr[7:0]),
    .h2d_pio_dec_write_data		    (host_reg_wdata[15:0]),
    .h2d_pio_dec_trans_size		    (host_reg_trans_size),
    .h2d_pio_dec_write		            (host_reg_wen),
    .h2d_pio_dec_read		            (host_reg_ren),
    
    .d2h_dec_pio_trans_size                 (),
    .d2h_dec_pio_read_data		    (host_reg_rdata[15:0]),
    .d2h_dec_pio_ack		            (host_reg_ack),
    .d2h_dec_pio_nack		            (host_reg_nack),
    
    ); */
   
   regfile_addr_map_pio
     u_regfile_pio
       (/*AUTOINST*/
	// Outputs
	.l2h__status_intr_o		(reg_host_irq),		 // Templated
	.l2h__user_irq_status_intr_o	(),			 // Templated
	.l2h__user_irq_flags__irq_0_intr_o(),			 // Templated
	.l2h__user_irq_flags__irq_1_intr_o(),			 // Templated
	.l2h__user_irq_flags__irq_2_intr_o(),			 // Templated
	.l2h__user_irq_flags__irq_3_intr_o(),			 // Templated
	.l2h__user_irq_flags__irq_4_intr_o(),			 // Templated
	.l2h__user_irq_flags__irq_5_intr_o(),			 // Templated
	.l2h__user_irq_flags__irq_6_intr_o(),			 // Templated
	.l2h__user_irq_flags__irq_7_intr_o(),			 // Templated
	.l2h__user_irq_flags__irq_8_intr_o(),			 // Templated
	.l2h__user_irq_flags__irq_9_intr_o(),			 // Templated
	.l2h__user_irq_flags__irq_10_intr_o(),			 // Templated
	.l2h__user_irq_flags__irq_11_intr_o(),			 // Templated
	.l2h__user_irq_flags__irq_12_intr_o(),			 // Templated
	.l2h__user_irq_flags__irq_13_intr_o(),			 // Templated
	.l2h__user_irq_flags__irq_14_intr_o(),			 // Templated
	.l2h__user_irq_flags__irq_15_intr_o(),			 // Templated
	.l2h__user_cfg_regs__user_cfg_0_user_cfg_r(l2h__user_cfg_regs__user_cfg_0_user_cfg_r[15:0]),
	.l2h__user_cfg_regs__user_cfg_1_user_cfg_r(l2h__user_cfg_regs__user_cfg_1_user_cfg_r[15:0]),
	.l2h__user_cfg_regs__user_cfg_2_user_cfg_r(l2h__user_cfg_regs__user_cfg_2_user_cfg_r[15:0]),
	.l2h__user_cfg_regs__user_cfg_3_user_cfg_r(l2h__user_cfg_regs__user_cfg_3_user_cfg_r[15:0]),
	.d2h_dec_pio_trans_size		(),			 // Templated
	.d2h_dec_pio_read_data		(host_reg_rdata[15:0]),	 // Templated
	.d2h_dec_pio_ack		(host_reg_ack),		 // Templated
	.d2h_dec_pio_nack		(host_reg_nack),	 // Templated
	// Inputs
	.clk				(clk),
	.sig_reset_n			(reset_n),		 // Templated
	.h2l__user_irq_flags__irq_0__user_irq_0_intr(h2l__user_irq_flags__irq_0__user_irq_0_intr),
	.h2l__user_irq_flags__irq_0__user_irq_1_intr(h2l__user_irq_flags__irq_0__user_irq_1_intr),
	.h2l__user_irq_flags__irq_0__user_irq_2_intr(h2l__user_irq_flags__irq_0__user_irq_2_intr),
	.h2l__user_irq_flags__irq_0__user_irq_3_intr(h2l__user_irq_flags__irq_0__user_irq_3_intr),
	.h2l__user_irq_flags__irq_0__user_irq_4_intr(h2l__user_irq_flags__irq_0__user_irq_4_intr),
	.h2l__user_irq_flags__irq_0__user_irq_5_intr(h2l__user_irq_flags__irq_0__user_irq_5_intr),
	.h2l__user_irq_flags__irq_0__user_irq_6_intr(h2l__user_irq_flags__irq_0__user_irq_6_intr),
	.h2l__user_irq_flags__irq_0__user_irq_7_intr(h2l__user_irq_flags__irq_0__user_irq_7_intr),
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
	.h2l__user_stat_regs__user_stat_5_user_stat_we(h2l__user_stat_regs__user_stat_5_user_stat_we),
	.h2d_pio_dec_address		(host_reg_addr[7:0]),	 // Templated
	.h2d_pio_dec_write_data		(host_reg_wdata[15:0]),	 // Templated
	.h2d_pio_dec_trans_size		(host_reg_trans_size),	 // Templated
	.h2d_pio_dec_write		(host_reg_wen),		 // Templated
	.h2d_pio_dec_read		(host_reg_ren));		 // Templated

   
endmodule // regfile

// Local Variables:
// verilog-library-directories:(".")
// End:
