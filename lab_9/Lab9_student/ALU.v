`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  ETH Zurich
// Engineer: Frank K. Gurkaynak
// 
// Create Date:    12:51:05 03/17/2011 
// Design Name:    MIPS processor
// Module Name:    ALU 
// Project Name:   Digital Circuits Lab Exercuse
// Target Devices: 
// Tool versions: 
// Description:    This is one possible solution to the
//                 ALU description from Lab5a
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU(
  input clock,
  input reset,   
  input  [31:0] a,
  input  [31:0] b,
  input  [4:0] shamt, //shift amnt
  input  [5:0] aluop,
  output [31:0] result,
  output zero
 );
  
  wire [31:0] logicout;   // output of the logic block
  wire [31:0] addout;     // adder subtractor out
  wire [31:0] arithout;   // output after alt
  wire [31:0] n_b;        // inverted b
  wire [31:0] sel_b;      // select b or n_b;
  wire [31:0] slt;        // output of the slt extension
  wire [31:0] old_result; // output of lab5
  wire [31:0] shiftvalue; // srl
  wire [31:0] multvalue;  // multiplication
  wire [31:0] new_result;
  
  
  wire [1:0] logicsel;    // lower two bits of aluop;
  reg [31:0] lo;
  reg [31:0] lo2;
  
  // logic select 
  assign logicsel = aluop[1:0];
  assign logicout = (logicsel == 2'b00) ? a & b :
                    (logicsel == 2'b01) ? a | b :
                    (logicsel == 2'b10) ? a ^ b :
                                        ~(a | b);
  
  // adder subtractor
  assign n_b = ~b ;  // invert b
  assign sel_b = (aluop[1])? n_b : b ;
  assign addout = a + sel_b + aluop[1];
  
  // set less than operator
  assign slt = {31'b0,addout[31]};
  
  // arith out
  assign arithout = (aluop[3]) ? slt : addout;
  
  // old_result
  assign old_result = (aluop[2]) ? logicout : arithout;
  
  //shift result
  assign shiftvalue = b >> shamt;
  
  //multiplication result
  assign multvalue = a * b;
  
  always @(posedge clock, posedge reset)
  begin
    if (reset) lo <= 32'b0;
    else if (aluop == 6'b011001) lo <= multvalue; 
    lo2 <= (lo==32'b0) ? 32'b111 : 32'b101;
  end
  
  assign new_result = (aluop == 6'b010010) ? lo : shiftvalue;
  assign result = aluop[5] ? old_result : new_result;
  // the zero
  assign zero = (result == 32'b0) ? 1: 0;
  
endmodule
