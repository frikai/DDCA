
module FourBitAdder (input [3:0] a, input [3:0] b, output [4:0] s);
    wire c0, c1, c2;
    FullAdder bit0 (a[0], b[0], 0, s[0], c0);
    FullAdder bit1 (a[1], b[1], c0, s[1], c1);
    FullAdder bit2 (a[2], b[2], c1, s[2], c2);
    FullAdder bit3 (a[3], b[3], c2, s[3], s[4]);
endmodule