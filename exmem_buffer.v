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


module EX_MEM (clk, Neg_In, Zero_In, RegWrt_In, MemtoReg_In, PCtoReg_In, BrNeg_In, BrZ_In, Jump_In, JumpMem_In, ALU_In, Data_In, RD_In, Branch_In, Neg_Out, Zero_Out, RegWrt_Out, MemtoReg_Out, PCtoReg_Out, BrNeg_Out, BrZ_Out, Jump_Out, JumpMem_Out, ALU_Out, Data_Out, RD_Out, Branch_Out);

input clk;
input Neg_In, Zero_In, RegWrt_In, MemtoReg_In, PCtoReg_In, BrNeg_In, BrZ_In, Jump_In, JumpMem_In;
input [31:0] ALU_In;
input [31:0] Data_In;
input [5:0] RD_In;
input [31:0] Branch_In;

output Neg_Out, Zero_Out, RegWrt_Out, MemtoReg_Out, PCtoReg_Out, BrNeg_Out, BrZ_Out, Jump_Out, JumpMem_Out;
output [31:0] ALU_Out;
output [31:0] Data_Out;
output [5:0] RD_Out;
output [31:0] Branch_Out;

always @(posedge clk) begin
    Neg_Out = Neg_In;
    Zero_Out = Zero_In;
    RegWrt_Out = RegWrt_In;
    MemtoReg_Out = MemtoReg_In;
    PCtoReg_Out = PCtoReg_In;
    BrNeg_Out = BrNeg_In;
    BrZ_Out = BrZ_In;
    Jump_Out = Jump_In;
    JumpMem_Out = JumpMem_In;
    ALU_Out = ALU_In;
    Data_Out = Data_In;
    RD_Out = RD_In;
    Branch_Out = Branch_In;    
end

endmodule
