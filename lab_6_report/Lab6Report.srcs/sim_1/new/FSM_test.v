`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: ETH Zurich
// Engineer: Frank K. Gurkaynak
//
// Create Date:   15:24:03 03/17/2011
// Design Name:   alu
// Module Name:   ALU_test.v
// Project Name:  Lab5b
// Target Device:  
// Tool versions:  
// Description: Simple testbench to test the ALU
//
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FSM_test;

    // Inputs
    reg         reset;
    reg      	left;
    reg      	right;
    
    // Outputs
    wire        [5:0] out;
    
    // Test clock 
    reg			clk ; //clk for tests
    reg         input_clk; //clk for fsm
    
    // Vector and Error counts
    reg [10:0]  vec_cnt, err_cnt;
    
    reg [2:0]  testvec [0:8];
    
    // The test clock generation
    always begin
        clk=1; #100_000; // clk is 1 for 50 ns 
        clk=0; #100_000; // clk is 0 for 50 ns 
    end     
    always begin
        input_clk=1; #10;		// clk is 1 for 5 ns 
        input_clk=0; #10;		// clk is 0 for 5 ns
    end					
    
    // Initialization
    initial
    begin
        $readmemb("testvec.mem", testvec);
    
        err_cnt=0; // number of errors
        vec_cnt=0; // number of vectors
    end
    
        
    // Tests
    always @ (posedge clk)		// trigger with the test clock
    begin
        reset = 1;
        // Wait 20 ns, so that we can safely apply the inputs
        #20; 
        reset = 0;
        
        // Assign the signals from the testvec array
        {reset, left, right}= testvec[vec_cnt]; 
    
        $display(vec_cnt);
                    
        vec_cnt = vec_cnt + 1;	// next vector
    
        // We use === so that we can also test for X
        if ((testvec[vec_cnt][0] === 1'bx))
        begin
            // End of test, no more entries...
            $display ("done");
            
            // Wait so that we can see the last result
            #20; 
            
            // Terminate simulation
            $finish;
        end
    end
    
    top_fsm top_fsm (input_clk, reset, left, right, out);
    
endmodule
