`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.04.2021 09:12:50
// Design Name: 
// Module Name: clock
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


module clock(input clk, input rst, output clk_en);
    reg [10:0] clk_count; // note: this was lowered such that the simulation can be run faster
    always @ (posedge clk)
        begin
            if (rst)
                clk_count <= 0;
            else
                clk_count <= clk_count + 1;
        end
    assign clk_en = &clk_count;
endmodule