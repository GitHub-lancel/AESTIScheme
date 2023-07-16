`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:29:40 11/09/2022 
// Design Name: 
// Module Name:    FSM 
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
(* keep_hierarchy = "yes" *)module FSM(
	input				clk,
	input				rstn,
	input				pk_valid,
	
	output	reg			doSboxIn,
	
	output	reg			doSG,
	output	reg			doCG,
	output	reg			doSR,
	output	reg			doMC,
	
	output	reg			doFirstSubkey,
	output	reg			doKeyFirstCol,
	output	reg			doKeyOtherCol,
	output	reg			doXorRcon,
	output		[07:00]	Rcon,
	
	output	reg			done
    );
	
	// intermediate;
	reg		[03:00]		rcnt;
	reg		[04:00]		ecnt;
	
	reg		[01:00]		CS;
	reg		[01:00]		NS;
	
	reg		[07:00]		Rcon_Reg;
	
	wire	[07:00]		conditionXor;
	wire	[07:00]		shiftedData;
	wire	[07:00]		Rcon_x2;
	
	// Rcon;
	assign Rcon = Rcon_Reg;
	
	// conditionXOR;
	assign conditionXor = {3'b0, Rcon_Reg[7], Rcon_Reg[7], 1'b0, Rcon_Reg[7], Rcon_Reg[7]};
	assign shiftedData = {Rcon_Reg[06:00], 1'b0};
	assign Rcon_x2 = conditionXor ^ shiftedData;
	
	// NS;
	always @(posedge clk or negedge rstn)
	begin
		if(~rstn)
			CS <= 0;
		else
			CS <= NS;
	end
	
	// CS;
	always @(CS or ecnt or rcnt)
	case(CS)
		2'b00:
			if(ecnt == 15)
				NS <= 2'b01;
			else
				NS <= 2'b00;
		2'b01: begin
			if((rcnt == 9) && (ecnt == 21))
				NS <= 2'b10;
			else
				NS <= 2'b01;
		end
		2'b10:
			if((rcnt == 10) && (ecnt == 15))
				NS <= 2'b00;
			else
				NS <= 2'b10;
		default:
			NS <= 2'b00;
	endcase
	
	// Control Signal;
	always @(posedge clk or negedge rstn)
	begin
		if(~rstn) begin
			ecnt <= 0;
			rcnt <= 0;
		end else case(CS)
			2'b00: begin
				if(ecnt == 15)
					ecnt <= 0;
				else if(pk_valid == 1)
					ecnt <= ecnt + 1'b1;
				else
					ecnt <= ecnt;
			end
			2'b01: begin
				// ecnt;
				if(ecnt == 21)
					ecnt <= 0;
				else
					ecnt <= ecnt + 1'b1;
				
				// rcnt;
				if(ecnt == 21)
					rcnt <= rcnt + 1'b1;
				else
					rcnt <= rcnt;
			end
			2'b10: begin
				// ecnt;
				if(ecnt == 15)
					ecnt <= 0;
				else
					ecnt <= ecnt + 1'b1;
				
				// rcnt;
				if(ecnt == 15)
					rcnt <= 0;
				else
					rcnt <= rcnt;
			end
			default: begin
				ecnt <= 0;
				rcnt <= 0;
			end
		endcase
	end
	
	// doSboxIn;
	always @(*)
	if((CS == 2'b01) && (ecnt >= 16) && (ecnt <= 19))
		doSboxIn <= 1'b1;
	else
		doSboxIn <= 1'b0;
	
	// doSG;
	always @(*)
	if((CS == 2'b01) && (ecnt == 0))
		doSG <= 1'b1;
	else
		doSG <= 1'b0;
	
	// doCG;
	always @(*)
	if((CS == 2'b01) && (ecnt == 15))
		doCG <= 1'b1;
	else
		doCG <= 1'b0;
		
	// doSR;
	always @(*)
	if((CS == 2'b01) && (ecnt == 21))
		doSR <= 1'b1;
	else
		doSR <= 1'b0;
	
	// doMC;
	always @(*)
	if((CS == 2'b01) && (rcnt > 0) && (rcnt < 10) && (ecnt == 0))
		doMC <= 1'b1;
	else if((CS == 2'b01) && (rcnt > 0) && (rcnt < 10) && (ecnt == 4))
		doMC <= 1'b1;
	else if((CS == 2'b01) && (rcnt > 0) && (rcnt < 10) && (ecnt == 8))
		doMC <= 1'b1;
	else if((CS == 2'b01) && (rcnt > 0) && (rcnt < 10) && (ecnt == 12))
		doMC <= 1'b1;
	else
		doMC <= 1'b0;
	
	// Rcon_Reg;
	always @(posedge clk or negedge rstn)
	begin
		if(~rstn)
			Rcon_Reg <= 1;
		else if((NS == 2'b01) || (NS == 2'b10)) begin
			if((rcnt > 0) && (ecnt == 21))
				Rcon_Reg <= Rcon_x2;
			else
				Rcon_Reg <= Rcon_Reg;
		end else
			Rcon_Reg <= 1;
	end
	
	// doFirstSubkey；
	always @(*)
	if((CS == 2'b01) && (rcnt == 0) && (ecnt < 16))
		doFirstSubkey <= 1'b1;
	else
		doFirstSubkey <= 1'b0;
		
	// doKeyFirstCol;
	always @(*)
	if((CS == 2'b01) && (rcnt > 0) && (ecnt < 4))
		doKeyFirstCol <= 1'b1;
	else if((CS == 2'b10) && (ecnt < 4))
		doKeyFirstCol <= 1'b1;
	else
		doKeyFirstCol <= 1'b0;
	
	// doKeyOtherCol;
	always @(*)
	if((CS == 2'b01) && (rcnt > 0) && (ecnt > 3) && (ecnt < 16))
		doKeyOtherCol <= 1'b1;
	else if((CS == 2'b10) && (ecnt > 3) && (ecnt < 16))
		doKeyOtherCol <= 1'b1;
	else
		doKeyOtherCol <= 1'b0;
	
	// doXorRcon;
	always @(*)
	if((CS == 2'b01) && (rcnt > 0) && (ecnt == 0))
		doXorRcon <= 1'b1;
	else if((CS == 2'b10) && (ecnt == 0))
		doXorRcon <= 1'b1;
	else
		doXorRcon <= 1'b0;
	
	// done;
	always @(*)
	if((CS == 2'b10) && (ecnt < 16))
		done <= 1'b1;
	else
		done <= 1'b0;
		
endmodule
