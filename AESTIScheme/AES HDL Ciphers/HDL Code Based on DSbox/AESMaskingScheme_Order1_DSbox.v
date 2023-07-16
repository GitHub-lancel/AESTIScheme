`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:39:45 10/30/2022 
// Design Name: 
// Module Name:    AESMaskingScheme_Order1_DSbox 
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
module AESMaskingScheme_Order1_DSbox(
	input				clk,
	input				rstn,
	
	input		[07:00]	plain0,
	input		[07:00]	plain1,
	input				pk_valid,
	
	input		[07:00]	key0,
	input		[07:00]	key1,
	
	input		[07:00] random,
	
	output		[15:00] cipher0,
	output		[15:00]	cipher1,
	
	output				done,
	output				busy
    );
	
	// intermediate;
	wire		 		dochoosesboxin;
	
	wire				doSR;
	wire				doMC;
	
	wire				key_reg_move;
	wire				dofirstsubkey;
	wire				dokeyfirstcol;
	wire				dokeyothercol;
	wire				doxorRcon;
	
	wire		[07:00]	Rcon;
	
	wire		[15:00]	SboxInSh0;
	wire		[15:00] SboxInSh1;
	
	wire		[15:00]	SboxOutSh0;
	wire		[15:00]	SboxOutSh1;
	
	wire		[15:00]	StateInSh0;
	wire		[15:00]	StateInSh1;
	
	wire		[15:00]	StateOutSh0;
	wire		[15:00]	StateOutSh1;
	
	wire		[15:00]	KeyInSh0;
	wire		[15:00]	KeyInSh1;
	
	wire		[15:00]	KeyOutSh0;
	wire		[15:00]	KeyOutSh1;
	
	wire		[15:00]	KeyToSboxSh0;
	wire		[15:00]	KeyToSboxSh1;
	
	wire		[15:00]	CipherSh0;
	wire		[15:00]	CipherSh1;
	
	// debug;
	wire		[07:00]	debug_plain;
	wire		[07:00]	debug_key;
	wire		[15:00]	debug_cipher;
	
	assign debug_plain = plain0 ^ plain1;
	assign debug_key = key0 ^ key1;
	assign debug_cipher = cipher0 ^ cipher1;
	
	// cipher0;
	assign cipher0[15:08] = CipherSh0[15:08] ^ KeyOutSh0[15:08];
	assign cipher0[07:00] = CipherSh0[07:00] ^ KeyOutSh0[07:00];
	
	// cipher1;
	assign cipher1[15:08] = CipherSh1[15:08] ^ KeyOutSh1[15:08];
	assign cipher1[07:00] = CipherSh1[07:00] ^ KeyOutSh1[07:00];
	
	// StateInSh0;
	assign StateInSh0[15:08] = SboxOutSh0[15:08];
	assign StateInSh0[07:00] = pk_valid ? plain0 : SboxOutSh0[07:00];
	
	// StateInSh1;
	assign StateInSh1[15:08] = SboxOutSh1[15:08];
	assign StateInSh1[07:00] = pk_valid ? plain1 : SboxOutSh1[07:00];
	
	// KeyInSh0;
	assign KeyInSh0[15:08] = SboxOutSh0[15:08];
	assign KeyInSh0[07:00] = pk_valid ? key0 : SboxOutSh0[07:00];
	
	// KeyInSh1;
	assign KeyInSh1[15:08] = SboxOutSh1[15:08];
	assign KeyInSh1[07:00] = pk_valid ? key1 : SboxOutSh1[07:00];
	
	// SboxInSh0;
	assign SboxInSh0 = dochoosesboxin ? KeyToSboxSh0 : (StateOutSh0 ^ KeyOutSh0);
	
	// SboxInSh1;
	assign SboxInSh1 = dochoosesboxin ? KeyToSboxSh1 : (StateOutSh1 ^ KeyOutSh1);
	
	// FSM;
	FSM Inst_FSM(
	.clk						(clk),
	.rstn						(rstn),
	.pk_valid					(pk_valid),
	
	.dochoosesboxin				(dochoosesboxin),
	
	.doSR						(doSR),
	.doMC						(doMC),
	
	.key_reg_move				(key_reg_move),
	.dofirstsubkey				(dofirstsubkey),
	.dokeyfirstcol				(dokeyfirstcol),
	.dokeyothercol				(dokeyothercol),
	.doxorRcon					(doxorRcon),
	.Rcon						(Rcon),
	
	.done						(done),
	.busy						(busy)
    );
	
	// DataRegistersC_Unit;
	DataRegistersC_Unit Inst_DataRegistersC_Unit(
	.clk						(clk),
	.en							(pk_valid),
	
	.doMC						(doMC),
	.doSR						(doSR),
	
	.statein					(StateInSh0),
	.stateout					(StateOutSh0),
	.cipher						(CipherSh0)
    );
	
	// DataRegisters_Unit;
	DataRegisters_Unit Inst_DataRegisters_Unit(
	.clk						(clk),
	.en							(pk_valid),
	
	.doMC						(doMC),
	.doSR						(doSR),
	
	.statein					(StateInSh1),
	.stateout					(StateOutSh1),
	.cipher						(CipherSh1)
    );
	
	// KeyRegistersC_Unit;
	KeyRegistersC_Unit Inst_KeyRegistersC_Unit(
	.clk						(clk),
	.en							(pk_valid),
	
	.dochoosesboxin				(dochoosesboxin),
	.key_reg_move				(key_reg_move),
	.dofirstsubkey				(dofirstsubkey),
	.dokeyfirstcol				(dokeyfirstcol),
	.dokeyothercol				(dokeyothercol),
	.doxorRcon					(doxorRcon),
	.Rcon						(Rcon),
	
	.keyin						(KeyInSh0),
	.subkey						(KeyOutSh0),
	.keytosbox					(KeyToSboxSh0)
    );
	
	// KeyRegisters_Unit;
	KeyRegisters_Unit Inst_KeyRegisters_Unit(
	.clk						(clk),
	.en							(pk_valid),
	
	.dochoosesboxin				(dochoosesboxin),
	.key_reg_move				(key_reg_move),
	.dofirstsubkey				(dofirstsubkey),
	.dokeyfirstcol				(dokeyfirstcol),
	.dokeyothercol				(dokeyothercol),
	.doxorRcon					(doxorRcon),
	.Rcon						(Rcon),
	
	.keyin						(KeyInSh1),
	.subkey						(KeyOutSh1),
	.keytosbox					(KeyToSboxSh1)
    );
	
	// GF256Inv_Unit;
	GF256Inv_Unit Inst_GF256Inv_Unit(
	.clk						(clk),
	
	// SboxA;
	.ha0ga0fa0ea0da0ca0ba0aa0	(SboxInSh0[15:08]),
	.ha1ga1fa1ea1da1ca1ba1aa1	(SboxInSh1[15:08]),
	
	.va0ua0sa0ra0ta0za0ya0xa0	(SboxOutSh0[15:08]),
	.va1ua1sa1ra1ta1za1ya1xa1	(SboxOutSh1[15:08]),
	
	// SboxB;
	.hb0gb0fb0eb0db0cb0bb0ab0	(SboxInSh0[07:00]),
	.hb1gb1fb1eb1db1cb1bb1ab1	(SboxInSh1[07:00]),
	
	.vb0ub0sb0rb0tb0zb0yb0xb0	(SboxOutSh0[07:00]),
	.vb1ub1sb1rb1tb1zb1yb1xb1	(SboxOutSh1[07:00]),
	
	.random						(random)
    );
	
endmodule
