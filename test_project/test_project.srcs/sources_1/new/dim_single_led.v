`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2021 22:02:47
// Design Name: 
// Module Name: dim_single_led
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


module dim_single_led(input clk, output reg [2:0] leds);
    reg [1:0] level;
    reg [1:0] current_level;
    wire clk_en;
    wire med_clk;
    slow_clk slow_clk(clk, clk_en);
    dim_clk dim_clk(clk, med_clk);
    
    always @ (posedge clk_en) begin
        level <= level +1;
        leds[2:1] <= level;
        end
    always @ (posedge clk) begin
        current_level <= current_level + 1;
        leds[0] <= (current_level+2 < level);
        end        
endmodule
