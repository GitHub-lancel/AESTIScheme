`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:08:54 10/26/2022 
// Design Name: 
// Module Name:    GF4Mul_Unit 
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
module GF4Mul_Unit(
	input				clk,
	
	// SboxA;
	input	[03:00]		da0ca0ba0aa0,
	input	[03:00]		da1ca1ba1aa1,
	
	input	[03:00]		ha0ga0fa0ea0,
	input	[03:00]		ha1ga1fa1ea1,
	
	input	[03:00]		ra3ra2ra1ra0,
	
	output	[01:00]		xa,
	output	[01:00]		ya,
	output	[01:00]		za,
	output	[01:00]		ta,
	
	// SboxB;
	input	[03:00]		db0cb0bb0ab0,
	input	[03:00]		db1cb1bb1ab1,
	
	input	[03:00]		hb0gb0fb0eb0,
	input	[03:00]		hb1gb1fb1eb1,
	
	input	[03:00]		rb3rb2rb1rb0,
	
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
	
	wire				aa0ea0, aa0ea1;
	wire				aa1ea0, aa1ea1;
	
	wire				aa0fa0, aa0fa1;
	wire				aa1fa0, aa1fa1;
	
	wire				ba0ea0, ba0ea1;
	wire				ba1ea0, ba1ea1;
	
	wire				ba0fa0, ba0fa1;
	wire				ba1fa0, ba1fa1;
	
	wire				ca0ga0, ca0ga1;
	wire				ca1ga0, ca1ga1;
	
	wire				ca0ha0, ca0ha1;
	wire				ca1ha0, ca1ha1;
	
	wire				da0ga0, da0ga1;
	wire				da1ga0, da1ga1;
	
	wire				da0ha0, da0ha1;
	wire				da1ha0, da1ha1;
		
	reg		[03:00]		xa_r;
	reg		[03:00]		ya_r;
	reg		[03:00]		za_r;
	reg		[03:00]		ta_r;
	
	wire				ra3;
	wire				ra2;
	wire				ra1;
	wire				ra0;
	
	// SboxB;
	wire				hb0, hb1;
	wire				gb0, gb1;
	wire				fb0, fb1;
	wire				eb0, eb1;
	
	wire				db0, db1;
	wire				cb0, cb1;
	wire				bb0, bb1;
	wire				ab0, ab1;
	
	wire				ab0eb0, ab0eb1;
	wire				ab1eb0, ab1eb1;
	
	wire				ab0fb0, ab0fb1;
	wire				ab1fb0, ab1fb1;
	
	wire				bb0eb0, bb0eb1;
	wire				bb1eb0, bb1eb1;
	
	wire				bb0fb0, bb0fb1;
	wire				bb1fb0, bb1fb1;
	
	wire				cb0hb0, cb0hb1;
	wire				cb1hb0, cb1hb1;
	
	wire				cb0gb0, cb0gb1;
	wire				cb1gb0, cb1gb1;
	
	wire				db0hb0, db0hb1;
	wire				db1hb0, db1hb1;
	
	wire				db0gb0, db0gb1;
	wire				db1gb0, db1gb1;
	
	reg		[03:00]		xb_r;
	reg		[03:00]		yb_r;
	reg		[03:00]		zb_r;
	reg		[03:00]		tb_r;
	
	wire				rb3;
	wire				rb2;
	wire				rb1;
	wire				rb0;
	
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
	
	assign ra3 = ra3ra2ra1ra0[3];
	assign ra2 = ra3ra2ra1ra0[2];
	assign ra1 = ra3ra2ra1ra0[1];
	assign ra0 = ra3ra2ra1ra0[0];
	
	assign aa0ea0 = aa0 & ea0;
	assign aa0ea1 = aa0 & ea1;
	assign aa1ea0 = aa1 & ea0;
	assign aa1ea1 = aa1 & ea1;
	
	assign aa0fa0 = aa0 & fa0;
	assign aa0fa1 = aa0 & fa1;
	assign aa1fa0 = aa1 & fa0;
	assign aa1fa1 = aa1 & fa1;
	
	assign ba0ea0 = ba0 & ea0;
	assign ba0ea1 = ba0 & ea1;
	assign ba1ea0 = ba1 & ea0;
	assign ba1ea1 = ba1 & ea1;
	
	assign ba0fa0 = ba0 & fa0;
	assign ba0fa1 = ba0 & fa1;
	assign ba1fa0 = ba1 & fa0;
	assign ba1fa1 = ba1 & fa1;
	
	assign ca0ga0 = ca0 & ga0;
	assign ca0ga1 = ca0 & ga1;
	assign ca1ga0 = ca1 & ga0;
	assign ca1ga1 = ca1 & ga1;
	
	assign ca0ha0 = ca0 & ha0;
	assign ca0ha1 = ca0 & ha1;
	assign ca1ha0 = ca1 & ha0;
	assign ca1ha1 = ca1 & ha1;
	
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
	
	assign rb3 = rb3rb2rb1rb0[3];
	assign rb2 = rb3rb2rb1rb0[2];
	assign rb1 = rb3rb2rb1rb0[1];
	assign rb0 = rb3rb2rb1rb0[0];
	
	assign ab0eb0 = ab0 & eb0;
	assign ab0eb1 = ab0 & eb1;
	assign ab1eb0 = ab1 & eb0;
	assign ab1eb1 = ab1 & eb1;
	
	assign ab0fb0 = ab0 & fb0;
	assign ab0fb1 = ab0 & fb1;
	assign ab1fb0 = ab1 & fb0;
	assign ab1fb1 = ab1 & fb1;
	
	assign bb0eb0 = bb0 & eb0;
	assign bb0eb1 = bb0 & eb1;
	assign bb1eb0 = bb1 & eb0;
	assign bb1eb1 = bb1 & eb1;
	
	assign bb0fb0 = bb0 & fb0;
	assign bb0fb1 = bb0 & fb1;
	assign bb1fb0 = bb1 & fb0;
	assign bb1fb1 = bb1 & fb1;
	
	assign cb0gb0 = cb0 & gb0;
	assign cb0gb1 = cb0 & gb1;
	assign cb1gb0 = cb1 & gb0;
	assign cb1gb1 = cb1 & gb1;
	
	assign cb0hb0 = cb0 & hb0;
	assign cb0hb1 = cb0 & hb1;
	assign cb1hb0 = cb1 & hb0;
	assign cb1hb1 = cb1 & hb1;
	
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
		xa_r[0] <=       da0ga0 ^ ca0ha0 ^ da0ha0 ^ rb3;
		xa_r[1] <= ha1 ^ da0ga1 ^ ca0ha1 ^ da0ha1 ^ rb3;
		xa_r[2] <=       da1ga0 ^ ca1ha0 ^ da1ha0 ^ rb3;
		xa_r[3] <= ha1 ^ da1ga1 ^ ca1ha1 ^ da1ha1 ^ rb3;
	end
	// ya_r;
	always @(posedge clk)
	begin
		ya_r[0] <=       ca0ga0 ^ da0ga0 ^ ca0ha0 ^ rb2;
		ya_r[1] <= ga1 ^ ca0ga1 ^ da0ga1 ^ ca0ha1 ^ rb2;
		ya_r[2] <=       ca1ga0 ^ da1ga0 ^ ca1ha0 ^ rb2;
		ya_r[3] <= ga1 ^ ca1ga1 ^ da1ga1 ^ ca1ha1 ^ rb2;
	end
	// za_r;
	always @(posedge clk)
	begin
		za_r[0] <=		 ba0ea0 ^ aa0fa0 ^ ba0fa0 ^ rb1;
		za_r[1] <= fa1 ^ ba0ea1 ^ aa0fa1 ^ ba0fa1 ^ rb1;
		za_r[2] <=		 ba1ea0 ^ aa1fa0 ^ ba1fa0 ^ rb1;
		za_r[3] <= fa1 ^ ba1ea1 ^ aa1fa1 ^ ba1fa1 ^ rb1;
	end
	// ta_r;
	always @(posedge clk)
	begin
		ta_r[0] <=		 aa0ea0 ^ ba0ea0 ^ aa0fa0 ^ rb0;
		ta_r[1] <= ea1 ^ aa0ea1 ^ ba0ea1 ^ aa0fa1 ^ rb0;
		ta_r[2] <=		 aa1ea0 ^ ba1ea0 ^ aa1fa0 ^ rb0;
		ta_r[3] <= ea1 ^ aa1ea1 ^ ba1ea1 ^ aa1fa1 ^ rb0;
	end
	
	//// SboxB Masking Scheme;
	// xb_r;
	always @(posedge clk)
	begin
		xb_r[0] <=       db0gb0 ^ cb0hb0 ^ db0hb0 ^ ra3;
		xb_r[1] <= hb1 ^ db0gb1 ^ cb0hb1 ^ db0hb1 ^ ra3;
		xb_r[2] <=       db1gb0 ^ cb1hb0 ^ db1hb0 ^ ra3;
		xb_r[3] <= hb1 ^ db1gb1 ^ cb1hb1 ^ db1hb1 ^ ra3;
	end
	// yb_r;
	always @(posedge clk)
	begin
		yb_r[0] <=       cb0gb0 ^ db0gb0 ^ cb0hb0 ^ ra2;
		yb_r[1] <= gb1 ^ cb0gb1 ^ db0gb1 ^ cb0hb1 ^ ra2;
		yb_r[2] <=       cb1gb0 ^ db1gb0 ^ cb1hb0 ^ ra2;
		yb_r[3] <= gb1 ^ cb1gb1 ^ db1gb1 ^ cb1hb1 ^ ra2;
	end
	// zb_r;
	always @(posedge clk)
	begin
		zb_r[0] <=		 bb0eb0 ^ ab0fb0 ^ bb0fb0 ^ ra1;
		zb_r[1] <= fb1 ^ bb0eb1 ^ ab0fb1 ^ bb0fb1 ^ ra1;
		zb_r[2] <=		 bb1eb0 ^ ab1fb0 ^ bb1fb0 ^ ra1;
		zb_r[3] <= fb1 ^ bb1eb1 ^ ab1fb1 ^ bb1fb1 ^ ra1;
	end
	// tb_r;
	always @(posedge clk)
	begin
		tb_r[0] <=		 ab0eb0 ^ bb0eb0 ^ ab0fb0 ^ ra0;
		tb_r[1] <= eb1 ^ ab0eb1 ^ bb0eb1 ^ ab0fb1 ^ ra0;
		tb_r[2] <=		 ab1eb0 ^ bb1eb0 ^ ab1fb0 ^ ra0;
		tb_r[3] <= eb1 ^ ab1eb1 ^ bb1eb1 ^ ab1fb1 ^ ra0;
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
