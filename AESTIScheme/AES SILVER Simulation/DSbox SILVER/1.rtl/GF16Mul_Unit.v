`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:04:17 10/26/2022 
// Design Name: 
// Module Name:    GF16Mul_Unit 
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
module GF16Mul_Unit(
	input				clk,
	
	// SboxA;
	input	[03:00]		da0ca0ba0aa0,
	input	[03:00]		da1ca1ba1aa1,
	
	input	[03:00]		ha0ga0fa0ea0,
	input	[03:00]		ha1ga1fa1ea1,
	
	input	[03:00]		qa0pa0na0ma0,
	input	[03:00]		qa1pa1na1ma1,
	
	output	[01:00]		xa,
	output	[01:00]		ya,
	output	[01:00]		za,
	output	[01:00]		ta,
	
	output	[01:00]		ra,
	output	[01:00]		sa,
	output	[01:00]		ua,
	output	[01:00]		va,
	
	// SboxB;
	input	[03:00]		db0cb0bb0ab0,
	input	[03:00]		db1cb1bb1ab1,
	
	input	[03:00]		hb0gb0fb0eb0,
	input	[03:00]		hb1gb1fb1eb1,
	
	input	[03:00]		qb0pb0nb0mb0,
	input	[03:00]		qb1pb1nb1mb1,
	
	output	[01:00]		xb,
	output	[01:00]		yb,
	output	[01:00]		zb,
	output	[01:00]		tb,
	
	output	[01:00]		rb,
	output	[01:00]		sb,
	output	[01:00]		ub,
	output	[01:00]		vb
    );
	
	// intermediate;
	// SboxA;
	wire				ha0, ha1;
	wire				ga0, ga1;
	wire				fa0, fa1;
	wire				ea0, ea1;
	
	wire				da0, da1;
	wire				ca0, ca1;
	wire				ba0, ba1;
	wire				aa0, aa1;
	
	wire				qa0, qa1;
	wire				pa0, pa1;
	wire				na0, na1;
	wire				ma0, ma1;
	
	wire				ma0aa0, ma0aa1;
	wire				ma1aa0, ma1aa1;
	
	wire				ma0ba0, ma0ba1;
	wire				ma1ba0, ma1ba1;
	
	wire				ma0ca0, ma0ca1;
	wire				ma1ca0, ma1ca1;
	
	wire				ma0da0, ma0da1;
	wire				ma1da0, ma1da1;
	
	wire				ma0ea0, ma0ea1;
	wire				ma1ea0, ma1ea1;
	
	wire				ma0fa0, ma0fa1;
	wire				ma1fa0, ma1fa1;
	
	wire				ma0ga0, ma0ga1;
	wire				ma1ga0, ma1ga1;
	
	wire				ma0ha0, ma0ha1;
	wire				ma1ha0, ma1ha1;
	
	wire				na0aa0, na0aa1;
	wire				na1aa0, na1aa1;
	
	wire				na0ba0, na0ba1;
	wire				na1ba0, na1ba1;
	
	wire				na0ca0, na0ca1;
	wire				na1ca0, na1ca1;
	
	wire				na0da0, na0da1;
	wire				na1da0, na1da1;
	
	wire				na0ea0, na0ea1;
	wire				na1ea0, na1ea1;
	
	wire				na0fa0, na0fa1;
	wire				na1fa0, na1fa1;
	
	wire				na0ga0, na0ga1;
	wire				na1ga0, na1ga1;
	
	wire				na0ha0, na0ha1;
	wire				na1ha0, na1ha1;
	
	wire				pa0aa0, pa0aa1;
	wire				pa1aa0, pa1aa1;
	
	wire				pa0ba0, pa0ba1;
	wire				pa1ba0, pa1ba1;
	
	wire				pa0ca0, pa0ca1;
	wire				pa1ca0, pa1ca1;
	
	wire				pa0da0, pa0da1;
	wire				pa1da0, pa1da1;
	
	wire				pa0ea0, pa0ea1;
	wire				pa1ea0, pa1ea1;
	
	wire				pa0fa0, pa0fa1;
	wire				pa1fa0, pa1fa1;
	
	wire				pa0ga0, pa0ga1;
	wire				pa1ga0, pa1ga1;
	
	wire				pa0ha0, pa0ha1;
	wire				pa1ha0, pa1ha1;
	
	wire				qa0aa0, qa0aa1;
	wire				qa1aa0, qa1aa1;
	
	wire				qa0ba0, qa0ba1;
	wire				qa1ba0, qa1ba1;
	
	wire				qa0ca0, qa0ca1;
	wire				qa1ca0, qa1ca1;
	
	wire				qa0da0, qa0da1;
	wire				qa1da0, qa1da1;
	
	wire				qa0ea0, qa0ea1;
	wire				qa1ea0, qa1ea1;
	
	wire				qa0fa0, qa0fa1;
	wire				qa1fa0, qa1fa1;
	
	wire				qa0ga0, qa0ga1;
	wire				qa1ga0, qa1ga1;
	
	wire				qa0ha0, qa0ha1;
	wire				qa1ha0, qa1ha1;
	
	reg		[03:00]		xa_r;
	reg		[03:00]		ya_r;
	reg		[03:00]		za_r;
	reg		[03:00]		ta_r;
	
	reg		[03:00]		ra_r;
	reg		[03:00]		sa_r;
	reg		[03:00]		ua_r;
	reg		[03:00]		va_r;
	
	// SboxB;
	wire				hb0, hb1;
	wire				gb0, gb1;
	wire				fb0, fb1;
	wire				eb0, eb1;
	
	wire				db0, db1;
	wire				cb0, cb1;
	wire				bb0, bb1;
	wire				ab0, ab1;
	
	wire				qb0, qb1;
	wire				pb0, pb1;
	wire				nb0, nb1;
	wire				mb0, mb1;
	
	wire				mb0ab0, mb0ab1;
	wire				mb1ab0, mb1ab1;
	
	wire				mb0bb0, mb0bb1;
	wire				mb1bb0, mb1bb1;
	
	wire				mb0cb0, mb0cb1;
	wire				mb1cb0, mb1cb1;
	
	wire				mb0db0, mb0db1;
	wire				mb1db0, mb1db1;
	
	wire				mb0eb0, mb0eb1;
	wire				mb1eb0, mb1eb1;
	
	wire				mb0fb0, mb0fb1;
	wire				mb1fb0, mb1fb1;
	
	wire				mb0gb0, mb0gb1;
	wire				mb1gb0, mb1gb1;
	
	wire				mb0hb0, mb0hb1;
	wire				mb1hb0, mb1hb1;
	
	wire				nb0ab0, nb0ab1;
	wire				nb1ab0, nb1ab1;
	
	wire				nb0bb0, nb0bb1;
	wire				nb1bb0, nb1bb1;
	
	wire				nb0cb0, nb0cb1;
	wire				nb1cb0, nb1cb1;
	
	wire				nb0db0, nb0db1;
	wire				nb1db0, nb1db1;
	
	wire				nb0eb0, nb0eb1;
	wire				nb1eb0, nb1eb1;
	
	wire				nb0fb0, nb0fb1;
	wire				nb1fb0, nb1fb1;
	
	wire				nb0gb0, nb0gb1;
	wire				nb1gb0, nb1gb1;
	
	wire				nb0hb0, nb0hb1;
	wire				nb1hb0, nb1hb1;
	
	wire				pb0ab0, pb0ab1;
	wire				pb1ab0, pb1ab1;
	
	wire				pb0bb0, pb0bb1;
	wire				pb1bb0, pb1bb1;
	
	wire				pb0cb0, pb0cb1;
	wire				pb1cb0, pb1cb1;
	
	wire				pb0db0, pb0db1;
	wire				pb1db0, pb1db1;
	
	wire				pb0eb0, pb0eb1;
	wire				pb1eb0, pb1eb1;
	
	wire				pb0fb0, pb0fb1;
	wire				pb1fb0, pb1fb1;
	
	wire				pb0gb0, pb0gb1;
	wire				pb1gb0, pb1gb1;
	
	wire				pb0hb0, pb0hb1;
	wire				pb1hb0, pb1hb1;
	
	wire				qb0ab0, qb0ab1;
	wire				qb1ab0, qb1ab1;
	
	wire				qb0bb0, qb0bb1;
	wire				qb1bb0, qb1bb1;
	
	wire				qb0cb0, qb0cb1;
	wire				qb1cb0, qb1cb1;
	
	wire				qb0db0, qb0db1;
	wire				qb1db0, qb1db1;
	
	wire				qb0eb0, qb0eb1;
	wire				qb1eb0, qb1eb1;
	
	wire				qb0fb0, qb0fb1;
	wire				qb1fb0, qb1fb1;
	
	wire				qb0gb0, qb0gb1;
	wire				qb1gb0, qb1gb1;
	
	wire				qb0hb0, qb0hb1;
	wire				qb1hb0, qb1hb1;
	
	reg		[03:00]		xb_r;
	reg		[03:00]		yb_r;
	reg		[03:00]		zb_r;
	reg		[03:00]		tb_r;
	
	reg		[03:00]		rb_r;
	reg		[03:00]		sb_r;
	reg		[03:00]		ub_r;
	reg		[03:00]		vb_r;
	
	// SboxA assign;
	assign ha0 = ha0ga0fa0ea0[3];
	assign ga0 = ha0ga0fa0ea0[2];
	assign fa0 = ha0ga0fa0ea0[1];
	assign ea0 = ha0ga0fa0ea0[0];
	
	assign da0 = da0ca0ba0aa0[3];
	assign ca0 = da0ca0ba0aa0[2];
	assign ba0 = da0ca0ba0aa0[1];
	assign aa0 = da0ca0ba0aa0[0];
	
	assign qa0 = qa0pa0na0ma0[3];
	assign pa0 = qa0pa0na0ma0[2];
	assign na0 = qa0pa0na0ma0[1];
	assign ma0 = qa0pa0na0ma0[0];
	
	assign ha1 = ha1ga1fa1ea1[3];
	assign ga1 = ha1ga1fa1ea1[2];
	assign fa1 = ha1ga1fa1ea1[1];
	assign ea1 = ha1ga1fa1ea1[0];
	
	assign da1 = da1ca1ba1aa1[3];
	assign ca1 = da1ca1ba1aa1[2];
	assign ba1 = da1ca1ba1aa1[1];
	assign aa1 = da1ca1ba1aa1[0];
	
	assign qa1 = qa1pa1na1ma1[3];
	assign pa1 = qa1pa1na1ma1[2];
	assign na1 = qa1pa1na1ma1[1];
	assign ma1 = qa1pa1na1ma1[0];
	
	assign ma0aa0 = ma0 & aa0;
	assign ma0aa1 = ma0 & aa1;
	assign ma1aa0 = ma1 & aa0;
	assign ma1aa1 = ma1 & aa1;
	
	assign ma0ba0 = ma0 & ba0;
	assign ma0ba1 = ma0 & ba1;
	assign ma1ba0 = ma1 & ba0;
	assign ma1ba1 = ma1 & ba1;
	
	assign ma0ca0 = ma0 & ca0;
	assign ma0ca1 = ma0 & ca1;
	assign ma1ca0 = ma1 & ca0;
	assign ma1ca1 = ma1 & ca1;
	
	assign ma0da0 = ma0 & da0;
	assign ma0da1 = ma0 & da1;
	assign ma1da0 = ma1 & da0;
	assign ma1da1 = ma1 & da1;
	
	assign ma0ea0 = ma0 & ea0;
	assign ma0ea1 = ma0 & ea1;
	assign ma1ea0 = ma1 & ea0;
	assign ma1ea1 = ma1 & ea1;
	
	assign ma0fa0 = ma0 & fa0;
	assign ma0fa1 = ma0 & fa1;
	assign ma1fa0 = ma1 & fa0;
	assign ma1fa1 = ma1 & fa1;
	
	assign ma0ga0 = ma0 & ga0;
	assign ma0ga1 = ma0 & ga1;
	assign ma1ga0 = ma1 & ga0;
	assign ma1ga1 = ma1 & ga1;
	
	assign ma0ha0 = ma0 & ha0;
	assign ma0ha1 = ma0 & ha1;
	assign ma1ha0 = ma1 & ha0;
	assign ma1ha1 = ma1 & ha1;
	
	assign na0aa0 = na0 & aa0;
	assign na0aa1 = na0 & aa1;
	assign na1aa0 = na1 & aa0;
	assign na1aa1 = na1 & aa1;
	
	assign na0ba0 = na0 & ba0;
	assign na0ba1 = na0 & ba1;
	assign na1ba0 = na1 & ba0;
	assign na1ba1 = na1 & ba1;
	
	assign na0ca0 = na0 & ca0;
	assign na0ca1 = na0 & ca1;
	assign na1ca0 = na1 & ca0;
	assign na1ca1 = na1 & ca1;
	
	assign na0da0 = na0 & da0;
	assign na0da1 = na0 & da1;
	assign na1da0 = na1 & da0;
	assign na1da1 = na1 & da1;
	
	assign na0ea0 = na0 & ea0;
	assign na0ea1 = na0 & ea1;
	assign na1ea0 = na1 & ea0;
	assign na1ea1 = na1 & ea1;
	
	assign na0fa0 = na0 & fa0;
	assign na0fa1 = na0 & fa1;
	assign na1fa0 = na1 & fa0;
	assign na1fa1 = na1 & fa1;
	
	assign na0ga0 = na0 & ga0;
	assign na0ga1 = na0 & ga1;
	assign na1ga0 = na1 & ga0;
	assign na1ga1 = na1 & ga1;
	
	assign na0ha0 = na0 & ha0;
	assign na0ha1 = na0 & ha1;
	assign na1ha0 = na1 & ha0;
	assign na1ha1 = na1 & ha1;
	
	assign pa0aa0 = pa0 & aa0;
	assign pa0aa1 = pa0 & aa1;
	assign pa1aa0 = pa1 & aa0;
	assign pa1aa1 = pa1 & aa1;
	
	assign pa0ba0 = pa0 & ba0;
	assign pa0ba1 = pa0 & ba1;
	assign pa1ba0 = pa1 & ba0;
	assign pa1ba1 = pa1 & ba1;
	
	assign pa0ca0 = pa0 & ca0;
	assign pa0ca1 = pa0 & ca1;
	assign pa1ca0 = pa1 & ca0;
	assign pa1ca1 = pa1 & ca1;
	
	assign pa0da0 = pa0 & da0;
	assign pa0da1 = pa0 & da1;
	assign pa1da0 = pa1 & da0;
	assign pa1da1 = pa1 & da1;
	
	assign pa0ea0 = pa0 & ea0;
	assign pa0ea1 = pa0 & ea1;
	assign pa1ea0 = pa1 & ea0;
	assign pa1ea1 = pa1 & ea1;
	
	assign pa0fa0 = pa0 & fa0;
	assign pa0fa1 = pa0 & fa1;
	assign pa1fa0 = pa1 & fa0;
	assign pa1fa1 = pa1 & fa1;
	
	assign pa0ga0 = pa0 & ga0;
	assign pa0ga1 = pa0 & ga1;
	assign pa1ga0 = pa1 & ga0;
	assign pa1ga1 = pa1 & ga1;
	
	assign pa0ha0 = pa0 & ha0;
	assign pa0ha1 = pa0 & ha1;
	assign pa1ha0 = pa1 & ha0;
	assign pa1ha1 = pa1 & ha1;
	
	assign qa0aa0 = qa0 & aa0;
	assign qa0aa1 = qa0 & aa1;
	assign qa1aa0 = qa1 & aa0;
	assign qa1aa1 = qa1 & aa1;
	
	assign qa0ba0 = qa0 & ba0;
	assign qa0ba1 = qa0 & ba1;
	assign qa1ba0 = qa1 & ba0;
	assign qa1ba1 = qa1 & ba1;
	
	assign qa0ca0 = qa0 & ca0;
	assign qa0ca1 = qa0 & ca1;
	assign qa1ca0 = qa1 & ca0;
	assign qa1ca1 = qa1 & ca1;
	
	assign qa0da0 = qa0 & da0;
	assign qa0da1 = qa0 & da1;
	assign qa1da0 = qa1 & da0;
	assign qa1da1 = qa1 & da1;
	
	assign qa0ea0 = qa0 & ea0;
	assign qa0ea1 = qa0 & ea1;
	assign qa1ea0 = qa1 & ea0;
	assign qa1ea1 = qa1 & ea1;
	
	assign qa0fa0 = qa0 & fa0;
	assign qa0fa1 = qa0 & fa1;
	assign qa1fa0 = qa1 & fa0;
	assign qa1fa1 = qa1 & fa1;
	
	assign qa0ga0 = qa0 & ga0;
	assign qa0ga1 = qa0 & ga1;
	assign qa1ga0 = qa1 & ga0;
	assign qa1ga1 = qa1 & ga1;
	
	assign qa0ha0 = qa0 & ha0;
	assign qa0ha1 = qa0 & ha1;
	assign qa1ha0 = qa1 & ha0;
	assign qa1ha1 = qa1 & ha1;
	
	// SboxB assign;
	assign hb0 = hb0gb0fb0eb0[3];
	assign gb0 = hb0gb0fb0eb0[2];
	assign fb0 = hb0gb0fb0eb0[1];
	assign eb0 = hb0gb0fb0eb0[0];
	
	assign db0 = db0cb0bb0ab0[3];
	assign cb0 = db0cb0bb0ab0[2];
	assign bb0 = db0cb0bb0ab0[1];
	assign ab0 = db0cb0bb0ab0[0];
	
	assign qb0 = qb0pb0nb0mb0[3];
	assign pb0 = qb0pb0nb0mb0[2];
	assign nb0 = qb0pb0nb0mb0[1];
	assign mb0 = qb0pb0nb0mb0[0];
	
	assign hb1 = hb1gb1fb1eb1[3];
	assign gb1 = hb1gb1fb1eb1[2];
	assign fb1 = hb1gb1fb1eb1[1];
	assign eb1 = hb1gb1fb1eb1[0];
	
	assign db1 = db1cb1bb1ab1[3];
	assign cb1 = db1cb1bb1ab1[2];
	assign bb1 = db1cb1bb1ab1[1];
	assign ab1 = db1cb1bb1ab1[0];
	
	assign qb1 = qb1pb1nb1mb1[3];
	assign pb1 = qb1pb1nb1mb1[2];
	assign nb1 = qb1pb1nb1mb1[1];
	assign mb1 = qb1pb1nb1mb1[0];
	
	assign mb0ab0 = mb0 & ab0;
	assign mb0ab1 = mb0 & ab1;
	assign mb1ab0 = mb1 & ab0;
	assign mb1ab1 = mb1 & ab1;
	
	assign mb0bb0 = mb0 & bb0;
	assign mb0bb1 = mb0 & bb1;
	assign mb1bb0 = mb1 & bb0;
	assign mb1bb1 = mb1 & bb1;
	
	assign mb0cb0 = mb0 & cb0;
	assign mb0cb1 = mb0 & cb1;
	assign mb1cb0 = mb1 & cb0;
	assign mb1cb1 = mb1 & cb1;
	
	assign mb0db0 = mb0 & db0;
	assign mb0db1 = mb0 & db1;
	assign mb1db0 = mb1 & db0;
	assign mb1db1 = mb1 & db1;
	
	assign mb0eb0 = mb0 & eb0;
	assign mb0eb1 = mb0 & eb1;
	assign mb1eb0 = mb1 & eb0;
	assign mb1eb1 = mb1 & eb1;
	
	assign mb0fb0 = mb0 & fb0;
	assign mb0fb1 = mb0 & fb1;
	assign mb1fb0 = mb1 & fb0;
	assign mb1fb1 = mb1 & fb1;
	
	assign mb0gb0 = mb0 & gb0;
	assign mb0gb1 = mb0 & gb1;
	assign mb1gb0 = mb1 & gb0;
	assign mb1gb1 = mb1 & gb1;
	
	assign mb0hb0 = mb0 & hb0;
	assign mb0hb1 = mb0 & hb1;
	assign mb1hb0 = mb1 & hb0;
	assign mb1hb1 = mb1 & hb1;
	
	assign nb0ab0 = nb0 & ab0;
	assign nb0ab1 = nb0 & ab1;
	assign nb1ab0 = nb1 & ab0;
	assign nb1ab1 = nb1 & ab1;
	
	assign nb0bb0 = nb0 & bb0;
	assign nb0bb1 = nb0 & bb1;
	assign nb1bb0 = nb1 & bb0;
	assign nb1bb1 = nb1 & bb1;
	
	assign nb0cb0 = nb0 & cb0;
	assign nb0cb1 = nb0 & cb1;
	assign nb1cb0 = nb1 & cb0;
	assign nb1cb1 = nb1 & cb1;
	
	assign nb0db0 = nb0 & db0;
	assign nb0db1 = nb0 & db1;
	assign nb1db0 = nb1 & db0;
	assign nb1db1 = nb1 & db1;
	
	assign nb0eb0 = nb0 & eb0;
	assign nb0eb1 = nb0 & eb1;
	assign nb1eb0 = nb1 & eb0;
	assign nb1eb1 = nb1 & eb1;
	
	assign nb0fb0 = nb0 & fb0;
	assign nb0fb1 = nb0 & fb1;
	assign nb1fb0 = nb1 & fb0;
	assign nb1fb1 = nb1 & fb1;
	
	assign nb0gb0 = nb0 & gb0;
	assign nb0gb1 = nb0 & gb1;
	assign nb1gb0 = nb1 & gb0;
	assign nb1gb1 = nb1 & gb1;
	
	assign nb0hb0 = nb0 & hb0;
	assign nb0hb1 = nb0 & hb1;
	assign nb1hb0 = nb1 & hb0;
	assign nb1hb1 = nb1 & hb1;
	
	assign pb0ab0 = pb0 & ab0;
	assign pb0ab1 = pb0 & ab1;
	assign pb1ab0 = pb1 & ab0;
	assign pb1ab1 = pb1 & ab1;
	
	assign pb0bb0 = pb0 & bb0;
	assign pb0bb1 = pb0 & bb1;
	assign pb1bb0 = pb1 & bb0;
	assign pb1bb1 = pb1 & bb1;
	
	assign pb0cb0 = pb0 & cb0;
	assign pb0cb1 = pb0 & cb1;
	assign pb1cb0 = pb1 & cb0;
	assign pb1cb1 = pb1 & cb1;
	
	assign pb0db0 = pb0 & db0;
	assign pb0db1 = pb0 & db1;
	assign pb1db0 = pb1 & db0;
	assign pb1db1 = pb1 & db1;
	
	assign pb0eb0 = pb0 & eb0;
	assign pb0eb1 = pb0 & eb1;
	assign pb1eb0 = pb1 & eb0;
	assign pb1eb1 = pb1 & eb1;
	
	assign pb0fb0 = pb0 & fb0;
	assign pb0fb1 = pb0 & fb1;
	assign pb1fb0 = pb1 & fb0;
	assign pb1fb1 = pb1 & fb1;
	
	assign pb0gb0 = pb0 & gb0;
	assign pb0gb1 = pb0 & gb1;
	assign pb1gb0 = pb1 & gb0;
	assign pb1gb1 = pb1 & gb1;
	
	assign pb0hb0 = pb0 & hb0;
	assign pb0hb1 = pb0 & hb1;
	assign pb1hb0 = pb1 & hb0;
	assign pb1hb1 = pb1 & hb1;
	
	assign qb0ab0 = qb0 & ab0;
	assign qb0ab1 = qb0 & ab1;
	assign qb1ab0 = qb1 & ab0;
	assign qb1ab1 = qb1 & ab1;
	
	assign qb0bb0 = qb0 & bb0;
	assign qb0bb1 = qb0 & bb1;
	assign qb1bb0 = qb1 & bb0;
	assign qb1bb1 = qb1 & bb1;
	
	assign qb0cb0 = qb0 & cb0;
	assign qb0cb1 = qb0 & cb1;
	assign qb1cb0 = qb1 & cb0;
	assign qb1cb1 = qb1 & cb1;
	
	assign qb0db0 = qb0 & db0;
	assign qb0db1 = qb0 & db1;
	assign qb1db0 = qb1 & db0;
	assign qb1db1 = qb1 & db1;
	
	assign qb0eb0 = qb0 & eb0;
	assign qb0eb1 = qb0 & eb1;
	assign qb1eb0 = qb1 & eb0;
	assign qb1eb1 = qb1 & eb1;
	
	assign qb0fb0 = qb0 & fb0;
	assign qb0fb1 = qb0 & fb1;
	assign qb1fb0 = qb1 & fb0;
	assign qb1fb1 = qb1 & fb1;
	
	assign qb0gb0 = qb0 & gb0;
	assign qb0gb1 = qb0 & gb1;
	assign qb1gb0 = qb1 & gb0;
	assign qb1gb1 = qb1 & gb1;
	
	assign qb0hb0 = qb0 & hb0;
	assign qb0hb1 = qb0 & hb1;
	assign qb1hb0 = qb1 & hb0;
	assign qb1hb1 = qb1 & hb1;
	
	//// SboxA Masking Scheme;
	// xa_r;
	always @(posedge clk)
	begin
		xa_r[0] <= ma0 ^ na0	   ^ ma0ea0 ^ na0ea0 ^ pa0ea0 ^ ma0fa0 ^ qa0fa0 ^ ma0ga0 ^ pa0ga0 ^ na0ha0 ^ qa0ha0 ^ aa0;
		xa_r[1] <= ma0 ^ na0 ^ fa1 ^ ma0ea1 ^ na0ea1 ^ pa0ea1 ^ ma0fa1 ^ qa0fa1 ^ ma0ga1 ^ pa0ga1 ^ na0ha1 ^ qa0ha1 ^ aa0;
		xa_r[2] <= ma1 ^ na1	   ^ ma1ea0 ^ na1ea0 ^ pa1ea0 ^ ma1fa0 ^ qa1fa0 ^ ma1ga0 ^ pa1ga0 ^ na1ha0 ^ qa1ha0 ^ aa0;
		xa_r[3] <= ma1 ^ na1 ^ fa1 ^ ma1ea1 ^ na1ea1 ^ pa1ea1 ^ ma1fa1 ^ qa1fa1 ^ ma1ga1 ^ pa1ga1 ^ na1ha1 ^ qa1ha1 ^ aa0;
	end
	
	// ya_r;
	always @(posedge clk)
	begin
		ya_r[0] <= na0		 ^ ma0ea0 ^ qa0ea0 ^ na0fa0 ^ pa0fa0 ^ qa0fa0 ^ na0ga0 ^ qa0ga0 ^ ma0ha0 ^ na0ha0 ^ pa0ha0 ^ qa0ha0 ^ ba0;
		ya_r[1] <= na0 ^ ga1 ^ ma0ea1 ^ qa0ea1 ^ na0fa1 ^ pa0fa1 ^ qa0fa1 ^ na0ga1 ^ qa0ga1 ^ ma0ha1 ^ na0ha1 ^ pa0ha1 ^ qa0ha1 ^ ba0;
		ya_r[2] <= na1		 ^ ma1ea0 ^ qa1ea0 ^ na1fa0 ^ pa1fa0 ^ qa1fa0 ^ na1ga0 ^ qa1ga0 ^ ma1ha0 ^ na1ha0 ^ pa1ha0 ^ qa1ha0 ^ ba0;
		ya_r[3] <= na1 ^ ga1 ^ ma1ea1 ^ qa1ea1 ^ na1fa1 ^ pa1fa1 ^ qa1fa1 ^ na1ga1 ^ qa1ga1 ^ ma1ha1 ^ na1ha1 ^ pa1ha1 ^ qa1ha1 ^ ba0;
	end
	
	// za_r;
	always @(posedge clk)
	begin
		za_r[0] <= ma0		 ^ ma0ea0 ^ pa0ea0 ^ na0fa0 ^ qa0fa0 ^ ma0ga0 ^ pa0ga0 ^ qa0ga0 ^ na0ha0 ^ pa0ha0 ^ ca0;
		za_r[1] <= ma0 ^ ha1 ^ ma0ea1 ^ pa0ea1 ^ na0fa1 ^ qa0fa1 ^ ma0ga1 ^ pa0ga1 ^ qa0ga1 ^ na0ha1 ^ pa0ha1 ^ ca0;
		za_r[2] <= ma1		 ^ ma1ea0 ^ pa1ea0 ^ na1fa0 ^ qa1fa0 ^ ma1ga0 ^ pa1ga0 ^ qa1ga0 ^ na1ha0 ^ pa1ha0 ^ ca0;
		za_r[3] <= ma1 ^ ha1 ^ ma1ea1 ^ pa1ea1 ^ na1fa1 ^ qa1fa1 ^ ma1ga1 ^ pa1ga1 ^ qa1ga1 ^ na1ha1 ^ pa1ha1 ^ ca0;
	end
	
	// ta_r;
	always @(posedge clk)
	begin
		ta_r[0] <= pa0 ^ qa0 ^ ea0 ^ ha0 ^ na0ea0 ^ qa0ea0 ^ ma0fa0 ^ na0fa0 ^ pa0fa0 ^ qa0fa0 ^ na0ga0 ^ pa0ga0 ^ ma0ha0 ^ na0ha0 ^ qa0ha0 ^ da0;
		ta_r[1] <= pa0 ^ qa0 ^ fa1 ^ ga1 ^ na0ea1 ^ qa0ea1 ^ ma0fa1 ^ na0fa1 ^ pa0fa1 ^ qa0fa1 ^ na0ga1 ^ pa0ga1 ^ ma0ha1 ^ na0ha1 ^ qa0ha1 ^ da0;
		ta_r[2] <= pa1 ^ qa1 ^ ea0 ^ ha0 ^ na1ea0 ^ qa1ea0 ^ ma1fa0 ^ na1fa0 ^ pa1fa0 ^ qa1fa0 ^ na1ga0 ^ pa1ga0 ^ ma1ha0 ^ na1ha0 ^ qa1ha0 ^ da0;
		ta_r[3] <= pa1 ^ qa1 ^ fa1 ^ ga1 ^ na1ea1 ^ qa1ea1 ^ ma1fa1 ^ na1fa1 ^ pa1fa1 ^ qa1fa1 ^ na1ga1 ^ pa1ga1 ^ ma1ha1 ^ na1ha1 ^ qa1ha1 ^ da0;
	end
	
	// ra_r;
	always @(posedge clk)
	begin
		ra_r[0] <= ma0 ^ na0	   ^ ma0aa0 ^ na0aa0 ^ pa0aa0 ^ ma0ba0 ^ qa0ba0 ^ ma0ca0 ^ pa0ca0 ^ na0da0 ^ qa0da0 ^ ea0;
		ra_r[1] <= ma0 ^ na0 ^ ba1 ^ ma0aa1 ^ na0aa1 ^ pa0aa1 ^ ma0ba1 ^ qa0ba1 ^ ma0ca1 ^ pa0ca1 ^ na0da1 ^ qa0da1 ^ ea0;
		ra_r[2] <= ma1 ^ na1	   ^ ma1aa0 ^ na1aa0 ^ pa1aa0 ^ ma1ba0 ^ qa1ba0 ^ ma1ca0 ^ pa1ca0 ^ na1da0 ^ qa1da0 ^ ea0;
		ra_r[3] <= ma1 ^ na1 ^ ba1 ^ ma1aa1 ^ na1aa1 ^ pa1aa1 ^ ma1ba1 ^ qa1ba1 ^ ma1ca1 ^ pa1ca1 ^ na1da1 ^ qa1da1 ^ ea0;
	end
	
	// sa_r;
	always @(posedge clk)
	begin
		sa_r[0] <= na0		 ^ ma0aa0 ^ qa0aa0 ^ na0ba0 ^ pa0ba0 ^ qa0ba0 ^ na0ca0 ^ qa0ca0 ^ ma0da0 ^ na0da0 ^ pa0da0 ^ qa0da0 ^ fa0;
		sa_r[1] <= na0 ^ ca1 ^ ma0aa1 ^ qa0aa1 ^ na0ba1 ^ pa0ba1 ^ qa0ba1 ^ na0ca1 ^ qa0ca1 ^ ma0da1 ^ na0da1 ^ pa0da1 ^ qa0da1 ^ fa0;
		sa_r[2] <= na1		 ^ ma1aa0 ^ qa1aa0 ^ na1ba0 ^ pa1ba0 ^ qa1ba0 ^ na1ca0 ^ qa1ca0 ^ ma1da0 ^ na1da0 ^ pa1da0 ^ qa1da0 ^ fa0;
		sa_r[3] <= na1 ^ ca1 ^ ma1aa1 ^ qa1aa1 ^ na1ba1 ^ pa1ba1 ^ qa1ba1 ^ na1ca1 ^ qa1ca1 ^ ma1da1 ^ na1da1 ^ pa1da1 ^ qa1da1 ^ fa0;
	end
	
	// ua_r;
	always @(posedge clk)
	begin
		ua_r[0] <= ma0		 ^ ma0aa0 ^ pa0aa0 ^ na0ba0 ^ qa0ba0 ^ ma0ca0 ^ pa0ca0 ^ qa0ca0 ^ na0da0 ^ pa0da0 ^ ga0;
		ua_r[1] <= ma0 ^ da1 ^ ma0aa1 ^ pa0aa1 ^ na0ba1 ^ qa0ba1 ^ ma0ca1 ^ pa0ca1 ^ qa0ca1 ^ na0da1 ^ pa0da1 ^ ga0;
		ua_r[2] <= ma1		 ^ ma1aa0 ^ pa1aa0 ^ na1ba0 ^ qa1ba0 ^ ma1ca0 ^ pa1ca0 ^ qa1ca0 ^ na1da0 ^ pa1da0 ^ ga0;
		ua_r[3] <= ma1 ^ da1 ^ ma1aa1 ^ pa1aa1 ^ na1ba1 ^ qa1ba1 ^ ma1ca1 ^ pa1ca1 ^ qa1ca1 ^ na1da1 ^ pa1da1 ^ ga0;
	end
	
	// va_r;
	always @(posedge clk)
	begin
		va_r[0] <= pa0 ^ qa0 ^ aa0 ^ da0 ^ na0aa0 ^ qa0aa0 ^ ma0ba0 ^ na0ba0 ^ pa0ba0 ^ qa0ba0 ^ na0ca0 ^ pa0ca0 ^ ma0da0 ^ na0da0 ^ qa0da0 ^ ha0;
		va_r[1] <= pa0 ^ qa0 ^ ba1 ^ ca1 ^ na0aa1 ^ qa0aa1 ^ ma0ba1 ^ na0ba1 ^ pa0ba1 ^ qa0ba1 ^ na0ca1 ^ pa0ca1 ^ ma0da1 ^ na0da1 ^ qa0da1 ^ ha0;
		va_r[2] <= pa1 ^ qa1 ^ aa0 ^ da0 ^ na1aa0 ^ qa1aa0 ^ ma1ba0 ^ na1ba0 ^ pa1ba0 ^ qa1ba0 ^ na1ca0 ^ pa1ca0 ^ ma1da0 ^ na1da0 ^ qa1da0 ^ ha0;
		va_r[3] <= pa1 ^ qa1 ^ ba1 ^ ca1 ^ na1aa1 ^ qa1aa1 ^ ma1ba1 ^ na1ba1 ^ pa1ba1 ^ qa1ba1 ^ na1ca1 ^ pa1ca1 ^ ma1da1 ^ na1da1 ^ qa1da1 ^ ha0;
	end
	
	//// SboxB mbsking Scheme;
	// xb_r;
	always @(posedge clk)
	begin
		xb_r[0] <= mb0 ^ nb0	   ^ mb0eb0 ^ nb0eb0 ^ pb0eb0 ^ mb0fb0 ^ qb0fb0 ^ mb0gb0 ^ pb0gb0 ^ nb0hb0 ^ qb0hb0 ^ ab0;
		xb_r[1] <= mb0 ^ nb0 ^ fb1 ^ mb0eb1 ^ nb0eb1 ^ pb0eb1 ^ mb0fb1 ^ qb0fb1 ^ mb0gb1 ^ pb0gb1 ^ nb0hb1 ^ qb0hb1 ^ ab0;
		xb_r[2] <= mb1 ^ nb1	   ^ mb1eb0 ^ nb1eb0 ^ pb1eb0 ^ mb1fb0 ^ qb1fb0 ^ mb1gb0 ^ pb1gb0 ^ nb1hb0 ^ qb1hb0 ^ ab0;
		xb_r[3] <= mb1 ^ nb1 ^ fb1 ^ mb1eb1 ^ nb1eb1 ^ pb1eb1 ^ mb1fb1 ^ qb1fb1 ^ mb1gb1 ^ pb1gb1 ^ nb1hb1 ^ qb1hb1 ^ ab0;
	end
	
	// yb_r;
	always @(posedge clk)
	begin
		yb_r[0] <= nb0		 ^ mb0eb0 ^ qb0eb0 ^ nb0fb0 ^ pb0fb0 ^ qb0fb0 ^ nb0gb0 ^ qb0gb0 ^ mb0hb0 ^ nb0hb0 ^ pb0hb0 ^ qb0hb0 ^ bb0;
		yb_r[1] <= nb0 ^ gb1 ^ mb0eb1 ^ qb0eb1 ^ nb0fb1 ^ pb0fb1 ^ qb0fb1 ^ nb0gb1 ^ qb0gb1 ^ mb0hb1 ^ nb0hb1 ^ pb0hb1 ^ qb0hb1 ^ bb0;
		yb_r[2] <= nb1		 ^ mb1eb0 ^ qb1eb0 ^ nb1fb0 ^ pb1fb0 ^ qb1fb0 ^ nb1gb0 ^ qb1gb0 ^ mb1hb0 ^ nb1hb0 ^ pb1hb0 ^ qb1hb0 ^ bb0;
		yb_r[3] <= nb1 ^ gb1 ^ mb1eb1 ^ qb1eb1 ^ nb1fb1 ^ pb1fb1 ^ qb1fb1 ^ nb1gb1 ^ qb1gb1 ^ mb1hb1 ^ nb1hb1 ^ pb1hb1 ^ qb1hb1 ^ bb0;
	end
	
	// zb_r;
	always @(posedge clk)
	begin
		zb_r[0] <= mb0		 ^ mb0eb0 ^ pb0eb0 ^ nb0fb0 ^ qb0fb0 ^ mb0gb0 ^ pb0gb0 ^ qb0gb0 ^ nb0hb0 ^ pb0hb0 ^ cb0;
		zb_r[1] <= mb0 ^ hb1 ^ mb0eb1 ^ pb0eb1 ^ nb0fb1 ^ qb0fb1 ^ mb0gb1 ^ pb0gb1 ^ qb0gb1 ^ nb0hb1 ^ pb0hb1 ^ cb0;
		zb_r[2] <= mb1		 ^ mb1eb0 ^ pb1eb0 ^ nb1fb0 ^ qb1fb0 ^ mb1gb0 ^ pb1gb0 ^ qb1gb0 ^ nb1hb0 ^ pb1hb0 ^ cb0;
		zb_r[3] <= mb1 ^ hb1 ^ mb1eb1 ^ pb1eb1 ^ nb1fb1 ^ qb1fb1 ^ mb1gb1 ^ pb1gb1 ^ qb1gb1 ^ nb1hb1 ^ pb1hb1 ^ cb0;
	end
	
	// tb_r;
	always @(posedge clk)
	begin
		tb_r[0] <= pb0 ^ qb0 ^ eb0 ^ hb0 ^ nb0eb0 ^ qb0eb0 ^ mb0fb0 ^ nb0fb0 ^ pb0fb0 ^ qb0fb0 ^ nb0gb0 ^ pb0gb0 ^ mb0hb0 ^ nb0hb0 ^ qb0hb0 ^ db0;
		tb_r[1] <= pb0 ^ qb0 ^ fb1 ^ gb1 ^ nb0eb1 ^ qb0eb1 ^ mb0fb1 ^ nb0fb1 ^ pb0fb1 ^ qb0fb1 ^ nb0gb1 ^ pb0gb1 ^ mb0hb1 ^ nb0hb1 ^ qb0hb1 ^ db0;
		tb_r[2] <= pb1 ^ qb1 ^ eb0 ^ hb0 ^ nb1eb0 ^ qb1eb0 ^ mb1fb0 ^ nb1fb0 ^ pb1fb0 ^ qb1fb0 ^ nb1gb0 ^ pb1gb0 ^ mb1hb0 ^ nb1hb0 ^ qb1hb0 ^ db0;
		tb_r[3] <= pb1 ^ qb1 ^ fb1 ^ gb1 ^ nb1eb1 ^ qb1eb1 ^ mb1fb1 ^ nb1fb1 ^ pb1fb1 ^ qb1fb1 ^ nb1gb1 ^ pb1gb1 ^ mb1hb1 ^ nb1hb1 ^ qb1hb1 ^ db0;
	end
	
	// rb_r;
	always @(posedge clk)
	begin
		rb_r[0] <= mb0 ^ nb0	   ^ mb0ab0 ^ nb0ab0 ^ pb0ab0 ^ mb0bb0 ^ qb0bb0 ^ mb0cb0 ^ pb0cb0 ^ nb0db0 ^ qb0db0 ^ eb0;
		rb_r[1] <= mb0 ^ nb0 ^ bb1 ^ mb0ab1 ^ nb0ab1 ^ pb0ab1 ^ mb0bb1 ^ qb0bb1 ^ mb0cb1 ^ pb0cb1 ^ nb0db1 ^ qb0db1 ^ eb0;
		rb_r[2] <= mb1 ^ nb1	   ^ mb1ab0 ^ nb1ab0 ^ pb1ab0 ^ mb1bb0 ^ qb1bb0 ^ mb1cb0 ^ pb1cb0 ^ nb1db0 ^ qb1db0 ^ eb0;
		rb_r[3] <= mb1 ^ nb1 ^ bb1 ^ mb1ab1 ^ nb1ab1 ^ pb1ab1 ^ mb1bb1 ^ qb1bb1 ^ mb1cb1 ^ pb1cb1 ^ nb1db1 ^ qb1db1 ^ eb0;
	end
	
	// sb_r;
	always @(posedge clk)
	begin
		sb_r[0] <= nb0		 ^ mb0ab0 ^ qb0ab0 ^ nb0bb0 ^ pb0bb0 ^ qb0bb0 ^ nb0cb0 ^ qb0cb0 ^ mb0db0 ^ nb0db0 ^ pb0db0 ^ qb0db0 ^ fb0;
		sb_r[1] <= nb0 ^ cb1 ^ mb0ab1 ^ qb0ab1 ^ nb0bb1 ^ pb0bb1 ^ qb0bb1 ^ nb0cb1 ^ qb0cb1 ^ mb0db1 ^ nb0db1 ^ pb0db1 ^ qb0db1 ^ fb0;
		sb_r[2] <= nb1		 ^ mb1ab0 ^ qb1ab0 ^ nb1bb0 ^ pb1bb0 ^ qb1bb0 ^ nb1cb0 ^ qb1cb0 ^ mb1db0 ^ nb1db0 ^ pb1db0 ^ qb1db0 ^ fb0;
		sb_r[3] <= nb1 ^ cb1 ^ mb1ab1 ^ qb1ab1 ^ nb1bb1 ^ pb1bb1 ^ qb1bb1 ^ nb1cb1 ^ qb1cb1 ^ mb1db1 ^ nb1db1 ^ pb1db1 ^ qb1db1 ^ fb0;
	end
	
	// ub_r;
	always @(posedge clk)
	begin
		ub_r[0] <= mb0		 ^ mb0ab0 ^ pb0ab0 ^ nb0bb0 ^ qb0bb0 ^ mb0cb0 ^ pb0cb0 ^ qb0cb0 ^ nb0db0 ^ pb0db0 ^ gb0;
		ub_r[1] <= mb0 ^ db1 ^ mb0ab1 ^ pb0ab1 ^ nb0bb1 ^ qb0bb1 ^ mb0cb1 ^ pb0cb1 ^ qb0cb1 ^ nb0db1 ^ pb0db1 ^ gb0;
		ub_r[2] <= mb1		 ^ mb1ab0 ^ pb1ab0 ^ nb1bb0 ^ qb1bb0 ^ mb1cb0 ^ pb1cb0 ^ qb1cb0 ^ nb1db0 ^ pb1db0 ^ gb0;
		ub_r[3] <= mb1 ^ db1 ^ mb1ab1 ^ pb1ab1 ^ nb1bb1 ^ qb1bb1 ^ mb1cb1 ^ pb1cb1 ^ qb1cb1 ^ nb1db1 ^ pb1db1 ^ gb0;
	end
	
	// vb_r;
	always @(posedge clk)
	begin
		vb_r[0] <= pb0 ^ qb0 ^ ab0 ^ db0 ^ nb0ab0 ^ qb0ab0 ^ mb0bb0 ^ nb0bb0 ^ pb0bb0 ^ qb0bb0 ^ nb0cb0 ^ pb0cb0 ^ mb0db0 ^ nb0db0 ^ qb0db0 ^ hb0;
		vb_r[1] <= pb0 ^ qb0 ^ bb1 ^ cb1 ^ nb0ab1 ^ qb0ab1 ^ mb0bb1 ^ nb0bb1 ^ pb0bb1 ^ qb0bb1 ^ nb0cb1 ^ pb0cb1 ^ mb0db1 ^ nb0db1 ^ qb0db1 ^ hb0;
		vb_r[2] <= pb1 ^ qb1 ^ ab0 ^ db0 ^ nb1ab0 ^ qb1ab0 ^ mb1bb0 ^ nb1bb0 ^ pb1bb0 ^ qb1bb0 ^ nb1cb0 ^ pb1cb0 ^ mb1db0 ^ nb1db0 ^ qb1db0 ^ hb0;
		vb_r[3] <= pb1 ^ qb1 ^ bb1 ^ cb1 ^ nb1ab1 ^ qb1ab1 ^ mb1bb1 ^ nb1bb1 ^ pb1bb1 ^ qb1bb1 ^ nb1cb1 ^ pb1cb1 ^ mb1db1 ^ nb1db1 ^ qb1db1 ^ hb0;
	end
	
	//// Output Assign;
	// SboxA;
	assign xa[0] = xa_r[0] ^ xa_r[1];
	assign xa[1] = xa_r[2] ^ xa_r[3];
	
	assign ya[0] = ya_r[0] ^ ya_r[1];
	assign ya[1] = ya_r[2] ^ ya_r[3];
	
	assign za[0] = za_r[0] ^ za_r[1];
	assign za[1] = za_r[2] ^ za_r[3];
	
	assign ta[0] = ta_r[0] ^ ta_r[1];
	assign ta[1] = ta_r[2] ^ ta_r[3];
	
	assign ra[0] = ra_r[0] ^ ra_r[1];
	assign ra[1] = ra_r[2] ^ ra_r[3];
	
	assign sa[0] = sa_r[0] ^ sa_r[1];
	assign sa[1] = sa_r[2] ^ sa_r[3];
	
	assign ua[0] = ua_r[0] ^ ua_r[1];
	assign ua[1] = ua_r[2] ^ ua_r[3];
	
	assign va[0] = va_r[0] ^ va_r[1];
	assign va[1] = va_r[2] ^ va_r[3];
	
	
	// SboxB;
	assign xb[0] = xb_r[0] ^ xb_r[1];
	assign xb[1] = xb_r[2] ^ xb_r[3];
	
	assign yb[0] = yb_r[0] ^ yb_r[1];
	assign yb[1] = yb_r[2] ^ yb_r[3];
	
	assign zb[0] = zb_r[0] ^ zb_r[1];
	assign zb[1] = zb_r[2] ^ zb_r[3];
	
	assign tb[0] = tb_r[0] ^ tb_r[1];
	assign tb[1] = tb_r[2] ^ tb_r[3];
	
	assign rb[0] = rb_r[0] ^ rb_r[1];
	assign rb[1] = rb_r[2] ^ rb_r[3];
	
	assign sb[0] = sb_r[0] ^ sb_r[1];
	assign sb[1] = sb_r[2] ^ sb_r[3];
	
	assign ub[0] = ub_r[0] ^ ub_r[1];
	assign ub[1] = ub_r[2] ^ ub_r[3];
	
	assign vb[0] = vb_r[0] ^ vb_r[1];
	assign vb[1] = vb_r[2] ^ vb_r[3];
	
endmodule
