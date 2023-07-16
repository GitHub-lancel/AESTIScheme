`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:50:59 11/09/2022 
// Design Name: 
// Module Name:    AffineOutputC_Unit 
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
module AffineOutputC_Unit(
	input	[07:00]		A,
	output	[07:00]		Z
    );
	
	// intermediate;
	wire				T1;
	wire				T2;
	wire				T3;
	wire				T4;
	wire				T5;
	wire				T6;
	wire				T7;
	wire				T8;
	wire				T9;
	
	wire	[07:00]		D;
	
	assign T1 =  A[7] ^ A[3];
	assign T2 =  A[6] ^ A[4];
	assign T3 =  A[6] ^ A[0];
	assign T4 = ~A[5] ^ A[3];
	assign T5 = ~A[5] ^ T1;
	assign T6 = ~A[5] ^ A[1];
	assign T7 = ~A[4] ^ T6;
	assign T8 =  A[2] ^ T4;
	assign T9 =  A[1] ^ T2;
	
	assign D[7] = T4;
	assign D[6] = T1;
	assign D[5] = T3;
	assign D[4] = T5;
	assign D[3] = T2 ^ T5;
	assign D[2] = T3 ^ T8;
	assign D[1] = T7;
	assign D[0] = T9;
	
	assign Z = ~D;
	
endmodule
