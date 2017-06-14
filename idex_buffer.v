`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2017 03:07:39 PM
// Design Name: 
// Module Name: EX_MEM
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

module ID_EX (clk, RegWrt_In, MemtoReg_In, PCtoReg_In, BrNeg_In, BrZ_In, Jump_In, JumpMem_In, MemRead_In, MemWrt_In, ALUOp_In, rsOut_In, rtOut_In, rd_In, SE_In, RegWrt_Out, MemtoReg_Out, PCtoReg_Out, BrNeg_Out, BrZ_Out, Jump_Out JumpMem_Out, MemRead_Out, MemWrt_Out, ALUOp_Out, rsOut_Out, rtOut_Out, rd_Out, SE_Out);

input clk;
input RegWrt_In, MemtoReg_In, PCtoReg_In, BrNeg_In, BrZ_In, Jump_In, JumpMem_In, MemRead_In, MemWrt_In;
input [2:0] ALUOp_In;
input [31:0] rsOut_In;
input [31:0] rtOut_In;
input [5:0] rd_In;
input [31:0] SE_In;

output RegWrt_Out, MemtoReg_Out, PCtoReg_Out, BrNeg_Out, BrZ_Out, Jump_Out JumpMem_Out, MemRead_Out, MemWrt_Out;
output reg[2:0] ALUOP_Out;
output reg[31:0] rsOut_Out;
output reg[31:0] rtOut_Out;
output reg[5:0] rd_Out;
output reg[31:0] SE_Out;

always@(posedge clk) begin
	RegWrt_Out = RegWrt_In;
	MemtoReg_Out = MemtoReg_In;
	PCtoReg_Out = PCtoReg_In;
        BrNeg_Out = BrNeg_In;
        BrZ_Out = BrZ_In;
        Jump_Out = Jump_In;
        JumpMem_Out = JumpMem_In;
	MemRead_Out = MemRead_In;
	MemWrt_Out = MemWrt_In;
	ALUOP_Out = ALUOP_In;
	rsOut_Out = rsOut_In;
	rtOut_Out = rtOut_In;
	rd_Out = rd_In;
	SE_Out = SE_In;
end

endmodule
