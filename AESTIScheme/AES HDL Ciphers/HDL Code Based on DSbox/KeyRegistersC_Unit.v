`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:09:57 10/31/2022 
// Design Name: 
// Module Name:    KeyRegistersC_Unit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module KeyRegistersC_Unit(
	input				clk,
	input				en,
	
	input				dochoosesboxin,
	input				key_reg_move,
	input				dofirstsubkey,
	input				dokeyfirstcol,
	input				dokeyothercol,
	input				doxorRcon,
	input	[07:00]		Rcon,
	
	input	[15:00]		keyin,
	output	[15:00]		subkey,
	output	[15:00]		keytosbox
    );
	
	// intermediate;
	reg		[07:00]	k0, k1, k2, k3;
	reg		[07:00]	k4, k5, k6, k7;
	reg		[07:00]	k8, k9, k10,k11;
	reg		[07:00]	k12,k13,k14,k15;
	
	wire	[07:00]	k0_in,  k1_in,  k2_in, k3_in;
	wire	[07:00]	k4_in,  k5_in,  k6_in, k7_in;
	wire	[07:00]	k8_in,  k9_in,  k10_in,k11_in;
	wire	[07:00]	k12_in, k13_in, k14_in,k15_in;
	
	wire	[07:00]	affine_out0;
	wire	[07:00]	affine_out1;
	
	reg		[15:00]	KeySbox_tmp;
	
	wire	[07:00]	nextkey0;
	wire	[07:00]	nextkey1;
	
	// nextkey0, nextkey1;
	assign nextkey0 = dokeyfirstcol ? (k0 ^ affine_out0 ^ (doxorRcon ? Rcon : 8'h00)) : (k0 ^ k12);
	assign nextkey1 = dokeyfirstcol ? (k1 ^ affine_out1) : (k1 ^ k13);
	
	// KeyOut;
	assign subkey[15:08] = dofirstsubkey ? k0 : nextkey0;
	assign subkey[07:00] = dofirstsubkey ? k1 : nextkey1;
	
	assign keytosbox[15:08] = k13;
	assign keytosbox[07:00]	= k14;
	
	// affine_outputC;
	AffineOutputC_Unit Inst_AffineOutputC_Unit0(
	.A				(KeySbox_tmp[15:08]),
	.Z				(affine_out0)
    );
	AffineOutputC_Unit Inst_AffineOutputC_Unit1(
	.A				(KeySbox_tmp[07:00]),
	.Z				(affine_out1)
    );
	
	// KeySbox_tmp;
	always @(posedge clk) KeySbox_tmp <= keyin;
	
	// k0_in, k0;
	assign k0_in = en ? k1 : (key_reg_move ? k2 : k0);
	always @(posedge clk) k0 <= k0_in;
	
	// k1_in, k1;
	assign k1_in = en ? k2 : (key_reg_move ? k3 : k1);
	always @(posedge clk) k1 <= k1_in;
	
	// k2_in, k2;
	assign k2_in = en ? k3 : (dochoosesboxin ? k0 : (key_reg_move ? k4 : k2));
	always @(posedge clk) k2 <= k2_in;

	// k3_in, k3;
	assign k3_in = en ? k4 : (dochoosesboxin ? k1 : (key_reg_move ? k5 : k3));
	always @(posedge clk) k3 <= k3_in;

	// k4_in, k4;
	assign k4_in = en ? k5 : (key_reg_move ? k6 : k4);
	always @(posedge clk) k4 <= k4_in;

	// k5_in, k5;
	assign k5_in = en ? k6 : (key_reg_move ? k7 : k5);
	always @(posedge clk) k5 <= k5_in;

	// k6_in, k6;
	assign k6_in = en ? k7 : (dochoosesboxin ? k4 : (key_reg_move ? k8 : k6));
	always @(posedge clk) k6 <= k6_in;

	// k7_in, k7;
	assign k7_in = en ? k8 : (dochoosesboxin ? k5 : (key_reg_move ? k9 : k7));
	always @(posedge clk) k7 <= k7_in;

	// k8_in, k8;
	assign k8_in = en ? k9 : (key_reg_move ? k10 : k8);
	always @(posedge clk) k8 <= k8_in;

	// k9_in, k9;
	assign k9_in = en ? k10 : (key_reg_move ? k11 : k9);
	always @(posedge clk) k9 <= k9_in;

	// k10_in, k10;
	assign k10_in = en ? k11 : (dochoosesboxin ? k8 : (key_reg_move ? k12 : k10));
	always @(posedge clk) k10 <= k10_in;

	// k11_in, k11;
	assign k11_in = en ? k12 : (dochoosesboxin ? k9 : (key_reg_move ? k13 : k11));
	always @(posedge clk) k11 <= k11_in;

	// k12_in, k12;
	assign k12_in = en ? k13 : (key_reg_move ? k14 : k12);
	always @(posedge clk) k12 <= k12_in;

	// k13_in, k13;
	assign k13_in = en ? k14 : (key_reg_move ? k15 : k13);
	always @(posedge clk) k13 <= k13_in;
	
	// k14_in, k14;
	// assign k14_in = en ? k15 : (dochoosesboxin ? k12 : nextkey0);
	assign k14_in = en ? k15 : (dofirstsubkey ? k0 : (dochoosesboxin ? k12 : (key_reg_move ? nextkey0 : k14)));
	always @(posedge clk) k14 <= k14_in;
	
	// k15_in, k15;
	//assign k15_in = en ? keyin[07:00] : (dochoosesboxin ? k13 : nextkey1);
	assign k15_in = en ? keyin[07:00] : (dofirstsubkey ? k1 : (dochoosesboxin ? k13 : (key_reg_move ? nextkey1 : k15)));
	always @(posedge clk) k15 <= k15_in;
	
endmodule
