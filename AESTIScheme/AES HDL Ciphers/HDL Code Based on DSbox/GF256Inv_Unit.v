`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:42:32 10/26/2022 
// Design Name: 
// Module Name:    GF256Inv_Unit 
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
module GF256Inv_Unit(
	input				clk,
	
	// SboxA;
	input	[07:00]		ha0ga0fa0ea0da0ca0ba0aa0,
	input	[07:00]		ha1ga1fa1ea1da1ca1ba1aa1,
	
	output	[07:00]		va0ua0sa0ra0ta0za0ya0xa0,
	output	[07:00]		va1ua1sa1ra1ta1za1ya1xa1,
	
	// SboxB;
	input	[07:00]		hb0gb0fb0eb0db0cb0bb0ab0,
	input	[07:00]		hb1gb1fb1eb1db1cb1bb1ab1,
	
	output	[07:00]		vb0ub0sb0rb0tb0zb0yb0xb0,
	output	[07:00]		vb1ub1sb1rb1tb1zb1yb1xb1,
	
	// random;
	input	[07:00]		random
    );
	
	//// intermediate;
	// AffineInput;
	wire	[07:00]		AffineInputASh0;
	wire	[07:00]		AffineInputASh1;
	
	wire	[07:00]		AffineInputBSh0;
	wire	[07:00]		AffineInputBSh1;
	
	reg		[07:00]		AffineInputASh0_r;
	reg		[07:00]		AffineInputASh1_r;
	
	reg		[07:00]		AffineInputBSh0_r;
	reg		[07:00]		AffineInputBSh1_r;
	
	reg		[07:00]		AffineInputASh0_r0;
	reg		[07:00]		AffineInputASh1_r0;
	
	reg		[07:00]		AffineInputBSh0_r0;
	reg		[07:00]		AffineInputBSh1_r0;
	
	reg		[07:00]		AffineInputASh0_r1;
	reg		[07:00]		AffineInputASh1_r1;
	 
	reg		[07:00]		AffineInputBSh0_r1;
	reg		[07:00]		AffineInputBSh1_r1;
	
	reg		[07:00]		AffineInputASh0_r2;
	reg		[07:00]		AffineInputASh1_r2;
	
	reg		[07:00]		AffineInputBSh0_r2;
	reg		[07:00]		AffineInputBSh1_r2;
	
	// GF16.MulXorSqSc;
	wire	[03:00]		Gf16MulXorSqScASh0;
	wire	[03:00]		Gf16MulXorSqScASh1;
	
	wire	[03:00]		Gf16MulXorSqScBSh0;
	wire	[03:00]		Gf16MulXorSqScBSh1;
	
	// GF4.MulXorSqSc;
	wire	[01:00]		GF4MulXorSqScA0Sh0;
	wire	[01:00]		GF4MulXorSqScA0Sh1;
	wire	[01:00]		GF4MulXorSqScA1Sh0;
	wire	[01:00]		GF4MulXorSqScA1Sh1;
	
	wire	[01:00]		GF4MulXorSqScB0Sh0;
	wire	[01:00]		GF4MulXorSqScB0Sh1;
	wire	[01:00]		GF4MulXorSqScB1Sh0;
	wire	[01:00]		GF4MulXorSqScB1Sh1;
	
	reg		[03:00]		Gf16MulXorSqScASh0_r;
	reg		[03:00]		Gf16MulXorSqScASh1_r;
	
	reg		[03:00]		Gf16MulXorSqScBSh0_r;
	reg		[03:00]		Gf16MulXorSqScBSh1_r;
	
	// GF4.Mul0, GF4.Mul1;
	wire	[03:00]		GF4MulASh0;
	wire	[03:00]		GF4MulASh1;
	
	wire	[03:00]		GF4MulBSh0;
	wire	[03:00]		GF4MulBSh1;
	
	//// AffineInput;
	always @(posedge clk) AffineInputASh0_r <= AffineInputASh0;
	always @(posedge clk) AffineInputASh1_r <= AffineInputASh1;
	
	always @(posedge clk) AffineInputBSh0_r <= AffineInputBSh0;
	always @(posedge clk) AffineInputBSh1_r <= AffineInputBSh1;
	
	always @(posedge clk) AffineInputASh0_r0 <= AffineInputASh0_r;
	always @(posedge clk) AffineInputASh1_r0 <= AffineInputASh1_r;
	
	always @(posedge clk) AffineInputBSh0_r0 <= AffineInputBSh0_r;
	always @(posedge clk) AffineInputBSh1_r0 <= AffineInputBSh1_r;
	
	always @(posedge clk) AffineInputASh0_r1 <= AffineInputASh0_r0;
	always @(posedge clk) AffineInputASh1_r1 <= AffineInputASh1_r0;
	
	always @(posedge clk) AffineInputBSh0_r1 <= AffineInputBSh0_r0;
	always @(posedge clk) AffineInputBSh1_r1 <= AffineInputBSh1_r0;
	
	always @(posedge clk) AffineInputASh0_r2 <= AffineInputASh0_r1;
	always @(posedge clk) AffineInputASh1_r2 <= AffineInputASh1_r1;
	
	always @(posedge clk) AffineInputBSh0_r2 <= AffineInputBSh0_r1;
	always @(posedge clk) AffineInputBSh1_r2 <= AffineInputBSh1_r1;
	
	// Gf16MulXorSqScASh0, Gf16MulXorSqScASh1;
	always @(posedge clk) Gf16MulXorSqScASh0_r <= Gf16MulXorSqScASh0;
	always @(posedge clk) Gf16MulXorSqScASh1_r <= Gf16MulXorSqScASh1;
	
	// Gf16MulXorSqScBSh0, Gf16MulXorSqScBSh1;
	always @(posedge clk) Gf16MulXorSqScBSh0_r <= Gf16MulXorSqScBSh0;
	always @(posedge clk) Gf16MulXorSqScBSh1_r <= Gf16MulXorSqScBSh1;
	
	//// AffineInput;
	AffineInput_Unit Inst_AffineInputA_Unit0(
	.A					(ha0ga0fa0ea0da0ca0ba0aa0),
	.Z					(AffineInputASh0)
    );
	
	AffineInput_Unit Inst_AffineInputA_Unit1(
	.A					(ha1ga1fa1ea1da1ca1ba1aa1),
	.Z					(AffineInputASh1)
    );
	
	AffineInput_Unit Inst_AffineInputB_Unit0(
	.A					(hb0gb0fb0eb0db0cb0bb0ab0),
	.Z					(AffineInputBSh0)
    );
	
	AffineInput_Unit Inst_AffineInputB_Unit1(
	.A					(hb1gb1fb1eb1db1cb1bb1ab1),
	.Z					(AffineInputBSh1)
    );
	
	//// GF16.MulXorSqSc;
	GF16MulXorSqSc_Unit Inst_GF16MulXorSqSc_Unit(
	.clk				(clk),
	
	// SboxA;
	.ha0ga0fa0ea0		(AffineInputASh0_r[07:04]),
	.ha1ga1fa1ea1		(AffineInputASh1_r[07:04]),
	.da0ca0ba0aa0		(AffineInputASh0_r[03:00]),
	.da1ca1ba1aa1		(AffineInputASh1_r[03:00]),
	
	.xa					({Gf16MulXorSqScASh0[0], Gf16MulXorSqScASh1[0]}),
	.ya					({Gf16MulXorSqScASh0[1], Gf16MulXorSqScASh1[1]}),
	.za					({Gf16MulXorSqScASh0[2], Gf16MulXorSqScASh1[2]}),
	.ta					({Gf16MulXorSqScASh0[3], Gf16MulXorSqScASh1[3]}),
	
	// SboxB;
	.hb0gb0fb0eb0		(AffineInputBSh0_r[07:04]),
	.hb1gb1fb1eb1		(AffineInputBSh1_r[07:04]),
	.db0cb0bb0ab0		(AffineInputBSh0_r[03:00]),
	.db1cb1bb1ab1		(AffineInputBSh1_r[03:00]),
	
	.xb					({Gf16MulXorSqScBSh0[0], Gf16MulXorSqScBSh1[0]}),
	.yb					({Gf16MulXorSqScBSh0[1], Gf16MulXorSqScBSh1[1]}),
	.zb					({Gf16MulXorSqScBSh0[2], Gf16MulXorSqScBSh1[2]}),
	.tb					({Gf16MulXorSqScBSh0[3], Gf16MulXorSqScBSh1[3]})
    );
	
	//// GF4.MulXorSqSc;
	GF4MulXorSqSc_Unit Inst_GF4MulXorSqSc_Unit(
	.clk				(clk),
	
	// SboxA;
	.da0ca0ba0aa0		(Gf16MulXorSqScASh0),
	.da1ca1ba1aa1		(Gf16MulXorSqScASh1),
	.ra3ra2ra1ra0		(AffineInputASh0_r0[07:04]),
	
	.xa					({GF4MulXorSqScA0Sh0[0], GF4MulXorSqScA0Sh1[0]}),
	.ya					({GF4MulXorSqScA0Sh0[1], GF4MulXorSqScA0Sh1[1]}),
	.za					({GF4MulXorSqScA1Sh0[0], GF4MulXorSqScA1Sh1[0]}),
	.ta					({GF4MulXorSqScA1Sh0[1], GF4MulXorSqScA1Sh1[1]}),
	
	// SboxB;
	.db0cb0bb0ab0		(Gf16MulXorSqScBSh0),
	.db1cb1bb1ab1		(Gf16MulXorSqScBSh1),
	.rb3rb2rb1rb0		(AffineInputBSh0_r0[07:04]),
	
	.xb					({GF4MulXorSqScB0Sh0[0], GF4MulXorSqScB0Sh1[0]}),
	.yb					({GF4MulXorSqScB0Sh0[1], GF4MulXorSqScB0Sh1[1]}),
	.zb					({GF4MulXorSqScB1Sh0[0], GF4MulXorSqScB1Sh1[0]}),
	.tb					({GF4MulXorSqScB1Sh0[1], GF4MulXorSqScB1Sh1[1]}),
	
	.random				(random)
    );
	
	//// GF4.Mul;
	GF4Mul_Unit Inst_GF4Mul_Unit(
	.clk				(clk),
	
	// SboxA;
	.da0ca0ba0aa0		(Gf16MulXorSqScASh0_r),
	.da1ca1ba1aa1		(Gf16MulXorSqScASh1_r),
	.ha0ga0fa0ea0		({GF4MulXorSqScA1Sh0, GF4MulXorSqScA0Sh0}),
	.ha1ga1fa1ea1		({GF4MulXorSqScA1Sh1, GF4MulXorSqScA0Sh1}),
	.ra3ra2ra1ra0		(AffineInputASh0_r1[03:00]),
	
	.xa					({GF4MulASh0[0], GF4MulASh1[0]}),
	.ya					({GF4MulASh0[1], GF4MulASh1[1]}),
	.za					({GF4MulASh0[2], GF4MulASh1[2]}),
	.ta					({GF4MulASh0[3], GF4MulASh1[3]}),
	
	// SboxB;
	.db0cb0bb0ab0		(Gf16MulXorSqScBSh0_r),
	.db1cb1bb1ab1		(Gf16MulXorSqScBSh1_r),
	.hb0gb0fb0eb0		({GF4MulXorSqScB1Sh0, GF4MulXorSqScB0Sh0}),
	.hb1gb1fb1eb1		({GF4MulXorSqScB1Sh1, GF4MulXorSqScB0Sh1}),
	.rb3rb2rb1rb0		(AffineInputBSh0_r1[03:00]),
	
	.xb					({GF4MulBSh0[0], GF4MulBSh1[0]}),
	.yb					({GF4MulBSh0[1], GF4MulBSh1[1]}),
	.zb					({GF4MulBSh0[2], GF4MulBSh1[2]}),
	.tb					({GF4MulBSh0[3], GF4MulBSh1[3]})
    );
	
	//// GF16.Mul;
	GF16Mul_Unit Inst_GF16Mul_Unit(
	.clk				(clk),
	
	// SboxA;
	.da0ca0ba0aa0		(AffineInputASh0_r2[03:00]),
	.da1ca1ba1aa1		(AffineInputASh1_r2[03:00]),
	.ha0ga0fa0ea0		(AffineInputASh0_r2[07:04]),
	.ha1ga1fa1ea1		(AffineInputASh1_r2[07:04]),
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
	.db0cb0bb0ab0		(AffineInputBSh0_r2[03:00]),
	.db1cb1bb1ab1		(AffineInputBSh1_r2[03:00]),
	.hb0gb0fb0eb0		(AffineInputBSh0_r2[07:04]),
	.hb1gb1fb1eb1		(AffineInputBSh1_r2[07:04]),
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
