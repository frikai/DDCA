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


module fsm_top(input clk, input reset, input left, input right, output [5:0] out);
    wire l_clock;
    wire d_clock;
    wire [2:0] state;
    wire [5:0] lights;
    light_clock light_clock (clk, reset, l_clock);
    dim_clock dim_clock (clk, reset, d_clock);
    fsm fsm (l_clock, reset, left, right, state, lights);
    dimmer dimmer (reset, clk, d_clock, state, lights, out);
endmodule
