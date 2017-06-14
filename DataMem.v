`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2016 02:14:10 PM
// Design Name: 
// Module Name: DataMem
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


module DataMem(clk,address,write,data_in,data_out);

input clk;
input [31:0]address;
input write;
input [31:0]data_in;

output reg[31:0]data_out;

reg[31:0] block[65535:0];

always @(posedge clk) begin
    data_out = block[address[15:0]];
    if(write == 1)begin
        block[address[15:0]] = data_in;
    end
end

endmodule
