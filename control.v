`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/05/2017 02:57:40 PM
// Design Name: 
// Module Name: control
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


module control(OPCODE, ALUOp, RegWrt, MemtoReg, PCtoReg, BrNeg, BrZ, Jump, JumpMem, MemRead, MemWrt);
    input [3:0] OPCODE;
    output reg [2:0] ALUOp;
    output reg RegWrt, MemtoReg, PCtoReg, BrNeg, BrZ, Jump, JumpMem, MemRead, MemWrt;
    
    always @ OPCODE
    begin
   
        //LOAD PC
        if (OPCODE == 4'b1111)
        begin
            RegWrt = 1;
            MemtoReg = 1;
            PCtoReg = 1;
            BrNeg = 0;
            BrZ = 0;
            Jump = 0;
            JumpMem = 0;
            MemRead = 1;
            MemWrt = 0;
            ALUOp = 3'b011;
        end
        
        //LOAD
        else if (OPCODE == 4'b1110)
        begin
            RegWrt = 1;
            MemtoReg = 1;
            PCtoReg = 1;
            BrNeg = 0;
            BrZ = 0;
            Jump = 0;
            JumpMem = 0;
            MemRead = 1;
            MemWrt = 0;
            ALUOp = 3'b011; 
        end
        
        //STORE
        else if (OPCODE == 4'b0011)
        begin
            RegWrt = 0;
            MemtoReg = 1;
            PCtoReg = 0;
            BrNeg = 0;
            BrZ = 0;
            Jump = 0;
            JumpMem = 0;
            MemRead = 0;
            MemWrt = 1;
            ALUOp = 3'b011; 
        end
        
        //ADD
        else if (OPCODE == 4'b0100)
        begin
            RegWrt = 1;
            MemtoReg = 0;
            PCtoReg = 0;
            BrNeg = 0;
            BrZ = 0;
            Jump = 0;
            JumpMem = 0;
            MemRead = 0;
            MemWrt = 1;
            ALUOp = 3'b100; 
        end
        
        //INCREMENT
        else if (OPCODE == 4'b0101)
        begin
            RegWrt = 1;
            MemtoReg = 0;
            PCtoReg = 0;
            BrNeg = 0;
            BrZ = 0;
            Jump = 0;
            JumpMem = 0;
            MemRead = 0;
            MemWrt = 1;
            ALUOp = 3'b010; 
        end
        //NEGATE       
        else if (OPCODE == 4'b0110)
        begin
            RegWrt = 1;
            MemtoReg = 0;
            PCtoReg = 0;
            BrNeg = 0;
            BrZ = 0;
            Jump = 0;
            JumpMem = 0;
            MemRead = 0;
            MemWrt = 1; 
            ALUOp = 3'b001; 
           end
       //SUBTRACT        
        else if (OPCODE == 4'b0111)
        begin
            RegWrt = 1;
            MemtoReg = 0;
            PCtoReg = 0;
            BrNeg = 0;
            BrZ = 0;
            Jump = 0;
            JumpMem = 0;
            MemRead = 0;
            MemWrt = 1;
            ALUOp = 3'b000; 
            end
               
       //JUMP
        else if (OPCODE == 4'b1000)
        begin
            RegWrt = 0;
            MemtoReg = 0;
            PCtoReg = 0;
            BrNeg = 0;
            BrZ = 0;
            Jump = 1;
            JumpMem = 0;
            MemRead = 0;
            MemWrt = 0;
            ALUOp = 3'b011; 
        end
               
        //BRANCH IF ZERO
        else if (OPCODE == 4'b1001)
        begin
            RegWrt = 0;
            MemtoReg = 0;
            PCtoReg = 0;
            BrNeg = 0;
            BrZ = 1;
            Jump = 0;
            JumpMem = 0;    
            MemRead = 0;
            MemWrt = 0;
            ALUOp = 3'b011; 
        end
                   
         //JUMP MEMORY      
        else if (OPCODE == 4'b1010)
        begin
            RegWrt = 0;
            MemtoReg = 0;
            PCtoReg = 0;
            BrNeg = 0;
            BrZ = 0;
            Jump = 0;
            JumpMem = 1;        
            MemRead = 0;
            MemWrt = 0;
            ALUOp = 3'b011; 
        end
               
         //BRANCH IF NEGATIVE
        else if (OPCODE == 4'b1011)
        begin
            RegWrt = 0;
            MemtoReg = 0;
            PCtoReg = 0;
            BrNeg = 1;
            BrZ = 0;
            Jump = 0;
            JumpMem = 0;
            MemRead = 0;
            MemWrt = 0;
            ALUOp = 3'b011; 
               end
        //SUM
        else if (OPCODE == 4'b0001)
             begin
                   RegWrt = 1;
                   MemtoReg = 0;
                   PCtoReg = 0;
                   MemRead = 0;
                   MemWrt = 1;
                   ALUOp = 3'b100; 
            end    
        else
            begin
                RegWrt = 0;
                MemtoReg = 0;
                PCtoReg = 0;
                MemRead = 0;
                MemWrt = 0;
                ALUOp = 3'b000;
            end
   end
   
  // why is this here? - Austin ID_EX IDEX(.clk(clk), .RegWrt_In(RegWrt), .MemtoReg_In(MemtoReg), .PCToReg_In(PCToReg), .MemRead_In(MemRead), .MemWrt_In(MemWrt), .ALUOP_In(ALUOP));
endmodule
