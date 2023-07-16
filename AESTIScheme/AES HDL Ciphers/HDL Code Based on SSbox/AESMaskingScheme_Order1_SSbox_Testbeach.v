`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:25:39 10/30/2022
// Design Name:   AESMaskingScheme_Order1_SSbox
// Module Name:   AESMaskingScheme_Order1_SSbox_Testbeach.v
// Project Name:  AESMaskingScheme_Order1_SSbox
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: AESMaskingScheme_Order1_SSbox
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module AESMaskingScheme_Order1_SSbox_Testbeach;

	// Inputs
	reg clk;
	reg rstn;
	reg [7:0] plain0;
	reg [7:0] plain1;
	reg pk_valid;
	reg [7:0] key0;
	reg [7:0] key1;
	reg [3:0] random;
	
	// Outputs
	wire [7:0] cipher0;
	wire [7:0] cipher1;
	wire done;
	wire busy;
	
	// Intermediate;
	reg  [07:0] cnt;
	wire [07:0] plain;
	wire [07:0] key;
	wire [07:0] cipher;
	
	// Instantiate the Unit Under Test (UUT)
	AESMaskingScheme_Order1_SSbox uut (
		.clk(clk), 
		.rstn(rstn), 
		
		.plain0(plain0), 
		.plain1(plain1), 
		.pk_valid(pk_valid), 
		
		.key0(key0), 
		.key1(key1), 
		
		.random(random),
		
		.cipher0(cipher0), 
		.cipher1(cipher1), 
		
		.done(done)
	);
	
	initial begin
		// Initialize Inputs
		clk = 0;
		rstn = 0;
		plain0 = 0;
		plain1 = 0;
		pk_valid = 0;
		key0 = 0;
		key1 = 0;
		// Wait 100 ns for global reset to finish
		#100;
        rstn = 1;
		// Add stimulus here
	end
	
	// clk;
	always #10 clk <= ~clk;
    
	// cnt;
	always @(posedge clk or negedge rstn)
	begin
		if(~rstn)
			cnt <= 0;
		else 
			cnt <= cnt + 1'b1;
	end
	
	// pk_valid;
	always @(posedge clk or negedge rstn)
	begin
		if(~rstn)
			pk_valid <= 0;
		else if((cnt >= 8'd2) && (cnt <= 8'd17))
		//else if((cnt >= 8'd2))
			pk_valid <= 1;
		else
			pk_valid <= 0;
	end
	
	// plain0;
	always @(posedge clk) plain0 <= {$random} % 256;
	// plain1;
	always @(posedge clk) plain1 <= {$random} % 256;
	// key0;
	always @(posedge clk) key0 <= {$random} % 256;
	// key1;
	always @(posedge clk) key1 <= {$random} % 256;
	
	// plain;
	assign plain = plain0 ^ plain1;
	// key;
	assign key = key0 ^ key1;
	
	// cipher;
	assign cipher = cipher0 ^ cipher1;
	
	always @(posedge clk) random <= {$random} % 16;
	
	
endmodule

