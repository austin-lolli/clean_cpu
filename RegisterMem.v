`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2016 01:42:05 PM
// Design Name: 
// Module Name: register
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


module register(rs,rt,rd,dataIn,write,write_address,clk,rsOut,rtOut);

input [5:0]rs;
input [5:0]rt;
input [5:0]rd;
input write;
input clk;
input [31:0]dataIn;
input [31:0] write_address;

output reg[31:0]rsOut;
output reg[31:0]rtOut;

reg[31:0] block[63:0];

always @(posedge clk) begin 
    rsOut = block[rs];
    rtOut = block[rt];
    
    if(write == 1)
        block[rd] = dataIn;
end

endmodule
