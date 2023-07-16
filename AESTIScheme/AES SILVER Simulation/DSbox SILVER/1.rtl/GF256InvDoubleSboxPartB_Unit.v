`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:45:32 05/30/2023 
// Design Name: 
// Module Name:    GF256InvDoubleSboxPartB_Unit 
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
module GF256InvDoubleSboxPartB_Unit(
	input				clk,
	
	// SboxA;
	input	[07:00]		ha0ga0fa0ea0da0ca0ba0aa0,
	input	[07:00]		ha1ga1fa1ea1da1ca1ba1aa1,
	input	[03:00]		GF4MulASh0,
	input	[03:00]		GF4MulASh1,
	
	output	[07:00]		va0ua0sa0ra0ta0za0ya0xa0,
	output	[07:00]		va1ua1sa1ra1ta1za1ya1xa1,
	
	// SboxB;
	input	[07:00]		hb0gb0fb0eb0db0cb0bb0ab0,
	input	[07:00]		hb1gb1fb1eb1db1cb1bb1ab1,
	input	[03:00]		GF4MulBSh0,
	input	[03:00]		GF4MulBSh1,
	
	output	[07:00]		vb0ub0sb0rb0tb0zb0yb0xb0,
	output	[07:00]		vb1ub1sb1rb1tb1zb1yb1xb1
    );
	
	//// GF16.Mul;
	GF16Mul_Unit Inst_GF16Mul_Unit(
	.clk				(clk),
	
	// SboxA;
	.da0ca0ba0aa0		(ha0ga0fa0ea0da0ca0ba0aa0[03:00]),
	.da1ca1ba1aa1		(ha1ga1fa1ea1da1ca1ba1aa1[03:00]),
	.ha0ga0fa0ea0		(ha0ga0fa0ea0da0ca0ba0aa0[07:04]),
	.ha1ga1fa1ea1		(ha1ga1fa1ea1da1ca1ba1aa1[07:04]),
	.qa0pa0na0ma0		(GF4MulASh0),
	.qa1pa1na1ma1		(GF4MulASh1),
	
	.xa					({va0ua0sa0ra0ta0za0ya0xa0[0], va1ua1sa1ra1ta1za1ya1xa1[0]}),
	.ya					({va0ua0sa0ra0ta0za0ya0xa0[1], va1ua1sa1ra1ta1za1ya1xa1[1]}),
	.za					({va0ua0sa0ra0ta0za0ya0xa0[2], va1ua1sa1ra1ta1za1ya1xa1[2]}),
	.ta					({va0ua0sa0ra0ta0za0ya0xa0[3], va1ua1sa1ra1ta1za1ya1xa1[3]}),
	
	.ra					({va0ua0sa0ra0ta0za0ya0xa0[4], va1ua1sa1ra1ta1za1ya1xa1[4]}),
	.sa					({va0ua0sa0ra0ta0za0ya0xa0[5], va1ua1sa1ra1ta1za1ya1xa1[5]}),
	.ua					({va0ua0sa0ra0ta0za0ya0xa0[6], va1ua1sa1ra1ta1za1ya1xa1[6]}),
	.va					({va0ua0sa0ra0ta0za0ya0xa0[7], va1ua1sa1ra1ta1za1ya1xa1[7]}),
	
	// SboxB;
	.db0cb0bb0ab0		(hb0gb0fb0eb0db0cb0bb0ab0[03:00]),
	.db1cb1bb1ab1		(hb1gb1fb1eb1db1cb1bb1ab1[03:00]),
	.hb0gb0fb0eb0		(hb0gb0fb0eb0db0cb0bb0ab0[07:04]),
	.hb1gb1fb1eb1		(hb1gb1fb1eb1db1cb1bb1ab1[07:04]),
	.qb0pb0nb0mb0		(GF4MulBSh0),
	.qb1pb1nb1mb1		(GF4MulBSh1),
	
	.xb					({vb0ub0sb0rb0tb0zb0yb0xb0[0], vb1ub1sb1rb1tb1zb1yb1xb1[0]}),
	.yb					({vb0ub0sb0rb0tb0zb0yb0xb0[1], vb1ub1sb1rb1tb1zb1yb1xb1[1]}),
	.zb					({vb0ub0sb0rb0tb0zb0yb0xb0[2], vb1ub1sb1rb1tb1zb1yb1xb1[2]}),
	.tb					({vb0ub0sb0rb0tb0zb0yb0xb0[3], vb1ub1sb1rb1tb1zb1yb1xb1[3]}),
														  
	.rb					({vb0ub0sb0rb0tb0zb0yb0xb0[4], vb1ub1sb1rb1tb1zb1yb1xb1[4]}),
	.sb					({vb0ub0sb0rb0tb0zb0yb0xb0[5], vb1ub1sb1rb1tb1zb1yb1xb1[5]}),
	.ub					({vb0ub0sb0rb0tb0zb0yb0xb0[6], vb1ub1sb1rb1tb1zb1yb1xb1[6]}),
	.vb					({vb0ub0sb0rb0tb0zb0yb0xb0[7], vb1ub1sb1rb1tb1zb1yb1xb1[7]})
    );


endmodule
