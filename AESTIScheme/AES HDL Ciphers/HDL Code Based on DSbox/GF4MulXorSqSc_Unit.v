`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:31:36 10/26/2022 
// Design Name: 
// Module Name:    GF4MulXorSqSc_Unit 
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
module GF4MulXorSqSc_Unit(
	input				clk,
	
	// SboxA;
	input	[03:00]		da0ca0ba0aa0,
	input	[03:00]		da1ca1ba1aa1,
	input	[03:00]		ra3ra2ra1ra0,
	
	output	[01:00]		xa,
	output	[01:00]		ya,
	output	[01:00]		za,
	output	[01:00]		ta,
	
	// SboxB;
	input	[03:00]		db0cb0bb0ab0,
	input	[03:00]		db1cb1bb1ab1,
	input	[03:00]		rb3rb2rb1rb0,
	
	output	[01:00]		xb,
	output	[01:00]		yb,
	output	[01:00]		zb,
	output	[01:00]		tb,
	
	// random;
	input	[07:00]		random
    );
	
	//// intermediate;
	// SboxA;
	wire				da0, da1;
	wire				ca0, ca1;
	wire				ba0, ba1;
	wire				aa0, aa1;
	
	wire				ra3, ra2;
	wire				ra1, ra0;
	
	wire				aa0ca0, aa0ca1;
	wire				aa1ca0, aa1ca1;
	
	wire				aa0da0, aa0da1;
	wire				aa1da0, aa1da1;
	
	wire				ba0ca0, ba0ca1;
	wire				ba1ca0, ba1ca1;
	
	wire				ba0da0, ba0da1;
	wire				ba1da0, ba1da1;
	
	wire	[03:00]		taa, tba;
	
	reg		[03:00]		xa_r;
	reg		[03:00]		ya_r;
	reg		[03:00]		za_r;
	reg		[03:00]		ta_r;
	
	// SboxB;
	wire				db0, db1;
	wire				cb0, cb1;
	wire				bb0, bb1;
	wire				ab0, ab1;
	
	wire				rb3, rb2;
	wire				rb1, rb0;
	
	wire				ab0cb0, ab0cb1;
	wire				ab1cb0, ab1cb1;
						
	wire				ab0db0, ab0db1;
	wire				ab1db0, ab1db1;
						
	wire				bb0cb0, bb0cb1;
	wire				bb1cb0, bb1cb1;
						
	wire				bb0db0, bb0db1;
	wire				bb1db0, bb1db1;
	
	wire	[03:00]		tab;
	wire	[03:00]		tbb;
	
	reg		[03:00]		xb_r;
	reg		[03:00]		yb_r;
	reg		[03:00]		zb_r;
	reg		[03:00]		tb_r;
	
	// SboxA assign;
	assign da0 = da0ca0ba0aa0[3];
	assign ca0 = da0ca0ba0aa0[2];
	assign ba0 = da0ca0ba0aa0[1];
	assign aa0 = da0ca0ba0aa0[0];
	
	assign da1 = da1ca1ba1aa1[3];
	assign ca1 = da1ca1ba1aa1[2];
	assign ba1 = da1ca1ba1aa1[1];
	assign aa1 = da1ca1ba1aa1[0];
	
	assign ra3 = ra3ra2ra1ra0[3];
	assign ra2 = ra3ra2ra1ra0[2];
	assign ra1 = ra3ra2ra1ra0[1];
	assign ra0 = ra3ra2ra1ra0[0];
	
	assign aa0ca0 = aa0 & ca0;
	assign aa0ca1 = aa0 & ca1;
	assign aa1ca0 = aa1 & ca0;
	assign aa1ca1 = aa1 & ca1;
	
	assign aa0da0 = aa0 & da0;
	assign aa0da1 = aa0 & da1;
	assign aa1da0 = aa1 & da0;
	assign aa1da1 = aa1 & da1;
	
	assign ba0ca0 = ba0 & ca0;
	assign ba0ca1 = ba0 & ca1;
	assign ba1ca0 = ba1 & ca0;
	assign ba1ca1 = ba1 & ca1;
	
	assign ba0da0 = ba0 & da0;
	assign ba0da1 = ba0 & da1;
	assign ba1da0 = ba1 & da0;
	assign ba1da1 = ba1 & da1;
	
	// SboxB assign;
	assign db0 = db0cb0bb0ab0[3];
	assign cb0 = db0cb0bb0ab0[2];
	assign bb0 = db0cb0bb0ab0[1];
	assign ab0 = db0cb0bb0ab0[0];
			
	assign db1 = db1cb1bb1ab1[3];
	assign cb1 = db1cb1bb1ab1[2];
	assign bb1 = db1cb1bb1ab1[1];
	assign ab1 = db1cb1bb1ab1[0];
			
	assign rb3 = rb3rb2rb1rb0[3];
	assign rb2 = rb3rb2rb1rb0[2];
	assign rb1 = rb3rb2rb1rb0[1];
	assign rb0 = rb3rb2rb1rb0[0];
	
	assign ab0cb0 = ab0 & cb0;
	assign ab0cb1 = ab0 & cb1;
	assign ab1cb0 = ab1 & cb0;
	assign ab1cb1 = ab1 & cb1;
	
	assign ab0db0 = ab0 & db0;
	assign ab0db1 = ab0 & db1;
	assign ab1db0 = ab1 & db0;
	assign ab1db1 = ab1 & db1;
	
	assign bb0cb0 = bb0 & cb0;
	assign bb0cb1 = bb0 & cb1;
	assign bb1cb0 = bb1 & cb0;
	assign bb1cb1 = bb1 & cb1;
	
	assign bb0db0 = bb0 & db0;
	assign bb0db1 = bb0 & db1;
	assign bb1db0 = bb1 & db0;
	assign bb1db1 = bb1 & db1;
	
	//// SboxA Masking Scheme;
	assign taa[0] = ba0       ^ aa0ca0 ^ ba0ca0 ^ aa0da0;
	assign taa[1] =             aa0ca1 ^ ba0ca1 ^ aa0da1;
	assign taa[2] = ba1 ^ da0 ^ aa1ca0 ^ ba1ca0 ^ aa1da0;
	assign taa[3] =       da1 ^ aa1ca1 ^ ba1ca1 ^ aa1da1;
	
	assign tba[0] = aa0 ^ ba0             ^ ba0ca0 ^ aa0da0 ^ ba0da0;
	assign tba[1] =                         ba0ca1 ^ aa0da1 ^ ba0da1;
	assign tba[2] = aa1 ^ ba1 ^ ca0 ^ da0 ^ ba1ca0 ^ aa1da0 ^ ba1da0;
	assign tba[3] =             ca1 ^ da1 ^ ba1ca1 ^ aa1da1 ^ ba1da1;
	
	// xa_r;
	always @(posedge clk)
	begin
		xa_r[0] <= taa[0] ^ rb3 ^ random[0];
		xa_r[1] <= taa[1] ^ rb3;
		xa_r[2] <= taa[2] ^ rb3 ^ random[0];
		xa_r[3] <= taa[3] ^ rb3;
	end
	
	// ya_r;
	always @(posedge clk)
	begin
		ya_r[0] <= tba[0] ^ rb2 ^ random[1];
		ya_r[1] <= tba[1] ^ rb2;
		ya_r[2] <= tba[2] ^ rb2 ^ random[1];
		ya_r[3] <= tba[3] ^ rb2;
	end
	
	//  za_r;
	always @(posedge clk)
	begin
		za_r[0] <= taa[0] ^ rb1 ^ random[2];
		za_r[1] <= taa[1] ^ rb1;
		za_r[2] <= taa[2] ^ rb1 ^ random[2];
		za_r[3] <= taa[3] ^ rb1;
	end
	
	// ta_r;
	always @(posedge clk)
	begin
		ta_r[0] <= tba[0] ^ rb0 ^ random[3];
		ta_r[1] <= tba[1] ^ rb0;
		ta_r[2] <= tba[2] ^ rb0 ^ random[3];
		ta_r[3] <= tba[3] ^ rb0;
	end
	
	//// SboxB Masking Scheme;
	assign tab[0] = bb0       ^ ab0cb0 ^ bb0cb0 ^ ab0db0;
	assign tab[1] =             ab0cb1 ^ bb0cb1 ^ ab0db1;
	assign tab[2] = bb1 ^ db0 ^ ab1cb0 ^ bb1cb0 ^ ab1db0;
	assign tab[3] =       db1 ^ ab1cb1 ^ bb1cb1 ^ ab1db1;
	
	assign tbb[0] = ab0 ^ bb0             ^ bb0cb0 ^ ab0db0 ^ bb0db0;
	assign tbb[1] =                         bb0cb1 ^ ab0db1 ^ bb0db1;
	assign tbb[2] = ab1 ^ bb1 ^ cb0 ^ db0 ^ bb1cb0 ^ ab1db0 ^ bb1db0;
	assign tbb[3] =             cb1 ^ db1 ^ bb1cb1 ^ ab1db1 ^ bb1db1;
	
	// xb_r;
	always @(posedge clk)
	begin
		xb_r[0] <= tab[0] ^ ra3 ^ random[4];
		xb_r[1] <= tab[1] ^ ra3;
		xb_r[2] <= tab[2] ^ ra3 ^ random[4];
		xb_r[3] <= tab[3] ^ ra3;
	end
	
	// yb_r;
	always @(posedge clk)
	begin
		yb_r[0] <= tbb[0] ^ ra2 ^ random[5];
		yb_r[1] <= tbb[1] ^ ra2;
		yb_r[2] <= tbb[2] ^ ra2 ^ random[5];
		yb_r[3] <= tbb[3] ^ ra2;
	end
	
	//  zb_r;
	always @(posedge clk)
	begin
		zb_r[0] <= tab[0] ^ ra1 ^ random[6];
		zb_r[1] <= tab[1] ^ ra1;
		zb_r[2] <= tab[2] ^ ra1 ^ random[6];
		zb_r[3] <= tab[3] ^ ra1;
	end
	
	// tb_r;
	always @(posedge clk)
	begin
		tb_r[0] <= tbb[0] ^ ra0 ^ random[7];
		tb_r[1] <= tbb[1] ^ ra0;
		tb_r[2] <= tbb[2] ^ ra0 ^ random[7];
		tb_r[3] <= tbb[3] ^ ra0;
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
