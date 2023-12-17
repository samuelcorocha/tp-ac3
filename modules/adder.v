`timescale 1 ps / 100 fs
module Adder(J,S,G);
output [31:0] J;
input [31:0] S,G;
wire [31:0] A;
 adder1bit adder1bit0(J[0],A[0],S[0],G[0],1'b0);
 adder1bit adder1bit1(J[1],A[1],S[1],G[1],A[0]);
 adder1bit adder1bit2(J[2],A[2],S[2],G[2],A[1]);
 adder1bit adder1bit3(J[3],A[3],S[3],G[3],A[2]);
 adder1bit adder1bit4(J[4],A[4],S[4],G[4],A[3]);
 adder1bit adder1bit5(J[5],A[5],S[5],G[5],A[4]);
 adder1bit adder1bit6(J[6],A[6],S[6],G[6],A[5]);
 adder1bit adder1bit7(J[7],A[7],S[7],G[7],A[6]);
 adder1bit adder1bit8(J[8],A[8],S[8],G[8],A[7]);
 adder1bit adder1bit9(J[9],A[9],S[9],G[9],A[8]);
 adder1bit adder1bit10(J[10],A[10],S[10],G[10],A[9]);
 adder1bit adder1bit11(J[11],A[11],S[11],G[11],A[10]);
 adder1bit adder1bit12(J[12],A[12],S[12],G[12],A[11]);
 adder1bit adder1bit13(J[13],A[13],S[13],G[13],A[12]);
 adder1bit adder1bit14(J[14],A[14],S[14],G[14],A[13]);
 adder1bit adder1bit15(J[15],A[15],S[15],G[15],A[14]);
 adder1bit adder1bit16(J[16],A[16],S[16],G[16],A[15]);
 adder1bit adder1bit17(J[17],A[17],S[17],G[17],A[16]);
 adder1bit adder1bit18(J[18],A[18],S[18],G[18],A[17]);
 adder1bit adder1bit19(J[19],A[19],S[19],G[19],A[18]);
 adder1bit adder1bit20(J[20],A[20],S[20],G[20],A[19]);
 adder1bit adder1bit21(J[21],A[21],S[21],G[21],A[20]);
 adder1bit adder1bit22(J[22],A[22],S[22],G[22],A[21]);
 adder1bit adder1bit23(J[23],A[23],S[23],G[23],A[22]);
 adder1bit adder1bit24(J[24],A[24],S[24],G[24],A[23]);
 adder1bit adder1bit25(J[25],A[25],S[25],G[25],A[24]);
 adder1bit adder1bit26(J[26],A[26],S[26],G[26],A[25]);
 adder1bit adder1bit27(J[27],A[27],S[27],G[27],A[26]);
 adder1bit adder1bit28(J[28],A[28],S[28],G[28],A[27]);
 adder1bit adder1bit29(J[29],A[29],S[29],G[29],A[28]);
 adder1bit adder1bit30(J[30],A[30],S[30],G[30],A[29]);
 adder1bit adder1bit31(J[31],A[31],S[31],G[31],A[30]);

endmodule

//---------------------------------------------------------------------------------------------------

`timescale 1 ps / 100 fs
module adder1bit(soma,contador,s,g,inp);
input   s,g,inp;
output  contador,soma;
// soma = s xor g xor inp
xor #(50) (soma,s,g,inp);
// carry out = s.g + inp.(s+g)
and #(50) and1(t,s,g);
or #(50) or1(t2,s,g);
and #(50) and2(t3,t2,inp);
or #(50) or2(contador,t,t3);
endmodule 