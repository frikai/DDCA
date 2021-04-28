`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.04.2021 09:11:29
// Design Name: 
// Module Name: fsm
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


module fsm(input clk, input reset, input left, input right, output reg [5:0] out);
    reg [2:0] state, nextstate;
    parameter S0 = 3'b000;
    parameter L1 = 3'b001;
    parameter L2 = 3'b010;
    parameter L3 = 3'b100;  
    parameter R1 = 3'b011;
    parameter R2 = 3'b101;
    parameter R3 = 3'b111;
    
    // state register
    always @ (posedge clk, posedge reset)
        if (reset) state <= S0;
        else state <= nextstate;
           
    // next state logic
    always @ (*)
        case (state)
            S0: begin
                if(left) nextstate = L1;
                else if (right) nextstate = R1;
                else nextstate = S0;
            end
            L1: nextstate = L2;
            L2: nextstate = L3;
            L3: nextstate = S0;
            R1: nextstate = R2;
            R2: nextstate = R3;
            R3: nextstate = S0;
            default: nextstate = S0;
        endcase
        
    // output
    always  @ (*)
        case (state)
            S0: out = 6'b000000;
            L1: out = 6'b001000;
            L2: out = 6'b011000; 
            L3: out = 6'b111000;
            R1: out = 6'b000100;
            R2: out = 6'b000110;
            R3: out = 6'b000111;
        endcase   
endmodule