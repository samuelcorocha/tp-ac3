`timescale 1 ps / 100 fs
module alu(Opt, COT, zero, ovflw, ngt, BussA, BussB, Controle);
output COT,ovflw,ngt,zero;
output [31:0] Opt;
input [31:0] BussA,BussB;
input [1:0] Controle;
wire lessthan;
wire [31:0] cyout;

alu1bit alu0(Opt[0],cyout[0],BussA[0],BussB[0],Controle[1],lessthan,Controle);
alu1bit alu1(Opt[1],cyout[1],BussA[1],BussB[1],cyout[0],1'b0,Controle);
alu1bit alu2(Opt[2],cyout[2],BussA[2],BussB[2],cyout[1],1'b0,Controle);
alu1bit alu3(Opt[3],cyout[3],BussA[3],BussB[3],cyout[2],1'b0,Controle);
alu1bit alu4(Opt[4],cyout[4],BussA[4],BussB[4],cyout[3],1'b0,Controle);
alu1bit alu5(Opt[5],cyout[5],BussA[5],BussB[5],cyout[4],1'b0,Controle);
alu1bit alu6(Opt[6],cyout[6],BussA[6],BussB[6],cyout[5],1'b0,Controle);
alu1bit alu7(Opt[7],cyout[7],BussA[7],BussB[7],cyout[6],1'b0,Controle);
alu1bit alu8(Opt[8],cyout[8],BussA[8],BussB[8],cyout[7],1'b0,Controle);
alu1bit alu9(Opt[9],cyout[9],BussA[9],BussB[9],cyout[8],1'b0,Controle);
alu1bit alu10(Opt[10],cyout[10],BussA[10],BussB[10],cyout[9],1'b0,Controle);
alu1bit alu11(Opt[11],cyout[11],BussA[11],BussB[11],cyout[10],1'b0,Controle);
alu1bit alu12(Opt[12],cyout[12],BussA[12],BussB[12],cyout[11],1'b0,Controle);
alu1bit alu13(Opt[13],cyout[13],BussA[13],BussB[13],cyout[12],1'b0,Controle);
alu1bit alu14(Opt[14],cyout[14],BussA[14],BussB[14],cyout[13],1'b0,Controle);
alu1bit alu15(Opt[15],cyout[15],BussA[15],BussB[15],cyout[14],1'b0,Controle);
alu1bit alu16(Opt[16],cyout[16],BussA[16],BussB[16],cyout[15],1'b0,Controle);
alu1bit alu17(Opt[17],cyout[17],BussA[17],BussB[17],cyout[16],1'b0,Controle);
alu1bit alu18(Opt[18],cyout[18],BussA[18],BussB[18],cyout[17],1'b0,Controle);
alu1bit alu19(Opt[19],cyout[19],BussA[19],BussB[19],cyout[18],1'b0,Controle);
alu1bit alu20(Opt[20],cyout[20],BussA[20],BussB[20],cyout[19],1'b0,Controle);
alu1bit alu21(Opt[21],cyout[21],BussA[21],BussB[21],cyout[20],1'b0,Controle);
alu1bit alu22(Opt[22],cyout[22],BussA[22],BussB[22],cyout[21],1'b0,Controle);
alu1bit alu23(Opt[23],cyout[23],BussA[23],BussB[23],cyout[22],1'b0,Controle);
alu1bit alu24(Opt[24],cyout[24],BussA[24],BussB[24],cyout[23],1'b0,Controle);
alu1bit alu25(Opt[25],cyout[25],BussA[25],BussB[25],cyout[24],1'b0,Controle);
alu1bit alu26(Opt[26],cyout[26],BussA[26],BussB[26],cyout[25],1'b0,Controle);
alu1bit alu27(Opt[27],cyout[27],BussA[27],BussB[26],cyout[26],1'b0,Controle);
alu1bit alu28(Opt[28],cyout[28],BussA[28],BussB[28],cyout[27],1'b0,Controle);
alu1bit alu29(Opt[29],cyout[29],BussA[29],BussB[29],cyout[28],1'b0,Controle);
alu1bit alu30(Opt[30],cyout[30],BussA[30],BussB[30],cyout[29],1'b0,Controle);
alu1bit alu31(Opt[31],cyout[31],BussA[31],BussB[31],cyout[30],1'b0,Controle);
not #(50) notcarry(notcr31,cyout[31]);
// Carryout = Not carry out 31 if it is subtraction
mux21 muxcarry31(COT,cyout[31],notcr31,Controle[1]);
xor #(50) xor5(ovflw,cyout[30],cyout[31]);
// SLT
addsub add2(addsub31Out,crrout31,BussA[31],BussB[31],cyout[30],Controle[1]);
xor #(50) xor6(lessthan,ovflw,addsub31Out);
assign ngt = Opt[31];
or #(50) or1(o1,Opt[0],Opt[1],Opt[2],Opt[3]);
or #(50) or2(o2,Opt[4],Opt[5],Opt[6],Opt[7]);
or #(50) or3(o3,Opt[8],Opt[9],Opt[10],Opt[11]);
or #(50) or4(o4,Opt[12],Opt[13],Opt[14],Opt[15]);
or #(50) or5(o5,Opt[16],Opt[17],Opt[18],Opt[19]);
or #(50) or6(o6,Opt[20],Opt[21],Opt[22],Opt[23]);
or #(50) or7(o7,Opt[24],Opt[25],Opt[26],Opt[27]);
or #(50) or8(o8,Opt[28],Opt[29],Opt[30],Opt[31]);
or #(50) or9(o9,o1,o2,o3,o4);
or #(50) or10(o10,o5,o6,o7,o8);
nor #(50) nor1(zero,o9,o10);
endmodule
`timescale 1 ps / 100 fs
module alu1bit(resultado,cyout,s,g,carryin,less,Controle);
output resultado,cyout;
input s,g,carryin,less;
input [1:0] Controle;
addsub add1(addsubOut,cyout,s,g,carryin,Controle[1]);
xor #(50) xor1(xorOut,s,g);
mux21 mux2(xorlessOut,xorOut,less,Controle[1]);
mux21 mux3(resultado,addsubOut,xorlessOut,Controle[0]);
endmodule

`timescale 1 ps / 100 fs
module addsub(Out,contador,s,g,inp,select);
input s,g,inp,select;
output Out,contador; // the resultado and carry out
not #(50) not1(notb,g);
mux21 mux1(b1,g,notb,select);

adder adder1(Out,contador,s,b1,inp);
endmodule

`timescale 1 ps / 100 fs
module adder(soma,contador,s,g,inp);
input   s,g,inp;
output  contador,soma;
// soma = s xor g xor inp
xor #(50) (soma,s,g,inp);
// carry out = s.g + inp.(s+g)
and #(50) and1(c1,s,g);
or #(50) or1(c2,s,g);
and #(50) and2(c3,c2,inp);
or #(50) or2(contador,c1,c3);
endmodule 

`timescale 1 ps / 100 fs
module mux21(O,A,B,sel);
// sel = 0 thi O = A
// sel = 1 thi O =B
output O;
input A,B,sel;
not #(50) not1(nsel,sel);
and #(50) and1(O1,A,nsel); 
and #(50) and2(O2,B,sel);
or #(50) or2(O,O1,O2);
endmodule