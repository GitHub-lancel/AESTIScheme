`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:24:38 11/11/2022 
// Design Name: 
// Module Name:    KeyScheduleC_Unit 
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
module KeyScheduleC_Unit(
	input				clk,
	input				rstn,
	
	input		[07:00]	KeyIn,
	input				doXorRcon,
	input		[07:00]	Rcon,
	
	input		[07:00]	K0,
	output		[07:00]	KeyOut
    );
	
	// intermediate;
	reg			[07:00] KeyIn_r;
	wire		[07:00]	affine_out;
	
	// KeyOut;
	assign KeyOut = K0 ^ affine_out ^ (doXorRcon ? Rcon : 8'h00);
	
	// affine_outputC;
	AffineOutputC_Unit Inst_AffineOutputC_Unit0(
	.A				(KeyIn_r),
	.Z				(affine_out)
    );
	
	// KeyIn_r;
	always @(posedge clk) KeyIn_r <= KeyIn;
	
endmodule
