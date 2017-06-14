`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/07/2017 04:02:28 PM
// Design Name: 
// Module Name: section3
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


module section3(clk, zero, neg, ALU_Result);

input clk;

wire [31:0] ALU_Result;
wire [31:0] DMemOut;
wire MemWrt, MemRead, MemtoReg, PCtoReg, RegWrt, zero, neg, BrNeg, BrZ, Jump, JumpMem;
wire [2:0] ALUOp;
wire [31:0] rsOut;
wire [31:0] rtOut;
wire [31:0] SE;
wire [5:0] rd;

idex_buffer ID_EX(.RegWrt_Out(RegWrt), .MemtoReg_Out(MemtoReg), .PCToReg_Out(PCtoReg), .ALUOP_Out(ALUOp), .MemRead_Out(MemRead), .MemWrt_Out(MemWrt), .rsOut_Out(rsOut), .rtOut_Out(rtOut), .rd_Out(rd), .SE_Out(SE));
DataMem DATAMEM(.clk(clk), .address(rsOut), .write(MemWrt), .data_in(rtOut), .data_out(DMemOut));
ALU alu (.opcode(ALUOp), .A(rsOut), .B(rtOut), .out(ALU_Result), .zero(zero), .neg(neg));
exmem_buffer EX_MEM (clk, .Neg_In(neg), .Zero_In(zero), .RegWrt_In(RegWrt), .MemtoReg_In(MemtoReg), .PCtoReg_In(PCtoReg), .BrNeg_In(BrNeg), .BrZ_In(BrZ), .Jump_In(Jump), .JumpMem_In(JumpMem), .ALU_In(ALU_Result), .Data_In(DMemOut), .RD_In(rd), .Branch_In(SE)); 
endmodule
