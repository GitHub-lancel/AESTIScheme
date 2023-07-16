/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP1
// Date      : Tue May 30 05:05:30 2023
/////////////////////////////////////////////////////////////


module AffineInput_Unit_0 ( A, Z );
  input [7:0] A;
  output [7:0] Z;
  wire   n8, n9, n10, n11, n12, n13;
  assign Z[2] = A[0];

  XOR2_X1 U1 ( .A(A[1]), .B(A[3]), .Z(n10) );
  XOR2_X1 U2 ( .A(n10), .B(A[4]), .Z(n9) );
  XNOR2_X1 U3 ( .A(A[0]), .B(A[7]), .ZN(n8) );
  XNOR2_X1 U4 ( .A(n9), .B(n8), .ZN(Z[3]) );
  XNOR2_X1 U5 ( .A(A[6]), .B(A[0]), .ZN(n12) );
  XOR2_X1 U6 ( .A(A[2]), .B(n10), .Z(n11) );
  XNOR2_X1 U7 ( .A(n12), .B(n11), .ZN(Z[0]) );
  XNOR2_X1 U8 ( .A(A[5]), .B(n12), .ZN(Z[1]) );
  XOR2_X1 U9 ( .A(Z[1]), .B(A[7]), .Z(Z[4]) );
  XOR2_X1 U10 ( .A(Z[1]), .B(A[4]), .Z(Z[6]) );
  XOR2_X1 U11 ( .A(A[1]), .B(Z[1]), .Z(Z[5]) );
  XNOR2_X1 U12 ( .A(Z[5]), .B(A[2]), .ZN(n13) );
  XNOR2_X1 U13 ( .A(n13), .B(A[7]), .ZN(Z[7]) );
endmodule


module AffineInput_Unit_1 ( A, Z );
  input [7:0] A;
  output [7:0] Z;
  wire   n15, n16, n17, n18, n19, n20;
  assign Z[2] = A[0];

  XOR2_X1 U1 ( .A(A[1]), .B(A[3]), .Z(n17) );
  XOR2_X1 U2 ( .A(n17), .B(A[4]), .Z(n16) );
  XNOR2_X1 U3 ( .A(A[0]), .B(A[7]), .ZN(n15) );
  XNOR2_X1 U4 ( .A(n16), .B(n15), .ZN(Z[3]) );
  XNOR2_X1 U5 ( .A(A[6]), .B(A[0]), .ZN(n19) );
  XOR2_X1 U6 ( .A(A[2]), .B(n17), .Z(n18) );
  XNOR2_X1 U7 ( .A(n19), .B(n18), .ZN(Z[0]) );
  XNOR2_X1 U8 ( .A(A[5]), .B(n19), .ZN(Z[1]) );
  XOR2_X1 U9 ( .A(Z[1]), .B(A[7]), .Z(Z[4]) );
  XOR2_X1 U10 ( .A(Z[1]), .B(A[4]), .Z(Z[6]) );
  XOR2_X1 U11 ( .A(A[1]), .B(Z[1]), .Z(Z[5]) );
  XNOR2_X1 U12 ( .A(Z[5]), .B(A[2]), .ZN(n20) );
  XNOR2_X1 U13 ( .A(n20), .B(A[7]), .ZN(Z[7]) );
endmodule


module GF16MulXorSqSc_Unit ( clk, h0g0f0e0, h1g1f1e1, d0c0b0a0, d1c1b1a1, 
        guards, x, y, z, t );
  input [3:0] h0g0f0e0;
  input [3:0] h1g1f1e1;
  input [3:0] d0c0b0a0;
  input [3:0] d1c1b1a1;
  input [3:0] guards;
  output [1:0] x;
  output [1:0] y;
  output [1:0] z;
  output [1:0] t;
  input clk;
  wire   N0, N1, N2, N4, N6, N7, N8, N9, N10, N12, N13, N15, n174, n175, n176,
         n177, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323, n324, n325, n326, n327, n328, n329, n330, n331,
         n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353,
         n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n364,
         n365, n366, n367, n368, n369, n370, n371, n372, n373, n374, n375,
         n376, n377, n378, n379;
  wire   [3:0] x_r;
  wire   [3:0] y_r;
  wire   [3:0] z_r;
  wire   [3:0] t_r;

  DFF_X1 \x_r_reg[3]  ( .D(n177), .CK(clk), .Q(x_r[3]) );
  DFF_X1 \x_r_reg[2]  ( .D(N2), .CK(clk), .Q(x_r[2]) );
  DFF_X1 \x_r_reg[1]  ( .D(N1), .CK(clk), .Q(x_r[1]) );
  DFF_X1 \x_r_reg[0]  ( .D(N0), .CK(clk), .Q(x_r[0]) );
  DFF_X1 \y_r_reg[3]  ( .D(N7), .CK(clk), .Q(y_r[3]) );
  DFF_X1 \y_r_reg[2]  ( .D(N6), .CK(clk), .Q(y_r[2]) );
  DFF_X1 \y_r_reg[1]  ( .D(n176), .CK(clk), .Q(y_r[1]) );
  DFF_X1 \y_r_reg[0]  ( .D(N4), .CK(clk), .Q(y_r[0]) );
  DFF_X1 \z_r_reg[3]  ( .D(n175), .CK(clk), .Q(z_r[3]) );
  DFF_X1 \z_r_reg[2]  ( .D(N10), .CK(clk), .Q(z_r[2]) );
  DFF_X1 \z_r_reg[1]  ( .D(N9), .CK(clk), .Q(z_r[1]) );
  DFF_X1 \z_r_reg[0]  ( .D(N8), .CK(clk), .Q(z_r[0]) );
  DFF_X1 \t_r_reg[3]  ( .D(N15), .CK(clk), .Q(t_r[3]) );
  DFF_X1 \t_r_reg[2]  ( .D(n174), .CK(clk), .Q(t_r[2]) );
  DFF_X1 \t_r_reg[1]  ( .D(N13), .CK(clk), .Q(t_r[1]) );
  DFF_X1 \t_r_reg[0]  ( .D(N12), .CK(clk), .Q(t_r[0]) );
  XOR2_X1 U3 ( .A(z_r[2]), .B(z_r[3]), .Z(z[1]) );
  XOR2_X1 U4 ( .A(z_r[0]), .B(z_r[1]), .Z(z[0]) );
  XOR2_X1 U5 ( .A(y_r[2]), .B(y_r[3]), .Z(y[1]) );
  XOR2_X1 U6 ( .A(y_r[0]), .B(y_r[1]), .Z(y[0]) );
  XOR2_X1 U7 ( .A(x_r[2]), .B(x_r[3]), .Z(x[1]) );
  XOR2_X1 U8 ( .A(x_r[0]), .B(x_r[1]), .Z(x[0]) );
  XOR2_X1 U9 ( .A(t_r[2]), .B(t_r[3]), .Z(t[1]) );
  XOR2_X1 U10 ( .A(t_r[0]), .B(t_r[1]), .Z(t[0]) );
  NAND2_X1 U11 ( .A1(d1c1b1a1[1]), .A2(h1g1f1e1[1]), .ZN(n204) );
  NAND2_X1 U12 ( .A1(d1c1b1a1[3]), .A2(h1g1f1e1[2]), .ZN(n202) );
  NAND2_X1 U13 ( .A1(d1c1b1a1[2]), .A2(h1g1f1e1[3]), .ZN(n201) );
  XOR2_X1 U14 ( .A(n202), .B(n201), .Z(n203) );
  XNOR2_X1 U15 ( .A(n204), .B(n203), .ZN(n370) );
  NAND2_X1 U16 ( .A1(d1c1b1a1[1]), .A2(h1g1f1e1[3]), .ZN(n206) );
  NAND2_X1 U17 ( .A1(d1c1b1a1[3]), .A2(h1g1f1e1[1]), .ZN(n205) );
  XOR2_X1 U18 ( .A(n206), .B(n205), .Z(n363) );
  NAND2_X1 U19 ( .A1(h1g1f1e1[3]), .A2(d1c1b1a1[3]), .ZN(n207) );
  XNOR2_X1 U20 ( .A(n363), .B(n207), .ZN(n219) );
  XNOR2_X1 U21 ( .A(n370), .B(n219), .ZN(n217) );
  NAND2_X1 U22 ( .A1(d1c1b1a1[0]), .A2(h1g1f1e1[3]), .ZN(n209) );
  NAND2_X1 U23 ( .A1(d1c1b1a1[2]), .A2(h1g1f1e1[1]), .ZN(n208) );
  XOR2_X1 U24 ( .A(n209), .B(n208), .Z(n213) );
  INV_X1 U25 ( .A(d1c1b1a1[3]), .ZN(n281) );
  NAND2_X1 U26 ( .A1(n281), .A2(h1g1f1e1[0]), .ZN(n211) );
  NAND2_X1 U27 ( .A1(d1c1b1a1[1]), .A2(h1g1f1e1[2]), .ZN(n210) );
  XNOR2_X1 U28 ( .A(n211), .B(n210), .ZN(n212) );
  XNOR2_X1 U29 ( .A(n213), .B(n212), .ZN(n218) );
  XOR2_X1 U30 ( .A(guards[1]), .B(n218), .Z(n215) );
  NAND2_X1 U31 ( .A1(d1c1b1a1[0]), .A2(h1g1f1e1[0]), .ZN(n214) );
  XNOR2_X1 U32 ( .A(n215), .B(n214), .ZN(n216) );
  XNOR2_X1 U33 ( .A(n217), .B(n216), .ZN(N7) );
  INV_X1 U34 ( .A(h1g1f1e1[3]), .ZN(n255) );
  XNOR2_X1 U35 ( .A(h1g1f1e1[2]), .B(n255), .ZN(n369) );
  XNOR2_X1 U36 ( .A(n218), .B(n369), .ZN(n227) );
  NAND2_X1 U37 ( .A1(h1g1f1e1[2]), .A2(d1c1b1a1[2]), .ZN(n368) );
  XNOR2_X1 U38 ( .A(n219), .B(n368), .ZN(n223) );
  NAND2_X1 U39 ( .A1(h1g1f1e1[0]), .A2(d1c1b1a1[1]), .ZN(n221) );
  NAND2_X1 U40 ( .A1(d1c1b1a1[0]), .A2(h1g1f1e1[1]), .ZN(n220) );
  XNOR2_X1 U41 ( .A(n221), .B(n220), .ZN(n222) );
  XNOR2_X1 U42 ( .A(n223), .B(n222), .ZN(n351) );
  XOR2_X1 U43 ( .A(guards[3]), .B(n351), .Z(n225) );
  INV_X1 U44 ( .A(h1g1f1e1[1]), .ZN(n263) );
  NAND2_X1 U45 ( .A1(d1c1b1a1[1]), .A2(n263), .ZN(n224) );
  XNOR2_X1 U46 ( .A(n225), .B(n224), .ZN(n226) );
  XNOR2_X1 U47 ( .A(n227), .B(n226), .ZN(N15) );
  NAND2_X1 U48 ( .A1(h1g1f1e1[0]), .A2(d0c0b0a0[2]), .ZN(n234) );
  INV_X1 U49 ( .A(d0c0b0a0[0]), .ZN(n308) );
  XNOR2_X1 U50 ( .A(n308), .B(d0c0b0a0[2]), .ZN(n228) );
  NAND2_X1 U51 ( .A1(n228), .A2(h1g1f1e1[2]), .ZN(n232) );
  NAND2_X1 U52 ( .A1(d0c0b0a0[1]), .A2(h1g1f1e1[3]), .ZN(n230) );
  NAND2_X1 U53 ( .A1(d0c0b0a0[3]), .A2(h1g1f1e1[1]), .ZN(n229) );
  XOR2_X1 U54 ( .A(n230), .B(n229), .Z(n248) );
  NOR2_X1 U55 ( .A1(h1g1f1e1[0]), .A2(n308), .ZN(n231) );
  XOR2_X1 U56 ( .A(n248), .B(n231), .Z(n355) );
  XNOR2_X1 U57 ( .A(n232), .B(n355), .ZN(n233) );
  XNOR2_X1 U58 ( .A(n234), .B(n233), .ZN(n246) );
  XOR2_X1 U59 ( .A(guards[0]), .B(n246), .Z(n238) );
  NAND2_X1 U60 ( .A1(h1g1f1e1[0]), .A2(d0c0b0a0[1]), .ZN(n236) );
  NAND2_X1 U61 ( .A1(d0c0b0a0[0]), .A2(h1g1f1e1[1]), .ZN(n235) );
  XOR2_X1 U62 ( .A(n236), .B(n235), .Z(n247) );
  XNOR2_X1 U63 ( .A(h1g1f1e1[0]), .B(n247), .ZN(n237) );
  XNOR2_X1 U64 ( .A(n238), .B(n237), .ZN(n240) );
  NAND2_X1 U65 ( .A1(h1g1f1e1[3]), .A2(d0c0b0a0[3]), .ZN(n239) );
  XNOR2_X1 U66 ( .A(n240), .B(n239), .ZN(N1) );
  NAND2_X1 U67 ( .A1(n263), .A2(d0c0b0a0[1]), .ZN(n244) );
  INV_X1 U68 ( .A(d0c0b0a0[2]), .ZN(n252) );
  NOR2_X1 U69 ( .A1(n255), .A2(n252), .ZN(n354) );
  XNOR2_X1 U70 ( .A(n354), .B(guards[2]), .ZN(n242) );
  NOR2_X1 U71 ( .A1(h1g1f1e1[2]), .A2(d0c0b0a0[3]), .ZN(n241) );
  XNOR2_X1 U72 ( .A(n242), .B(n241), .ZN(n243) );
  XNOR2_X1 U73 ( .A(n244), .B(n243), .ZN(n245) );
  XNOR2_X1 U74 ( .A(n246), .B(n245), .ZN(N9) );
  XOR2_X1 U75 ( .A(n248), .B(n247), .Z(n250) );
  XNOR2_X1 U76 ( .A(h1g1f1e1[3]), .B(d0c0b0a0[0]), .ZN(n249) );
  XNOR2_X1 U77 ( .A(n250), .B(n249), .ZN(n251) );
  XNOR2_X1 U78 ( .A(guards[3]), .B(n251), .ZN(n254) );
  NOR2_X1 U79 ( .A1(n252), .A2(h1g1f1e1[2]), .ZN(n253) );
  XNOR2_X1 U80 ( .A(n254), .B(n253), .ZN(n268) );
  XNOR2_X1 U81 ( .A(n255), .B(h1g1f1e1[0]), .ZN(n256) );
  NAND2_X1 U82 ( .A1(n256), .A2(d0c0b0a0[3]), .ZN(n267) );
  NAND2_X1 U83 ( .A1(h1g1f1e1[3]), .A2(d0c0b0a0[0]), .ZN(n261) );
  NAND2_X1 U84 ( .A1(h1g1f1e1[2]), .A2(d0c0b0a0[1]), .ZN(n257) );
  XOR2_X1 U85 ( .A(n261), .B(n257), .Z(n258) );
  XNOR2_X1 U86 ( .A(d0c0b0a0[2]), .B(n258), .ZN(n259) );
  NAND2_X1 U87 ( .A1(n259), .A2(h1g1f1e1[1]), .ZN(n265) );
  INV_X1 U88 ( .A(d0c0b0a0[1]), .ZN(n340) );
  NOR2_X1 U89 ( .A1(h1g1f1e1[2]), .A2(n340), .ZN(n260) );
  XOR2_X1 U90 ( .A(n261), .B(n260), .Z(n262) );
  NAND2_X1 U91 ( .A1(n263), .A2(n262), .ZN(n264) );
  NAND2_X1 U92 ( .A1(n265), .A2(n264), .ZN(n266) );
  XNOR2_X1 U93 ( .A(n267), .B(n266), .ZN(n361) );
  XNOR2_X1 U94 ( .A(n268), .B(n361), .ZN(N13) );
  NAND2_X1 U95 ( .A1(d1c1b1a1[3]), .A2(h0g0f0e0[1]), .ZN(n270) );
  NAND2_X1 U96 ( .A1(h0g0f0e0[3]), .A2(d1c1b1a1[1]), .ZN(n269) );
  XOR2_X1 U97 ( .A(n270), .B(n269), .Z(n373) );
  NAND2_X1 U98 ( .A1(h0g0f0e0[0]), .A2(d1c1b1a1[0]), .ZN(n271) );
  XNOR2_X1 U99 ( .A(n373), .B(n271), .ZN(n291) );
  NAND2_X1 U100 ( .A1(d1c1b1a1[0]), .A2(h0g0f0e0[1]), .ZN(n273) );
  NAND2_X1 U101 ( .A1(h0g0f0e0[0]), .A2(d1c1b1a1[1]), .ZN(n272) );
  XOR2_X1 U102 ( .A(n273), .B(n272), .Z(n375) );
  XNOR2_X1 U103 ( .A(n291), .B(n375), .ZN(n280) );
  NAND2_X1 U104 ( .A1(d1c1b1a1[2]), .A2(h0g0f0e0[0]), .ZN(n275) );
  INV_X1 U105 ( .A(d1c1b1a1[0]), .ZN(n347) );
  XNOR2_X1 U106 ( .A(d1c1b1a1[2]), .B(n347), .ZN(n348) );
  NAND2_X1 U107 ( .A1(n348), .A2(h0g0f0e0[2]), .ZN(n274) );
  XNOR2_X1 U108 ( .A(n275), .B(n274), .ZN(n276) );
  XNOR2_X1 U109 ( .A(d1c1b1a1[3]), .B(n276), .ZN(n298) );
  XNOR2_X1 U110 ( .A(guards[0]), .B(n298), .ZN(n278) );
  NAND2_X1 U111 ( .A1(h0g0f0e0[3]), .A2(d1c1b1a1[3]), .ZN(n282) );
  XNOR2_X1 U112 ( .A(n282), .B(h0g0f0e0[0]), .ZN(n277) );
  XNOR2_X1 U113 ( .A(n278), .B(n277), .ZN(n279) );
  XNOR2_X1 U114 ( .A(n280), .B(n279), .ZN(N2) );
  NAND2_X1 U115 ( .A1(d1c1b1a1[2]), .A2(h0g0f0e0[1]), .ZN(n290) );
  NAND2_X1 U116 ( .A1(n281), .A2(h0g0f0e0[0]), .ZN(n283) );
  NAND2_X1 U117 ( .A1(n283), .A2(n282), .ZN(n288) );
  XNOR2_X1 U118 ( .A(h0g0f0e0[2]), .B(h0g0f0e0[1]), .ZN(n284) );
  NAND2_X1 U119 ( .A1(n284), .A2(d1c1b1a1[1]), .ZN(n286) );
  NOR2_X1 U120 ( .A1(h0g0f0e0[3]), .A2(n347), .ZN(n285) );
  XNOR2_X1 U121 ( .A(n286), .B(n285), .ZN(n287) );
  XNOR2_X1 U122 ( .A(n288), .B(n287), .ZN(n289) );
  XNOR2_X1 U123 ( .A(n290), .B(n289), .ZN(n374) );
  XNOR2_X1 U124 ( .A(guards[1]), .B(n374), .ZN(n296) );
  XNOR2_X1 U125 ( .A(h0g0f0e0[1]), .B(n291), .ZN(n295) );
  NAND2_X1 U126 ( .A1(d1c1b1a1[2]), .A2(h0g0f0e0[3]), .ZN(n293) );
  NAND2_X1 U127 ( .A1(d1c1b1a1[3]), .A2(h0g0f0e0[2]), .ZN(n292) );
  XNOR2_X1 U128 ( .A(n293), .B(n292), .ZN(n294) );
  XNOR2_X1 U129 ( .A(n295), .B(n294), .ZN(n304) );
  XNOR2_X1 U130 ( .A(n296), .B(n304), .ZN(N6) );
  XNOR2_X1 U131 ( .A(h0g0f0e0[3]), .B(d1c1b1a1[0]), .ZN(n302) );
  INV_X1 U132 ( .A(h0g0f0e0[1]), .ZN(n297) );
  NAND2_X1 U133 ( .A1(d1c1b1a1[1]), .A2(n297), .ZN(n300) );
  XOR2_X1 U134 ( .A(guards[2]), .B(n298), .Z(n299) );
  XNOR2_X1 U135 ( .A(n300), .B(n299), .ZN(n301) );
  XNOR2_X1 U136 ( .A(n302), .B(n301), .ZN(n303) );
  XNOR2_X1 U137 ( .A(n304), .B(n303), .ZN(N10) );
  NAND2_X1 U138 ( .A1(h0g0f0e0[0]), .A2(d0c0b0a0[1]), .ZN(n306) );
  NAND2_X1 U139 ( .A1(h0g0f0e0[1]), .A2(d0c0b0a0[0]), .ZN(n305) );
  XOR2_X1 U140 ( .A(n306), .B(n305), .Z(n307) );
  NAND2_X1 U141 ( .A1(d0c0b0a0[3]), .A2(h0g0f0e0[3]), .ZN(n324) );
  XNOR2_X1 U142 ( .A(n307), .B(n324), .ZN(n344) );
  XNOR2_X1 U143 ( .A(guards[0]), .B(n344), .ZN(n316) );
  NAND2_X1 U144 ( .A1(h0g0f0e0[0]), .A2(d0c0b0a0[2]), .ZN(n315) );
  XNOR2_X1 U145 ( .A(h0g0f0e0[2]), .B(h0g0f0e0[0]), .ZN(n309) );
  NOR2_X1 U146 ( .A1(n309), .A2(n308), .ZN(n313) );
  NAND2_X1 U147 ( .A1(d0c0b0a0[3]), .A2(h0g0f0e0[1]), .ZN(n311) );
  NAND2_X1 U148 ( .A1(h0g0f0e0[3]), .A2(d0c0b0a0[1]), .ZN(n310) );
  XNOR2_X1 U149 ( .A(n311), .B(n310), .ZN(n330) );
  NAND2_X1 U150 ( .A1(d0c0b0a0[2]), .A2(h0g0f0e0[2]), .ZN(n312) );
  XNOR2_X1 U151 ( .A(n330), .B(n312), .ZN(n346) );
  XNOR2_X1 U152 ( .A(n313), .B(n346), .ZN(n314) );
  XNOR2_X1 U153 ( .A(n315), .B(n314), .ZN(n335) );
  XNOR2_X1 U154 ( .A(n316), .B(n335), .ZN(N0) );
  NAND2_X1 U155 ( .A1(h0g0f0e0[0]), .A2(d0c0b0a0[3]), .ZN(n318) );
  NAND2_X1 U156 ( .A1(h0g0f0e0[3]), .A2(d0c0b0a0[0]), .ZN(n317) );
  XOR2_X1 U157 ( .A(n318), .B(n317), .Z(n322) );
  NAND2_X1 U158 ( .A1(h0g0f0e0[1]), .A2(d0c0b0a0[2]), .ZN(n320) );
  NAND2_X1 U159 ( .A1(h0g0f0e0[2]), .A2(d0c0b0a0[1]), .ZN(n319) );
  XNOR2_X1 U160 ( .A(n320), .B(n319), .ZN(n321) );
  XNOR2_X1 U161 ( .A(n322), .B(n321), .ZN(n339) );
  NAND2_X1 U162 ( .A1(d0c0b0a0[0]), .A2(h0g0f0e0[0]), .ZN(n323) );
  XNOR2_X1 U163 ( .A(n324), .B(n323), .ZN(n333) );
  XOR2_X1 U164 ( .A(d0c0b0a0[3]), .B(guards[1]), .Z(n329) );
  NAND2_X1 U165 ( .A1(h0g0f0e0[2]), .A2(d0c0b0a0[3]), .ZN(n326) );
  NAND2_X1 U166 ( .A1(h0g0f0e0[3]), .A2(d0c0b0a0[2]), .ZN(n325) );
  XOR2_X1 U167 ( .A(n326), .B(n325), .Z(n328) );
  NAND2_X1 U168 ( .A1(d0c0b0a0[1]), .A2(h0g0f0e0[1]), .ZN(n327) );
  XNOR2_X1 U169 ( .A(n328), .B(n327), .ZN(n336) );
  XNOR2_X1 U170 ( .A(n329), .B(n336), .ZN(n331) );
  XNOR2_X1 U171 ( .A(n331), .B(n330), .ZN(n332) );
  XNOR2_X1 U172 ( .A(n333), .B(n332), .ZN(n334) );
  XNOR2_X1 U173 ( .A(n339), .B(n334), .ZN(N4) );
  XOR2_X1 U174 ( .A(n336), .B(n335), .Z(n338) );
  XNOR2_X1 U175 ( .A(d0c0b0a0[0]), .B(guards[2]), .ZN(n337) );
  XNOR2_X1 U176 ( .A(n338), .B(n337), .ZN(N8) );
  XNOR2_X1 U177 ( .A(guards[3]), .B(n339), .ZN(n342) );
  NOR2_X1 U178 ( .A1(n340), .A2(h0g0f0e0[1]), .ZN(n341) );
  XNOR2_X1 U179 ( .A(n342), .B(n341), .ZN(n343) );
  XOR2_X1 U180 ( .A(n344), .B(n343), .Z(n345) );
  XNOR2_X1 U181 ( .A(n346), .B(n345), .ZN(N12) );
  NOR2_X1 U182 ( .A1(h1g1f1e1[2]), .A2(n347), .ZN(n350) );
  NAND2_X1 U183 ( .A1(n348), .A2(h1g1f1e1[0]), .ZN(n349) );
  XNOR2_X1 U184 ( .A(n350), .B(n349), .ZN(n364) );
  XOR2_X1 U185 ( .A(n364), .B(n351), .Z(n353) );
  XNOR2_X1 U186 ( .A(d1c1b1a1[3]), .B(guards[0]), .ZN(n352) );
  XNOR2_X1 U187 ( .A(n353), .B(n352), .ZN(n177) );
  XNOR2_X1 U188 ( .A(h1g1f1e1[1]), .B(n354), .ZN(n360) );
  XNOR2_X1 U189 ( .A(n355), .B(guards[1]), .ZN(n358) );
  INV_X1 U190 ( .A(d0c0b0a0[3]), .ZN(n356) );
  NOR2_X1 U191 ( .A1(n356), .A2(h1g1f1e1[2]), .ZN(n357) );
  XNOR2_X1 U192 ( .A(n358), .B(n357), .ZN(n359) );
  XNOR2_X1 U193 ( .A(n360), .B(n359), .ZN(n362) );
  XNOR2_X1 U194 ( .A(n362), .B(n361), .ZN(n176) );
  XOR2_X1 U195 ( .A(n364), .B(n363), .Z(n366) );
  XNOR2_X1 U196 ( .A(h1g1f1e1[1]), .B(guards[2]), .ZN(n365) );
  XNOR2_X1 U197 ( .A(n366), .B(n365), .ZN(n367) );
  XNOR2_X1 U198 ( .A(n368), .B(n367), .ZN(n372) );
  XNOR2_X1 U199 ( .A(n370), .B(n369), .ZN(n371) );
  XNOR2_X1 U200 ( .A(n372), .B(n371), .ZN(n175) );
  XNOR2_X1 U201 ( .A(n374), .B(n373), .ZN(n379) );
  XNOR2_X1 U202 ( .A(guards[3]), .B(n375), .ZN(n377) );
  NOR2_X1 U203 ( .A1(h0g0f0e0[2]), .A2(d1c1b1a1[2]), .ZN(n376) );
  XNOR2_X1 U204 ( .A(n377), .B(n376), .ZN(n378) );
  XNOR2_X1 U205 ( .A(n379), .B(n378), .ZN(n174) );
endmodule


module GF4MulXorSqSc_Unit ( clk, d0c0b0a0, d1c1b1a1, guards, random, x, y, z, 
        t );
  input [3:0] d0c0b0a0;
  input [3:0] d1c1b1a1;
  input [3:0] guards;
  input [3:0] random;
  output [1:0] x;
  output [1:0] y;
  output [1:0] z;
  output [1:0] t;
  input clk;
  wire   N0, N1, N3, N4, N5, N7, N8, N9, N11, N12, N13, N15, n48, n49, n50,
         n51, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120;
  wire   [3:0] x_r;
  wire   [3:0] y_r;
  wire   [3:0] z_r;
  wire   [3:0] t_r;

  DFF_X1 \x_r_reg[3]  ( .D(N3), .CK(clk), .Q(x_r[3]) );
  DFF_X1 \x_r_reg[2]  ( .D(n51), .CK(clk), .Q(x_r[2]) );
  DFF_X1 \x_r_reg[1]  ( .D(N1), .CK(clk), .Q(x_r[1]) );
  DFF_X1 \x_r_reg[0]  ( .D(N0), .CK(clk), .Q(x_r[0]) );
  DFF_X1 \y_r_reg[3]  ( .D(N7), .CK(clk), .Q(y_r[3]) );
  DFF_X1 \y_r_reg[2]  ( .D(n48), .CK(clk), .Q(y_r[2]) );
  DFF_X1 \y_r_reg[1]  ( .D(N5), .CK(clk), .Q(y_r[1]) );
  DFF_X1 \y_r_reg[0]  ( .D(N4), .CK(clk), .Q(y_r[0]) );
  DFF_X1 \z_r_reg[3]  ( .D(N11), .CK(clk), .Q(z_r[3]) );
  DFF_X1 \z_r_reg[2]  ( .D(n50), .CK(clk), .Q(z_r[2]) );
  DFF_X1 \z_r_reg[1]  ( .D(N9), .CK(clk), .Q(z_r[1]) );
  DFF_X1 \z_r_reg[0]  ( .D(N8), .CK(clk), .Q(z_r[0]) );
  DFF_X1 \t_r_reg[3]  ( .D(N15), .CK(clk), .Q(t_r[3]) );
  DFF_X1 \t_r_reg[2]  ( .D(n49), .CK(clk), .Q(t_r[2]) );
  DFF_X1 \t_r_reg[1]  ( .D(N13), .CK(clk), .Q(t_r[1]) );
  DFF_X1 \t_r_reg[0]  ( .D(N12), .CK(clk), .Q(t_r[0]) );
  XOR2_X1 U3 ( .A(z_r[2]), .B(z_r[3]), .Z(z[1]) );
  XOR2_X1 U4 ( .A(z_r[0]), .B(z_r[1]), .Z(z[0]) );
  XOR2_X1 U5 ( .A(y_r[2]), .B(y_r[3]), .Z(y[1]) );
  XOR2_X1 U6 ( .A(y_r[0]), .B(y_r[1]), .Z(y[0]) );
  XOR2_X1 U7 ( .A(x_r[2]), .B(x_r[3]), .Z(x[1]) );
  XOR2_X1 U8 ( .A(x_r[0]), .B(x_r[1]), .Z(x[0]) );
  XOR2_X1 U9 ( .A(t_r[2]), .B(t_r[3]), .Z(t[1]) );
  XOR2_X1 U10 ( .A(t_r[0]), .B(t_r[1]), .Z(t[0]) );
  NAND2_X1 U11 ( .A1(d1c1b1a1[2]), .A2(d0c0b0a0[1]), .ZN(n66) );
  NAND2_X1 U12 ( .A1(d0c0b0a0[0]), .A2(d1c1b1a1[3]), .ZN(n65) );
  XNOR2_X1 U13 ( .A(n66), .B(n65), .ZN(n68) );
  NAND2_X1 U14 ( .A1(d1c1b1a1[2]), .A2(d0c0b0a0[0]), .ZN(n67) );
  XNOR2_X1 U15 ( .A(n68), .B(n67), .ZN(n70) );
  XNOR2_X1 U16 ( .A(guards[0]), .B(n70), .ZN(N1) );
  NAND2_X1 U17 ( .A1(d0c0b0a0[1]), .A2(d1c1b1a1[3]), .ZN(n69) );
  XNOR2_X1 U18 ( .A(n69), .B(n68), .ZN(n71) );
  XNOR2_X1 U19 ( .A(guards[1]), .B(n71), .ZN(N5) );
  XNOR2_X1 U20 ( .A(guards[2]), .B(n70), .ZN(N9) );
  XNOR2_X1 U21 ( .A(guards[3]), .B(n71), .ZN(N13) );
  INV_X1 U22 ( .A(d1c1b1a1[3]), .ZN(n80) );
  NOR2_X1 U23 ( .A1(d1c1b1a1[0]), .A2(n80), .ZN(n78) );
  NOR2_X1 U24 ( .A1(n78), .A2(d1c1b1a1[2]), .ZN(n77) );
  INV_X1 U25 ( .A(d1c1b1a1[0]), .ZN(n109) );
  NAND2_X1 U26 ( .A1(d1c1b1a1[3]), .A2(d1c1b1a1[2]), .ZN(n72) );
  NAND2_X1 U27 ( .A1(n109), .A2(n72), .ZN(n73) );
  NAND2_X1 U28 ( .A1(d1c1b1a1[1]), .A2(n73), .ZN(n75) );
  NOR2_X1 U29 ( .A1(d1c1b1a1[1]), .A2(d1c1b1a1[0]), .ZN(n106) );
  NAND2_X1 U30 ( .A1(n106), .A2(n80), .ZN(n74) );
  NAND2_X1 U31 ( .A1(n75), .A2(n74), .ZN(n76) );
  NOR2_X1 U32 ( .A1(n77), .A2(n76), .ZN(n83) );
  XOR2_X1 U33 ( .A(guards[0]), .B(n83), .Z(N3) );
  NOR2_X1 U34 ( .A1(d1c1b1a1[1]), .A2(d1c1b1a1[2]), .ZN(n79) );
  XNOR2_X1 U35 ( .A(n79), .B(n78), .ZN(n82) );
  NAND2_X1 U36 ( .A1(d1c1b1a1[1]), .A2(n80), .ZN(n81) );
  NAND2_X1 U37 ( .A1(n82), .A2(n81), .ZN(n84) );
  XNOR2_X1 U38 ( .A(guards[1]), .B(n84), .ZN(N7) );
  XOR2_X1 U39 ( .A(guards[2]), .B(n83), .Z(N11) );
  XNOR2_X1 U40 ( .A(guards[3]), .B(n84), .ZN(N15) );
  INV_X1 U41 ( .A(d0c0b0a0[1]), .ZN(n93) );
  NOR2_X1 U42 ( .A1(d0c0b0a0[2]), .A2(n93), .ZN(n91) );
  NOR2_X1 U43 ( .A1(n91), .A2(d0c0b0a0[0]), .ZN(n90) );
  INV_X1 U44 ( .A(d0c0b0a0[2]), .ZN(n113) );
  NAND2_X1 U45 ( .A1(d0c0b0a0[1]), .A2(d0c0b0a0[0]), .ZN(n85) );
  NAND2_X1 U46 ( .A1(n113), .A2(n85), .ZN(n86) );
  NAND2_X1 U47 ( .A1(n86), .A2(d0c0b0a0[3]), .ZN(n88) );
  NOR2_X1 U48 ( .A1(d0c0b0a0[3]), .A2(d0c0b0a0[2]), .ZN(n99) );
  NAND2_X1 U49 ( .A1(n99), .A2(n93), .ZN(n87) );
  NAND2_X1 U50 ( .A1(n88), .A2(n87), .ZN(n89) );
  NOR2_X1 U51 ( .A1(n90), .A2(n89), .ZN(n96) );
  XNOR2_X1 U52 ( .A(guards[0]), .B(random[0]), .ZN(n103) );
  XNOR2_X1 U53 ( .A(n96), .B(n103), .ZN(N0) );
  XOR2_X1 U54 ( .A(guards[1]), .B(random[1]), .Z(n120) );
  NOR2_X1 U55 ( .A1(d0c0b0a0[3]), .A2(d0c0b0a0[0]), .ZN(n92) );
  XNOR2_X1 U56 ( .A(n92), .B(n91), .ZN(n95) );
  NAND2_X1 U57 ( .A1(d0c0b0a0[3]), .A2(n93), .ZN(n94) );
  NAND2_X1 U58 ( .A1(n95), .A2(n94), .ZN(n97) );
  XNOR2_X1 U59 ( .A(n120), .B(n97), .ZN(N4) );
  XNOR2_X1 U60 ( .A(guards[2]), .B(random[2]), .ZN(n104) );
  XNOR2_X1 U61 ( .A(n96), .B(n104), .ZN(N8) );
  XOR2_X1 U62 ( .A(guards[3]), .B(random[3]), .Z(n118) );
  XNOR2_X1 U63 ( .A(n118), .B(n97), .ZN(N12) );
  INV_X1 U64 ( .A(d0c0b0a0[3]), .ZN(n115) );
  NOR2_X1 U65 ( .A1(d0c0b0a0[2]), .A2(n106), .ZN(n98) );
  NOR2_X1 U66 ( .A1(n115), .A2(n98), .ZN(n102) );
  NOR2_X1 U67 ( .A1(d1c1b1a1[1]), .A2(d0c0b0a0[2]), .ZN(n110) );
  NOR2_X1 U68 ( .A1(d1c1b1a1[0]), .A2(n99), .ZN(n100) );
  NOR2_X1 U69 ( .A1(n110), .A2(n100), .ZN(n101) );
  NOR2_X1 U70 ( .A1(n102), .A2(n101), .ZN(n105) );
  XOR2_X1 U71 ( .A(n105), .B(n103), .Z(n51) );
  XOR2_X1 U72 ( .A(n105), .B(n104), .Z(n50) );
  INV_X1 U73 ( .A(n106), .ZN(n108) );
  NOR2_X1 U74 ( .A1(d0c0b0a0[3]), .A2(n113), .ZN(n107) );
  NOR2_X1 U75 ( .A1(n108), .A2(n107), .ZN(n112) );
  NOR2_X1 U76 ( .A1(n110), .A2(n109), .ZN(n111) );
  NOR2_X1 U77 ( .A1(n112), .A2(n111), .ZN(n117) );
  NOR2_X1 U78 ( .A1(n113), .A2(d1c1b1a1[1]), .ZN(n114) );
  NOR2_X1 U79 ( .A1(n115), .A2(n114), .ZN(n116) );
  NOR2_X1 U80 ( .A1(n117), .A2(n116), .ZN(n119) );
  XNOR2_X1 U81 ( .A(n118), .B(n119), .ZN(n49) );
  XNOR2_X1 U82 ( .A(n120), .B(n119), .ZN(n48) );
endmodule


module GF4Mul_Unit ( clk, d0c0b0a0, d1c1b1a1, h0g0f0e0, h1g1f1e1, guards, x, y, 
        z, t );
  input [3:0] d0c0b0a0;
  input [3:0] d1c1b1a1;
  input [3:0] h0g0f0e0;
  input [3:0] h1g1f1e1;
  input [3:0] guards;
  output [1:0] x;
  output [1:0] y;
  output [1:0] z;
  output [1:0] t;
  input clk;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         n71, n72, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136;
  wire   [3:0] x_r;
  wire   [3:0] y_r;
  wire   [3:0] z_r;
  wire   [3:0] t_r;

  DFF_X1 \x_r_reg[3]  ( .D(N3), .CK(clk), .Q(x_r[3]) );
  DFF_X1 \x_r_reg[2]  ( .D(N2), .CK(clk), .Q(x_r[2]) );
  DFF_X1 \x_r_reg[1]  ( .D(N1), .CK(clk), .Q(x_r[1]) );
  DFF_X1 \x_r_reg[0]  ( .D(N0), .CK(clk), .Q(x_r[0]) );
  DFF_X1 \y_r_reg[3]  ( .D(N7), .CK(clk), .Q(y_r[3]) );
  DFF_X1 \y_r_reg[2]  ( .D(N6), .CK(clk), .Q(y_r[2]) );
  DFF_X1 \y_r_reg[1]  ( .D(N5), .CK(clk), .Q(y_r[1]) );
  DFF_X1 \y_r_reg[0]  ( .D(N4), .CK(clk), .Q(y_r[0]) );
  DFF_X1 \z_r_reg[3]  ( .D(N11), .CK(clk), .Q(z_r[3]) );
  DFF_X1 \z_r_reg[2]  ( .D(N10), .CK(clk), .Q(z_r[2]) );
  DFF_X1 \z_r_reg[1]  ( .D(N9), .CK(clk), .Q(z_r[1]) );
  DFF_X1 \z_r_reg[0]  ( .D(N8), .CK(clk), .Q(z_r[0]) );
  DFF_X1 \t_r_reg[3]  ( .D(N15), .CK(clk), .Q(t_r[3]) );
  DFF_X1 \t_r_reg[2]  ( .D(N14), .CK(clk), .Q(t_r[2]) );
  DFF_X1 \t_r_reg[1]  ( .D(N13), .CK(clk), .Q(t_r[1]) );
  DFF_X1 \t_r_reg[0]  ( .D(N12), .CK(clk), .Q(t_r[0]) );
  XNOR2_X1 U3 ( .A(z_r[0]), .B(z_r[1]), .ZN(n71) );
  XNOR2_X1 U4 ( .A(y_r[2]), .B(y_r[3]), .ZN(n72) );
  INV_X1 U5 ( .A(n72), .ZN(y[1]) );
  INV_X1 U6 ( .A(n71), .ZN(z[0]) );
  XOR2_X2 U7 ( .A(z_r[2]), .B(z_r[3]), .Z(z[1]) );
  XOR2_X2 U8 ( .A(x_r[0]), .B(x_r[1]), .Z(x[0]) );
  XOR2_X2 U9 ( .A(x_r[2]), .B(x_r[3]), .Z(x[1]) );
  XOR2_X2 U10 ( .A(y_r[0]), .B(y_r[1]), .Z(y[0]) );
  XOR2_X2 U11 ( .A(t_r[0]), .B(t_r[1]), .Z(t[0]) );
  XOR2_X2 U12 ( .A(t_r[2]), .B(t_r[3]), .Z(t[1]) );
  NAND2_X1 U13 ( .A1(h1g1f1e1[1]), .A2(d0c0b0a0[0]), .ZN(n76) );
  NAND2_X1 U14 ( .A1(h1g1f1e1[0]), .A2(d0c0b0a0[1]), .ZN(n75) );
  XOR2_X1 U15 ( .A(n76), .B(n75), .Z(n80) );
  XOR2_X1 U16 ( .A(guards[2]), .B(n80), .Z(n79) );
  INV_X1 U17 ( .A(d0c0b0a0[1]), .ZN(n77) );
  NAND2_X1 U18 ( .A1(h1g1f1e1[1]), .A2(n77), .ZN(n78) );
  XNOR2_X1 U19 ( .A(n79), .B(n78), .ZN(N9) );
  XOR2_X1 U20 ( .A(n80), .B(guards[3]), .Z(n83) );
  INV_X1 U21 ( .A(d0c0b0a0[0]), .ZN(n81) );
  NAND2_X1 U22 ( .A1(h1g1f1e1[0]), .A2(n81), .ZN(n82) );
  XNOR2_X1 U23 ( .A(n83), .B(n82), .ZN(N13) );
  INV_X1 U24 ( .A(h1g1f1e1[3]), .ZN(n97) );
  NOR2_X1 U25 ( .A1(d0c0b0a0[3]), .A2(n97), .ZN(n84) );
  XNOR2_X1 U26 ( .A(guards[0]), .B(n84), .ZN(n87) );
  NAND2_X1 U27 ( .A1(d0c0b0a0[2]), .A2(h1g1f1e1[3]), .ZN(n86) );
  NAND2_X1 U28 ( .A1(h1g1f1e1[2]), .A2(d0c0b0a0[3]), .ZN(n85) );
  XOR2_X1 U29 ( .A(n86), .B(n85), .Z(n114) );
  XNOR2_X1 U30 ( .A(n87), .B(n114), .ZN(N1) );
  NAND2_X1 U31 ( .A1(d1c1b1a1[0]), .A2(h1g1f1e1[1]), .ZN(n89) );
  NAND2_X1 U32 ( .A1(d1c1b1a1[1]), .A2(h1g1f1e1[0]), .ZN(n88) );
  XOR2_X1 U33 ( .A(n89), .B(n88), .Z(n93) );
  XOR2_X1 U34 ( .A(guards[2]), .B(n93), .Z(n92) );
  INV_X1 U35 ( .A(d1c1b1a1[1]), .ZN(n90) );
  NAND2_X1 U36 ( .A1(h1g1f1e1[1]), .A2(n90), .ZN(n91) );
  XNOR2_X1 U37 ( .A(n92), .B(n91), .ZN(N11) );
  XOR2_X1 U38 ( .A(guards[3]), .B(n93), .Z(n96) );
  INV_X1 U39 ( .A(d1c1b1a1[0]), .ZN(n94) );
  NAND2_X1 U40 ( .A1(h1g1f1e1[0]), .A2(n94), .ZN(n95) );
  XNOR2_X1 U41 ( .A(n96), .B(n95), .ZN(N15) );
  NOR2_X1 U42 ( .A1(d1c1b1a1[3]), .A2(n97), .ZN(n98) );
  XNOR2_X1 U43 ( .A(guards[0]), .B(n98), .ZN(n101) );
  NAND2_X1 U44 ( .A1(d1c1b1a1[3]), .A2(h1g1f1e1[2]), .ZN(n100) );
  NAND2_X1 U45 ( .A1(d1c1b1a1[2]), .A2(h1g1f1e1[3]), .ZN(n99) );
  XOR2_X1 U46 ( .A(n100), .B(n99), .Z(n110) );
  XNOR2_X1 U47 ( .A(n101), .B(n110), .ZN(N3) );
  NAND2_X1 U48 ( .A1(h0g0f0e0[3]), .A2(d1c1b1a1[2]), .ZN(n103) );
  NAND2_X1 U49 ( .A1(h0g0f0e0[2]), .A2(d1c1b1a1[3]), .ZN(n102) );
  XOR2_X1 U50 ( .A(n103), .B(n102), .Z(n106) );
  XOR2_X1 U51 ( .A(guards[0]), .B(n106), .Z(n105) );
  NAND2_X1 U52 ( .A1(h0g0f0e0[3]), .A2(d1c1b1a1[3]), .ZN(n104) );
  XNOR2_X1 U53 ( .A(n105), .B(n104), .ZN(N2) );
  XOR2_X1 U54 ( .A(guards[1]), .B(n106), .Z(n108) );
  NAND2_X1 U55 ( .A1(h0g0f0e0[2]), .A2(d1c1b1a1[2]), .ZN(n107) );
  XNOR2_X1 U56 ( .A(n108), .B(n107), .ZN(N6) );
  INV_X1 U57 ( .A(h1g1f1e1[2]), .ZN(n112) );
  NOR2_X1 U58 ( .A1(d1c1b1a1[2]), .A2(n112), .ZN(n109) );
  XNOR2_X1 U59 ( .A(n109), .B(guards[1]), .ZN(n111) );
  XNOR2_X1 U60 ( .A(n111), .B(n110), .ZN(N7) );
  NOR2_X1 U61 ( .A1(d0c0b0a0[2]), .A2(n112), .ZN(n113) );
  XNOR2_X1 U62 ( .A(n113), .B(guards[1]), .ZN(n115) );
  XNOR2_X1 U63 ( .A(n115), .B(n114), .ZN(N5) );
  NAND2_X1 U64 ( .A1(h0g0f0e0[1]), .A2(d1c1b1a1[0]), .ZN(n117) );
  NAND2_X1 U65 ( .A1(h0g0f0e0[0]), .A2(d1c1b1a1[1]), .ZN(n116) );
  XOR2_X1 U66 ( .A(n117), .B(n116), .Z(n120) );
  XOR2_X1 U67 ( .A(guards[2]), .B(n120), .Z(n119) );
  NAND2_X1 U68 ( .A1(h0g0f0e0[1]), .A2(d1c1b1a1[1]), .ZN(n118) );
  XNOR2_X1 U69 ( .A(n119), .B(n118), .ZN(N10) );
  XOR2_X1 U70 ( .A(guards[3]), .B(n120), .Z(n122) );
  NAND2_X1 U71 ( .A1(h0g0f0e0[0]), .A2(d1c1b1a1[0]), .ZN(n121) );
  XNOR2_X1 U72 ( .A(n122), .B(n121), .ZN(N14) );
  NAND2_X1 U73 ( .A1(h0g0f0e0[3]), .A2(d0c0b0a0[2]), .ZN(n124) );
  NAND2_X1 U74 ( .A1(h0g0f0e0[2]), .A2(d0c0b0a0[3]), .ZN(n123) );
  XOR2_X1 U75 ( .A(n124), .B(n123), .Z(n127) );
  XOR2_X1 U76 ( .A(guards[0]), .B(n127), .Z(n126) );
  NAND2_X1 U77 ( .A1(h0g0f0e0[3]), .A2(d0c0b0a0[3]), .ZN(n125) );
  XNOR2_X1 U78 ( .A(n126), .B(n125), .ZN(N0) );
  XOR2_X1 U79 ( .A(guards[1]), .B(n127), .Z(n129) );
  NAND2_X1 U80 ( .A1(h0g0f0e0[2]), .A2(d0c0b0a0[2]), .ZN(n128) );
  XNOR2_X1 U81 ( .A(n129), .B(n128), .ZN(N4) );
  NAND2_X1 U82 ( .A1(h0g0f0e0[1]), .A2(d0c0b0a0[0]), .ZN(n131) );
  NAND2_X1 U83 ( .A1(h0g0f0e0[0]), .A2(d0c0b0a0[1]), .ZN(n130) );
  XOR2_X1 U84 ( .A(n131), .B(n130), .Z(n134) );
  XOR2_X1 U85 ( .A(guards[2]), .B(n134), .Z(n133) );
  NAND2_X1 U86 ( .A1(h0g0f0e0[1]), .A2(d0c0b0a0[1]), .ZN(n132) );
  XNOR2_X1 U87 ( .A(n133), .B(n132), .ZN(N8) );
  XOR2_X1 U88 ( .A(guards[3]), .B(n134), .Z(n136) );
  NAND2_X1 U89 ( .A1(h0g0f0e0[0]), .A2(d0c0b0a0[0]), .ZN(n135) );
  XNOR2_X1 U90 ( .A(n136), .B(n135), .ZN(N12) );
endmodule


module GF16Mul_Unit ( clk, d0c0b0a0, d1c1b1a1, h0g0f0e0, h1g1f1e1, q0p0n0m0, 
        q1p1n1m1, x, y, z, t, r, s, u, v );
  input [3:0] d0c0b0a0;
  input [3:0] d1c1b1a1;
  input [3:0] h0g0f0e0;
  input [3:0] h1g1f1e1;
  input [3:0] q0p0n0m0;
  input [3:0] q1p1n1m1;
  output [1:0] x;
  output [1:0] y;
  output [1:0] z;
  output [1:0] t;
  output [1:0] r;
  output [1:0] s;
  output [1:0] u;
  output [1:0] v;
  input clk;
  wire   N2, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N16, N18, N19, N20,
         N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34,
         N35, n336, n337, n378, n379, n380, n381, n382, n383, n384, n385, n386,
         n387, n388, n389, n390, n391, n392, n393, n394, n395, n396, n397,
         n398, n399, n400, n401, n402, n403, n404, n405, n406, n407, n408,
         n409, n410, n411, n412, n413, n414, n415, n416, n417, n418, n419,
         n420, n421, n422, n423, n424, n425, n426, n427, n428, n429, n430,
         n431, n432, n433, n434, n435, n436, n437, n438, n439, n440, n441,
         n442, n443, n444, n445, n446, n447, n448, n449, n450, n451, n452,
         n453, n454, n455, n456, n457, n458, n459, n460, n461, n462, n463,
         n464, n465, n466, n467, n468, n469, n470, n471, n472, n473, n474,
         n475, n476, n477, n478, n479, n480, n481, n482, n483, n484, n485,
         n486, n487, n488, n489, n490, n491, n492, n493, n494, n495, n496,
         n497, n498, n499, n500, n501, n502, n503, n504, n505, n506, n507,
         n508, n509, n510, n511, n512, n513, n514, n515, n516, n517, n518,
         n519, n520, n521, n522, n523, n524, n525, n526, n527, n528, n529,
         n530, n531, n532, n533, n534, n535, n536, n537, n538, n539, n540,
         n541, n542, n543, n544, n545, n546, n547, n548, n549, n550, n551,
         n552, n553, n554, n555, n556, n557, n558, n559, n560, n561, n562,
         n563, n564, n565, n566, n567, n568, n569, n570, n571, n572, n573,
         n574, n575, n576, n577, n578, n579, n580, n581, n582, n583, n584,
         n585, n586, n587, n588, n589, n590, n591, n592, n593, n594, n595,
         n596, n597, n598, n599, n600, n601, n602, n603, n604, n605, n606,
         n607, n608, n609, n610, n611, n612, n613, n614, n615, n616, n617,
         n618, n619, n620, n621, n622, n623, n624, n625, n626, n627, n628,
         n629, n630, n631, n632, n633, n634, n635, n636, n637, n638, n639,
         n640, n641, n642, n643, n644, n645, n646, n647, n648, n649, n650,
         n651, n652, n653, n654, n655, n656, n657, n658, n659, n660, n661,
         n662, n663, n664, n665, n666, n667, n668, n669, n670, n671, n672,
         n673, n674, n675, n676, n677, n678, n679, n680, n681, n682, n683,
         n684, n685, n686, n687, n688, n689, n690, n691, n692, n693, n694,
         n695, n696, n697, n698, n699, n700, n701, n702, n703, n704, n705,
         n706, n707, n708, n709, n710, n711, n712, n713, n714, n715, n716,
         n717, n718, n719, n720;
  wire   [3:0] x_r;
  wire   [3:0] y_r;
  wire   [3:0] z_r;
  wire   [3:0] t_r;
  wire   [3:0] r_r;
  wire   [3:0] s_r;
  wire   [3:0] u_r;
  wire   [3:0] v_r;

  DFF_X1 \x_r_reg[3]  ( .D(N5), .CK(clk), .Q(x_r[3]) );
  DFF_X1 \x_r_reg[2]  ( .D(N4), .CK(clk), .Q(x_r[2]) );
  DFF_X1 \x_r_reg[1]  ( .D(n337), .CK(clk), .Q(x_r[1]) );
  DFF_X1 \x_r_reg[0]  ( .D(N2), .CK(clk), .Q(x_r[0]) );
  DFF_X1 \y_r_reg[3]  ( .D(N9), .CK(clk), .Q(y_r[3]) );
  DFF_X1 \y_r_reg[2]  ( .D(N8), .CK(clk), .Q(y_r[2]) );
  DFF_X1 \y_r_reg[1]  ( .D(N7), .CK(clk), .Q(y_r[1]) );
  DFF_X1 \y_r_reg[0]  ( .D(N6), .CK(clk), .Q(y_r[0]) );
  DFF_X1 \z_r_reg[3]  ( .D(N13), .CK(clk), .Q(z_r[3]) );
  DFF_X1 \z_r_reg[2]  ( .D(N12), .CK(clk), .Q(z_r[2]) );
  DFF_X1 \z_r_reg[1]  ( .D(N11), .CK(clk), .Q(z_r[1]) );
  DFF_X1 \z_r_reg[0]  ( .D(N10), .CK(clk), .Q(z_r[0]) );
  DFF_X1 \t_r_reg[3]  ( .D(N19), .CK(clk), .Q(t_r[3]) );
  DFF_X1 \t_r_reg[2]  ( .D(N18), .CK(clk), .Q(t_r[2]) );
  DFF_X1 \t_r_reg[1]  ( .D(n336), .CK(clk), .Q(t_r[1]) );
  DFF_X1 \t_r_reg[0]  ( .D(N16), .CK(clk), .Q(t_r[0]) );
  DFF_X1 \r_r_reg[3]  ( .D(N23), .CK(clk), .Q(r_r[3]) );
  DFF_X1 \r_r_reg[2]  ( .D(N22), .CK(clk), .Q(r_r[2]) );
  DFF_X1 \r_r_reg[1]  ( .D(N21), .CK(clk), .Q(r_r[1]) );
  DFF_X1 \r_r_reg[0]  ( .D(N20), .CK(clk), .Q(r_r[0]) );
  DFF_X1 \s_r_reg[3]  ( .D(N27), .CK(clk), .Q(s_r[3]) );
  DFF_X1 \s_r_reg[2]  ( .D(N26), .CK(clk), .Q(s_r[2]) );
  DFF_X1 \s_r_reg[1]  ( .D(N25), .CK(clk), .Q(s_r[1]) );
  DFF_X1 \s_r_reg[0]  ( .D(N24), .CK(clk), .Q(s_r[0]) );
  DFF_X1 \u_r_reg[3]  ( .D(N31), .CK(clk), .Q(u_r[3]) );
  DFF_X1 \u_r_reg[2]  ( .D(N30), .CK(clk), .Q(u_r[2]) );
  DFF_X1 \u_r_reg[1]  ( .D(N29), .CK(clk), .Q(u_r[1]) );
  DFF_X1 \u_r_reg[0]  ( .D(N28), .CK(clk), .Q(u_r[0]) );
  DFF_X1 \v_r_reg[3]  ( .D(N35), .CK(clk), .Q(v_r[3]) );
  DFF_X1 \v_r_reg[2]  ( .D(N34), .CK(clk), .Q(v_r[2]) );
  DFF_X1 \v_r_reg[1]  ( .D(N33), .CK(clk), .Q(v_r[1]) );
  DFF_X1 \v_r_reg[0]  ( .D(N32), .CK(clk), .Q(v_r[0]) );
  XOR2_X1 U3 ( .A(z_r[2]), .B(z_r[3]), .Z(z[1]) );
  XOR2_X1 U4 ( .A(z_r[0]), .B(z_r[1]), .Z(z[0]) );
  XOR2_X1 U5 ( .A(y_r[2]), .B(y_r[3]), .Z(y[1]) );
  XOR2_X1 U6 ( .A(y_r[0]), .B(y_r[1]), .Z(y[0]) );
  XOR2_X1 U7 ( .A(x_r[2]), .B(x_r[3]), .Z(x[1]) );
  XOR2_X1 U8 ( .A(x_r[0]), .B(x_r[1]), .Z(x[0]) );
  XOR2_X1 U9 ( .A(v_r[2]), .B(v_r[3]), .Z(v[1]) );
  XOR2_X1 U10 ( .A(v_r[0]), .B(v_r[1]), .Z(v[0]) );
  XOR2_X1 U11 ( .A(u_r[2]), .B(u_r[3]), .Z(u[1]) );
  XOR2_X1 U12 ( .A(u_r[0]), .B(u_r[1]), .Z(u[0]) );
  XOR2_X1 U13 ( .A(t_r[2]), .B(t_r[3]), .Z(t[1]) );
  XOR2_X1 U14 ( .A(t_r[0]), .B(t_r[1]), .Z(t[0]) );
  XOR2_X1 U15 ( .A(s_r[2]), .B(s_r[3]), .Z(s[1]) );
  XOR2_X1 U16 ( .A(s_r[0]), .B(s_r[1]), .Z(s[0]) );
  XOR2_X1 U17 ( .A(r_r[2]), .B(r_r[3]), .Z(r[1]) );
  XOR2_X1 U18 ( .A(r_r[0]), .B(r_r[1]), .Z(r[0]) );
  NAND2_X1 U19 ( .A1(q1p1n1m1[3]), .A2(h0g0f0e0[2]), .ZN(n379) );
  NAND2_X1 U20 ( .A1(q1p1n1m1[2]), .A2(h0g0f0e0[3]), .ZN(n378) );
  XOR2_X1 U21 ( .A(n379), .B(n378), .Z(n392) );
  NAND2_X1 U22 ( .A1(q1p1n1m1[0]), .A2(h0g0f0e0[0]), .ZN(n382) );
  NAND2_X1 U23 ( .A1(q1p1n1m1[3]), .A2(h0g0f0e0[1]), .ZN(n381) );
  NAND2_X1 U24 ( .A1(q1p1n1m1[1]), .A2(h0g0f0e0[3]), .ZN(n380) );
  XOR2_X1 U25 ( .A(n381), .B(n380), .Z(n488) );
  XNOR2_X1 U26 ( .A(n382), .B(n488), .ZN(n397) );
  XOR2_X1 U27 ( .A(n392), .B(n397), .Z(n391) );
  INV_X1 U28 ( .A(q1p1n1m1[1]), .ZN(n590) );
  XNOR2_X1 U29 ( .A(n590), .B(d0c0b0a0[1]), .ZN(n548) );
  INV_X1 U30 ( .A(q1p1n1m1[0]), .ZN(n571) );
  XNOR2_X1 U31 ( .A(q1p1n1m1[3]), .B(n571), .ZN(n589) );
  NAND2_X1 U32 ( .A1(n589), .A2(h0g0f0e0[3]), .ZN(n389) );
  XOR2_X1 U33 ( .A(q1p1n1m1[2]), .B(q1p1n1m1[1]), .Z(n383) );
  NAND2_X1 U34 ( .A1(n383), .A2(h0g0f0e0[1]), .ZN(n387) );
  NAND2_X1 U35 ( .A1(q1p1n1m1[3]), .A2(h0g0f0e0[0]), .ZN(n385) );
  NAND2_X1 U36 ( .A1(q1p1n1m1[1]), .A2(h0g0f0e0[2]), .ZN(n384) );
  XOR2_X1 U37 ( .A(n385), .B(n384), .Z(n386) );
  XNOR2_X1 U38 ( .A(n387), .B(n386), .ZN(n388) );
  XNOR2_X1 U39 ( .A(n389), .B(n388), .ZN(n490) );
  XNOR2_X1 U40 ( .A(n548), .B(n490), .ZN(n390) );
  XNOR2_X1 U41 ( .A(n391), .B(n390), .ZN(N8) );
  INV_X1 U42 ( .A(d0c0b0a0[2]), .ZN(n672) );
  XOR2_X1 U43 ( .A(n571), .B(n672), .Z(n550) );
  XNOR2_X1 U44 ( .A(n392), .B(n550), .ZN(n398) );
  INV_X1 U45 ( .A(h0g0f0e0[0]), .ZN(n624) );
  XOR2_X1 U46 ( .A(n624), .B(h0g0f0e0[2]), .Z(n393) );
  INV_X1 U47 ( .A(q1p1n1m1[2]), .ZN(n557) );
  NOR2_X1 U48 ( .A1(n393), .A2(n557), .ZN(n395) );
  NAND2_X1 U49 ( .A1(h0g0f0e0[2]), .A2(q1p1n1m1[0]), .ZN(n394) );
  XNOR2_X1 U50 ( .A(n395), .B(n394), .ZN(n396) );
  XOR2_X1 U51 ( .A(n397), .B(n396), .Z(n510) );
  XNOR2_X1 U52 ( .A(n398), .B(n510), .ZN(n400) );
  NAND2_X1 U53 ( .A1(h0g0f0e0[1]), .A2(q1p1n1m1[1]), .ZN(n399) );
  XNOR2_X1 U54 ( .A(n400), .B(n399), .ZN(N12) );
  NAND2_X1 U55 ( .A1(h1g1f1e1[3]), .A2(q0p0n0m0[2]), .ZN(n402) );
  NAND2_X1 U56 ( .A1(h1g1f1e1[2]), .A2(q0p0n0m0[3]), .ZN(n401) );
  XOR2_X1 U57 ( .A(n402), .B(n401), .Z(n418) );
  XOR2_X1 U58 ( .A(d0c0b0a0[1]), .B(q0p0n0m0[1]), .Z(n437) );
  XNOR2_X1 U59 ( .A(n418), .B(n437), .ZN(n411) );
  NAND2_X1 U60 ( .A1(q0p0n0m0[3]), .A2(h1g1f1e1[3]), .ZN(n707) );
  INV_X1 U61 ( .A(q0p0n0m0[2]), .ZN(n659) );
  INV_X1 U62 ( .A(q0p0n0m0[1]), .ZN(n673) );
  XOR2_X1 U63 ( .A(n659), .B(n673), .Z(n403) );
  NAND2_X1 U64 ( .A1(n403), .A2(h1g1f1e1[1]), .ZN(n407) );
  NAND2_X1 U65 ( .A1(h1g1f1e1[3]), .A2(q0p0n0m0[0]), .ZN(n405) );
  NAND2_X1 U66 ( .A1(h1g1f1e1[2]), .A2(n673), .ZN(n404) );
  XOR2_X1 U67 ( .A(n405), .B(n404), .Z(n406) );
  XNOR2_X1 U68 ( .A(n407), .B(n406), .ZN(n409) );
  NAND2_X1 U69 ( .A1(h1g1f1e1[0]), .A2(q0p0n0m0[3]), .ZN(n408) );
  XNOR2_X1 U70 ( .A(n409), .B(n408), .ZN(n712) );
  XNOR2_X1 U71 ( .A(n707), .B(n712), .ZN(n410) );
  XNOR2_X1 U72 ( .A(n411), .B(n410), .ZN(n414) );
  NAND2_X1 U73 ( .A1(h1g1f1e1[3]), .A2(q0p0n0m0[1]), .ZN(n413) );
  NAND2_X1 U74 ( .A1(h1g1f1e1[1]), .A2(q0p0n0m0[3]), .ZN(n412) );
  XOR2_X1 U75 ( .A(n413), .B(n412), .Z(n714) );
  NAND2_X1 U76 ( .A1(q0p0n0m0[0]), .A2(h1g1f1e1[0]), .ZN(n421) );
  XOR2_X1 U77 ( .A(n714), .B(n421), .Z(n428) );
  XNOR2_X1 U78 ( .A(n414), .B(n428), .ZN(N7) );
  INV_X1 U79 ( .A(q0p0n0m0[0]), .ZN(n704) );
  XOR2_X1 U80 ( .A(n672), .B(n704), .Z(n448) );
  XOR2_X1 U81 ( .A(h1g1f1e1[3]), .B(n448), .Z(n416) );
  NAND2_X1 U82 ( .A1(h1g1f1e1[1]), .A2(q0p0n0m0[1]), .ZN(n415) );
  XNOR2_X1 U83 ( .A(n416), .B(n415), .ZN(n417) );
  XNOR2_X1 U84 ( .A(n418), .B(n417), .ZN(n429) );
  NAND2_X1 U85 ( .A1(h1g1f1e1[2]), .A2(q0p0n0m0[0]), .ZN(n420) );
  NAND2_X1 U86 ( .A1(h1g1f1e1[0]), .A2(q0p0n0m0[2]), .ZN(n419) );
  NAND2_X1 U87 ( .A1(n420), .A2(n419), .ZN(n423) );
  NAND2_X1 U88 ( .A1(n421), .A2(n423), .ZN(n422) );
  NAND2_X1 U89 ( .A1(q0p0n0m0[2]), .A2(h1g1f1e1[2]), .ZN(n424) );
  INV_X1 U90 ( .A(n424), .ZN(n715) );
  NAND2_X1 U91 ( .A1(n422), .A2(n715), .ZN(n426) );
  NAND2_X1 U92 ( .A1(n424), .A2(n423), .ZN(n425) );
  NAND2_X1 U93 ( .A1(n426), .A2(n425), .ZN(n427) );
  XNOR2_X1 U94 ( .A(n428), .B(n427), .ZN(n710) );
  XNOR2_X1 U95 ( .A(n429), .B(n710), .ZN(N11) );
  NAND2_X1 U96 ( .A1(h0g0f0e0[1]), .A2(q0p0n0m0[2]), .ZN(n431) );
  NAND2_X1 U97 ( .A1(h0g0f0e0[0]), .A2(q0p0n0m0[3]), .ZN(n430) );
  XOR2_X1 U98 ( .A(n431), .B(n430), .Z(n436) );
  NAND2_X1 U99 ( .A1(q0p0n0m0[1]), .A2(h0g0f0e0[2]), .ZN(n434) );
  XNOR2_X1 U100 ( .A(q0p0n0m0[3]), .B(n704), .ZN(n432) );
  NAND2_X1 U101 ( .A1(n432), .A2(h0g0f0e0[3]), .ZN(n433) );
  XOR2_X1 U102 ( .A(n434), .B(n433), .Z(n435) );
  XNOR2_X1 U103 ( .A(n436), .B(n435), .ZN(n484) );
  XNOR2_X1 U104 ( .A(n484), .B(n437), .ZN(n439) );
  NAND2_X1 U105 ( .A1(h0g0f0e0[0]), .A2(q0p0n0m0[0]), .ZN(n438) );
  XNOR2_X1 U106 ( .A(n439), .B(n438), .ZN(n442) );
  NAND2_X1 U107 ( .A1(h0g0f0e0[3]), .A2(q0p0n0m0[1]), .ZN(n441) );
  NAND2_X1 U108 ( .A1(h0g0f0e0[1]), .A2(q0p0n0m0[3]), .ZN(n440) );
  XNOR2_X1 U109 ( .A(n441), .B(n440), .ZN(n449) );
  XNOR2_X1 U110 ( .A(n442), .B(n449), .ZN(n446) );
  NAND2_X1 U111 ( .A1(q0p0n0m0[1]), .A2(h0g0f0e0[1]), .ZN(n479) );
  NAND2_X1 U112 ( .A1(q0p0n0m0[2]), .A2(h0g0f0e0[3]), .ZN(n444) );
  NAND2_X1 U113 ( .A1(h0g0f0e0[2]), .A2(q0p0n0m0[3]), .ZN(n443) );
  XNOR2_X1 U114 ( .A(n444), .B(n443), .ZN(n445) );
  XNOR2_X1 U115 ( .A(n479), .B(n445), .ZN(n447) );
  XNOR2_X1 U116 ( .A(n446), .B(n447), .ZN(N6) );
  XNOR2_X1 U117 ( .A(n448), .B(n447), .ZN(n454) );
  NAND2_X1 U118 ( .A1(h0g0f0e0[2]), .A2(q0p0n0m0[2]), .ZN(n450) );
  XNOR2_X1 U119 ( .A(n450), .B(n449), .ZN(n483) );
  NAND2_X1 U120 ( .A1(h0g0f0e0[2]), .A2(q0p0n0m0[0]), .ZN(n452) );
  XOR2_X1 U121 ( .A(n659), .B(q0p0n0m0[0]), .Z(n616) );
  NOR2_X1 U122 ( .A1(n624), .A2(n616), .ZN(n451) );
  XOR2_X1 U123 ( .A(n452), .B(n451), .Z(n453) );
  XNOR2_X1 U124 ( .A(n483), .B(n453), .ZN(n566) );
  XNOR2_X1 U125 ( .A(n454), .B(n566), .ZN(N10) );
  NAND2_X1 U126 ( .A1(d0c0b0a0[2]), .A2(q1p1n1m1[1]), .ZN(n456) );
  NAND2_X1 U127 ( .A1(d0c0b0a0[0]), .A2(q1p1n1m1[3]), .ZN(n455) );
  XOR2_X1 U128 ( .A(n456), .B(n455), .Z(n460) );
  NAND2_X1 U129 ( .A1(d0c0b0a0[1]), .A2(q1p1n1m1[2]), .ZN(n458) );
  NAND2_X1 U130 ( .A1(q1p1n1m1[0]), .A2(d0c0b0a0[3]), .ZN(n457) );
  XNOR2_X1 U131 ( .A(n458), .B(n457), .ZN(n459) );
  XNOR2_X1 U132 ( .A(n460), .B(n459), .ZN(n500) );
  NAND2_X1 U133 ( .A1(q1p1n1m1[0]), .A2(d0c0b0a0[0]), .ZN(n463) );
  NAND2_X1 U134 ( .A1(d0c0b0a0[1]), .A2(q1p1n1m1[3]), .ZN(n462) );
  NAND2_X1 U135 ( .A1(q1p1n1m1[1]), .A2(d0c0b0a0[3]), .ZN(n461) );
  XNOR2_X1 U136 ( .A(n462), .B(n461), .ZN(n505) );
  XOR2_X1 U137 ( .A(n463), .B(n505), .Z(n472) );
  XNOR2_X1 U138 ( .A(n500), .B(n472), .ZN(n469) );
  XOR2_X1 U139 ( .A(h0g0f0e0[1]), .B(q1p1n1m1[1]), .Z(n588) );
  NAND2_X1 U140 ( .A1(d0c0b0a0[3]), .A2(q1p1n1m1[3]), .ZN(n498) );
  XNOR2_X1 U141 ( .A(n588), .B(n498), .ZN(n467) );
  NAND2_X1 U142 ( .A1(q1p1n1m1[1]), .A2(d0c0b0a0[1]), .ZN(n502) );
  NAND2_X1 U143 ( .A1(d0c0b0a0[2]), .A2(q1p1n1m1[3]), .ZN(n465) );
  NAND2_X1 U144 ( .A1(q1p1n1m1[2]), .A2(d0c0b0a0[3]), .ZN(n464) );
  XNOR2_X1 U145 ( .A(n465), .B(n464), .ZN(n466) );
  XNOR2_X1 U146 ( .A(n502), .B(n466), .ZN(n470) );
  XNOR2_X1 U147 ( .A(n467), .B(n470), .ZN(n468) );
  XNOR2_X1 U148 ( .A(n469), .B(n468), .ZN(N26) );
  XOR2_X1 U149 ( .A(h0g0f0e0[2]), .B(q1p1n1m1[0]), .Z(n600) );
  XNOR2_X1 U150 ( .A(n600), .B(n470), .ZN(n476) );
  NOR2_X1 U151 ( .A1(n571), .A2(n672), .ZN(n471) );
  XOR2_X1 U152 ( .A(n472), .B(n471), .Z(n474) );
  NAND2_X1 U153 ( .A1(d0c0b0a0[0]), .A2(q1p1n1m1[2]), .ZN(n473) );
  XNOR2_X1 U154 ( .A(n474), .B(n473), .ZN(n475) );
  NAND2_X1 U155 ( .A1(q1p1n1m1[2]), .A2(d0c0b0a0[2]), .ZN(n507) );
  XOR2_X1 U156 ( .A(n475), .B(n507), .Z(n518) );
  XNOR2_X1 U157 ( .A(n476), .B(n518), .ZN(N30) );
  NAND2_X1 U158 ( .A1(q0p0n0m0[0]), .A2(h0g0f0e0[1]), .ZN(n478) );
  NAND2_X1 U159 ( .A1(h0g0f0e0[0]), .A2(q0p0n0m0[1]), .ZN(n477) );
  XOR2_X1 U160 ( .A(n478), .B(n477), .Z(n570) );
  XNOR2_X1 U161 ( .A(n479), .B(n570), .ZN(n481) );
  XNOR2_X1 U162 ( .A(q0p0n0m0[3]), .B(n659), .ZN(n716) );
  XNOR2_X1 U163 ( .A(d0c0b0a0[3]), .B(h0g0f0e0[3]), .ZN(n489) );
  XNOR2_X1 U164 ( .A(n716), .B(n489), .ZN(n703) );
  XOR2_X1 U165 ( .A(n703), .B(n624), .Z(n480) );
  XNOR2_X1 U166 ( .A(n481), .B(n480), .ZN(n482) );
  XNOR2_X1 U167 ( .A(n483), .B(n482), .ZN(n485) );
  XNOR2_X1 U168 ( .A(n485), .B(n484), .ZN(N16) );
  NAND2_X1 U169 ( .A1(q1p1n1m1[1]), .A2(h0g0f0e0[0]), .ZN(n487) );
  NAND2_X1 U170 ( .A1(q1p1n1m1[0]), .A2(h0g0f0e0[1]), .ZN(n486) );
  XOR2_X1 U171 ( .A(n487), .B(n486), .Z(n514) );
  XOR2_X1 U172 ( .A(n514), .B(n488), .Z(n492) );
  XNOR2_X1 U173 ( .A(q1p1n1m1[3]), .B(n557), .ZN(n610) );
  XOR2_X1 U174 ( .A(n489), .B(n610), .Z(n501) );
  XNOR2_X1 U175 ( .A(n501), .B(n490), .ZN(n491) );
  XNOR2_X1 U176 ( .A(n492), .B(n491), .ZN(n493) );
  XOR2_X1 U177 ( .A(n624), .B(n493), .Z(n495) );
  NAND2_X1 U178 ( .A1(h0g0f0e0[2]), .A2(q1p1n1m1[2]), .ZN(n494) );
  XNOR2_X1 U179 ( .A(n495), .B(n494), .ZN(N18) );
  NAND2_X1 U180 ( .A1(d0c0b0a0[0]), .A2(q1p1n1m1[1]), .ZN(n497) );
  NAND2_X1 U181 ( .A1(d0c0b0a0[1]), .A2(q1p1n1m1[0]), .ZN(n496) );
  XOR2_X1 U182 ( .A(n497), .B(n496), .Z(n499) );
  XNOR2_X1 U183 ( .A(n499), .B(n498), .ZN(n516) );
  XNOR2_X1 U184 ( .A(n501), .B(n500), .ZN(n504) );
  XNOR2_X1 U185 ( .A(n502), .B(d0c0b0a0[0]), .ZN(n503) );
  XNOR2_X1 U186 ( .A(n504), .B(n503), .ZN(n506) );
  XNOR2_X1 U187 ( .A(n506), .B(n505), .ZN(n508) );
  XNOR2_X1 U188 ( .A(n508), .B(n507), .ZN(n509) );
  XNOR2_X1 U189 ( .A(n516), .B(n509), .ZN(N34) );
  XOR2_X1 U190 ( .A(n571), .B(q1p1n1m1[1]), .Z(n515) );
  XNOR2_X1 U191 ( .A(d0c0b0a0[0]), .B(n515), .ZN(n532) );
  XNOR2_X1 U192 ( .A(n510), .B(n532), .ZN(n512) );
  NAND2_X1 U193 ( .A1(h0g0f0e0[3]), .A2(q1p1n1m1[3]), .ZN(n511) );
  XNOR2_X1 U194 ( .A(n512), .B(n511), .ZN(n513) );
  XNOR2_X1 U195 ( .A(n514), .B(n513), .ZN(N4) );
  XOR2_X1 U196 ( .A(n624), .B(n515), .Z(n581) );
  XOR2_X1 U197 ( .A(n516), .B(n581), .Z(n517) );
  XNOR2_X1 U198 ( .A(n518), .B(n517), .ZN(N22) );
  NAND2_X1 U199 ( .A1(q1p1n1m1[0]), .A2(h1g1f1e1[0]), .ZN(n529) );
  NAND2_X1 U200 ( .A1(h1g1f1e1[0]), .A2(q1p1n1m1[2]), .ZN(n520) );
  NAND2_X1 U201 ( .A1(h1g1f1e1[2]), .A2(q1p1n1m1[0]), .ZN(n519) );
  NAND2_X1 U202 ( .A1(n520), .A2(n519), .ZN(n523) );
  NAND2_X1 U203 ( .A1(n529), .A2(n523), .ZN(n522) );
  NAND2_X1 U204 ( .A1(q1p1n1m1[2]), .A2(h1g1f1e1[2]), .ZN(n524) );
  INV_X1 U205 ( .A(n524), .ZN(n521) );
  NAND2_X1 U206 ( .A1(n522), .A2(n521), .ZN(n526) );
  NAND2_X1 U207 ( .A1(n524), .A2(n523), .ZN(n525) );
  NAND2_X1 U208 ( .A1(n526), .A2(n525), .ZN(n551) );
  NAND2_X1 U209 ( .A1(q1p1n1m1[3]), .A2(h1g1f1e1[1]), .ZN(n528) );
  NAND2_X1 U210 ( .A1(q1p1n1m1[1]), .A2(h1g1f1e1[3]), .ZN(n527) );
  XNOR2_X1 U211 ( .A(n528), .B(n527), .ZN(n562) );
  XNOR2_X1 U212 ( .A(n562), .B(n529), .ZN(n546) );
  XNOR2_X1 U213 ( .A(n551), .B(n546), .ZN(n536) );
  NAND2_X1 U214 ( .A1(q1p1n1m1[1]), .A2(h1g1f1e1[0]), .ZN(n531) );
  NAND2_X1 U215 ( .A1(h1g1f1e1[1]), .A2(n571), .ZN(n530) );
  XOR2_X1 U216 ( .A(n531), .B(n530), .Z(n561) );
  XNOR2_X1 U217 ( .A(n561), .B(n532), .ZN(n534) );
  NAND2_X1 U218 ( .A1(h1g1f1e1[3]), .A2(q1p1n1m1[3]), .ZN(n533) );
  XNOR2_X1 U219 ( .A(n534), .B(n533), .ZN(n535) );
  XNOR2_X1 U220 ( .A(n536), .B(n535), .ZN(N5) );
  NAND2_X1 U221 ( .A1(q1p1n1m1[3]), .A2(h1g1f1e1[0]), .ZN(n538) );
  NAND2_X1 U222 ( .A1(h1g1f1e1[2]), .A2(n590), .ZN(n537) );
  XOR2_X1 U223 ( .A(n538), .B(n537), .Z(n542) );
  NAND2_X1 U224 ( .A1(q1p1n1m1[2]), .A2(h1g1f1e1[1]), .ZN(n540) );
  NAND2_X1 U225 ( .A1(n589), .A2(h1g1f1e1[3]), .ZN(n539) );
  XNOR2_X1 U226 ( .A(n540), .B(n539), .ZN(n541) );
  XNOR2_X1 U227 ( .A(n542), .B(n541), .ZN(n556) );
  NAND2_X1 U228 ( .A1(h1g1f1e1[2]), .A2(q1p1n1m1[3]), .ZN(n544) );
  NAND2_X1 U229 ( .A1(q1p1n1m1[2]), .A2(h1g1f1e1[3]), .ZN(n543) );
  XOR2_X1 U230 ( .A(n544), .B(n543), .Z(n545) );
  NAND2_X1 U231 ( .A1(h1g1f1e1[1]), .A2(q1p1n1m1[1]), .ZN(n555) );
  XNOR2_X1 U232 ( .A(n545), .B(n555), .ZN(n547) );
  XNOR2_X1 U233 ( .A(n547), .B(n546), .ZN(n552) );
  XNOR2_X1 U234 ( .A(n556), .B(n552), .ZN(n549) );
  XNOR2_X1 U235 ( .A(n549), .B(n548), .ZN(N9) );
  XOR2_X1 U236 ( .A(n551), .B(n550), .Z(n554) );
  XNOR2_X1 U237 ( .A(h1g1f1e1[3]), .B(n552), .ZN(n553) );
  XNOR2_X1 U238 ( .A(n554), .B(n553), .ZN(N13) );
  XNOR2_X1 U239 ( .A(d0c0b0a0[3]), .B(n555), .ZN(n565) );
  XNOR2_X1 U240 ( .A(q1p1n1m1[3]), .B(n556), .ZN(n559) );
  NOR2_X1 U241 ( .A1(n557), .A2(h1g1f1e1[2]), .ZN(n558) );
  XNOR2_X1 U242 ( .A(n559), .B(n558), .ZN(n560) );
  XNOR2_X1 U243 ( .A(n561), .B(n560), .ZN(n563) );
  XNOR2_X1 U244 ( .A(n563), .B(n562), .ZN(n564) );
  XNOR2_X1 U245 ( .A(n565), .B(n564), .ZN(N19) );
  NAND2_X1 U246 ( .A1(q0p0n0m0[3]), .A2(h0g0f0e0[3]), .ZN(n568) );
  XOR2_X1 U247 ( .A(n673), .B(q0p0n0m0[0]), .Z(n623) );
  XNOR2_X1 U248 ( .A(d0c0b0a0[0]), .B(n623), .ZN(n709) );
  XOR2_X1 U249 ( .A(n709), .B(n566), .Z(n567) );
  XNOR2_X1 U250 ( .A(n568), .B(n567), .ZN(n569) );
  XNOR2_X1 U251 ( .A(n570), .B(n569), .ZN(N2) );
  NAND2_X1 U252 ( .A1(d1c1b1a1[0]), .A2(q1p1n1m1[1]), .ZN(n574) );
  NAND2_X1 U253 ( .A1(q1p1n1m1[2]), .A2(d1c1b1a1[2]), .ZN(n601) );
  NAND2_X1 U254 ( .A1(n571), .A2(d1c1b1a1[1]), .ZN(n572) );
  XOR2_X1 U255 ( .A(n601), .B(n572), .Z(n573) );
  XNOR2_X1 U256 ( .A(n574), .B(n573), .ZN(n608) );
  NAND2_X1 U257 ( .A1(d1c1b1a1[3]), .A2(q1p1n1m1[1]), .ZN(n576) );
  NAND2_X1 U258 ( .A1(d1c1b1a1[1]), .A2(q1p1n1m1[3]), .ZN(n575) );
  XOR2_X1 U259 ( .A(n576), .B(n575), .Z(n609) );
  NAND2_X1 U260 ( .A1(q1p1n1m1[0]), .A2(d1c1b1a1[0]), .ZN(n577) );
  XNOR2_X1 U261 ( .A(n609), .B(n577), .ZN(n597) );
  NAND2_X1 U262 ( .A1(q1p1n1m1[2]), .A2(d1c1b1a1[0]), .ZN(n579) );
  NAND2_X1 U263 ( .A1(d1c1b1a1[2]), .A2(q1p1n1m1[0]), .ZN(n578) );
  XNOR2_X1 U264 ( .A(n579), .B(n578), .ZN(n580) );
  XNOR2_X1 U265 ( .A(n597), .B(n580), .ZN(n606) );
  XOR2_X1 U266 ( .A(n606), .B(n581), .Z(n583) );
  NAND2_X1 U267 ( .A1(d1c1b1a1[3]), .A2(q1p1n1m1[3]), .ZN(n582) );
  XNOR2_X1 U268 ( .A(n583), .B(n582), .ZN(n584) );
  XOR2_X1 U269 ( .A(n608), .B(n584), .Z(N23) );
  NAND2_X1 U270 ( .A1(d1c1b1a1[3]), .A2(q1p1n1m1[2]), .ZN(n586) );
  NAND2_X1 U271 ( .A1(d1c1b1a1[2]), .A2(q1p1n1m1[3]), .ZN(n585) );
  XOR2_X1 U272 ( .A(n586), .B(n585), .Z(n587) );
  NAND2_X1 U273 ( .A1(q1p1n1m1[1]), .A2(d1c1b1a1[1]), .ZN(n607) );
  XNOR2_X1 U274 ( .A(n587), .B(n607), .ZN(n602) );
  XOR2_X1 U275 ( .A(n588), .B(n602), .Z(n599) );
  NAND2_X1 U276 ( .A1(d1c1b1a1[3]), .A2(n589), .ZN(n592) );
  NAND2_X1 U277 ( .A1(d1c1b1a1[2]), .A2(n590), .ZN(n591) );
  XOR2_X1 U278 ( .A(n592), .B(n591), .Z(n596) );
  NAND2_X1 U279 ( .A1(d1c1b1a1[1]), .A2(q1p1n1m1[2]), .ZN(n594) );
  NAND2_X1 U280 ( .A1(d1c1b1a1[0]), .A2(q1p1n1m1[3]), .ZN(n593) );
  XNOR2_X1 U281 ( .A(n594), .B(n593), .ZN(n595) );
  XNOR2_X1 U282 ( .A(n596), .B(n595), .ZN(n615) );
  XNOR2_X1 U283 ( .A(n615), .B(n597), .ZN(n598) );
  XNOR2_X1 U284 ( .A(n599), .B(n598), .ZN(N27) );
  XNOR2_X1 U285 ( .A(n601), .B(n600), .ZN(n604) );
  XNOR2_X1 U286 ( .A(d1c1b1a1[3]), .B(n602), .ZN(n603) );
  XNOR2_X1 U287 ( .A(n604), .B(n603), .ZN(n605) );
  XOR2_X1 U288 ( .A(n606), .B(n605), .Z(N31) );
  XNOR2_X1 U289 ( .A(h0g0f0e0[3]), .B(n607), .ZN(n613) );
  XNOR2_X1 U290 ( .A(n609), .B(n608), .ZN(n611) );
  XNOR2_X1 U291 ( .A(n611), .B(n610), .ZN(n612) );
  XNOR2_X1 U292 ( .A(n613), .B(n612), .ZN(n614) );
  XNOR2_X1 U293 ( .A(n615), .B(n614), .ZN(N35) );
  XNOR2_X1 U294 ( .A(d1c1b1a1[0]), .B(d1c1b1a1[2]), .ZN(n617) );
  NOR2_X1 U295 ( .A1(n617), .A2(n616), .ZN(n647) );
  NAND2_X1 U296 ( .A1(q0p0n0m0[3]), .A2(d1c1b1a1[1]), .ZN(n643) );
  XOR2_X1 U297 ( .A(q0p0n0m0[3]), .B(q0p0n0m0[1]), .Z(n618) );
  NAND2_X1 U298 ( .A1(n618), .A2(d1c1b1a1[3]), .ZN(n619) );
  XOR2_X1 U299 ( .A(n643), .B(n619), .Z(n633) );
  NAND2_X1 U300 ( .A1(d1c1b1a1[1]), .A2(q0p0n0m0[0]), .ZN(n621) );
  NAND2_X1 U301 ( .A1(d1c1b1a1[0]), .A2(q0p0n0m0[1]), .ZN(n620) );
  XNOR2_X1 U302 ( .A(n621), .B(n620), .ZN(n622) );
  XNOR2_X1 U303 ( .A(n633), .B(n622), .ZN(n651) );
  XOR2_X1 U304 ( .A(n647), .B(n651), .Z(n626) );
  XOR2_X1 U305 ( .A(n624), .B(n623), .Z(n663) );
  XNOR2_X1 U306 ( .A(d1c1b1a1[1]), .B(n663), .ZN(n625) );
  XNOR2_X1 U307 ( .A(n626), .B(n625), .ZN(N21) );
  NAND2_X1 U308 ( .A1(d1c1b1a1[3]), .A2(q0p0n0m0[0]), .ZN(n628) );
  NAND2_X1 U309 ( .A1(d1c1b1a1[1]), .A2(q0p0n0m0[2]), .ZN(n627) );
  XOR2_X1 U310 ( .A(n628), .B(n627), .Z(n632) );
  NAND2_X1 U311 ( .A1(n673), .A2(d1c1b1a1[2]), .ZN(n630) );
  NAND2_X1 U312 ( .A1(d1c1b1a1[0]), .A2(q0p0n0m0[3]), .ZN(n629) );
  XNOR2_X1 U313 ( .A(n630), .B(n629), .ZN(n631) );
  XNOR2_X1 U314 ( .A(n632), .B(n631), .ZN(n652) );
  XNOR2_X1 U315 ( .A(n633), .B(n652), .ZN(n641) );
  XNOR2_X1 U316 ( .A(n673), .B(h0g0f0e0[1]), .ZN(n681) );
  NAND2_X1 U317 ( .A1(d1c1b1a1[1]), .A2(q0p0n0m0[1]), .ZN(n637) );
  NAND2_X1 U318 ( .A1(d1c1b1a1[3]), .A2(q0p0n0m0[2]), .ZN(n635) );
  NAND2_X1 U319 ( .A1(d1c1b1a1[2]), .A2(q0p0n0m0[3]), .ZN(n634) );
  XOR2_X1 U320 ( .A(n635), .B(n634), .Z(n636) );
  XNOR2_X1 U321 ( .A(n637), .B(n636), .ZN(n642) );
  XOR2_X1 U322 ( .A(n681), .B(n642), .Z(n639) );
  NAND2_X1 U323 ( .A1(d1c1b1a1[0]), .A2(q0p0n0m0[0]), .ZN(n638) );
  XNOR2_X1 U324 ( .A(n639), .B(n638), .ZN(n640) );
  XNOR2_X1 U325 ( .A(n641), .B(n640), .ZN(N25) );
  XOR2_X1 U326 ( .A(h0g0f0e0[2]), .B(n704), .Z(n691) );
  XNOR2_X1 U327 ( .A(n643), .B(n642), .ZN(n645) );
  NAND2_X1 U328 ( .A1(n673), .A2(d1c1b1a1[3]), .ZN(n644) );
  XNOR2_X1 U329 ( .A(n645), .B(n644), .ZN(n646) );
  XOR2_X1 U330 ( .A(n647), .B(n646), .Z(n648) );
  XNOR2_X1 U331 ( .A(n691), .B(n648), .ZN(N29) );
  NOR2_X1 U332 ( .A1(d1c1b1a1[2]), .A2(n659), .ZN(n650) );
  NAND2_X1 U333 ( .A1(d1c1b1a1[1]), .A2(n673), .ZN(n649) );
  XNOR2_X1 U334 ( .A(n650), .B(n649), .ZN(n656) );
  XOR2_X1 U335 ( .A(n652), .B(n651), .Z(n654) );
  XNOR2_X1 U336 ( .A(q0p0n0m0[3]), .B(h0g0f0e0[3]), .ZN(n653) );
  XNOR2_X1 U337 ( .A(n654), .B(n653), .ZN(n655) );
  XOR2_X1 U338 ( .A(n656), .B(n655), .Z(N33) );
  NAND2_X1 U339 ( .A1(q0p0n0m0[2]), .A2(d0c0b0a0[2]), .ZN(n699) );
  NOR2_X1 U340 ( .A1(n699), .A2(d0c0b0a0[0]), .ZN(n658) );
  NOR2_X1 U341 ( .A1(n704), .A2(n672), .ZN(n657) );
  XNOR2_X1 U342 ( .A(n658), .B(n657), .ZN(n662) );
  NOR2_X1 U343 ( .A1(d0c0b0a0[2]), .A2(n659), .ZN(n660) );
  NAND2_X1 U344 ( .A1(d0c0b0a0[0]), .A2(n660), .ZN(n661) );
  NAND2_X1 U345 ( .A1(n662), .A2(n661), .ZN(n690) );
  XOR2_X1 U346 ( .A(n663), .B(n690), .Z(n671) );
  NAND2_X1 U347 ( .A1(q0p0n0m0[1]), .A2(d0c0b0a0[3]), .ZN(n665) );
  NAND2_X1 U348 ( .A1(d0c0b0a0[1]), .A2(q0p0n0m0[3]), .ZN(n664) );
  XOR2_X1 U349 ( .A(n665), .B(n664), .Z(n697) );
  NAND2_X1 U350 ( .A1(q0p0n0m0[0]), .A2(d0c0b0a0[0]), .ZN(n666) );
  XNOR2_X1 U351 ( .A(n697), .B(n666), .ZN(n684) );
  NAND2_X1 U352 ( .A1(d0c0b0a0[1]), .A2(q0p0n0m0[0]), .ZN(n668) );
  NAND2_X1 U353 ( .A1(d0c0b0a0[0]), .A2(q0p0n0m0[1]), .ZN(n667) );
  XOR2_X1 U354 ( .A(n668), .B(n667), .Z(n669) );
  NAND2_X1 U355 ( .A1(q0p0n0m0[3]), .A2(d0c0b0a0[3]), .ZN(n688) );
  XNOR2_X1 U356 ( .A(n669), .B(n688), .ZN(n695) );
  XNOR2_X1 U357 ( .A(n684), .B(n695), .ZN(n670) );
  XNOR2_X1 U358 ( .A(n671), .B(n670), .ZN(N20) );
  NAND2_X1 U359 ( .A1(d0c0b0a0[1]), .A2(q0p0n0m0[2]), .ZN(n680) );
  XOR2_X1 U360 ( .A(d0c0b0a0[1]), .B(n672), .Z(n674) );
  NOR2_X1 U361 ( .A1(n674), .A2(n673), .ZN(n678) );
  NAND2_X1 U362 ( .A1(q0p0n0m0[0]), .A2(d0c0b0a0[3]), .ZN(n676) );
  NAND2_X1 U363 ( .A1(d0c0b0a0[0]), .A2(q0p0n0m0[3]), .ZN(n675) );
  XOR2_X1 U364 ( .A(n676), .B(n675), .Z(n677) );
  XNOR2_X1 U365 ( .A(n678), .B(n677), .ZN(n679) );
  XNOR2_X1 U366 ( .A(n680), .B(n679), .ZN(n696) );
  XNOR2_X1 U367 ( .A(n696), .B(n681), .ZN(n686) );
  NAND2_X1 U368 ( .A1(d0c0b0a0[3]), .A2(q0p0n0m0[2]), .ZN(n683) );
  NAND2_X1 U369 ( .A1(d0c0b0a0[2]), .A2(q0p0n0m0[3]), .ZN(n682) );
  XOR2_X1 U370 ( .A(n683), .B(n682), .Z(n685) );
  XNOR2_X1 U371 ( .A(n685), .B(n684), .ZN(n689) );
  XNOR2_X1 U372 ( .A(n686), .B(n689), .ZN(n687) );
  XNOR2_X1 U373 ( .A(n688), .B(n687), .ZN(N24) );
  XNOR2_X1 U374 ( .A(n690), .B(n689), .ZN(n692) );
  XNOR2_X1 U375 ( .A(n692), .B(n691), .ZN(n694) );
  NAND2_X1 U376 ( .A1(q0p0n0m0[1]), .A2(d0c0b0a0[1]), .ZN(n693) );
  XNOR2_X1 U377 ( .A(n694), .B(n693), .ZN(N28) );
  XNOR2_X1 U378 ( .A(n696), .B(n695), .ZN(n701) );
  XOR2_X1 U379 ( .A(d0c0b0a0[0]), .B(n697), .Z(n698) );
  XNOR2_X1 U380 ( .A(n699), .B(n698), .ZN(n700) );
  XNOR2_X1 U381 ( .A(n701), .B(n700), .ZN(n702) );
  XNOR2_X1 U382 ( .A(n703), .B(n702), .ZN(N32) );
  NAND2_X1 U383 ( .A1(h1g1f1e1[0]), .A2(q0p0n0m0[1]), .ZN(n706) );
  NAND2_X1 U384 ( .A1(h1g1f1e1[1]), .A2(n704), .ZN(n705) );
  XOR2_X1 U385 ( .A(n706), .B(n705), .Z(n708) );
  XNOR2_X1 U386 ( .A(n708), .B(n707), .ZN(n713) );
  XNOR2_X1 U387 ( .A(n713), .B(n709), .ZN(n711) );
  XNOR2_X1 U388 ( .A(n711), .B(n710), .ZN(n337) );
  XNOR2_X1 U389 ( .A(n713), .B(n712), .ZN(n720) );
  XOR2_X1 U390 ( .A(n715), .B(n714), .Z(n718) );
  XNOR2_X1 U391 ( .A(n716), .B(d0c0b0a0[3]), .ZN(n717) );
  XNOR2_X1 U392 ( .A(n718), .B(n717), .ZN(n719) );
  XNOR2_X1 U393 ( .A(n720), .B(n719), .ZN(n336) );
endmodule


module GF256InvSingleSBox_Unit ( clk, h0g0f0e0d0c0b0a0, h1g1f1e1d1c1b1a1, 
        guards, random, v0u0s0r0t0z0y0x0, v1u1s1r1t1z1y1x1 );
(* SILVER="[7:0]_0" *)  input [7:0] h0g0f0e0d0c0b0a0;
(* SILVER="[7:0]_1" *)  input [7:0] h1g1f1e1d1c1b1a1;
(* SILVER="refresh" *)  input [7:0] guards;
(* SILVER="refresh" *)  input [3:0] random;
(* SILVER="[7:0]_0" *)  output [7:0] v0u0s0r0t0z0y0x0;
(* SILVER="[7:0]_1" *)  output [7:0] v1u1s1r1t1z1y1x1;
(* SILVER="clock" *)  input clk;

  wire   [7:0] AffineInputSh0_r;
  wire   [7:0] AffineInputSh0;
  wire   [7:0] AffineInputSh1_r;
  wire   [7:0] AffineInputSh1;
  wire   [7:0] AffineInputSh0_r0;
  wire   [7:0] AffineInputSh1_r0;
  wire   [7:0] AffineInputSh0_r1;
  wire   [7:0] AffineInputSh1_r1;
  wire   [7:0] AffineInputSh0_r2;
  wire   [7:0] AffineInputSh1_r2;
  wire   [7:0] guards_r0;
  wire   [7:0] guards_r1;
  wire   [3:0] guards_r2;
  wire   [3:0] Gf16MulXorSqScSh0_r;
  wire   [3:0] Gf16MulXorSqScSh0;
  wire   [3:0] Gf16MulXorSqScSh1_r;
  wire   [3:0] Gf16MulXorSqScSh1;
  wire   [1:0] GF4MulXorSqSc1Sh0;
  wire   [1:0] GF4MulXorSqSc1Sh1;
  wire   [1:0] GF4MulXorSqSc0Sh0;
  wire   [1:0] GF4MulXorSqSc0Sh1;
  wire   [3:0] GF4MulSh0;
  wire   [3:0] GF4MulSh1;

  AffineInput_Unit_0 Inst_AffineInputA_Unit0 ( .A(h0g0f0e0d0c0b0a0), .Z(
        AffineInputSh0) );
  AffineInput_Unit_1 Inst_AffineInputA_Unit1 ( .A(h1g1f1e1d1c1b1a1), .Z(
        AffineInputSh1) );
  GF16MulXorSqSc_Unit Inst_GF16MulXorSqSc_Unit ( .clk(clk), .h0g0f0e0(
        AffineInputSh0_r[7:4]), .h1g1f1e1(AffineInputSh1_r[7:4]), .d0c0b0a0(
        AffineInputSh0_r[3:0]), .d1c1b1a1(AffineInputSh1_r[3:0]), .guards(
        guards_r0[3:0]), .x({Gf16MulXorSqScSh0[0], Gf16MulXorSqScSh1[0]}), .y(
        {Gf16MulXorSqScSh0[1], Gf16MulXorSqScSh1[1]}), .z({
        Gf16MulXorSqScSh0[2], Gf16MulXorSqScSh1[2]}), .t({Gf16MulXorSqScSh0[3], 
        Gf16MulXorSqScSh1[3]}) );
  GF4MulXorSqSc_Unit Inst_GF4MulXorSqSc_Unit ( .clk(clk), .d0c0b0a0(
        Gf16MulXorSqScSh0), .d1c1b1a1(Gf16MulXorSqScSh1), .guards(
        guards_r1[7:4]), .random(random), .x({GF4MulXorSqSc0Sh0[0], 
        GF4MulXorSqSc0Sh1[0]}), .y({GF4MulXorSqSc0Sh0[1], GF4MulXorSqSc0Sh1[1]}), .z({GF4MulXorSqSc1Sh0[0], GF4MulXorSqSc1Sh1[0]}), .t({GF4MulXorSqSc1Sh0[1], 
        GF4MulXorSqSc1Sh1[1]}) );
  GF4Mul_Unit Inst_GF4Mul_Unit ( .clk(clk), .d0c0b0a0(Gf16MulXorSqScSh0_r), 
        .d1c1b1a1(Gf16MulXorSqScSh1_r), .h0g0f0e0({GF4MulXorSqSc1Sh0, 
        GF4MulXorSqSc0Sh0}), .h1g1f1e1({GF4MulXorSqSc1Sh1, GF4MulXorSqSc0Sh1}), 
        .guards(guards_r2), .x({GF4MulSh0[0], GF4MulSh1[0]}), .y({GF4MulSh0[1], 
        GF4MulSh1[1]}), .z({GF4MulSh0[2], GF4MulSh1[2]}), .t({GF4MulSh0[3], 
        GF4MulSh1[3]}) );
  GF16Mul_Unit Inst_GF16Mul_Unit ( .clk(clk), .d0c0b0a0(AffineInputSh0_r2[3:0]), .d1c1b1a1(AffineInputSh1_r2[3:0]), .h0g0f0e0(AffineInputSh0_r2[7:4]), 
        .h1g1f1e1(AffineInputSh1_r2[7:4]), .q0p0n0m0(GF4MulSh0), .q1p1n1m1(
        GF4MulSh1), .x({v0u0s0r0t0z0y0x0[0], v1u1s1r1t1z1y1x1[0]}), .y({
        v0u0s0r0t0z0y0x0[1], v1u1s1r1t1z1y1x1[1]}), .z({v0u0s0r0t0z0y0x0[2], 
        v1u1s1r1t1z1y1x1[2]}), .t({v0u0s0r0t0z0y0x0[3], v1u1s1r1t1z1y1x1[3]}), 
        .r({v0u0s0r0t0z0y0x0[4], v1u1s1r1t1z1y1x1[4]}), .s({
        v0u0s0r0t0z0y0x0[5], v1u1s1r1t1z1y1x1[5]}), .u({v0u0s0r0t0z0y0x0[6], 
        v1u1s1r1t1z1y1x1[6]}), .v({v0u0s0r0t0z0y0x0[7], v1u1s1r1t1z1y1x1[7]})
         );
  DFF_X1 \AffineInputSh0_r_reg[7]  ( .D(AffineInputSh0[7]), .CK(clk), .Q(
        AffineInputSh0_r[7]) );
  DFF_X1 \AffineInputSh0_r_reg[6]  ( .D(AffineInputSh0[6]), .CK(clk), .Q(
        AffineInputSh0_r[6]) );
  DFF_X1 \AffineInputSh0_r_reg[5]  ( .D(AffineInputSh0[5]), .CK(clk), .Q(
        AffineInputSh0_r[5]) );
  DFF_X1 \AffineInputSh0_r_reg[4]  ( .D(AffineInputSh0[4]), .CK(clk), .Q(
        AffineInputSh0_r[4]) );
  DFF_X1 \AffineInputSh0_r_reg[3]  ( .D(AffineInputSh0[3]), .CK(clk), .Q(
        AffineInputSh0_r[3]) );
  DFF_X1 \AffineInputSh0_r_reg[2]  ( .D(AffineInputSh0[2]), .CK(clk), .Q(
        AffineInputSh0_r[2]) );
  DFF_X1 \AffineInputSh0_r_reg[1]  ( .D(AffineInputSh0[1]), .CK(clk), .Q(
        AffineInputSh0_r[1]) );
  DFF_X1 \AffineInputSh0_r_reg[0]  ( .D(AffineInputSh0[0]), .CK(clk), .Q(
        AffineInputSh0_r[0]) );
  DFF_X1 \AffineInputSh1_r_reg[7]  ( .D(AffineInputSh1[7]), .CK(clk), .Q(
        AffineInputSh1_r[7]) );
  DFF_X1 \AffineInputSh1_r_reg[6]  ( .D(AffineInputSh1[6]), .CK(clk), .Q(
        AffineInputSh1_r[6]) );
  DFF_X1 \AffineInputSh1_r_reg[5]  ( .D(AffineInputSh1[5]), .CK(clk), .Q(
        AffineInputSh1_r[5]) );
  DFF_X1 \AffineInputSh1_r_reg[4]  ( .D(AffineInputSh1[4]), .CK(clk), .Q(
        AffineInputSh1_r[4]) );
  DFF_X1 \AffineInputSh1_r_reg[3]  ( .D(AffineInputSh1[3]), .CK(clk), .Q(
        AffineInputSh1_r[3]) );
  DFF_X1 \AffineInputSh1_r_reg[2]  ( .D(AffineInputSh1[2]), .CK(clk), .Q(
        AffineInputSh1_r[2]) );
  DFF_X1 \AffineInputSh1_r_reg[1]  ( .D(AffineInputSh1[1]), .CK(clk), .Q(
        AffineInputSh1_r[1]) );
  DFF_X1 \AffineInputSh1_r_reg[0]  ( .D(AffineInputSh1[0]), .CK(clk), .Q(
        AffineInputSh1_r[0]) );
  DFF_X1 \AffineInputSh0_r0_reg[7]  ( .D(AffineInputSh0_r[7]), .CK(clk), .Q(
        AffineInputSh0_r0[7]) );
  DFF_X1 \AffineInputSh0_r0_reg[6]  ( .D(AffineInputSh0_r[6]), .CK(clk), .Q(
        AffineInputSh0_r0[6]) );
  DFF_X1 \AffineInputSh0_r0_reg[5]  ( .D(AffineInputSh0_r[5]), .CK(clk), .Q(
        AffineInputSh0_r0[5]) );
  DFF_X1 \AffineInputSh0_r0_reg[4]  ( .D(AffineInputSh0_r[4]), .CK(clk), .Q(
        AffineInputSh0_r0[4]) );
  DFF_X1 \AffineInputSh0_r0_reg[3]  ( .D(AffineInputSh0_r[3]), .CK(clk), .Q(
        AffineInputSh0_r0[3]) );
  DFF_X1 \AffineInputSh0_r0_reg[2]  ( .D(AffineInputSh0_r[2]), .CK(clk), .Q(
        AffineInputSh0_r0[2]) );
  DFF_X1 \AffineInputSh0_r0_reg[1]  ( .D(AffineInputSh0_r[1]), .CK(clk), .Q(
        AffineInputSh0_r0[1]) );
  DFF_X1 \AffineInputSh0_r0_reg[0]  ( .D(AffineInputSh0_r[0]), .CK(clk), .Q(
        AffineInputSh0_r0[0]) );
  DFF_X1 \AffineInputSh1_r0_reg[7]  ( .D(AffineInputSh1_r[7]), .CK(clk), .Q(
        AffineInputSh1_r0[7]) );
  DFF_X1 \AffineInputSh1_r0_reg[6]  ( .D(AffineInputSh1_r[6]), .CK(clk), .Q(
        AffineInputSh1_r0[6]) );
  DFF_X1 \AffineInputSh1_r0_reg[5]  ( .D(AffineInputSh1_r[5]), .CK(clk), .Q(
        AffineInputSh1_r0[5]) );
  DFF_X1 \AffineInputSh1_r0_reg[4]  ( .D(AffineInputSh1_r[4]), .CK(clk), .Q(
        AffineInputSh1_r0[4]) );
  DFF_X1 \AffineInputSh1_r0_reg[3]  ( .D(AffineInputSh1_r[3]), .CK(clk), .Q(
        AffineInputSh1_r0[3]) );
  DFF_X1 \AffineInputSh1_r0_reg[2]  ( .D(AffineInputSh1_r[2]), .CK(clk), .Q(
        AffineInputSh1_r0[2]) );
  DFF_X1 \AffineInputSh1_r0_reg[1]  ( .D(AffineInputSh1_r[1]), .CK(clk), .Q(
        AffineInputSh1_r0[1]) );
  DFF_X1 \AffineInputSh1_r0_reg[0]  ( .D(AffineInputSh1_r[0]), .CK(clk), .Q(
        AffineInputSh1_r0[0]) );
  DFF_X1 \AffineInputSh0_r1_reg[7]  ( .D(AffineInputSh0_r0[7]), .CK(clk), .Q(
        AffineInputSh0_r1[7]) );
  DFF_X1 \AffineInputSh0_r1_reg[6]  ( .D(AffineInputSh0_r0[6]), .CK(clk), .Q(
        AffineInputSh0_r1[6]) );
  DFF_X1 \AffineInputSh0_r1_reg[5]  ( .D(AffineInputSh0_r0[5]), .CK(clk), .Q(
        AffineInputSh0_r1[5]) );
  DFF_X1 \AffineInputSh0_r1_reg[4]  ( .D(AffineInputSh0_r0[4]), .CK(clk), .Q(
        AffineInputSh0_r1[4]) );
  DFF_X1 \AffineInputSh0_r1_reg[3]  ( .D(AffineInputSh0_r0[3]), .CK(clk), .Q(
        AffineInputSh0_r1[3]) );
  DFF_X1 \AffineInputSh0_r1_reg[2]  ( .D(AffineInputSh0_r0[2]), .CK(clk), .Q(
        AffineInputSh0_r1[2]) );
  DFF_X1 \AffineInputSh0_r1_reg[1]  ( .D(AffineInputSh0_r0[1]), .CK(clk), .Q(
        AffineInputSh0_r1[1]) );
  DFF_X1 \AffineInputSh0_r1_reg[0]  ( .D(AffineInputSh0_r0[0]), .CK(clk), .Q(
        AffineInputSh0_r1[0]) );
  DFF_X1 \AffineInputSh1_r1_reg[7]  ( .D(AffineInputSh1_r0[7]), .CK(clk), .Q(
        AffineInputSh1_r1[7]) );
  DFF_X1 \AffineInputSh1_r1_reg[6]  ( .D(AffineInputSh1_r0[6]), .CK(clk), .Q(
        AffineInputSh1_r1[6]) );
  DFF_X1 \AffineInputSh1_r1_reg[5]  ( .D(AffineInputSh1_r0[5]), .CK(clk), .Q(
        AffineInputSh1_r1[5]) );
  DFF_X1 \AffineInputSh1_r1_reg[4]  ( .D(AffineInputSh1_r0[4]), .CK(clk), .Q(
        AffineInputSh1_r1[4]) );
  DFF_X1 \AffineInputSh1_r1_reg[3]  ( .D(AffineInputSh1_r0[3]), .CK(clk), .Q(
        AffineInputSh1_r1[3]) );
  DFF_X1 \AffineInputSh1_r1_reg[2]  ( .D(AffineInputSh1_r0[2]), .CK(clk), .Q(
        AffineInputSh1_r1[2]) );
  DFF_X1 \AffineInputSh1_r1_reg[1]  ( .D(AffineInputSh1_r0[1]), .CK(clk), .Q(
        AffineInputSh1_r1[1]) );
  DFF_X1 \AffineInputSh1_r1_reg[0]  ( .D(AffineInputSh1_r0[0]), .CK(clk), .Q(
        AffineInputSh1_r1[0]) );
  DFF_X1 \AffineInputSh0_r2_reg[7]  ( .D(AffineInputSh0_r1[7]), .CK(clk), .Q(
        AffineInputSh0_r2[7]) );
  DFF_X1 \AffineInputSh0_r2_reg[6]  ( .D(AffineInputSh0_r1[6]), .CK(clk), .Q(
        AffineInputSh0_r2[6]) );
  DFF_X1 \AffineInputSh0_r2_reg[5]  ( .D(AffineInputSh0_r1[5]), .CK(clk), .Q(
        AffineInputSh0_r2[5]) );
  DFF_X1 \AffineInputSh0_r2_reg[4]  ( .D(AffineInputSh0_r1[4]), .CK(clk), .Q(
        AffineInputSh0_r2[4]) );
  DFF_X1 \AffineInputSh0_r2_reg[3]  ( .D(AffineInputSh0_r1[3]), .CK(clk), .Q(
        AffineInputSh0_r2[3]) );
  DFF_X1 \AffineInputSh0_r2_reg[2]  ( .D(AffineInputSh0_r1[2]), .CK(clk), .Q(
        AffineInputSh0_r2[2]) );
  DFF_X1 \AffineInputSh0_r2_reg[1]  ( .D(AffineInputSh0_r1[1]), .CK(clk), .Q(
        AffineInputSh0_r2[1]) );
  DFF_X1 \AffineInputSh0_r2_reg[0]  ( .D(AffineInputSh0_r1[0]), .CK(clk), .Q(
        AffineInputSh0_r2[0]) );
  DFF_X1 \AffineInputSh1_r2_reg[7]  ( .D(AffineInputSh1_r1[7]), .CK(clk), .Q(
        AffineInputSh1_r2[7]) );
  DFF_X1 \AffineInputSh1_r2_reg[6]  ( .D(AffineInputSh1_r1[6]), .CK(clk), .Q(
        AffineInputSh1_r2[6]) );
  DFF_X1 \AffineInputSh1_r2_reg[5]  ( .D(AffineInputSh1_r1[5]), .CK(clk), .Q(
        AffineInputSh1_r2[5]) );
  DFF_X1 \AffineInputSh1_r2_reg[4]  ( .D(AffineInputSh1_r1[4]), .CK(clk), .Q(
        AffineInputSh1_r2[4]) );
  DFF_X1 \AffineInputSh1_r2_reg[3]  ( .D(AffineInputSh1_r1[3]), .CK(clk), .Q(
        AffineInputSh1_r2[3]) );
  DFF_X1 \AffineInputSh1_r2_reg[2]  ( .D(AffineInputSh1_r1[2]), .CK(clk), .Q(
        AffineInputSh1_r2[2]) );
  DFF_X1 \AffineInputSh1_r2_reg[1]  ( .D(AffineInputSh1_r1[1]), .CK(clk), .Q(
        AffineInputSh1_r2[1]) );
  DFF_X1 \AffineInputSh1_r2_reg[0]  ( .D(AffineInputSh1_r1[0]), .CK(clk), .Q(
        AffineInputSh1_r2[0]) );
  DFF_X1 \guards_r0_reg[7]  ( .D(guards[7]), .CK(clk), .Q(guards_r0[7]) );
  DFF_X1 \guards_r0_reg[6]  ( .D(guards[6]), .CK(clk), .Q(guards_r0[6]) );
  DFF_X1 \guards_r0_reg[5]  ( .D(guards[5]), .CK(clk), .Q(guards_r0[5]) );
  DFF_X1 \guards_r0_reg[4]  ( .D(guards[4]), .CK(clk), .Q(guards_r0[4]) );
  DFF_X1 \guards_r0_reg[3]  ( .D(guards[3]), .CK(clk), .Q(guards_r0[3]) );
  DFF_X1 \guards_r0_reg[2]  ( .D(guards[2]), .CK(clk), .Q(guards_r0[2]) );
  DFF_X1 \guards_r0_reg[1]  ( .D(guards[1]), .CK(clk), .Q(guards_r0[1]) );
  DFF_X1 \guards_r0_reg[0]  ( .D(guards[0]), .CK(clk), .Q(guards_r0[0]) );
  DFF_X1 \guards_r1_reg[7]  ( .D(guards_r0[7]), .CK(clk), .Q(guards_r1[7]) );
  DFF_X1 \guards_r1_reg[6]  ( .D(guards_r0[6]), .CK(clk), .Q(guards_r1[6]) );
  DFF_X1 \guards_r1_reg[5]  ( .D(guards_r0[5]), .CK(clk), .Q(guards_r1[5]) );
  DFF_X1 \guards_r1_reg[4]  ( .D(guards_r0[4]), .CK(clk), .Q(guards_r1[4]) );
  DFF_X1 \guards_r1_reg[3]  ( .D(guards_r0[3]), .CK(clk), .Q(guards_r1[3]) );
  DFF_X1 \guards_r1_reg[2]  ( .D(guards_r0[2]), .CK(clk), .Q(guards_r1[2]) );
  DFF_X1 \guards_r1_reg[1]  ( .D(guards_r0[1]), .CK(clk), .Q(guards_r1[1]) );
  DFF_X1 \guards_r1_reg[0]  ( .D(guards_r0[0]), .CK(clk), .Q(guards_r1[0]) );
  DFF_X1 \guards_r2_reg[3]  ( .D(guards_r1[3]), .CK(clk), .Q(guards_r2[3]) );
  DFF_X1 \guards_r2_reg[2]  ( .D(guards_r1[2]), .CK(clk), .Q(guards_r2[2]) );
  DFF_X1 \guards_r2_reg[1]  ( .D(guards_r1[1]), .CK(clk), .Q(guards_r2[1]) );
  DFF_X1 \guards_r2_reg[0]  ( .D(guards_r1[0]), .CK(clk), .Q(guards_r2[0]) );
  DFF_X1 \Gf16MulXorSqScSh0_r_reg[3]  ( .D(Gf16MulXorSqScSh0[3]), .CK(clk), 
        .Q(Gf16MulXorSqScSh0_r[3]) );
  DFF_X1 \Gf16MulXorSqScSh0_r_reg[2]  ( .D(Gf16MulXorSqScSh0[2]), .CK(clk), 
        .Q(Gf16MulXorSqScSh0_r[2]) );
  DFF_X1 \Gf16MulXorSqScSh0_r_reg[1]  ( .D(Gf16MulXorSqScSh0[1]), .CK(clk), 
        .Q(Gf16MulXorSqScSh0_r[1]) );
  DFF_X1 \Gf16MulXorSqScSh0_r_reg[0]  ( .D(Gf16MulXorSqScSh0[0]), .CK(clk), 
        .Q(Gf16MulXorSqScSh0_r[0]) );
  DFF_X1 \Gf16MulXorSqScSh1_r_reg[3]  ( .D(Gf16MulXorSqScSh1[3]), .CK(clk), 
        .Q(Gf16MulXorSqScSh1_r[3]) );
  DFF_X1 \Gf16MulXorSqScSh1_r_reg[2]  ( .D(Gf16MulXorSqScSh1[2]), .CK(clk), 
        .Q(Gf16MulXorSqScSh1_r[2]) );
  DFF_X1 \Gf16MulXorSqScSh1_r_reg[1]  ( .D(Gf16MulXorSqScSh1[1]), .CK(clk), 
        .Q(Gf16MulXorSqScSh1_r[1]) );
  DFF_X1 \Gf16MulXorSqScSh1_r_reg[0]  ( .D(Gf16MulXorSqScSh1[0]), .CK(clk), 
        .Q(Gf16MulXorSqScSh1_r[0]) );
endmodule

