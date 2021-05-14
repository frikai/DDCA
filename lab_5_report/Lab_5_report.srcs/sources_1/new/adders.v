`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.05.2021 22:32:56
// Design Name: 
// Module Name: 
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


module fulladder(input a, input b, input ci, output s, output co);
    assign s = (a ^ b) ^ ci;
    assign co = (a & b)  |  (a & ci)  |  (b & ci);
endmodule

module fouradder(input [3:0] a, input [3:0] b, input carryIn, output [3:0] s, output carryOut);
    wire c1, c2, c3;
    fulladder out1 (a[0], b[0], carryIn, s[0], c1);
    fulladder out2 (a[1], b[1], c1, s[1], c2);
    fulladder out3 (a[2], b[2], c2, s[2], c3);
    fulladder out4 (a[3], b[3], c3, s[3], carryOut);
endmodule

module bigadder(input [31:0] a, input [31:0] b, input carryIn, output [31:0] s, output carryOut);
    wire c1, c2, c3, c4, c5, c6, c7;
    fouradder out1 (a[3:0], b[3:0], carryIn, s[3:0], c1);
    fouradder out2 (a[7:4], b[7:4], c1, s[7:4], c2);
    fouradder out3 (a[11:8], b[11:8], c2, s[11:8], c3);
    fouradder out4 (a[15:12], b[15:12], c3, s[15:12], c4);
    fouradder out5 (a[19:16], b[19:16], c4, s[19:16], c5);
    fouradder out6 (a[23:20], b[23:20], c5, s[23:20], c6);
    fouradder out7 (a[27:24], b[27:24], c6, s[27:24], c7);
    fouradder out8 (a[31:28], b[31:28], c7, s[31:28], carryOut);
endmodule