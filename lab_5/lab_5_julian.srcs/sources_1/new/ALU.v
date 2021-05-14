`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2021 09:24:07
// Design Name: 
// Module Name: alu
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


module alu(input [3:0] AluOp, input [31:0] a, input[31:0] b, output isZero, output [31:0] result);
    assign result = AluOp==4'b0000 ? a+b:
                    AluOp==4'b0010 ? a-b:
                    AluOp==4'b0100 ? a&b:
                    AluOp==4'b0101 ? a|b:
                    AluOp==4'b0110 ? a^b:
                    AluOp==4'b0111 ? ~(a|b):
                    AluOp==4'b1010 ? a<b : 32'b0;
    assign isZero = result==32'b0 ? 1 : 0;    
endmodule
