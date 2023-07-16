`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:48:53 10/30/2022 
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
module FSM(
	input				clk,
	input				rstn,
	input				pk_valid,
	
	output	reg			dochoosesboxin,
	
	output 	reg			doSR,
	output	reg			doMC,
	
	output	reg			key_reg_move,
	output	reg			dofirstsubkey,
	output	reg 		dokeyfirstcol,
	output	reg			dokeyothercol,
	output	reg			doxorRcon,
	output		[07:00]	Rcon,
	
	output	reg			done,
	output	reg			busy
    );
	
	// intermediate;
	reg		[03:00]		rcnt;
	reg		[03:00]		ecnt;
	
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
			if(ecnt == 4'd15)
				NS <= 2'b01;
			else
				NS <= 2'b00;
		2'b01:
			if((ecnt == 4'd7) && (rcnt == 4'd10))
				NS <= 2'b10;
			else
				NS <= 2'b01;
		2'b10:
			NS <= 2'b00;
		default:
			NS <= 2'b00;
	endcase
	
	always @(posedge clk or negedge rstn)
	begin
		if(~rstn) begin
			ecnt <= 4'd0;
			rcnt <= 4'd0;
			dochoosesboxin <= 1'b0;
			
			doSR <= 1'b0;
			doMC <= 1'b0;
			
			key_reg_move <= 1'b1;
			dofirstsubkey <= 1'b0;
			dokeyfirstcol <= 1'b0;
			dokeyothercol <= 1'b0;
			doxorRcon <= 1'b0;
			Rcon_Reg <= 8'd1;
			
			done <= 1'b0;
			busy <= 1'b0;
		end else begin case(NS)	// data storage;
			2'b00: begin
				if(pk_valid  == 1'b1)
					ecnt <= ecnt + 1'b1;
				else
					ecnt <= ecnt;
				rcnt <= 4'd0;
				
				// key_reg_move;
				key_reg_move <= 1'b1;
				
				// busy;
				if(pk_valid == 1'b1)
					busy <= 1'b1;
				else
					busy <= busy;
			end
			2'b01: begin		// enc;
				// cnt;
				if((rcnt <= 4'd9) && (ecnt == 4'd13))
					ecnt <= 0;
				else
					ecnt <= ecnt + 1'b1;
				
				// rcnt;
				if((rcnt == 4'd10) && (ecnt == 4'd7))
					rcnt <= 4'd0;
				else if((rcnt <= 4'd9) && (ecnt == 4'd13))
					rcnt <= rcnt + 1'b1;
				else
					rcnt <= rcnt;
				
				// doSR;
				if((rcnt <= 4'd9) && (ecnt == 4'd12))
					doSR <= 1'b1;
				else
					doSR <= 1'b0;
				
				// doMC;
				if((rcnt > 4'd0) && (rcnt < 4'd10) && ((ecnt == 4'd1) || (ecnt == 4'd3) || (ecnt == 4'd5)))
					doMC <= 1'b1;
				else if((rcnt < 4'd9) && (ecnt == 4'd13))
					doMC <= 1'b1;
				else
					doMC <= 1'b0;
				
				// key_reg_move;
				if((ecnt >= 4'd9) && (ecnt <= 12))
					key_reg_move <= 1'b0;
				else
					key_reg_move <= 1'b1;
				
				// dofirstsubkey;
				if(ecnt == 4'd15)
					dofirstsubkey <= 1'b1;
				else if(ecnt >= 4'd7)
					dofirstsubkey <= 1'b0;
				else
					dofirstsubkey <= dofirstsubkey;
					
				// dokeyfirstcol;
				if(ecnt == 4'd13)
					dokeyfirstcol <= 1'b1;
				else if((rcnt > 4'd0) && (ecnt == 4'd0))
					dokeyfirstcol <= 1'b1;
				else
					dokeyfirstcol <= 1'b0;
				
				// dochoosesboxin;
				if((ecnt == 4'd7) || (ecnt == 4'd8))
					dochoosesboxin <= 1'b1;
				else
					dochoosesboxin <= 1'b0;
				
				// doxorRcon;
				if(ecnt == 4'd13)
					doxorRcon <= 1'b1;
				else
					doxorRcon <= 1'b0;
				
				// Rcon_Reg;
				if((rcnt > 4'd0) && (ecnt == 4'd13))
					Rcon_Reg <= Rcon_x2;
				else
					Rcon_Reg <= Rcon_Reg;
				
				// done;
				if((rcnt == 4'd9) && (ecnt == 4'd13))
					done <= 1'b1;
				else if((rcnt == 4'd10) && (ecnt== 4'd7))
					done <= 1'b0;
				else
					done <= done;
			end 
			2'b10: begin
				ecnt <= 4'd0;
				rcnt <= 4'd0;
				
				dochoosesboxin <= 1'b0;
				doSR <= 1'b0;
				doMC <= 1'b0;
				
				key_reg_move <= 1'b1;
				dofirstsubkey <= 1'b0;
				dokeyfirstcol <= 1'b0;
				dokeyothercol <= 1'b0;
				doxorRcon <= 1'b0;
				Rcon_Reg <= 8'd1;
				
				done <= 1'b0;
				busy <= 1'b0;
			end default: begin
				ecnt <= 4'd0;
				rcnt <= 4'd0;
				
				dochoosesboxin <= 1'b0;
				doSR <= 1'b0;
				doMC <= 1'b0;
				
				key_reg_move <= 1'b1;
				dofirstsubkey <= 1'b0;
				dokeyfirstcol <= 1'b0;
				dokeyothercol <= 1'b0;
				doxorRcon <= 1'b0;
				Rcon_Reg <= 8'd1;
				
				done <= 1'b0;
				busy <= 1'b0;
			end
		endcase
		end
	end
	
endmodule
