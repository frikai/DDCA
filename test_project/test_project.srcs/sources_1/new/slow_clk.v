`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2021 22:09:08
// Design Name: 
// Module Name: slow_clk
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


module slow_clk(input clk, output clk_en);
    reg [25:0] clk_count;
    always @ (posedge clk)
        clk_count <= clk_count + 1;
    assign clk_en = &clk_count;
endmodule
