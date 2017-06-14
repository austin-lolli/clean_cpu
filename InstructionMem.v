`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2016 02:13:34 PM
// Design Name: 
// Module Name: InstructionMem
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


module InstructionMem(address,clk,instruction_out);

input clk;
input [7:0] address;

output reg[31:0] instruction_out;

reg [31:0] block[255:0];
initial begin
    block[0] = 123;
    block[5] = 15;
    block[10] = 69;
end

always @(posedge clk) begin
    instruction_out = block[address];
end

endmodule
