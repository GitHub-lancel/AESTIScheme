`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:22:29 11/09/2022 
// Design Name: 
// Module Name:    AESMaskingScheme_Order1_SSbox 
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
module AESMaskingScheme_Order1_SSbox(
	input				clk,
	input				rstn,
	
	input		[07:00]	plain0,
	input		[07:00]	plain1,
	input				pk_valid,
	
	input		[07:00]	key0,
	input		[07:00]	key1,
	
	input		[03:00]	random,
	
	output		[07:00] cipher0,
	output		[07:00]	cipher1,
	
	output				done
    );
	
	//// intermediate;
	wire				doSboxIn;
	
	wire				doSR;
	wire				doMC;
	wire				doSG;
	wire				doCG;
	
	wire				doFirstSubkey;
	wire				doKeyFirstCol;
	wire				doKeyOtherCol;
	wire				doXorRcon;
	
	wire		[07:00]	Rcon;
	
	wire		[07:00]	StateInSh0;
	wire		[07:00]	StateInSh1;
	
	wire		[07:00]	StateOutSh0;
	wire		[07:00]	StateOutSh1;
	
	wire		[07:00]	SboxInSh0;
	wire		[07:00]	SboxInSh1;
	
	wire		[07:00]	SboxOutSh0;
	wire		[07:00]	SboxOutSh1;
	
	wire		[07:00]	KeyInSh0;
	wire		[07:00]	KeyInSh1;
	
	wire		[07:00]	KeyOutSh0;
	wire		[07:00]	KeyOutSh1;
	
	wire		[07:00]	KeyToSboxSh0;
	wire		[07:00]	KeyToSboxSh1;
	
	wire		[07:00]	KeyScheduleOutSh0;
	wire		[07:00]	KeyScheduleOutSh1;
	
	wire		[07:00]	CipherSh0;
	wire		[07:00]	CipherSh1;
	
	wire		[07:00]	DGuards;
	wire		[07:00]	KGuards;
	wire		[07:00]	Guards;
	
	// cipher0;
	assign cipher0 = CipherSh0 ^ (doKeyFirstCol ? KeyScheduleOutSh0 : KeyOutSh0);
	
	// cipher1;
	assign cipher1 = CipherSh1 ^ (doKeyFirstCol ? KeyScheduleOutSh1 : KeyOutSh1);
	
	// StateInSh0;
	assign StateInSh0 = pk_valid ? plain0 : SboxOutSh0;
	
	// StateInSh1;
	assign StateInSh1 = pk_valid ? plain1 : SboxOutSh1;
	
	// KeyInSh0;
	assign KeyInSh0 = pk_valid ? key0 : KeyScheduleOutSh0;
	
	// KeyInSh1;
	assign KeyInSh1 = pk_valid ? key1 : KeyScheduleOutSh1;
	
	// SboxInSh0;
	assign SboxInSh0 = doSboxIn ? KeyToSboxSh0 : (StateOutSh0 ^ (doKeyFirstCol ? KeyScheduleOutSh0 : KeyOutSh0));
	
	// SboxInSh1;
	assign SboxInSh1 = doSboxIn ? KeyToSboxSh1 : (StateOutSh1 ^ (doKeyFirstCol ? KeyScheduleOutSh1 : KeyOutSh1));
	
	// guards;
	assign Guards = doSboxIn ? KGuards : DGuards;
	
	// FSM;
	FSM Inst_FSM(
	.clk				(clk),
	.rstn				(rstn),
	.pk_valid			(pk_valid),
	
	.doSboxIn			(doSboxIn),
	
	.doSR				(doSR),
	.doMC				(doMC),
	.doSG				(doSG),
	.doCG				(doCG),
	
	.doFirstSubkey		(doFirstSubkey),
	.doKeyFirstCol		(doKeyFirstCol),
	.doKeyOtherCol		(doKeyOtherCol),
	.doXorRcon			(doXorRcon),
	.Rcon				(Rcon),
	
	.done				(done)
    );
	
	// GF256Inv_Unit;
	GF256Inv_Unit Inst_GF256Inv_Unit(
	.clk				(clk),
	
	.h0g0f0e0d0c0b0a0	(SboxInSh0),
	.h1g1f1e1d1c1b1a1	(SboxInSh1),
	
	.guards				(Guards),
	.random				(random),
	
	.v0u0s0r0t0z0y0x0	(SboxOutSh0),
	.v1u1s1r1t1z1y1x1	(SboxOutSh1)
    );
	
	// DataRegistersC_Unit;
	DataRegistersC_Unit Inst_DataRegistersC_Unit(
	.clk				(clk),
	.en					(pk_valid),
	
	.doSG				(doSG),
	.doCG				(doCG),
	.doMC				(doMC),
	.doSR				(doSR),
	
	.guards				(DGuards),
	
	.stateIn			(StateInSh0),
	.stateOut			(StateOutSh0),
	.cipher				(CipherSh0)
    );
	
	// DataRegisters_Unit;
	DataRegisters_Unit Inst_DataRegisters_Unit(
	.clk				(clk),
	.en					(pk_valid),
	
	.doMC				(doMC),
	.doSR				(doSR),
	
	.stateIn			(StateInSh1),
	.stateOut			(StateOutSh1),
	.cipher				(CipherSh1)
    );
	
	// KeyRegistersC_Unit;
	KeyRegistersC_Unit Inst_KeyRegistersC_Unit(
	.clk				(clk),
	.en					(pk_valid),
	
	.doSboxIn			(doSboxIn),
	.doFirstSubkey		(doFirstSubkey),
	.doKeyFirstCol		(doKeyFirstCol),
	.doKeyOtherCol		(doKeyOtherCol),
	
	.guards				(KGuards),
	
	.keyIn				(KeyInSh0),
	.keyOut				(KeyOutSh0),
	.keyToSbox			(KeyToSboxSh0)
    );
	
	// KeyRegisters_Unit;
	KeyRegisters_Unit Inst_KeyRegisters_Unit(
	.clk				(clk),
	.en					(pk_valid),
	
	.doSboxIn			(doSboxIn),
	.doFirstSubkey		(doFirstSubkey),
	.doKeyFirstCol		(doKeyFirstCol),
	.doKeyOtherCol		(doKeyOtherCol),
	
	.keyIn				(KeyInSh1),
	.keyOut				(KeyOutSh1),
	.keyToSbox			(KeyToSboxSh1)
    );
	
	// KeyScheduleC_Unit;
	KeyScheduleC_Unit Inst_KeyScheduleC_Unit(
	.clk				(clk),
	.rstn				(rstn),
	
	.KeyIn				(SboxOutSh0),
	.doXorRcon			(doXorRcon),
	.Rcon				(Rcon),
	.K0					(KeyOutSh0),
	.KeyOut				(KeyScheduleOutSh0)
    );
	
	// KeySchedule_Unit;
	KeySchedule_Unit Inst_KeySchedule_Unit(
	.clk				(clk),
	.rstn				(rstn),
	
	.KeyIn				(SboxOutSh1),
	.K0					(KeyOutSh1),
	.KeyOut				(KeyScheduleOutSh1)
    );
	
endmodule
