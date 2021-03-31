`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2021 09:20:37
// Design Name: 
// Module Name: TopAdder
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


module TopAdder(
    input [3:0] a, b, [1:0] c, output [7:0] s, [3:0] AN
    );
    wire [4:0] out;
    FourBitAdder adder (a, b, out);
    hex_display_decoder decoder (out[3:0], s[6:0]);
    display_decoder (c, AN);
    assign s[7] = out[4];
    
endmodule
