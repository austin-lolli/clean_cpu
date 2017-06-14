`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2017 02:33:37 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input  [2:0] opcode,
    input  [31:0] A,
    input  [31:0] B,
    
    output [31:0] out,
    output zero,
    output neg
    );
    reg [31:0] out;
    reg zero;
    reg neg;
    
    always @(A,B,opcode) 
    begin
        case(opcode)
            //addition case 0
            3'b000: out = B + A;
            //Increment case 0
            3'b001: out = B + 1;
            //Negate case 0
            3'b010: out = 0 + (-A);
            //Subtraction case 0
            3'b011: out = B + (-A);
            //Pass A case 0
            3'b100: out = 0 + A;
        endcase
        
        zero = !out;
        
        if (out[31] == 1)
             neg = 1;
        else
             neg = 0;          
    end
endmodule
