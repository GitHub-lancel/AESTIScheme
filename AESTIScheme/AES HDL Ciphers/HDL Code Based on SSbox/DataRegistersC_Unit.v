`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:59:38 11/09/2022 
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
	input				clk,
	input				en,
	
	input				doSG,
	input				doCG,
	input				doMC,
	input				doSR,
	
	output	[07:00]		guards,
	
	input	[07:00]		stateIn,
	output	[07:00]		stateOut,
	
	output	[07:00]		cipher
    );
	
	// intermediate;
	reg		[07:00]		S0, S1, S2, S3;
	reg		[07:00]		S4, S5, S6, S7;
	reg		[07:00]		S8, S9, S10,S11;
	reg		[07:00]		S12,S13,S14,S15;
	
	wire	[07:00]		S0_in, S1_in, S2_in, S3_in;
	wire	[07:00]		S4_in, S5_in, S6_in, S7_in;
	wire	[07:00]		S8_in, S9_in, S10_in,S11_in;
	wire	[07:00]		S12_in,S13_in,S14_in,S15_in;
	
	reg		[07:00]		S0_r;
	
	wire	[07:00]		affine_out0;
	wire	[07:00]		affine_out1;
	wire	[07:00]		affine_out2;
	wire	[07:00]		affine_out3;
	
	wire	[07:00]		affineout0Xoraffineout1;
	wire	[07:00]		affineout2Xoraffineout3;
		
	wire	[07:00]		xorout0;
	wire	[07:00]		xorout1;
	wire	[07:00]		xorout2;
	wire	[07:00]		xorout3;
		
	wire	[07:00]		conditionalXor0;
	wire	[07:00]		conditionalXor1;
	wire	[07:00]		conditionalXor2;
	wire	[07:00]		conditionalXor3;
		
	wire	[07:00]		shiftedData0;
	wire	[07:00]		shiftedData1;
	wire	[07:00]		shiftedData2;
	wire	[07:00]		shiftedData3;
		
	wire	[07:00]		mult2_in0;
	wire	[07:00]		mult2_in1;
	wire	[07:00]		mult2_in2;
	wire	[07:00]		mult2_in3;
		
	wire	[07:00]		mult3_in0;
	wire	[07:00]		mult3_in1;
	wire	[07:00]		mult3_in2;
	wire	[07:00]		mult3_in3;
		
	wire	[07:00]		mixcout0;
	wire	[07:00]		mixcout1;
	wire	[07:00]		mixcout2;
	wire	[07:00]		mixcout3;
	
	// affine_outputC;
	AffineOutputC_Unit Inst_AffineOutputC_Unit0(
	.A				(S0),
	.Z				(affine_out0)
    );
	AffineOutputC_Unit Inst_AffineOutputC_Unit1(
	.A				(S1),
	.Z				(affine_out1)
    );
	AffineOutputC_Unit Inst_AffineOutputC_Unit2(
	.A				(S2),
	.Z				(affine_out2)
    );
	AffineOutputC_Unit Inst_AffineOutputC_Unit3(
	.A				(S3),
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
	
	// cipher;
	assign cipher = affine_out0;
	
	// stateOut;
	assign stateOut = doMC ? mixcout0 : S0;
	
	// guards;
	assign guards = doCG ? S0_r : S1;
	
	// S0_r;
	always @(posedge clk) S0_r <= doSG ? S0 : S0_r;
	
	// S0, S0_in;
	assign S0_in = doSR ? S0 : (doMC ? mixcout1 : S1);
	always @(posedge clk) S0 <= S0_in;
	
	// S1, S1_in;
	assign S1_in = doSR ? S5 : (doMC ? mixcout2 : S2);
	always @(posedge clk) S1 <= S1_in; 
	
	// S2, S2_in;
	assign S2_in = doSR ? S10 : (doMC ? mixcout3 : S3);
	always @(posedge clk) S2 <= S2_in; 
	
	// S3, S3_in;
	assign S3_in = doSR ? S15 : S4;
	always @(posedge clk) S3 <= S3_in; 
	
	// S4, S4_in;
	assign S4_in = doSR ? S4 : S5;
	always @(posedge clk) S4 <= S4_in; 
	
	// S5, S5_in;
	assign S5_in = doSR ? S9 : S6;
	always @(posedge clk) S5 <= S5_in; 
	
	// S6, S6_in;
	assign S6_in = doSR ? S14 : S7;
	always @(posedge clk) S6 <= S6_in; 
	
	// S7, S7_in;
	assign S7_in = doSR ? S3 : S8;
	always @(posedge clk) S7 <= S7_in; 
	
	// S8, S8_in;
	assign S8_in = doSR ? S8 : S9;
	always @(posedge clk) S8 <= S8_in;
	
	// S9, S9_in;
	assign S9_in = doSR ? S13 : S10;
	always @(posedge clk) S9 <= S9_in;
	
	// S10, S10_in;
	assign S10_in = doSR ? S2 : S11;
	always @(posedge clk) S10 <= S10_in;
	
	// S11, S11_in;
	assign S11_in = doSR ? S7 : S12;
	always @(posedge clk) S11 <= S11_in;
	
	// S12, S12_in;
	assign S12_in = doSR ? S12 : S13;
	always @(posedge clk) S12 <= S12_in;
	
	// S13, S13_in;
	assign S13_in = doSR ? S1 : S14;
	always @(posedge clk) S13 <= S13_in;
	
	// S14, S14_in;
	assign S14_in = doSR ? S6 : S15;
	always @(posedge clk) S14 <= S14_in;
	
	// S15, S15_in;
	assign S15_in = doSR ? S11 : stateIn;
	always @(posedge clk) S15 <= S15_in;
	

endmodule
