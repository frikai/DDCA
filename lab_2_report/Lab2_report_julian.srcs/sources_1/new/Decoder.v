`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2021 19:38:03
// Design Name: 
// Module Name: Decoder
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


module Decoder (input [1:0] a, output [3:0] s);
    // wires for the inverted signals of a[0] and a[1]
    /*wire na0, na1;
    // invert the inputs and assign them to the wires
    not ng0(na0, a[0]);
    not ng1(na1, a[1]);
    // each output is the result of an AND gate with the (inverted) input
    //00
    and ag0(s[0], na0, na1);
    //01
    and ag1(s[1], a[0], na1);
    //10
    and ag2(s[2], na0, a[1]);
    //11
    and ag3(s[3], a[0], a[1]);*/
    
    // alternate implementation:
    assign s[0] = ~a[0]&~a[1];
    assign s[1] = a[0]&~a[1];
    assign s[2] = ~a[0]&a[1];
    assign s[3] = a[0]&a[1]; 
    
endmodule
