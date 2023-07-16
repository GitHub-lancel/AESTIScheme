`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:05:39 10/25/2022 
// Design Name: 
// Module Name:    GF16MulXorSqSc_Unit 
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
module GF16MulXorSqSc_Unit(
	input				clk,
	
	// SboxA;
	input	[03:00]		ha0ga0fa0ea0,
	input	[03:00]		ha1ga1fa1ea1,
	
	input	[03:00]		da0ca0ba0aa0,
	input	[03:00]		da1ca1ba1aa1,
	
	output	[01:00]		xa,
	output	[01:00]		ya,
	output	[01:00]		za,
	output	[01:00]		ta,
	
	// SboxB;
	input	[03:00]		hb0gb0fb0eb0,
	input	[03:00]		hb1gb1fb1eb1,
	
	input	[03:00]		db0cb0bb0ab0,
	input	[03:00]		db1cb1bb1ab1,
	
	output	[01:00]		xb,
	output	[01:00]		yb,
	output	[01:00]		zb,
	output	[01:00]		tb
    );
	
	//// intermediate;
	// SboxA;
	wire				ha0, ha1;
	wire				ga0, ga1;
	wire				fa0, fa1;
	wire				ea0, ea1;
	
	wire				da0, da1;
	wire				ca0, ca1;
	wire				ba0, ba1;
	wire				aa0, aa1;
	
	wire				aa0ea0, aa0ea1, aa1ea0, aa1ea1;
	wire				aa0fa0, aa0fa1, aa1fa0, aa1fa1;
	wire				aa0ga0, aa0ga1, aa1ga0, aa1ga1;
	wire				aa0ha0, aa0ha1, aa1ha0, aa1ha1;
	
	wire 				ba0ea0, ba0ea1, ba1ea0, ba1ea1;
	wire 				ba0fa0, ba0fa1, ba1fa0, ba1fa1;
	wire 				ba0ga0, ba0ga1, ba1ga0, ba1ga1;
	wire				ba0ha0, ba0ha1, ba1ha0, ba1ha1;
	
	
	wire				ca0ea0, ca0ea1, ca1ea0, ca1ea1;
	wire				ca0fa0, ca0fa1, ca1fa0, ca1fa1;
	wire				ca0ga0, ca0ga1, ca1ga0, ca1ga1;
	wire				ca0ha0, ca0ha1, ca1ha0, ca1ha1;
	
	wire				da0ea0, da0ea1, da1ea0, da1ea1;
	wire				da0fa0, da0fa1, da1fa0, da1fa1;
	wire				da0ga0, da0ga1, da1ga0, da1ga1;
	wire				da0ha0, da0ha1, da1ha0, da1ha1;
	
	reg		[03:00]		xa_r;
	reg		[03:00]		ya_r;
	reg		[03:00]		za_r;
	reg		[03:00]		ta_r;
	
	// SboxB;
	wire				hb0, hb1;
	wire				gb0, gb1;
	wire				fb0, fb1;
	wire				eb0, eb1;
	
	wire				db0, db1;
	wire				cb0, cb1;
	wire				bb0, bb1;
	wire				ab0, ab1;
	
	wire				ab0eb0, ab0eb1, ab1eb0, ab1eb1;
	wire				ab0fb0, ab0fb1, ab1fb0, ab1fb1;
	wire				ab0gb0, ab0gb1, ab1gb0, ab1gb1;
	wire				ab0hb0, ab0hb1, ab1hb0, ab1hb1;
	
	wire 				bb0eb0, bb0eb1, bb1eb0, bb1eb1;
	wire 				bb0fb0, bb0fb1, bb1fb0, bb1fb1;
	wire 				bb0gb0, bb0gb1, bb1gb0, bb1gb1;
	wire				bb0hb0, bb0hb1, bb1hb0, bb1hb1;
	
	
	wire				cb0eb0, cb0eb1, cb1eb0, cb1eb1;
	wire				cb0fb0, cb0fb1, cb1fb0, cb1fb1;
	wire				cb0gb0, cb0gb1, cb1gb0, cb1gb1;
	wire				cb0hb0, cb0hb1, cb1hb0, cb1hb1;
	
	wire				db0eb0, db0eb1, db1eb0, db1eb1;
	wire				db0fb0, db0fb1, db1fb0, db1fb1;
	wire				db0gb0, db0gb1, db1gb0, db1gb1;
	wire				db0hb0, db0hb1, db1hb0, db1hb1;
	
	reg		[03:00]		xb_r;
	reg		[03:00]		yb_r;
	reg		[03:00]		zb_r;
	reg		[03:00]		tb_r;
	
	// SboxA assign;
	assign ha0 = ha0ga0fa0ea0[3];
	assign ga0 = ha0ga0fa0ea0[2];
	assign fa0 = ha0ga0fa0ea0[1];
	assign ea0 = ha0ga0fa0ea0[0];
	
	assign da0 = da0ca0ba0aa0[3];
	assign ca0 = da0ca0ba0aa0[2];
	assign ba0 = da0ca0ba0aa0[1];
	assign aa0 = da0ca0ba0aa0[0];
	
	assign ha1 = ha1ga1fa1ea1[3];
	assign ga1 = ha1ga1fa1ea1[2];
	assign fa1 = ha1ga1fa1ea1[1];
	assign ea1 = ha1ga1fa1ea1[0];
	
	assign da1 = da1ca1ba1aa1[3];
	assign ca1 = da1ca1ba1aa1[2];
	assign ba1 = da1ca1ba1aa1[1];
	assign aa1 = da1ca1ba1aa1[0];
	
	assign aa0ea0 = aa0 & ea0;
	assign aa0ea1 = aa0 & ea1;
	assign aa1ea0 = aa1 & ea0;
	assign aa1ea1 = aa1 & ea1;
	
	assign aa0fa0 = aa0 & fa0;
	assign aa0fa1 = aa0 & fa1;
	assign aa1fa0 = aa1 & fa0;
	assign aa1fa1 = aa1 & fa1;
	
	assign aa0ga0 = aa0 & ga0;
	assign aa0ga1 = aa0 & ga1;
	assign aa1ga0 = aa1 & ga0;
	assign aa1ga1 = aa1 & ga1;
	
	assign aa0ha0 = aa0 & ha0;
	assign aa0ha1 = aa0 & ha1;
	assign aa1ha0 = aa1 & ha0;
	assign aa1ha1 = aa1 & ha1;
	
	assign ba0ea0 = ba0 & ea0;
	assign ba0ea1 = ba0 & ea1;
	assign ba1ea0 = ba1 & ea0;
	assign ba1ea1 = ba1 & ea1;
	
	assign ba0fa0 = ba0 & fa0;
	assign ba0fa1 = ba0 & fa1;
	assign ba1fa0 = ba1 & fa0;
	assign ba1fa1 = ba1 & fa1;
	
	assign ba0ga0 = ba0 & ga0;
	assign ba0ga1 = ba0 & ga1;
	assign ba1ga0 = ba1 & ga0;
	assign ba1ga1 = ba1 & ga1;
	
	assign ba0ha0 = ba0 & ha0;
	assign ba0ha1 = ba0 & ha1;
	assign ba1ha0 = ba1 & ha0;
	assign ba1ha1 = ba1 & ha1;
	
	assign ca0ea0 = ca0 & ea0;
	assign ca0ea1 = ca0 & ea1;
	assign ca1ea0 = ca1 & ea0;
	assign ca1ea1 = ca1 & ea1;
	
	assign ca0fa0 = ca0 & fa0;
	assign ca0fa1 = ca0 & fa1;
	assign ca1fa0 = ca1 & fa0;
	assign ca1fa1 = ca1 & fa1;
	
	assign ca0ga0 = ca0 & ga0;
	assign ca0ga1 = ca0 & ga1;
	assign ca1ga0 = ca1 & ga0;
	assign ca1ga1 = ca1 & ga1;
	
	assign ca0ha0 = ca0 & ha0;
	assign ca0ha1 = ca0 & ha1;
	assign ca1ha0 = ca1 & ha0;
	assign ca1ha1 = ca1 & ha1;
	
	assign da0ea0 = da0 & ea0;
	assign da0ea1 = da0 & ea1;
	assign da1ea0 = da1 & ea0;
	assign da1ea1 = da1 & ea1;
	
	assign da0fa0 = da0 & fa0;
	assign da0fa1 = da0 & fa1;
	assign da1fa0 = da1 & fa0;
	assign da1fa1 = da1 & fa1;
	
	assign da0ga0 = da0 & ga0;
	assign da0ga1 = da0 & ga1;
	assign da1ga0 = da1 & ga0;
	assign da1ga1 = da1 & ga1;
	
	assign da0ha0 = da0 & ha0;
	assign da0ha1 = da0 & ha1;
	assign da1ha0 = da1 & ha0;
	assign da1ha1 = da1 & ha1;
	
	// SboxB assign;
	assign hb0 = hb0gb0fb0eb0[3];
	assign gb0 = hb0gb0fb0eb0[2];
	assign fb0 = hb0gb0fb0eb0[1];
	assign eb0 = hb0gb0fb0eb0[0];
	
	assign db0 = db0cb0bb0ab0[3];
	assign cb0 = db0cb0bb0ab0[2];
	assign bb0 = db0cb0bb0ab0[1];
	assign ab0 = db0cb0bb0ab0[0];
	
	assign hb1 = hb1gb1fb1eb1[3];
	assign gb1 = hb1gb1fb1eb1[2];
	assign fb1 = hb1gb1fb1eb1[1];
	assign eb1 = hb1gb1fb1eb1[0];
	
	assign db1 = db1cb1bb1ab1[3];
	assign cb1 = db1cb1bb1ab1[2];
	assign bb1 = db1cb1bb1ab1[1];
	assign ab1 = db1cb1bb1ab1[0];
	
	assign ab0eb0 = ab0 & eb0;
	assign ab0eb1 = ab0 & eb1;
	assign ab1eb0 = ab1 & eb0;
	assign ab1eb1 = ab1 & eb1;
	
	assign ab0fb0 = ab0 & fb0;
	assign ab0fb1 = ab0 & fb1;
	assign ab1fb0 = ab1 & fb0;
	assign ab1fb1 = ab1 & fb1;
	
	assign ab0gb0 = ab0 & gb0;
	assign ab0gb1 = ab0 & gb1;
	assign ab1gb0 = ab1 & gb0;
	assign ab1gb1 = ab1 & gb1;
	
	assign ab0hb0 = ab0 & hb0;
	assign ab0hb1 = ab0 & hb1;
	assign ab1hb0 = ab1 & hb0;
	assign ab1hb1 = ab1 & hb1;
	
	assign bb0eb0 = bb0 & eb0;
	assign bb0eb1 = bb0 & eb1;
	assign bb1eb0 = bb1 & eb0;
	assign bb1eb1 = bb1 & eb1;
	
	assign bb0fb0 = bb0 & fb0;
	assign bb0fb1 = bb0 & fb1;
	assign bb1fb0 = bb1 & fb0;
	assign bb1fb1 = bb1 & fb1;
	
	assign bb0gb0 = bb0 & gb0;
	assign bb0gb1 = bb0 & gb1;
	assign bb1gb0 = bb1 & gb0;
	assign bb1gb1 = bb1 & gb1;
	
	assign bb0hb0 = bb0 & hb0;
	assign bb0hb1 = bb0 & hb1;
	assign bb1hb0 = bb1 & hb0;
	assign bb1hb1 = bb1 & hb1;
	
	assign cb0eb0 = cb0 & eb0;
	assign cb0eb1 = cb0 & eb1;
	assign cb1eb0 = cb1 & eb0;
	assign cb1eb1 = cb1 & eb1;
	
	assign cb0fb0 = cb0 & fb0;
	assign cb0fb1 = cb0 & fb1;
	assign cb1fb0 = cb1 & fb0;
	assign cb1fb1 = cb1 & fb1;
	
	assign cb0gb0 = cb0 & gb0;
	assign cb0gb1 = cb0 & gb1;
	assign cb1gb0 = cb1 & gb0;
	assign cb1gb1 = cb1 & gb1;
	
	assign cb0hb0 = cb0 & hb0;
	assign cb0hb1 = cb0 & hb1;
	assign cb1hb0 = cb1 & hb0;
	assign cb1hb1 = cb1 & hb1;
	
	assign db0eb0 = db0 & eb0;
	assign db0eb1 = db0 & eb1;
	assign db1eb0 = db1 & eb0;
	assign db1eb1 = db1 & eb1;
	
	assign db0fb0 = db0 & fb0;
	assign db0fb1 = db0 & fb1;
	assign db1fb0 = db1 & fb0;
	assign db1fb1 = db1 & fb1;
	
	assign db0gb0 = db0 & gb0;
	assign db0gb1 = db0 & gb1;
	assign db1gb0 = db1 & gb0;
	assign db1gb1 = db1 & gb1;
	
	assign db0hb0 = db0 & hb0;
	assign db0hb1 = db0 & hb1;
	assign db1hb0 = db1 & hb0;
	assign db1hb1 = db1 & hb1;
	
	//// SboxA Masking Scheme;
	// xa_r;
	always @(posedge clk)
	begin 
		xa_r[0] <=			   aa0ea0 ^ ba0ea0 ^ ca0ea0 ^ aa0fa0 ^ da0fa0 ^ aa0ga0 ^ ca0ga0 ^ ba0ha0 ^ da0ha0 ^ ab0;
		xa_r[1] <= aa0 ^ ea1 ^ aa0ea1 ^ ba0ea1 ^ ca0ea1 ^ aa0fa1 ^ da0fa1 ^ aa0ga1 ^ ca0ga1 ^ ba0ha1 ^ da0ha1 ^ ab0;
		xa_r[2] <= da1 ^ ea0 ^ aa1ea0 ^ ba1ea0 ^ ca1ea0 ^ aa1fa0 ^ da1fa0 ^ aa1ga0 ^ ca1ga0 ^ ba1ha0 ^ da1ha0 ^ ab0;
		xa_r[3] <= aa1 ^ da1 ^ aa1ea1 ^ ba1ea1 ^ ca1ea1 ^ aa1fa1 ^ da1fa1 ^ aa1ga1 ^ ca1ga1 ^ ba1ha1 ^ da1ha1 ^ ab0;
	end
	
	// ya_r;
	always @(posedge clk)
	begin
		ya_r[0] =			  da0	    ^ aa0ea0 ^ da0ea0 ^ ba0fa0 ^ ca0fa0 ^ da0fa0 ^ ba0ga0 ^ da0ga0 ^ aa0ha0 ^ ba0ha0 ^ ca0ha0 ^ da0ha0 ^ bb0;
		ya_r[1] = aa0 ^ ba0 ^ da0 ^ fa1 ^ aa0ea1 ^ da0ea1 ^ ba0fa1 ^ ca0fa1 ^ da0fa1 ^ ba0ga1 ^ da0ga1 ^ aa0ha1 ^ ba0ha1 ^ ca0ha1 ^ da0ha1 ^ bb0;
		ya_r[2] = aa1 ^ ba1	^ ea0 ^ fa0 ^ aa1ea0 ^ da1ea0 ^ ba1fa0 ^ ca1fa0 ^ da1fa0 ^ ba1ga0 ^ da1ga0 ^ aa1ha0 ^ ba1ha0 ^ ca1ha0 ^ da1ha0 ^ bb0;
		ya_r[3] =			  ea1       ^ aa1ea1 ^ da1ea1 ^ ba1fa1 ^ ca1fa1 ^ da1fa1 ^ ba1ga1 ^ da1ga1 ^ aa1ha1 ^ ba1ha1 ^ ca1ha1 ^ da1ha1 ^ bb0;
	end
	
	// za_r;
	always @(posedge clk)
	begin
		za_r[0] <= aa0						   ^ aa0ea0 ^ ca0ea0 ^ ba0fa0 ^ da0fa0 ^ aa0ga0 ^ ca0ga0 ^ da0ga0 ^ ba0ha0 ^ ca0ha0 ^ cb0;
		za_r[1] <= aa0 ^ ba0 ^ da0       ^ ga1 ^ aa0ea1 ^ ca0ea1 ^ ba0fa1 ^ da0fa1 ^ aa0ga1 ^ ca0ga1 ^ da0ga1 ^ ba0ha1 ^ ca0ha1 ^ cb0;
		za_r[2] <= aa1 ^ ba1 ^ da1 ^ fa0 ^ ha0 ^ aa1ea0 ^ ca1ea0 ^ ba1fa0 ^ da1fa0 ^ aa1ga0 ^ ca1ga0 ^ da1ga0 ^ ba1ha0 ^ ca1ha0 ^ cb0;
		za_r[3] <= aa1       ^ fa1 ^ ga1 ^ ha1 ^ aa1ea1 ^ ca1ea1 ^ ba1fa1 ^ da1fa1 ^ aa1ga1 ^ ca1ga1 ^ da1ga1 ^ ba1ha1 ^ ca1ha1 ^ cb0;
	end
	
	// ta_r;
	always @(posedge clk)
	begin
		ta_r[0] <=		 ba0				   ^ ba0ea0 ^ da0ea0 ^ aa0fa0 ^ ba0fa0 ^ ca0fa0 ^ da0fa0 ^ ba0ga0 ^ ca0ga0 ^ aa0ha0 ^ ba0ha0 ^ da0ha0 ^ db0;
		ta_r[1] <= aa0 ^ ba0 ^ ca0		 ^ ha1 ^ ba0ea1 ^ da0ea1 ^ aa0fa1 ^ ba0fa1 ^ ca0fa1 ^ da0fa1 ^ ba0ga1 ^ ca0ga1 ^ aa0ha1 ^ ba0ha1 ^ da0ha1 ^ db0;
		ta_r[2] <= aa1 ^ ba1 ^ ca1 ^ ea0 ^ ga0 ^ ba1ea0 ^ da1ea0 ^ aa1fa0 ^ ba1fa0 ^ ca1fa0 ^ da1fa0 ^ ba1ga0 ^ ca1ga0 ^ aa1ha0 ^ ba1ha0 ^ da1ha0 ^ db0;
		ta_r[3] <=       ba1 ^ ea1 ^ ga1 ^ ha1 ^ ba1ea1 ^ da1ea1 ^ aa1fa1 ^ ba1fa1 ^ ca1fa1 ^ da1fa1 ^ ba1ga1 ^ ca1ga1 ^ aa1ha1 ^ ba1ha1 ^ da1ha1 ^ db0;	
	end
	
	//// SboxB Masking Scheme;
	// xb_r;
	always @(posedge clk)
	begin 
		xb_r[0] <=			   ab0eb0 ^ bb0eb0 ^ cb0eb0 ^ ab0fb0 ^ db0fb0 ^ ab0gb0 ^ cb0gb0 ^ bb0hb0 ^ db0hb0 ^ aa0;
		xb_r[1] <= ab0 ^ eb1 ^ ab0eb1 ^ bb0eb1 ^ cb0eb1 ^ ab0fb1 ^ db0fb1 ^ ab0gb1 ^ cb0gb1 ^ bb0hb1 ^ db0hb1 ^ aa0;
		xb_r[2] <= db1 ^ eb0 ^ ab1eb0 ^ bb1eb0 ^ cb1eb0 ^ ab1fb0 ^ db1fb0 ^ ab1gb0 ^ cb1gb0 ^ bb1hb0 ^ db1hb0 ^ aa0;
		xb_r[3] <= ab1 ^ db1 ^ ab1eb1 ^ bb1eb1 ^ cb1eb1 ^ ab1fb1 ^ db1fb1 ^ ab1gb1 ^ cb1gb1 ^ bb1hb1 ^ db1hb1 ^ aa0;
	end
	
	// yb_r;
	always @(posedge clk)
	begin
		yb_r[0] =			  db0	    ^ ab0eb0 ^ db0eb0 ^ bb0fb0 ^ cb0fb0 ^ db0fb0 ^ bb0gb0 ^ db0gb0 ^ ab0hb0 ^ bb0hb0 ^ cb0hb0 ^ db0hb0 ^ ba0;
		yb_r[1] = ab0 ^ bb0 ^ db0 ^ fb1 ^ ab0eb1 ^ db0eb1 ^ bb0fb1 ^ cb0fb1 ^ db0fb1 ^ bb0gb1 ^ db0gb1 ^ ab0hb1 ^ bb0hb1 ^ cb0hb1 ^ db0hb1 ^ ba0;
		yb_r[2] = ab1 ^ bb1	^ eb0 ^ fb0 ^ ab1eb0 ^ db1eb0 ^ bb1fb0 ^ cb1fb0 ^ db1fb0 ^ bb1gb0 ^ db1gb0 ^ ab1hb0 ^ bb1hb0 ^ cb1hb0 ^ db1hb0 ^ ba0;
		yb_r[3] =			  eb1       ^ ab1eb1 ^ db1eb1 ^ bb1fb1 ^ cb1fb1 ^ db1fb1 ^ bb1gb1 ^ db1gb1 ^ ab1hb1 ^ bb1hb1 ^ cb1hb1 ^ db1hb1 ^ ba0;
	end
	
	// zb_r;
	always @(posedge clk)
	begin
		zb_r[0] <= ab0						   ^ ab0eb0 ^ cb0eb0 ^ bb0fb0 ^ db0fb0 ^ ab0gb0 ^ cb0gb0 ^ db0gb0 ^ bb0hb0 ^ cb0hb0 ^ ca0;
		zb_r[1] <= ab0 ^ bb0 ^ db0       ^ gb1 ^ ab0eb1 ^ cb0eb1 ^ bb0fb1 ^ db0fb1 ^ ab0gb1 ^ cb0gb1 ^ db0gb1 ^ bb0hb1 ^ cb0hb1 ^ ca0;
		zb_r[2] <= ab1 ^ bb1 ^ db1 ^ fb0 ^ hb0 ^ ab1eb0 ^ cb1eb0 ^ bb1fb0 ^ db1fb0 ^ ab1gb0 ^ cb1gb0 ^ db1gb0 ^ bb1hb0 ^ cb1hb0 ^ ca0;
		zb_r[3] <= ab1       ^ fb1 ^ gb1 ^ hb1 ^ ab1eb1 ^ cb1eb1 ^ bb1fb1 ^ db1fb1 ^ ab1gb1 ^ cb1gb1 ^ db1gb1 ^ bb1hb1 ^ cb1hb1 ^ ca0;
	end
	
	// tb_r;
	always @(posedge clk)
	begin
		tb_r[0] <=		 bb0				   ^ bb0eb0 ^ db0eb0 ^ ab0fb0 ^ bb0fb0 ^ cb0fb0 ^ db0fb0 ^ bb0gb0 ^ cb0gb0 ^ ab0hb0 ^ bb0hb0 ^ db0hb0 ^ da0;
		tb_r[1] <= ab0 ^ bb0 ^ cb0		 ^ hb1 ^ bb0eb1 ^ db0eb1 ^ ab0fb1 ^ bb0fb1 ^ cb0fb1 ^ db0fb1 ^ bb0gb1 ^ cb0gb1 ^ ab0hb1 ^ bb0hb1 ^ db0hb1 ^ da0;
		tb_r[2] <= ab1 ^ bb1 ^ cb1 ^ eb0 ^ gb0 ^ bb1eb0 ^ db1eb0 ^ ab1fb0 ^ bb1fb0 ^ cb1fb0 ^ db1fb0 ^ bb1gb0 ^ cb1gb0 ^ ab1hb0 ^ bb1hb0 ^ db1hb0 ^ da0;
		tb_r[3] <=       bb1 ^ eb1 ^ gb1 ^ hb1 ^ bb1eb1 ^ db1eb1 ^ ab1fb1 ^ bb1fb1 ^ cb1fb1 ^ db1fb1 ^ bb1gb1 ^ cb1gb1 ^ ab1hb1 ^ bb1hb1 ^ db1hb1 ^ da0;	
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
	
	// SboxB;
	assign xb[0] = xb_r[0] ^ xb_r[1];
	assign xb[1] = xb_r[2] ^ xb_r[3];
	
	assign yb[0] = yb_r[0] ^ yb_r[1];
	assign yb[1] = yb_r[2] ^ yb_r[3];
	
	assign zb[0] = zb_r[0] ^ zb_r[1];
	assign zb[1] = zb_r[2] ^ zb_r[3];
	
	assign tb[0] = tb_r[0] ^ tb_r[1];
	assign tb[1] = tb_r[2] ^ tb_r[3];
	

endmodule
