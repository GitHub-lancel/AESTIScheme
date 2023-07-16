`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:52:18 11/01/2022 
// Design Name: 
// Module Name:    DataRegistersC_Unit 
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
module DataRegistersC_Unit(
	input			clk,
	input			en,
	
	input			doMC,
	input			doSR,
	
	input	[15:00]	statein,
	output	[15:00]	stateout,
	output	[15:00]	cipher
    );
	
	// intermediate;
	reg		[07:00]	s0, s1, s2, s3;
	reg		[07:00]	s4, s5, s6, s7;
	reg		[07:00]	s8, s9, s10,s11;
	reg		[07:00]	s12,s13,s14,s15;
	
	wire	[07:00]	affine_out0;
	wire	[07:00]	affine_out1;
	wire	[07:00]	affine_out2;
	wire	[07:00]	affine_out3;
	
	wire	[07:00]	affineout0Xoraffineout1;
	wire	[07:00]	affineout2Xoraffineout3;
	
	wire	[07:00]	xorout0;
	wire	[07:00]	xorout1;
	wire	[07:00]	xorout2;
	wire	[07:00]	xorout3;
	
	wire	[07:00]	conditionalXor0;
	wire	[07:00]	conditionalXor1;
	wire	[07:00]	conditionalXor2;
	wire	[07:00]	conditionalXor3;
	
	wire	[07:00]	shiftedData0;
	wire	[07:00]	shiftedData1;
	wire	[07:00]	shiftedData2;
	wire	[07:00]	shiftedData3;
	
	wire	[07:00]	mult2_in0;
	wire	[07:00]	mult2_in1;
	wire	[07:00]	mult2_in2;
	wire	[07:00]	mult2_in3;
	
	wire	[07:00]	mult3_in0;
	wire	[07:00]	mult3_in1;
	wire	[07:00]	mult3_in2;
	wire	[07:00]	mult3_in3;
	
	wire	[07:00]	mixcout0;
	wire	[07:00]	mixcout1;
	wire	[07:00]	mixcout2;
	wire	[07:00]	mixcout3;
	
	wire	[07:00]	s0_in,  s1_in,  s2_in, s3_in;
	wire	[07:00]	s4_in,  s5_in,  s6_in, s7_in;
	wire	[07:00]	s8_in,  s9_in,  s10_in,s11_in;
	wire	[07:00]	s12_in, s13_in, s14_in,s15_in;
	
	// cipher;
	assign cipher[15:08] = affine_out0;
	assign cipher[07:00] = affine_out1;
	
	// affine_outputC;
	AffineOutputC_Unit Inst_AffineOutputC_Unit0(
	.A				(s0),
	.Z				(affine_out0)
    );
	AffineOutputC_Unit Inst_AffineOutputC_Unit1(
	.A				(s1),
	.Z				(affine_out1)
    );
	AffineOutputC_Unit Inst_AffineOutputC_Unit2(
	.A				(s2),
	.Z				(affine_out2)
    );
	AffineOutputC_Unit Inst_AffineOutputC_Unit3(
	.A				(s3),
	.Z				(affine_out3)
    );
	
	// affineout0Xoraffineout1, affineout2Xoraffineout3;
	assign affineout0Xoraffineout1 = affine_out0 ^ affine_out1;
	assign affineout2Xoraffineout3 = affine_out2 ^ affine_out3;
	
	// xorout0, xorout1, xorout2, xorout3;
	assign xorout0 = affine_out0 ^ affineout2Xoraffineout3;
	assign xorout1 = affineout0Xoraffineout1 ^ affine_out3;
	assign xorout2 = affineout0Xoraffineout1 ^ affine_out2;
	assign xorout3 = affine_out1 ^ affineout2Xoraffineout3;
	
	// conditionalXor0, conditionalXor1, conditionalXor2, conditionalXor3;
	assign conditionalXor0 = {3'b0, xorout0[7], xorout0[7], 1'b0, xorout0[7], xorout0[7]};
	assign conditionalXor1 = {3'b0, xorout1[7], xorout1[7], 1'b0, xorout1[7], xorout1[7]};
	assign conditionalXor2 = {3'b0, xorout2[7], xorout2[7], 1'b0, xorout2[7], xorout2[7]};
	assign conditionalXor3 = {3'b0, xorout3[7], xorout3[7], 1'b0, xorout3[7], xorout3[7]};
	
	// shifteddata0, shifteddata1, shifteddata2, shifteddata3;
	assign shiftedData0 = {xorout0[06:00], 1'b0};
	assign shiftedData1 = {xorout1[06:00], 1'b0};
	assign shiftedData2 = {xorout2[06:00], 1'b0};
	assign shiftedData3 = {xorout3[06:00], 1'b0};
	
	// mult2_in0, mult2_in1, mult2_in2, mult2_in3;
	assign mult2_in0 = shiftedData0 ^ conditionalXor0;
	assign mult2_in1 = shiftedData1 ^ conditionalXor1;
	assign mult2_in2 = shiftedData2 ^ conditionalXor2;
	assign mult2_in3 = shiftedData3 ^ conditionalXor3;
	
	// mult3_in0, mult3_in1, mult3_in2, mult3_in3;
	assign mult3_in0 = mult2_in0 ^ xorout0;
	assign mult3_in1 = mult2_in1 ^ xorout1;
	assign mult3_in2 = mult2_in2 ^ xorout2;
	assign mult3_in3 = mult2_in3 ^ xorout3;
	
	// mixcout0, mixcout1, mixcout2, mixcout3;
	assign mixcout0 = mult2_in0 ^ mult3_in3;
	assign mixcout1 = mult2_in1 ^ mult3_in0;
	assign mixcout2 = mult2_in2 ^ mult3_in1;
	assign mixcout3 = mult2_in3 ^ mult3_in2;
	
	// stateout;
	assign stateout[15:08] = doMC ? mixcout0 : s0;
	assign stateout[07:00] = doMC ? mixcout1 : s1;
	
	// s0_in, s0;
	assign s0_in = en ? s1 : (doSR ? s0 : (doMC ? mixcout2 : s2));
	always @(posedge clk) s0 <= s0_in;
	
	// s1_in, s1;
	assign s1_in = en ? s2 : (doSR ? s5 : (doMC ? mixcout3 : s3));
	always @(posedge clk) s1 <= s1_in;
	
	// s2_in, s2;
	assign s2_in = en ? s3 : (doSR ? s10 : s4);
	always @(posedge clk) s2 <= s2_in;
	
	// s3_in, s3;
	assign s3_in = en ? s4 : (doSR ? s15 : s5);
	always @(posedge clk) s3 <= s3_in;
	
	// s4_in, s4;
	assign s4_in = en ? s5 : (doSR ? s4 : s6);
	always @(posedge clk) s4 <= s4_in;
	
	// s5_in, s5;
	assign s5_in = en ? s6 : (doSR ? s9 : s7);
	always @(posedge clk) s5 <= s5_in;
	
	// s6_in, s6;
	assign s6_in = en ? s7 : (doSR ? s14 : s8);
	always @(posedge clk) s6 <= s6_in;
	
	// s7_in, s7;
	assign s7_in = en ? s8 : (doSR ? s3 : s9);
	always @(posedge clk) s7 <= s7_in;
	
	// s8_in, s8;
	assign s8_in = en ? s9 : (doSR ? s8 : s10);
	always @(posedge clk) s8 <= s8_in;
	
	// s9_in, s9;
	assign s9_in = en ? s10 : (doSR ? s13 : s11);
	always @(posedge clk) s9 <= s9_in;
	
	// s10_in;
	assign s10_in = en ? s11 : (doSR ? s2 : s12);
	always @(posedge clk) s10 <= s10_in;
	
	// s11_in;
	assign s11_in = en ? s12 : (doSR ? s7 : s13);
	always @(posedge clk) s11 <= s11_in;
	
	// s12_in;
	assign s12_in = en ? s13 : (doSR ? s12 : s14);
	always @(posedge clk) s12 <= s12_in;
	
	// s13_in;
	assign s13_in = en ? s14 : (doSR ? s1 : s15);
	always @(posedge clk) s13 <= s13_in;
	
	// s14_in;
	assign s14_in = en ? s15 : (doSR ? s6 : statein[15:08]);
	always @(posedge clk) s14 <= s14_in;
	
	// s15_in;
	assign s15_in = doSR ? s11 : statein[07:00];
	always @(posedge clk) s15 <= s15_in;
	
endmodule
