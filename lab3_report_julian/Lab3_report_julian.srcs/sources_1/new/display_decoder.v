`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2021 08:41:40
// Design Name: 
// Module Name: display_decoder
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


module display_decoder(
    input [1:0] i, output reg [3:0] s);
    always @(i) begin
        case(i)
            2'b00: s = 4'b1110;
            2'b01: s = 4'b1101;
            2'b10: s = 4'b1011;
            2'b11: s = 4'b0111;
        endcase
    end    
    
endmodule
