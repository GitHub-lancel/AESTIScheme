`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:21:45 11/09/2022 
// Design Name: 
// Module Name:    KeyRegisters_Unit 
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
module KeyRegisters_Unit(
	input				clk,
	input				en,
	
	input				doSboxIn,
	input				doFirstSubkey,
	input				doKeyFirstCol,
	input				doKeyOtherCol,
	
	input	[07:00]		keyIn,
	output	[07:00]		keyOut,
	output	[07:00]		keyToSbox
    );
	
	// intermediate;
	reg		[07:00]		K0, K1, K2, K3;
	reg		[07:00]		K4, K5, K6, K7;
	reg		[07:00]		K8, K9, K10,K11;
	reg		[07:00]		K12,K13,K14,K15;
	
	wire	[07:00]		K0_in,  K1_in,  K2_in, K3_in;
	wire	[07:00]		K4_in,  K5_in,  K6_in, K7_in;
	wire	[07:00]		K8_in,  K9_in,  K10_in,K11_in;
	wire	[07:00]		K12_in, K13_in, K14_in,K15_in;
	
	wire	[07:00] 	K0XorK12;
	
	wire				en0;
	wire				en1;
	
	// en1;
	assign en0 = en | doSboxIn | doFirstSubkey | doKeyFirstCol | doKeyOtherCol;
	
	// en2;
	assign en1 = en | doFirstSubkey | doKeyFirstCol | doKeyOtherCol;
	
	// K0XorK12;
	assign K0XorK12 = K0 ^ K12;
	
	// keyToSbox;
	assign keyToSbox = K13;
	
	// keyOut;
	assign keyOut = doKeyOtherCol ? K0XorK12 : K0;
	
	// K0_in, K0;
	assign K0_in = en0 ? K1 : K0;
	always @(posedge clk) K0 <= K0_in;
	
	// K1_in, K1;
	assign K1_in = en0 ? K2 : K1;
	always @(posedge clk) K1 <= K1_in;
	
	// K2_in, K2;
	assign K2_in = en0 ? K3 : K2;
	always @(posedge clk) K2 <= K2_in;

	// K3_in, K3;
	assign K3_in = en1 ? K4 : (doSboxIn ? K0 : K3);
	always @(posedge clk) K3 <= K3_in;

	// K4_in, K4;
	assign K4_in = en0 ? K5 : K4;
	always @(posedge clk) K4 <= K4_in;

	// K5_in, K5;
	assign K5_in = en0 ? K6 : K5;
	always @(posedge clk) K5 <= K5_in;

	// K6_in, K6;
	assign K6_in = en0 ? K7 : K6;
	always @(posedge clk) K6 <= K6_in;

	// K7_in, K7;
	assign K7_in = en1 ? K8 : (doSboxIn ? K4 : K7);
	always @(posedge clk) K7 <= K7_in;

	// K8_in, K8;
	assign K8_in = en0 ? K9 : K8;
	always @(posedge clk) K8 <= K8_in;

	// K9_in, K9;
	assign K9_in = en0 ? K10 : K9;
	always @(posedge clk) K9 <= K9_in;

	// K10_in, K10;
	assign K10_in = en0 ? K11 : K10;
	always @(posedge clk) K10 <= K10_in;

	// K11_in, K11;
	assign K11_in = en1 ? K12 : (doSboxIn ? K8 : K11);
	always @(posedge clk) K11 <= K11_in;

	// K12_in, K12;
	assign K12_in = en0 ? K13 : K12;
	always @(posedge clk) K12 <= K12_in;

	// K13_in, K13;
	assign K13_in = en0 ? K14 : K13;
	always @(posedge clk) K13 <= K13_in;
	
	// K14_in, K14;
	assign K14_in = en0 ? K15 : K14;
	always @(posedge clk) K14 <= K14_in;
	
	// K15_in, K15;
	assign K15_in = (en | doKeyFirstCol) ? keyIn : (doSboxIn ? K12 : (doKeyOtherCol ? K0XorK12 : (doFirstSubkey ? K0 : K15)));
	always @(posedge clk) K15 <= K15_in;
	
endmodule
