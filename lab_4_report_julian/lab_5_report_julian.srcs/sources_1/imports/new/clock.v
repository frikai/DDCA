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


module clock(input clk, input rst, output clk_en, output clk_med);
    reg [25:0] clk_count;
    reg [15:0] clk_m_count;
    always @ (posedge clk)
        begin
            if (rst) begin
                clk_count <= 0;
                clk_m_count <= 0;
            end
            else begin
                clk_count <= clk_count + 1;
                clk_m_count <= clk_m_count + 1;
            end
        end
    assign clk_en = &clk_count;
    assign clk_med = &clk_m_count;
endmodule