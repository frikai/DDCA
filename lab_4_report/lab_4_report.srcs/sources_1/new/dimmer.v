`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2021 23:02:01
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


module dimmer (input reset, input clk, input d_clock, input [2:0] state, input[5:0] lights, output reg [5:0] out);
    reg [3:0] d_level;
    reg [3:0] d_cycle;
    parameter S0 = 3'b111;
    parameter L1 = 3'b011;
    parameter L2 = 3'b100;
    parameter L3 = 3'b101;  
    parameter R1 = 3'b010;
    parameter R2 = 3'b001;
    parameter R3 = 3'b000;
        
    always @ (posedge d_clock, posedge reset) begin
        if (reset) begin
            d_level <= 0;
        end
        else
            d_level <= d_level + 1;
    end        
         
    always @ (posedge clk) begin
        d_cycle <= d_cycle + 1;
        if (d_cycle >= d_level) begin
            case (state)
                S0: out <= 6'b000000;
                L1: out <= 6'b000000;
                L2: out <= 6'b001000; 
                L3: out <= 6'b011000;
                R1: out <= 6'b000000;
                R2: out <= 6'b000100;
                R3: out <= 6'b000110;
            endcase 
        end
        else
            out <= lights;
    end
endmodule
