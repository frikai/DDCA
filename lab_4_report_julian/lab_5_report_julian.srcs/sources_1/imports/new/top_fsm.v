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
    wire clk_m;
    wire [2:0] state;
    wire [5:0] lights;
    clock clock (clk, reset, clk_en, clk_m);
    fsm fsm (clk_en, reset, left, right, state, lights);
    dimmer dimmer (clk, reset, clk_m, state, lights, out);
endmodule
