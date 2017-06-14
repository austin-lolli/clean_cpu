`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/07/2017 02:27:47 PM
// Design Name: 
// Module Name: section2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module section2(instruction, PC, clk, SE);

input [31:0] instruction;
input [31:0] PC;
input [31:0] dataIn;
input [5:0] write_address; 
input clk;

wire [3:0] opcode;
wire [5:0] rs_addr;
wire [5:0] rt_addr;
wire [5:0] rd_addr;
//input SE
wire [21:0] SE_Val;

//Final SE-ed value
output [31:0] SE;
output [31:0] rs;
output [31:0] rt;
output [2:0] ALUOp;
output RegWrt, MemtoReg, PCtoReg, MemRead, MemWrt;

assign opcode = instruction[31:28];
assign rs_addr = instruction[27:22];
assign rt_addr = instruction [21:16];
assign rd_addr = instruction [15:10];
assign SE_Val = instruction[21:0];

IFIDBuffer IFID_BUFF(.clk(clk), .PC4Out(PC), .I_MemOut(instruction));
control CONTROL (.OPCODE(opcode), .ALUOp(ALUOp), .RegWrt(RegWrt), .MemtoReg(MemtoReg), .PCtoReg(PCtoReg), .MemRead(MemRead), .MemWrt(MemWrt));
RegisterMem REGISTER (.rs(rs_addr), .rt(rt_addr), .rd(rd_addr), .dataIn(dataIn), .write_address(write_address), .clk(clk), .rsOut(rs), .rtOut(rt));
signextend S_E (.clk(clk), .in(SE_Val), .out(SE));
Adder ADD_SE (.PC(PC), .in(SE), .out(SE));
idex_buffer ID_EX (.clk(clk), .RegWrt_In(RegWrt), .MemtoReg_In(MemtoReg), .PCtoReg_In(PCtoReg), .BrNeg_In, .BrZ_In, .Jump_In, .JumpMem_In, .MemRead_In(MemRead), .MemWrt_In(MemWrt), .ALUOp_In(ALUOp), .rsOut_In(rs), .rtOut_In(rt), .rd_In(rd_addr), .SE_In(SE))

endmodule
