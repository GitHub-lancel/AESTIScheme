`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:45:57 11/11/2022 
// Design Name: 
// Module Name:    KeySchedule_Unit 
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
module KeySchedule_Unit(
	input				clk,
	input				rstn,
	
	input		[07:00]	KeyIn,
	input		[07:00]	K0,
	output		[07:00]	KeyOut
    );
	
	// intermediate;
	reg			[07:00] KeyIn_r;
	wire		[07:00]	affine_out;
	
	// KeyOut;
	assign KeyOut = K0 ^ affine_out;
	
	// affine_outputC;
	AffineOutput_Unit Inst_AffineOutput_Unit0(
	.A				(KeyIn_r),
	.Z				(affine_out)
    );
	
	// Skey_r;
	always @(posedge clk) KeyIn_r <= KeyIn;
	
endmodule
