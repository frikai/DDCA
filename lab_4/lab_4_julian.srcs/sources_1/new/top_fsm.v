`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.04.2021 09:16:05
// Design Name: 
// Module Name: top_fsm
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


module top_fsm(input clk, input reset, input left, input right, output [5:0] out);
    wire clk_en;
    clock clock (clk, reset, clk_en);
    fsm fsm (clk_en, reset, left, right, out);
endmodule
