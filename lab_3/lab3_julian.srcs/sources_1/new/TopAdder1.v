`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2021 09:16:10
// Design Name: 
// Module Name: TopAdder1
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


module TopAdder1(input [3:0] a, b, output [7:0] s);
    wire [4:0] out;
    FourBitAdder adder (a, b, out);
    hex_display_decoder decoder (out[3:0], s[6:0]);
    assign s[7] = out[4];
    
endmodule
