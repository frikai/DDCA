`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2021 08:48:46
// Design Name: 
// Module Name: dimmer
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


module dimmer(input clk, input reset, input m_clk, input [2:0] state, input [5:0] lights, output reg [5:0] out);
    reg [9:0] on_time;
    reg [9:0] counter;
    reg c_light_state;
    always @ (posedge m_clk)
        on_time <= on_time + 1;
    
    always @ (posedge clk) begin
        counter = counter + 1;
        c_light_state = (counter <= on_time);
        out = lights;
        if (~(state == 3'b111))
            out[state] = c_light_state;
    end
        
    always @ (posedge reset) begin
        on_time <= 0;
        counter <= 0;
    end
    always @ (state) begin
        on_time <= 0;
        counter <= 0;
    end
    
endmodule
