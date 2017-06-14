`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/05/2017 04:26:04 PM
// Design Name: 
// Module Name: section1
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


module section1(JUMP, BRANCH, SELECT, CLOCK, PC_OUT, INST);

input CLOCK;
input [1:0] SELECT;
input [31:0] JUMP, BRANCH;

output reg [31:0] PC_OUT;
output reg [31:0] INST;

reg [31:0] PC;
reg [31:0] INCREMENT;

wire [31:0] INST_BUS;
wire [31:0] PC_BUS;
wire [31:0] ADD_BUS;
wire [31:0] BUFF_BUS_PC;
wire [31:0] BUFF_BUS_INST;

Mux3to1 PC_MUX(.a_in(ADD_BUS), .b_in(JUMP), .c_in(BRANCH), .select(SELECT), .out(PC_BUS));

Adder PC_ADDER(.pc(PC_BUS), .in(1), .clk(CLOCK), .out(ADD_BUS));

IFIDBuffer IFID_BUFF(.clk(CLOCK), .PC4In(PC_BUS), .I_MemIn(INST_BUS));

/*
InstructionMem INST_MEM(.address(PC_BUS), .clk(CLOCK), .instruction_out(INST_BUS));

IFIDBuffer IFID_BUFF(.clk(CLOCK), .PC4In(PC_BUS), .I_MemIn(INST_BUS), .PC4Out(BUFF_BUS_PC), .I_MemOut(BUFF_BUS_INST));
*/

initial
begin
    assign PC = 0;
    assign INCREMENT = 1;
end

always @ (posedge CLOCK)
begin
    assign PC = PC_BUS;
    assign PC_OUT = BUFF_BUS_PC;
    assign INST = BUFF_BUS_INST;
end

endmodule