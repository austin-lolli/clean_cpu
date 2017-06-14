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

module IFIDBuffer (clk, PC4In, I_MemIn, PC4Out, I_MemOut);

input clk;
input [31:0] PC4In;
input [31:0] I_MemIn;
output reg [31:0] PC4Out;
output reg [31:0] I_MemOut;

always@(posedge clk) begin
	PC4Out = PC4In;
	I_MemOut = I_MemIn;
end

endmodule