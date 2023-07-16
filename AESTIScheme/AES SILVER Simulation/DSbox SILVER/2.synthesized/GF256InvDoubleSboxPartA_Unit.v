/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP1
// Date      : Tue May 30 05:25:28 2023
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


module AffineInput_Unit_3 ( A, Z );
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


module GF16MulXorSqSc_Unit ( clk, ha0ga0fa0ea0, ha1ga1fa1ea1, da0ca0ba0aa0, 
        da1ca1ba1aa1, xa, ya, za, ta, hb0gb0fb0eb0, hb1gb1fb1eb1, db0cb0bb0ab0, 
        db1cb1bb1ab1, xb, yb, zb, tb );
  input [3:0] ha0ga0fa0ea0;
  input [3:0] ha1ga1fa1ea1;
  input [3:0] da0ca0ba0aa0;
  input [3:0] da1ca1ba1aa1;
  output [1:0] xa;
  output [1:0] ya;
  output [1:0] za;
  output [1:0] ta;
  input [3:0] hb0gb0fb0eb0;
  input [3:0] hb1gb1fb1eb1;
  input [3:0] db0cb0bb0ab0;
  input [3:0] db1cb1bb1ab1;
  output [1:0] xb;
  output [1:0] yb;
  output [1:0] zb;
  output [1:0] tb;
  input clk;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N10, N11, N12, N13, N14, N15, N16,
         N17, N18, N19, N20, N21, N22, N23, N24, N26, N27, N28, N29, N31, n354,
         n355, n356, n420, n421, n422, n423, n424, n425, n426, n427, n428,
         n429, n430, n431, n432, n433, n434, n435, n436, n437, n438, n439,
         n440, n441, n442, n443, n444, n445, n446, n447, n448, n449, n450,
         n451, n452, n453, n454, n455, n456, n457, n458, n459, n460, n461,
         n462, n463, n464, n465, n466, n467, n468, n469, n470, n471, n472,
         n473, n474, n475, n476, n477, n478, n479, n480, n481, n482, n483,
         n484, n485, n486, n487, n488, n489, n490, n491, n492, n493, n494,
         n495, n496, n497, n498, n499, n500, n501, n502, n503, n504, n505,
         n506, n507, n508, n509, n510, n511, n512, n513, n514, n515, n516,
         n517, n518, n519, n520, n521, n522, n523, n524, n525, n526, n527,
         n528, n529, n530, n531, n532, n533, n534, n535, n536, n537, n538,
         n539, n540, n541, n542, n543, n544, n545, n546, n547, n548, n549,
         n550, n551, n552, n553, n554, n555, n556, n557, n558, n559, n560,
         n561, n562, n563, n564, n565, n566, n567, n568, n569, n570, n571,
         n572, n573, n574, n575, n576, n577, n578, n579, n580, n581, n582,
         n583, n584, n585, n586, n587, n588, n589, n590, n591, n592, n593,
         n594, n595, n596, n597, n598, n599, n600, n601, n602, n603, n604,
         n605, n606, n607, n608, n609, n610, n611, n612, n613, n614, n615,
         n616, n617, n618, n619, n620, n621, n622, n623, n624, n625, n626,
         n627, n628, n629, n630, n631, n632, n633, n634, n635, n636, n637,
         n638, n639, n640, n641, n642, n643, n644, n645, n646, n647, n648,
         n649, n650, n651, n652, n653, n654, n655, n656, n657, n658, n659,
         n660, n661, n662, n663, n664, n665, n666, n667, n668, n669, n670,
         n671, n672, n673, n674, n675, n676, n677, n678, n679, n680, n681,
         n682, n683, n684, n685, n686, n687, n688, n689, n690, n691, n692,
         n693, n694, n695, n696, n697, n698, n699, n700, n701, n702, n703,
         n704, n705, n706, n707, n708, n709, n710, n711, n712, n713, n714,
         n715, n716, n717, n718, n719, n720, n721, n722, n723, n724, n725,
         n726, n727, n728, n729, n730, n731, n732, n733, n734, n735, n736,
         n737, n738, n739, n740, n741, n742, n743, n744, n745, n746, n747,
         n748, n749, n750, n751, n752, n753, n754, n755, n756, n757, n758,
         n759, n760, n761, n762, n763, n764, n765, n766, n767, n768, n769,
         n770, n771, n772, n773, n774, n775, n776, n777, n778, n779, n780,
         n781;
  wire   [3:0] xa_r;
  wire   [3:0] ya_r;
  wire   [3:0] za_r;
  wire   [3:0] ta_r;
  wire   [3:0] xb_r;
  wire   [3:0] yb_r;
  wire   [3:0] zb_r;
  wire   [3:0] tb_r;

  DFF_X1 \xa_r_reg[3]  ( .D(N3), .CK(clk), .Q(xa_r[3]) );
  DFF_X1 \xa_r_reg[2]  ( .D(N2), .CK(clk), .Q(xa_r[2]) );
  DFF_X1 \xa_r_reg[1]  ( .D(N1), .CK(clk), .Q(xa_r[1]) );
  DFF_X1 \xa_r_reg[0]  ( .D(N0), .CK(clk), .Q(xa_r[0]) );
  DFF_X1 \ya_r_reg[3]  ( .D(N7), .CK(clk), .Q(ya_r[3]) );
  DFF_X1 \ya_r_reg[2]  ( .D(N6), .CK(clk), .Q(ya_r[2]) );
  DFF_X1 \ya_r_reg[1]  ( .D(N5), .CK(clk), .Q(ya_r[1]) );
  DFF_X1 \ya_r_reg[0]  ( .D(N4), .CK(clk), .Q(ya_r[0]) );
  DFF_X1 \za_r_reg[3]  ( .D(N11), .CK(clk), .Q(za_r[3]) );
  DFF_X1 \za_r_reg[2]  ( .D(N10), .CK(clk), .Q(za_r[2]) );
  DFF_X1 \za_r_reg[1]  ( .D(n354), .CK(clk), .Q(za_r[1]) );
  DFF_X1 \za_r_reg[0]  ( .D(N8), .CK(clk), .Q(za_r[0]) );
  DFF_X1 \ta_r_reg[3]  ( .D(N15), .CK(clk), .Q(ta_r[3]) );
  DFF_X1 \ta_r_reg[2]  ( .D(N14), .CK(clk), .Q(ta_r[2]) );
  DFF_X1 \ta_r_reg[1]  ( .D(N13), .CK(clk), .Q(ta_r[1]) );
  DFF_X1 \ta_r_reg[0]  ( .D(N12), .CK(clk), .Q(ta_r[0]) );
  DFF_X1 \xb_r_reg[3]  ( .D(N19), .CK(clk), .Q(xb_r[3]) );
  DFF_X1 \xb_r_reg[2]  ( .D(N18), .CK(clk), .Q(xb_r[2]) );
  DFF_X1 \xb_r_reg[1]  ( .D(N17), .CK(clk), .Q(xb_r[1]) );
  DFF_X1 \xb_r_reg[0]  ( .D(N16), .CK(clk), .Q(xb_r[0]) );
  DFF_X1 \yb_r_reg[3]  ( .D(N23), .CK(clk), .Q(yb_r[3]) );
  DFF_X1 \yb_r_reg[2]  ( .D(N22), .CK(clk), .Q(yb_r[2]) );
  DFF_X1 \yb_r_reg[1]  ( .D(N21), .CK(clk), .Q(yb_r[1]) );
  DFF_X1 \yb_r_reg[0]  ( .D(N20), .CK(clk), .Q(yb_r[0]) );
  DFF_X1 \zb_r_reg[3]  ( .D(N27), .CK(clk), .Q(zb_r[3]) );
  DFF_X1 \zb_r_reg[2]  ( .D(N26), .CK(clk), .Q(zb_r[2]) );
  DFF_X1 \zb_r_reg[1]  ( .D(n356), .CK(clk), .Q(zb_r[1]) );
  DFF_X1 \zb_r_reg[0]  ( .D(N24), .CK(clk), .Q(zb_r[0]) );
  DFF_X1 \tb_r_reg[3]  ( .D(N31), .CK(clk), .Q(tb_r[3]) );
  DFF_X1 \tb_r_reg[2]  ( .D(n355), .CK(clk), .Q(tb_r[2]) );
  DFF_X1 \tb_r_reg[1]  ( .D(N29), .CK(clk), .Q(tb_r[1]) );
  DFF_X1 \tb_r_reg[0]  ( .D(N28), .CK(clk), .Q(tb_r[0]) );
  XOR2_X1 U3 ( .A(yb_r[0]), .B(yb_r[1]), .Z(yb[0]) );
  XOR2_X1 U4 ( .A(tb_r[2]), .B(tb_r[3]), .Z(tb[1]) );
  XOR2_X1 U5 ( .A(zb_r[2]), .B(zb_r[3]), .Z(zb[1]) );
  XOR2_X1 U6 ( .A(zb_r[0]), .B(zb_r[1]), .Z(zb[0]) );
  XOR2_X1 U7 ( .A(za_r[2]), .B(za_r[3]), .Z(za[1]) );
  XOR2_X1 U8 ( .A(za_r[0]), .B(za_r[1]), .Z(za[0]) );
  XOR2_X1 U9 ( .A(yb_r[2]), .B(yb_r[3]), .Z(yb[1]) );
  XOR2_X1 U10 ( .A(ya_r[2]), .B(ya_r[3]), .Z(ya[1]) );
  XOR2_X1 U11 ( .A(ya_r[0]), .B(ya_r[1]), .Z(ya[0]) );
  XOR2_X1 U12 ( .A(xb_r[2]), .B(xb_r[3]), .Z(xb[1]) );
  XOR2_X1 U13 ( .A(xb_r[0]), .B(xb_r[1]), .Z(xb[0]) );
  XOR2_X1 U14 ( .A(xa_r[2]), .B(xa_r[3]), .Z(xa[1]) );
  XOR2_X1 U15 ( .A(xa_r[0]), .B(xa_r[1]), .Z(xa[0]) );
  XOR2_X1 U16 ( .A(tb_r[0]), .B(tb_r[1]), .Z(tb[0]) );
  XOR2_X1 U17 ( .A(ta_r[2]), .B(ta_r[3]), .Z(ta[1]) );
  XOR2_X1 U18 ( .A(ta_r[0]), .B(ta_r[1]), .Z(ta[0]) );
  NAND2_X1 U19 ( .A1(da0ca0ba0aa0[3]), .A2(ha1ga1fa1ea1[3]), .ZN(n423) );
  NAND2_X1 U20 ( .A1(ha1ga1fa1ea1[3]), .A2(da0ca0ba0aa0[1]), .ZN(n421) );
  NAND2_X1 U21 ( .A1(da0ca0ba0aa0[3]), .A2(ha1ga1fa1ea1[1]), .ZN(n420) );
  XNOR2_X1 U22 ( .A(n421), .B(n420), .ZN(n422) );
  XNOR2_X1 U23 ( .A(da0ca0ba0aa0[0]), .B(n422), .ZN(n774) );
  XNOR2_X1 U24 ( .A(n423), .B(n774), .ZN(n516) );
  INV_X1 U25 ( .A(ha1ga1fa1ea1[2]), .ZN(n779) );
  XOR2_X1 U26 ( .A(n779), .B(ha1ga1fa1ea1[0]), .Z(n425) );
  XNOR2_X1 U27 ( .A(da0ca0ba0aa0[2]), .B(da0ca0ba0aa0[0]), .ZN(n424) );
  NOR2_X1 U28 ( .A1(n425), .A2(n424), .ZN(n775) );
  INV_X1 U29 ( .A(db0cb0bb0ab0[0]), .ZN(n705) );
  XNOR2_X1 U30 ( .A(n775), .B(n705), .ZN(n429) );
  INV_X1 U31 ( .A(ha1ga1fa1ea1[0]), .ZN(n576) );
  NAND2_X1 U32 ( .A1(da0ca0ba0aa0[1]), .A2(ha1ga1fa1ea1[0]), .ZN(n427) );
  NAND2_X1 U33 ( .A1(da0ca0ba0aa0[0]), .A2(ha1ga1fa1ea1[1]), .ZN(n426) );
  XOR2_X1 U34 ( .A(n427), .B(n426), .Z(n521) );
  XOR2_X1 U35 ( .A(n576), .B(n521), .Z(n428) );
  XNOR2_X1 U36 ( .A(n429), .B(n428), .ZN(n430) );
  XOR2_X1 U37 ( .A(n516), .B(n430), .Z(N1) );
  NAND2_X1 U38 ( .A1(da0ca0ba0aa0[2]), .A2(ha0ga0fa0ea0[2]), .ZN(n455) );
  NAND2_X1 U39 ( .A1(ha0ga0fa0ea0[2]), .A2(da0ca0ba0aa0[0]), .ZN(n432) );
  NAND2_X1 U40 ( .A1(ha0ga0fa0ea0[0]), .A2(da0ca0ba0aa0[2]), .ZN(n431) );
  NAND2_X1 U41 ( .A1(n432), .A2(n431), .ZN(n434) );
  NAND2_X1 U42 ( .A1(n455), .A2(n434), .ZN(n433) );
  NAND2_X1 U43 ( .A1(da0ca0ba0aa0[0]), .A2(ha0ga0fa0ea0[0]), .ZN(n435) );
  INV_X1 U44 ( .A(n435), .ZN(n739) );
  NAND2_X1 U45 ( .A1(n433), .A2(n739), .ZN(n437) );
  NAND2_X1 U46 ( .A1(n435), .A2(n434), .ZN(n436) );
  NAND2_X1 U47 ( .A1(n437), .A2(n436), .ZN(n452) );
  NAND2_X1 U48 ( .A1(da0ca0ba0aa0[3]), .A2(ha0ga0fa0ea0[1]), .ZN(n439) );
  NAND2_X1 U49 ( .A1(ha0ga0fa0ea0[3]), .A2(da0ca0ba0aa0[1]), .ZN(n438) );
  XNOR2_X1 U50 ( .A(n439), .B(n438), .ZN(n449) );
  XNOR2_X1 U51 ( .A(n452), .B(n449), .ZN(n446) );
  NAND2_X1 U52 ( .A1(da0ca0ba0aa0[3]), .A2(ha0ga0fa0ea0[3]), .ZN(n443) );
  NAND2_X1 U53 ( .A1(da0ca0ba0aa0[0]), .A2(ha0ga0fa0ea0[1]), .ZN(n441) );
  NAND2_X1 U54 ( .A1(ha0ga0fa0ea0[0]), .A2(da0ca0ba0aa0[1]), .ZN(n440) );
  XNOR2_X1 U55 ( .A(n441), .B(n440), .ZN(n442) );
  XNOR2_X1 U56 ( .A(n455), .B(n442), .ZN(n537) );
  XNOR2_X1 U57 ( .A(n443), .B(n537), .ZN(n444) );
  XOR2_X1 U58 ( .A(n444), .B(db0cb0bb0ab0[0]), .Z(n445) );
  XNOR2_X1 U59 ( .A(n446), .B(n445), .ZN(N0) );
  NAND2_X1 U60 ( .A1(ha0ga0fa0ea0[2]), .A2(da0ca0ba0aa0[3]), .ZN(n448) );
  NAND2_X1 U61 ( .A1(ha0ga0fa0ea0[3]), .A2(da0ca0ba0aa0[2]), .ZN(n447) );
  XOR2_X1 U62 ( .A(n448), .B(n447), .Z(n451) );
  NAND2_X1 U63 ( .A1(ha0ga0fa0ea0[1]), .A2(da0ca0ba0aa0[1]), .ZN(n450) );
  XNOR2_X1 U64 ( .A(n450), .B(n449), .ZN(n536) );
  XNOR2_X1 U65 ( .A(n451), .B(n536), .ZN(n738) );
  XOR2_X1 U66 ( .A(n452), .B(n738), .Z(n454) );
  INV_X1 U67 ( .A(db0cb0bb0ab0[2]), .ZN(n777) );
  XOR2_X1 U68 ( .A(da0ca0ba0aa0[0]), .B(n777), .Z(n453) );
  XNOR2_X1 U69 ( .A(n454), .B(n453), .ZN(n456) );
  XNOR2_X1 U70 ( .A(n456), .B(n455), .ZN(N8) );
  INV_X1 U71 ( .A(db1cb1bb1ab1[0]), .ZN(n652) );
  XOR2_X1 U72 ( .A(n652), .B(db1cb1bb1ab1[2]), .Z(n458) );
  INV_X1 U73 ( .A(hb0gb0fb0eb0[0]), .ZN(n495) );
  XOR2_X1 U74 ( .A(n495), .B(hb0gb0fb0eb0[2]), .Z(n457) );
  NOR2_X1 U75 ( .A1(n458), .A2(n457), .ZN(n487) );
  NAND2_X1 U76 ( .A1(hb0gb0fb0eb0[1]), .A2(db1cb1bb1ab1[0]), .ZN(n461) );
  INV_X1 U77 ( .A(db1cb1bb1ab1[1]), .ZN(n689) );
  NAND2_X1 U78 ( .A1(n689), .A2(hb0gb0fb0eb0[0]), .ZN(n459) );
  NAND2_X1 U79 ( .A1(hb0gb0fb0eb0[3]), .A2(db1cb1bb1ab1[3]), .ZN(n482) );
  XNOR2_X1 U80 ( .A(n459), .B(n482), .ZN(n460) );
  XNOR2_X1 U81 ( .A(n461), .B(n460), .ZN(n771) );
  XNOR2_X1 U82 ( .A(n487), .B(n771), .ZN(n462) );
  INV_X1 U83 ( .A(db1cb1bb1ab1[3]), .ZN(n665) );
  XOR2_X1 U84 ( .A(n665), .B(da0ca0ba0aa0[0]), .Z(n655) );
  XNOR2_X1 U85 ( .A(n462), .B(n655), .ZN(n465) );
  NAND2_X1 U86 ( .A1(hb0gb0fb0eb0[1]), .A2(db1cb1bb1ab1[3]), .ZN(n464) );
  NAND2_X1 U87 ( .A1(db1cb1bb1ab1[1]), .A2(hb0gb0fb0eb0[3]), .ZN(n463) );
  XNOR2_X1 U88 ( .A(n464), .B(n463), .ZN(n472) );
  XNOR2_X1 U89 ( .A(n465), .B(n472), .ZN(N18) );
  NAND2_X1 U90 ( .A1(db1cb1bb1ab1[2]), .A2(hb0gb0fb0eb0[1]), .ZN(n467) );
  NAND2_X1 U91 ( .A1(hb0gb0fb0eb0[0]), .A2(db1cb1bb1ab1[3]), .ZN(n466) );
  XOR2_X1 U92 ( .A(n467), .B(n466), .Z(n471) );
  NAND2_X1 U93 ( .A1(hb0gb0fb0eb0[2]), .A2(db1cb1bb1ab1[1]), .ZN(n469) );
  NAND2_X1 U94 ( .A1(hb0gb0fb0eb0[3]), .A2(db1cb1bb1ab1[0]), .ZN(n468) );
  XNOR2_X1 U95 ( .A(n469), .B(n468), .ZN(n470) );
  XNOR2_X1 U96 ( .A(n471), .B(n470), .ZN(n770) );
  NOR2_X1 U97 ( .A1(hb0gb0fb0eb0[1]), .A2(n689), .ZN(n474) );
  INV_X1 U98 ( .A(n474), .ZN(n473) );
  NAND2_X1 U99 ( .A1(n473), .A2(n472), .ZN(n476) );
  NAND2_X1 U100 ( .A1(hb0gb0fb0eb0[3]), .A2(n474), .ZN(n475) );
  NAND2_X1 U101 ( .A1(n476), .A2(n475), .ZN(n477) );
  XOR2_X1 U102 ( .A(n477), .B(n652), .Z(n766) );
  XNOR2_X1 U103 ( .A(hb0gb0fb0eb0[1]), .B(n766), .ZN(n481) );
  NAND2_X1 U104 ( .A1(db1cb1bb1ab1[3]), .A2(hb0gb0fb0eb0[2]), .ZN(n479) );
  NAND2_X1 U105 ( .A1(db1cb1bb1ab1[2]), .A2(hb0gb0fb0eb0[3]), .ZN(n478) );
  XOR2_X1 U106 ( .A(n479), .B(n478), .Z(n480) );
  XNOR2_X1 U107 ( .A(n481), .B(n480), .ZN(n491) );
  XNOR2_X1 U108 ( .A(n770), .B(n491), .ZN(n486) );
  NOR2_X1 U109 ( .A1(n495), .A2(db1cb1bb1ab1[0]), .ZN(n484) );
  XOR2_X1 U110 ( .A(n482), .B(da0ca0ba0aa0[1]), .Z(n483) );
  XNOR2_X1 U111 ( .A(n484), .B(n483), .ZN(n485) );
  XNOR2_X1 U112 ( .A(n486), .B(n485), .ZN(N22) );
  XOR2_X1 U113 ( .A(n487), .B(da0ca0ba0aa0[2]), .Z(n489) );
  XOR2_X1 U114 ( .A(hb0gb0fb0eb0[3]), .B(n665), .Z(n488) );
  XNOR2_X1 U115 ( .A(n489), .B(n488), .ZN(n490) );
  XOR2_X1 U116 ( .A(n491), .B(n490), .Z(N26) );
  NAND2_X1 U117 ( .A1(hb0gb0fb0eb0[3]), .A2(db0cb0bb0ab0[3]), .ZN(n504) );
  NAND2_X1 U118 ( .A1(hb0gb0fb0eb0[0]), .A2(db0cb0bb0ab0[0]), .ZN(n508) );
  NAND2_X1 U119 ( .A1(db0cb0bb0ab0[3]), .A2(hb0gb0fb0eb0[1]), .ZN(n493) );
  NAND2_X1 U120 ( .A1(db0cb0bb0ab0[1]), .A2(hb0gb0fb0eb0[3]), .ZN(n492) );
  XOR2_X1 U121 ( .A(n493), .B(n492), .Z(n548) );
  NAND2_X1 U122 ( .A1(hb0gb0fb0eb0[2]), .A2(db0cb0bb0ab0[2]), .ZN(n494) );
  XNOR2_X1 U123 ( .A(n548), .B(n494), .ZN(n749) );
  NOR2_X1 U124 ( .A1(n777), .A2(n495), .ZN(n497) );
  NAND2_X1 U125 ( .A1(db0cb0bb0ab0[0]), .A2(hb0gb0fb0eb0[2]), .ZN(n496) );
  XOR2_X1 U126 ( .A(n497), .B(n496), .Z(n498) );
  XNOR2_X1 U127 ( .A(n749), .B(n498), .ZN(n510) );
  XNOR2_X1 U128 ( .A(n508), .B(n510), .ZN(n502) );
  NAND2_X1 U129 ( .A1(db0cb0bb0ab0[0]), .A2(hb0gb0fb0eb0[1]), .ZN(n500) );
  NAND2_X1 U130 ( .A1(hb0gb0fb0eb0[0]), .A2(db0cb0bb0ab0[1]), .ZN(n499) );
  XOR2_X1 U131 ( .A(n500), .B(n499), .Z(n753) );
  XNOR2_X1 U132 ( .A(da0ca0ba0aa0[0]), .B(n753), .ZN(n501) );
  XNOR2_X1 U133 ( .A(n502), .B(n501), .ZN(n503) );
  XNOR2_X1 U134 ( .A(n504), .B(n503), .ZN(N16) );
  NAND2_X1 U135 ( .A1(db0cb0bb0ab0[2]), .A2(hb0gb0fb0eb0[3]), .ZN(n506) );
  NAND2_X1 U136 ( .A1(hb0gb0fb0eb0[2]), .A2(db0cb0bb0ab0[3]), .ZN(n505) );
  XOR2_X1 U137 ( .A(n506), .B(n505), .Z(n507) );
  NAND2_X1 U138 ( .A1(db0cb0bb0ab0[1]), .A2(hb0gb0fb0eb0[1]), .ZN(n751) );
  XNOR2_X1 U139 ( .A(n507), .B(n751), .ZN(n509) );
  XNOR2_X1 U140 ( .A(n509), .B(n508), .ZN(n550) );
  XOR2_X1 U141 ( .A(n510), .B(n550), .Z(n512) );
  XOR2_X1 U142 ( .A(da0ca0ba0aa0[2]), .B(n705), .Z(n511) );
  XNOR2_X1 U143 ( .A(n512), .B(n511), .ZN(N24) );
  NAND2_X1 U144 ( .A1(da0ca0ba0aa0[3]), .A2(ha1ga1fa1ea1[0]), .ZN(n514) );
  NAND2_X1 U145 ( .A1(da0ca0ba0aa0[1]), .A2(ha1ga1fa1ea1[2]), .ZN(n513) );
  XOR2_X1 U146 ( .A(n514), .B(n513), .Z(n515) );
  XNOR2_X1 U147 ( .A(n516), .B(n515), .ZN(n520) );
  NAND2_X1 U148 ( .A1(da0ca0ba0aa0[0]), .A2(ha1ga1fa1ea1[3]), .ZN(n518) );
  NAND2_X1 U149 ( .A1(da0ca0ba0aa0[2]), .A2(ha1ga1fa1ea1[1]), .ZN(n517) );
  XOR2_X1 U150 ( .A(n518), .B(n517), .Z(n519) );
  XNOR2_X1 U151 ( .A(n520), .B(n519), .ZN(n731) );
  XNOR2_X1 U152 ( .A(n731), .B(n521), .ZN(n528) );
  NAND2_X1 U153 ( .A1(ha1ga1fa1ea1[1]), .A2(da0ca0ba0aa0[1]), .ZN(n524) );
  INV_X1 U154 ( .A(ha1ga1fa1ea1[3]), .ZN(n589) );
  XOR2_X1 U155 ( .A(n589), .B(da0ca0ba0aa0[2]), .Z(n522) );
  XOR2_X1 U156 ( .A(db0cb0bb0ab0[3]), .B(da0ca0ba0aa0[1]), .Z(n724) );
  XNOR2_X1 U157 ( .A(n522), .B(n724), .ZN(n523) );
  XNOR2_X1 U158 ( .A(n524), .B(n523), .ZN(n526) );
  NAND2_X1 U159 ( .A1(da0ca0ba0aa0[2]), .A2(ha1ga1fa1ea1[2]), .ZN(n525) );
  XNOR2_X1 U160 ( .A(n526), .B(n525), .ZN(n527) );
  XNOR2_X1 U161 ( .A(n528), .B(n527), .ZN(N13) );
  NAND2_X1 U162 ( .A1(ha0ga0fa0ea0[2]), .A2(da0ca0ba0aa0[1]), .ZN(n535) );
  XOR2_X1 U163 ( .A(ha0ga0fa0ea0[0]), .B(ha0ga0fa0ea0[3]), .Z(n529) );
  NAND2_X1 U164 ( .A1(n529), .A2(da0ca0ba0aa0[3]), .ZN(n533) );
  NAND2_X1 U165 ( .A1(ha0ga0fa0ea0[3]), .A2(da0ca0ba0aa0[0]), .ZN(n531) );
  NAND2_X1 U166 ( .A1(ha0ga0fa0ea0[1]), .A2(da0ca0ba0aa0[2]), .ZN(n530) );
  XNOR2_X1 U167 ( .A(n531), .B(n530), .ZN(n532) );
  XNOR2_X1 U168 ( .A(n533), .B(n532), .ZN(n534) );
  XNOR2_X1 U169 ( .A(n535), .B(n534), .ZN(n742) );
  XNOR2_X1 U170 ( .A(n536), .B(n742), .ZN(n538) );
  XNOR2_X1 U171 ( .A(n538), .B(n537), .ZN(n539) );
  XNOR2_X1 U172 ( .A(n724), .B(n539), .ZN(N12) );
  NAND2_X1 U173 ( .A1(db0cb0bb0ab0[2]), .A2(hb0gb0fb0eb0[1]), .ZN(n541) );
  NAND2_X1 U174 ( .A1(hb0gb0fb0eb0[0]), .A2(db0cb0bb0ab0[3]), .ZN(n540) );
  XOR2_X1 U175 ( .A(n541), .B(n540), .Z(n546) );
  XNOR2_X1 U176 ( .A(db0cb0bb0ab0[3]), .B(n705), .ZN(n542) );
  NAND2_X1 U177 ( .A1(n542), .A2(hb0gb0fb0eb0[3]), .ZN(n544) );
  NAND2_X1 U178 ( .A1(hb0gb0fb0eb0[2]), .A2(db0cb0bb0ab0[1]), .ZN(n543) );
  XNOR2_X1 U179 ( .A(n544), .B(n543), .ZN(n545) );
  XNOR2_X1 U180 ( .A(n546), .B(n545), .ZN(n750) );
  XOR2_X1 U181 ( .A(n724), .B(n750), .Z(n547) );
  XNOR2_X1 U182 ( .A(n548), .B(n547), .ZN(n549) );
  XNOR2_X1 U183 ( .A(n550), .B(n549), .ZN(N20) );
  NAND2_X1 U184 ( .A1(ha1ga1fa1ea1[2]), .A2(da1ca1ba1aa1[2]), .ZN(n553) );
  NAND2_X1 U185 ( .A1(da1ca1ba1aa1[1]), .A2(ha1ga1fa1ea1[3]), .ZN(n552) );
  NAND2_X1 U186 ( .A1(da1ca1ba1aa1[3]), .A2(ha1ga1fa1ea1[1]), .ZN(n551) );
  XOR2_X1 U187 ( .A(n552), .B(n551), .Z(n588) );
  XNOR2_X1 U188 ( .A(n553), .B(n588), .ZN(n568) );
  INV_X1 U189 ( .A(da1ca1ba1aa1[0]), .ZN(n617) );
  NOR2_X1 U190 ( .A1(n617), .A2(n576), .ZN(n573) );
  INV_X1 U191 ( .A(da1ca1ba1aa1[1]), .ZN(n635) );
  NOR2_X1 U192 ( .A1(n635), .A2(n576), .ZN(n555) );
  INV_X1 U193 ( .A(ha1ga1fa1ea1[1]), .ZN(n733) );
  NOR2_X1 U194 ( .A1(n617), .A2(n733), .ZN(n554) );
  NOR2_X1 U195 ( .A1(n555), .A2(n554), .ZN(n557) );
  NOR2_X1 U196 ( .A1(n573), .A2(n557), .ZN(n560) );
  INV_X1 U197 ( .A(n573), .ZN(n558) );
  NAND2_X1 U198 ( .A1(ha1ga1fa1ea1[1]), .A2(da1ca1ba1aa1[1]), .ZN(n571) );
  NOR2_X1 U199 ( .A1(n558), .A2(n571), .ZN(n556) );
  NOR2_X1 U200 ( .A1(n557), .A2(n556), .ZN(n599) );
  NOR2_X1 U201 ( .A1(n599), .A2(n558), .ZN(n559) );
  NOR2_X1 U202 ( .A1(n560), .A2(n559), .ZN(n563) );
  NOR2_X1 U203 ( .A1(n617), .A2(ha1ga1fa1ea1[2]), .ZN(n562) );
  NAND2_X1 U204 ( .A1(da1ca1ba1aa1[2]), .A2(ha1ga1fa1ea1[0]), .ZN(n561) );
  XOR2_X1 U205 ( .A(n562), .B(n561), .Z(n595) );
  XNOR2_X1 U206 ( .A(n563), .B(n595), .ZN(n564) );
  XNOR2_X1 U207 ( .A(n705), .B(n564), .ZN(n566) );
  NAND2_X1 U208 ( .A1(da1ca1ba1aa1[3]), .A2(n589), .ZN(n565) );
  XNOR2_X1 U209 ( .A(n566), .B(n565), .ZN(n567) );
  XNOR2_X1 U210 ( .A(n568), .B(n567), .ZN(N3) );
  NAND2_X1 U211 ( .A1(ha1ga1fa1ea1[2]), .A2(da1ca1ba1aa1[3]), .ZN(n570) );
  NAND2_X1 U212 ( .A1(ha1ga1fa1ea1[3]), .A2(da1ca1ba1aa1[2]), .ZN(n569) );
  XOR2_X1 U213 ( .A(n570), .B(n569), .Z(n572) );
  XNOR2_X1 U214 ( .A(n572), .B(n571), .ZN(n574) );
  XOR2_X1 U215 ( .A(n574), .B(n573), .Z(n592) );
  XOR2_X1 U216 ( .A(n592), .B(n588), .Z(n587) );
  INV_X1 U217 ( .A(db0cb0bb0ab0[1]), .ZN(n734) );
  NAND2_X1 U218 ( .A1(da1ca1ba1aa1[2]), .A2(ha1ga1fa1ea1[1]), .ZN(n585) );
  NAND2_X1 U219 ( .A1(ha1ga1fa1ea1[2]), .A2(da1ca1ba1aa1[1]), .ZN(n579) );
  NAND2_X1 U220 ( .A1(ha1ga1fa1ea1[3]), .A2(da1ca1ba1aa1[0]), .ZN(n575) );
  XNOR2_X1 U221 ( .A(n579), .B(n575), .ZN(n577) );
  XOR2_X1 U222 ( .A(n577), .B(n576), .Z(n578) );
  INV_X1 U223 ( .A(da1ca1ba1aa1[3]), .ZN(n640) );
  NAND2_X1 U224 ( .A1(n578), .A2(n640), .ZN(n583) );
  NOR2_X1 U225 ( .A1(n589), .A2(da1ca1ba1aa1[0]), .ZN(n580) );
  XNOR2_X1 U226 ( .A(n580), .B(n579), .ZN(n581) );
  NAND2_X1 U227 ( .A1(da1ca1ba1aa1[3]), .A2(n581), .ZN(n582) );
  NAND2_X1 U228 ( .A1(n583), .A2(n582), .ZN(n584) );
  XNOR2_X1 U229 ( .A(n585), .B(n584), .ZN(n598) );
  XOR2_X1 U230 ( .A(n734), .B(n598), .Z(n586) );
  XNOR2_X1 U231 ( .A(n587), .B(n586), .ZN(N7) );
  XOR2_X1 U232 ( .A(n589), .B(n588), .Z(n591) );
  NOR2_X1 U233 ( .A1(n779), .A2(da1ca1ba1aa1[2]), .ZN(n590) );
  XNOR2_X1 U234 ( .A(n591), .B(n590), .ZN(n597) );
  XNOR2_X1 U235 ( .A(n777), .B(n597), .ZN(n594) );
  XOR2_X1 U236 ( .A(n733), .B(n592), .Z(n593) );
  XNOR2_X1 U237 ( .A(n594), .B(n593), .ZN(n596) );
  XNOR2_X1 U238 ( .A(n596), .B(n595), .ZN(N11) );
  XNOR2_X1 U239 ( .A(n598), .B(n597), .ZN(n603) );
  XOR2_X1 U240 ( .A(n599), .B(db0cb0bb0ab0[3]), .Z(n601) );
  NAND2_X1 U241 ( .A1(da1ca1ba1aa1[1]), .A2(n733), .ZN(n600) );
  XNOR2_X1 U242 ( .A(n601), .B(n600), .ZN(n602) );
  XNOR2_X1 U243 ( .A(n603), .B(n602), .ZN(N15) );
  NAND2_X1 U244 ( .A1(da1ca1ba1aa1[3]), .A2(ha0ga0fa0ea0[3]), .ZN(n618) );
  NAND2_X1 U245 ( .A1(ha0ga0fa0ea0[0]), .A2(da1ca1ba1aa1[2]), .ZN(n606) );
  XNOR2_X1 U246 ( .A(ha0ga0fa0ea0[0]), .B(ha0ga0fa0ea0[2]), .ZN(n604) );
  NOR2_X1 U247 ( .A1(n604), .A2(n617), .ZN(n605) );
  XNOR2_X1 U248 ( .A(n606), .B(n605), .ZN(n638) );
  XNOR2_X1 U249 ( .A(n618), .B(n638), .ZN(n614) );
  NAND2_X1 U250 ( .A1(ha0ga0fa0ea0[3]), .A2(da1ca1ba1aa1[1]), .ZN(n608) );
  NAND2_X1 U251 ( .A1(ha0ga0fa0ea0[1]), .A2(da1ca1ba1aa1[3]), .ZN(n607) );
  XOR2_X1 U252 ( .A(n608), .B(n607), .Z(n630) );
  NAND2_X1 U253 ( .A1(da1ca1ba1aa1[2]), .A2(ha0ga0fa0ea0[2]), .ZN(n609) );
  XNOR2_X1 U254 ( .A(n630), .B(n609), .ZN(n644) );
  NAND2_X1 U255 ( .A1(da1ca1ba1aa1[0]), .A2(ha0ga0fa0ea0[1]), .ZN(n611) );
  NAND2_X1 U256 ( .A1(ha0ga0fa0ea0[0]), .A2(da1ca1ba1aa1[1]), .ZN(n610) );
  XNOR2_X1 U257 ( .A(n611), .B(n610), .ZN(n612) );
  XNOR2_X1 U258 ( .A(n644), .B(n612), .ZN(n647) );
  XNOR2_X1 U259 ( .A(ha0ga0fa0ea0[0]), .B(n647), .ZN(n613) );
  XNOR2_X1 U260 ( .A(n614), .B(n613), .ZN(n616) );
  XOR2_X1 U261 ( .A(n640), .B(db0cb0bb0ab0[0]), .Z(n615) );
  XNOR2_X1 U262 ( .A(n616), .B(n615), .ZN(N2) );
  OR2_X1 U263 ( .A1(n617), .A2(ha0ga0fa0ea0[3]), .ZN(n619) );
  NAND2_X1 U264 ( .A1(n619), .A2(n618), .ZN(n626) );
  XNOR2_X1 U265 ( .A(ha0ga0fa0ea0[1]), .B(ha0ga0fa0ea0[2]), .ZN(n620) );
  NAND2_X1 U266 ( .A1(n620), .A2(da1ca1ba1aa1[1]), .ZN(n624) );
  NAND2_X1 U267 ( .A1(ha0ga0fa0ea0[1]), .A2(da1ca1ba1aa1[2]), .ZN(n622) );
  NAND2_X1 U268 ( .A1(ha0ga0fa0ea0[0]), .A2(n640), .ZN(n621) );
  XOR2_X1 U269 ( .A(n622), .B(n621), .Z(n623) );
  XNOR2_X1 U270 ( .A(n624), .B(n623), .ZN(n625) );
  XNOR2_X1 U271 ( .A(n626), .B(n625), .ZN(n648) );
  XNOR2_X1 U272 ( .A(n734), .B(n648), .ZN(n628) );
  NAND2_X1 U273 ( .A1(ha0ga0fa0ea0[0]), .A2(da1ca1ba1aa1[0]), .ZN(n627) );
  XNOR2_X1 U274 ( .A(n628), .B(n627), .ZN(n629) );
  XNOR2_X1 U275 ( .A(n630), .B(n629), .ZN(n634) );
  NAND2_X1 U276 ( .A1(ha0ga0fa0ea0[2]), .A2(da1ca1ba1aa1[3]), .ZN(n632) );
  NAND2_X1 U277 ( .A1(ha0ga0fa0ea0[3]), .A2(da1ca1ba1aa1[2]), .ZN(n631) );
  XOR2_X1 U278 ( .A(n632), .B(n631), .Z(n633) );
  XNOR2_X1 U279 ( .A(ha0ga0fa0ea0[1]), .B(n633), .ZN(n645) );
  XNOR2_X1 U280 ( .A(n634), .B(n645), .ZN(N6) );
  XOR2_X1 U281 ( .A(da1ca1ba1aa1[0]), .B(ha0ga0fa0ea0[3]), .Z(n637) );
  NOR2_X1 U282 ( .A1(n635), .A2(ha0ga0fa0ea0[1]), .ZN(n636) );
  XNOR2_X1 U283 ( .A(n637), .B(n636), .ZN(n639) );
  XOR2_X1 U284 ( .A(n639), .B(n638), .Z(n642) );
  XOR2_X1 U285 ( .A(n640), .B(db0cb0bb0ab0[2]), .Z(n641) );
  XNOR2_X1 U286 ( .A(n642), .B(n641), .ZN(n643) );
  XNOR2_X1 U287 ( .A(n644), .B(n643), .ZN(n646) );
  XNOR2_X1 U288 ( .A(n646), .B(n645), .ZN(N10) );
  XOR2_X1 U289 ( .A(n648), .B(n647), .Z(n650) );
  XNOR2_X1 U290 ( .A(da1ca1ba1aa1[2]), .B(ha0ga0fa0ea0[2]), .ZN(n649) );
  XNOR2_X1 U291 ( .A(n650), .B(n649), .ZN(n651) );
  XNOR2_X1 U292 ( .A(db0cb0bb0ab0[3]), .B(n651), .ZN(N14) );
  NOR2_X1 U293 ( .A1(hb1gb1fb1eb1[2]), .A2(n652), .ZN(n654) );
  NAND2_X1 U294 ( .A1(db1cb1bb1ab1[2]), .A2(hb1gb1fb1eb1[0]), .ZN(n653) );
  XNOR2_X1 U295 ( .A(n654), .B(n653), .ZN(n679) );
  XNOR2_X1 U296 ( .A(n655), .B(n679), .ZN(n664) );
  NAND2_X1 U297 ( .A1(hb1gb1fb1eb1[1]), .A2(db1cb1bb1ab1[3]), .ZN(n657) );
  NAND2_X1 U298 ( .A1(hb1gb1fb1eb1[3]), .A2(db1cb1bb1ab1[1]), .ZN(n656) );
  XOR2_X1 U299 ( .A(n657), .B(n656), .Z(n688) );
  NAND2_X1 U300 ( .A1(db1cb1bb1ab1[0]), .A2(hb1gb1fb1eb1[0]), .ZN(n658) );
  XNOR2_X1 U301 ( .A(n688), .B(n658), .ZN(n675) );
  NAND2_X1 U302 ( .A1(hb1gb1fb1eb1[0]), .A2(db1cb1bb1ab1[1]), .ZN(n660) );
  NAND2_X1 U303 ( .A1(hb1gb1fb1eb1[1]), .A2(db1cb1bb1ab1[0]), .ZN(n659) );
  XOR2_X1 U304 ( .A(n660), .B(n659), .Z(n661) );
  NAND2_X1 U305 ( .A1(db1cb1bb1ab1[3]), .A2(hb1gb1fb1eb1[3]), .ZN(n676) );
  XNOR2_X1 U306 ( .A(n661), .B(n676), .ZN(n662) );
  NAND2_X1 U307 ( .A1(db1cb1bb1ab1[2]), .A2(hb1gb1fb1eb1[2]), .ZN(n683) );
  XNOR2_X1 U308 ( .A(n662), .B(n683), .ZN(n687) );
  XNOR2_X1 U309 ( .A(n675), .B(n687), .ZN(n663) );
  XNOR2_X1 U310 ( .A(n664), .B(n663), .ZN(N19) );
  NAND2_X1 U311 ( .A1(hb1gb1fb1eb1[1]), .A2(db1cb1bb1ab1[2]), .ZN(n667) );
  NAND2_X1 U312 ( .A1(hb1gb1fb1eb1[0]), .A2(n665), .ZN(n666) );
  XOR2_X1 U313 ( .A(n667), .B(n666), .Z(n671) );
  XNOR2_X1 U314 ( .A(hb1gb1fb1eb1[1]), .B(hb1gb1fb1eb1[2]), .ZN(n714) );
  NOR2_X1 U315 ( .A1(n689), .A2(n714), .ZN(n669) );
  NAND2_X1 U316 ( .A1(hb1gb1fb1eb1[3]), .A2(db1cb1bb1ab1[0]), .ZN(n668) );
  XOR2_X1 U317 ( .A(n669), .B(n668), .Z(n670) );
  XNOR2_X1 U318 ( .A(n671), .B(n670), .ZN(n695) );
  NAND2_X1 U319 ( .A1(db1cb1bb1ab1[2]), .A2(hb1gb1fb1eb1[3]), .ZN(n673) );
  NAND2_X1 U320 ( .A1(hb1gb1fb1eb1[2]), .A2(db1cb1bb1ab1[3]), .ZN(n672) );
  XNOR2_X1 U321 ( .A(n673), .B(n672), .ZN(n674) );
  XNOR2_X1 U322 ( .A(n675), .B(n674), .ZN(n684) );
  XNOR2_X1 U323 ( .A(n695), .B(n684), .ZN(n677) );
  XNOR2_X1 U324 ( .A(n677), .B(n676), .ZN(n678) );
  XNOR2_X1 U325 ( .A(da0ca0ba0aa0[1]), .B(n678), .ZN(N23) );
  XNOR2_X1 U326 ( .A(hb1gb1fb1eb1[3]), .B(hb1gb1fb1eb1[2]), .ZN(n690) );
  XNOR2_X1 U327 ( .A(n690), .B(n679), .ZN(n681) );
  NAND2_X1 U328 ( .A1(n689), .A2(hb1gb1fb1eb1[1]), .ZN(n680) );
  XNOR2_X1 U329 ( .A(n681), .B(n680), .ZN(n682) );
  XNOR2_X1 U330 ( .A(n683), .B(n682), .ZN(n686) );
  XNOR2_X1 U331 ( .A(da0ca0ba0aa0[2]), .B(n684), .ZN(n685) );
  XNOR2_X1 U332 ( .A(n686), .B(n685), .ZN(N27) );
  XNOR2_X1 U333 ( .A(n688), .B(n687), .ZN(n693) );
  XOR2_X1 U334 ( .A(n689), .B(da0ca0ba0aa0[3]), .Z(n691) );
  XNOR2_X1 U335 ( .A(n691), .B(n690), .ZN(n692) );
  XNOR2_X1 U336 ( .A(n693), .B(n692), .ZN(n694) );
  XNOR2_X1 U337 ( .A(n695), .B(n694), .ZN(N31) );
  NAND2_X1 U338 ( .A1(hb1gb1fb1eb1[3]), .A2(db0cb0bb0ab0[3]), .ZN(n699) );
  NAND2_X1 U339 ( .A1(hb1gb1fb1eb1[1]), .A2(db0cb0bb0ab0[3]), .ZN(n697) );
  NAND2_X1 U340 ( .A1(hb1gb1fb1eb1[3]), .A2(db0cb0bb0ab0[1]), .ZN(n696) );
  XNOR2_X1 U341 ( .A(n697), .B(n696), .ZN(n698) );
  XOR2_X1 U342 ( .A(n705), .B(n698), .Z(n758) );
  XNOR2_X1 U343 ( .A(n699), .B(n758), .ZN(n713) );
  NAND2_X1 U344 ( .A1(db0cb0bb0ab0[0]), .A2(hb1gb1fb1eb1[1]), .ZN(n701) );
  NAND2_X1 U345 ( .A1(hb1gb1fb1eb1[0]), .A2(db0cb0bb0ab0[1]), .ZN(n700) );
  XNOR2_X1 U346 ( .A(n701), .B(n700), .ZN(n747) );
  XNOR2_X1 U347 ( .A(n713), .B(n747), .ZN(n709) );
  XOR2_X1 U348 ( .A(n705), .B(n777), .Z(n702) );
  NAND2_X1 U349 ( .A1(n702), .A2(hb1gb1fb1eb1[2]), .ZN(n704) );
  NAND2_X1 U350 ( .A1(db0cb0bb0ab0[2]), .A2(hb1gb1fb1eb1[0]), .ZN(n703) );
  XOR2_X1 U351 ( .A(n704), .B(n703), .Z(n760) );
  XNOR2_X1 U352 ( .A(da0ca0ba0aa0[0]), .B(n760), .ZN(n707) );
  NAND2_X1 U353 ( .A1(hb1gb1fb1eb1[0]), .A2(n705), .ZN(n706) );
  XNOR2_X1 U354 ( .A(n707), .B(n706), .ZN(n708) );
  XNOR2_X1 U355 ( .A(n709), .B(n708), .ZN(N17) );
  NAND2_X1 U356 ( .A1(db0cb0bb0ab0[0]), .A2(hb1gb1fb1eb1[3]), .ZN(n711) );
  NAND2_X1 U357 ( .A1(hb1gb1fb1eb1[0]), .A2(db0cb0bb0ab0[3]), .ZN(n710) );
  XOR2_X1 U358 ( .A(n711), .B(n710), .Z(n712) );
  XNOR2_X1 U359 ( .A(n713), .B(n712), .ZN(n718) );
  NOR2_X1 U360 ( .A1(n734), .A2(n714), .ZN(n716) );
  NAND2_X1 U361 ( .A1(db0cb0bb0ab0[2]), .A2(hb1gb1fb1eb1[1]), .ZN(n715) );
  XNOR2_X1 U362 ( .A(n716), .B(n715), .ZN(n717) );
  XNOR2_X1 U363 ( .A(n718), .B(n717), .ZN(n743) );
  NAND2_X1 U364 ( .A1(db0cb0bb0ab0[3]), .A2(hb1gb1fb1eb1[2]), .ZN(n719) );
  XOR2_X1 U365 ( .A(n734), .B(n719), .Z(n723) );
  NAND2_X1 U366 ( .A1(db0cb0bb0ab0[0]), .A2(hb1gb1fb1eb1[0]), .ZN(n721) );
  NAND2_X1 U367 ( .A1(db0cb0bb0ab0[2]), .A2(hb1gb1fb1eb1[3]), .ZN(n720) );
  XNOR2_X1 U368 ( .A(n721), .B(n720), .ZN(n722) );
  XNOR2_X1 U369 ( .A(n723), .B(n722), .ZN(n759) );
  XOR2_X1 U370 ( .A(n743), .B(n759), .Z(n726) );
  XNOR2_X1 U371 ( .A(n724), .B(hb1gb1fb1eb1[1]), .ZN(n725) );
  XNOR2_X1 U372 ( .A(n726), .B(n725), .ZN(N21) );
  NAND2_X1 U373 ( .A1(da0ca0ba0aa0[1]), .A2(n733), .ZN(n730) );
  NAND2_X1 U374 ( .A1(ha1ga1fa1ea1[3]), .A2(da0ca0ba0aa0[2]), .ZN(n728) );
  NAND2_X1 U375 ( .A1(ha1ga1fa1ea1[2]), .A2(da0ca0ba0aa0[3]), .ZN(n727) );
  XOR2_X1 U376 ( .A(n728), .B(n727), .Z(n729) );
  XNOR2_X1 U377 ( .A(n730), .B(n729), .ZN(n773) );
  XNOR2_X1 U378 ( .A(n731), .B(n773), .ZN(n737) );
  NAND2_X1 U379 ( .A1(ha1ga1fa1ea1[0]), .A2(da0ca0ba0aa0[0]), .ZN(n732) );
  XOR2_X1 U380 ( .A(n733), .B(n732), .Z(n735) );
  XOR2_X1 U381 ( .A(n734), .B(da0ca0ba0aa0[3]), .Z(n752) );
  XNOR2_X1 U382 ( .A(n735), .B(n752), .ZN(n736) );
  XNOR2_X1 U383 ( .A(n737), .B(n736), .ZN(N5) );
  XNOR2_X1 U384 ( .A(n738), .B(n752), .ZN(n740) );
  XOR2_X1 U385 ( .A(n740), .B(n739), .Z(n741) );
  XNOR2_X1 U386 ( .A(n742), .B(n741), .ZN(N4) );
  XNOR2_X1 U387 ( .A(hb1gb1fb1eb1[3]), .B(n743), .ZN(n745) );
  NOR2_X1 U388 ( .A1(n777), .A2(hb1gb1fb1eb1[2]), .ZN(n744) );
  XNOR2_X1 U389 ( .A(n745), .B(n744), .ZN(n746) );
  XNOR2_X1 U390 ( .A(n746), .B(n752), .ZN(n748) );
  XNOR2_X1 U391 ( .A(n748), .B(n747), .ZN(N29) );
  XNOR2_X1 U392 ( .A(n750), .B(n749), .ZN(n756) );
  XNOR2_X1 U393 ( .A(n752), .B(n751), .ZN(n754) );
  XNOR2_X1 U394 ( .A(n754), .B(n753), .ZN(n755) );
  XNOR2_X1 U395 ( .A(n756), .B(n755), .ZN(N28) );
  XNOR2_X1 U396 ( .A(db0cb0bb0ab0[3]), .B(da0ca0ba0aa0[2]), .ZN(n757) );
  XNOR2_X1 U397 ( .A(n757), .B(hb1gb1fb1eb1[2]), .ZN(n763) );
  XNOR2_X1 U398 ( .A(n759), .B(n758), .ZN(n761) );
  XNOR2_X1 U399 ( .A(n761), .B(n760), .ZN(n762) );
  XOR2_X1 U400 ( .A(n763), .B(n762), .Z(n765) );
  NAND2_X1 U401 ( .A1(hb1gb1fb1eb1[1]), .A2(db0cb0bb0ab0[1]), .ZN(n764) );
  XNOR2_X1 U402 ( .A(n765), .B(n764), .ZN(n356) );
  XNOR2_X1 U403 ( .A(n766), .B(da0ca0ba0aa0[3]), .ZN(n768) );
  NOR2_X1 U404 ( .A1(hb0gb0fb0eb0[2]), .A2(db1cb1bb1ab1[2]), .ZN(n767) );
  XNOR2_X1 U405 ( .A(n768), .B(n767), .ZN(n769) );
  XNOR2_X1 U406 ( .A(n770), .B(n769), .ZN(n772) );
  XNOR2_X1 U407 ( .A(n772), .B(n771), .ZN(n355) );
  XNOR2_X1 U408 ( .A(n774), .B(n773), .ZN(n776) );
  XNOR2_X1 U409 ( .A(n776), .B(n775), .ZN(n778) );
  XNOR2_X1 U410 ( .A(n778), .B(n777), .ZN(n781) );
  XOR2_X1 U411 ( .A(n779), .B(da0ca0ba0aa0[3]), .Z(n780) );
  XNOR2_X1 U412 ( .A(n781), .B(n780), .ZN(n354) );
endmodule


module GF4MulXorSqSc_Unit ( clk, da0ca0ba0aa0, da1ca1ba1aa1, ra3ra2ra1ra0, xa, 
        ya, za, ta, db0cb0bb0ab0, db1cb1bb1ab1, rb3rb2rb1rb0, xb, yb, zb, tb, 
        random );
  input [3:0] da0ca0ba0aa0;
  input [3:0] da1ca1ba1aa1;
  input [3:0] ra3ra2ra1ra0;
  output [1:0] xa;
  output [1:0] ya;
  output [1:0] za;
  output [1:0] ta;
  input [3:0] db0cb0bb0ab0;
  input [3:0] db1cb1bb1ab1;
  input [3:0] rb3rb2rb1rb0;
  output [1:0] xb;
  output [1:0] yb;
  output [1:0] zb;
  output [1:0] tb;
  input [7:0] random;
  input clk;
  wire   N0, N1, N3, N4, N5, N7, N8, N9, N11, N12, N13, N15, N16, N17, N19,
         N20, N21, N23, N24, N25, N27, N28, N29, N31, n95, n96, n97, n98, n99,
         n100, n101, n102, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237;
  wire   [3:0] xa_r;
  wire   [3:0] ya_r;
  wire   [3:0] za_r;
  wire   [3:0] ta_r;
  wire   [3:0] xb_r;
  wire   [3:0] yb_r;
  wire   [3:0] zb_r;
  wire   [3:0] tb_r;

  DFF_X1 \xa_r_reg[3]  ( .D(N3), .CK(clk), .Q(xa_r[3]) );
  DFF_X1 \xa_r_reg[2]  ( .D(n97), .CK(clk), .Q(xa_r[2]) );
  DFF_X1 \xa_r_reg[1]  ( .D(N1), .CK(clk), .Q(xa_r[1]) );
  DFF_X1 \xa_r_reg[0]  ( .D(N0), .CK(clk), .Q(xa_r[0]) );
  DFF_X1 \ya_r_reg[3]  ( .D(N7), .CK(clk), .Q(ya_r[3]) );
  DFF_X1 \ya_r_reg[2]  ( .D(n95), .CK(clk), .Q(ya_r[2]) );
  DFF_X1 \ya_r_reg[1]  ( .D(N5), .CK(clk), .Q(ya_r[1]) );
  DFF_X1 \ya_r_reg[0]  ( .D(N4), .CK(clk), .Q(ya_r[0]) );
  DFF_X1 \za_r_reg[3]  ( .D(N11), .CK(clk), .Q(za_r[3]) );
  DFF_X1 \za_r_reg[2]  ( .D(n98), .CK(clk), .Q(za_r[2]) );
  DFF_X1 \za_r_reg[1]  ( .D(N9), .CK(clk), .Q(za_r[1]) );
  DFF_X1 \za_r_reg[0]  ( .D(N8), .CK(clk), .Q(za_r[0]) );
  DFF_X1 \ta_r_reg[3]  ( .D(N15), .CK(clk), .Q(ta_r[3]) );
  DFF_X1 \ta_r_reg[2]  ( .D(n96), .CK(clk), .Q(ta_r[2]) );
  DFF_X1 \ta_r_reg[1]  ( .D(N13), .CK(clk), .Q(ta_r[1]) );
  DFF_X1 \ta_r_reg[0]  ( .D(N12), .CK(clk), .Q(ta_r[0]) );
  DFF_X1 \xb_r_reg[3]  ( .D(N19), .CK(clk), .Q(xb_r[3]) );
  DFF_X1 \xb_r_reg[2]  ( .D(n99), .CK(clk), .Q(xb_r[2]) );
  DFF_X1 \xb_r_reg[1]  ( .D(N17), .CK(clk), .Q(xb_r[1]) );
  DFF_X1 \xb_r_reg[0]  ( .D(N16), .CK(clk), .Q(xb_r[0]) );
  DFF_X1 \yb_r_reg[3]  ( .D(N23), .CK(clk), .Q(yb_r[3]) );
  DFF_X1 \yb_r_reg[2]  ( .D(n100), .CK(clk), .Q(yb_r[2]) );
  DFF_X1 \yb_r_reg[1]  ( .D(N21), .CK(clk), .Q(yb_r[1]) );
  DFF_X1 \yb_r_reg[0]  ( .D(N20), .CK(clk), .Q(yb_r[0]) );
  DFF_X1 \zb_r_reg[3]  ( .D(N27), .CK(clk), .Q(zb_r[3]) );
  DFF_X1 \zb_r_reg[2]  ( .D(n101), .CK(clk), .Q(zb_r[2]) );
  DFF_X1 \zb_r_reg[1]  ( .D(N25), .CK(clk), .Q(zb_r[1]) );
  DFF_X1 \zb_r_reg[0]  ( .D(N24), .CK(clk), .Q(zb_r[0]) );
  DFF_X1 \tb_r_reg[3]  ( .D(N31), .CK(clk), .Q(tb_r[3]) );
  DFF_X1 \tb_r_reg[2]  ( .D(n102), .CK(clk), .Q(tb_r[2]) );
  DFF_X1 \tb_r_reg[1]  ( .D(N29), .CK(clk), .Q(tb_r[1]) );
  DFF_X1 \tb_r_reg[0]  ( .D(N28), .CK(clk), .Q(tb_r[0]) );
  XOR2_X1 U3 ( .A(zb_r[2]), .B(zb_r[3]), .Z(zb[1]) );
  XOR2_X1 U4 ( .A(zb_r[0]), .B(zb_r[1]), .Z(zb[0]) );
  XOR2_X1 U5 ( .A(za_r[2]), .B(za_r[3]), .Z(za[1]) );
  XOR2_X1 U6 ( .A(za_r[0]), .B(za_r[1]), .Z(za[0]) );
  XOR2_X1 U7 ( .A(yb_r[2]), .B(yb_r[3]), .Z(yb[1]) );
  XOR2_X1 U8 ( .A(yb_r[0]), .B(yb_r[1]), .Z(yb[0]) );
  XOR2_X1 U9 ( .A(ya_r[2]), .B(ya_r[3]), .Z(ya[1]) );
  XOR2_X1 U10 ( .A(ya_r[0]), .B(ya_r[1]), .Z(ya[0]) );
  XOR2_X1 U11 ( .A(xb_r[2]), .B(xb_r[3]), .Z(xb[1]) );
  XOR2_X1 U12 ( .A(xb_r[0]), .B(xb_r[1]), .Z(xb[0]) );
  XOR2_X1 U13 ( .A(xa_r[2]), .B(xa_r[3]), .Z(xa[1]) );
  XOR2_X1 U14 ( .A(xa_r[0]), .B(xa_r[1]), .Z(xa[0]) );
  XOR2_X1 U15 ( .A(tb_r[2]), .B(tb_r[3]), .Z(tb[1]) );
  XOR2_X1 U16 ( .A(tb_r[0]), .B(tb_r[1]), .Z(tb[0]) );
  XOR2_X1 U17 ( .A(ta_r[2]), .B(ta_r[3]), .Z(ta[1]) );
  XOR2_X1 U18 ( .A(ta_r[0]), .B(ta_r[1]), .Z(ta[0]) );
  INV_X1 U19 ( .A(da1ca1ba1aa1[3]), .ZN(n138) );
  NOR2_X1 U20 ( .A1(da1ca1ba1aa1[0]), .A2(n138), .ZN(n136) );
  NOR2_X1 U21 ( .A1(n136), .A2(da1ca1ba1aa1[2]), .ZN(n135) );
  INV_X1 U22 ( .A(da1ca1ba1aa1[0]), .ZN(n226) );
  NAND2_X1 U23 ( .A1(da1ca1ba1aa1[3]), .A2(da1ca1ba1aa1[2]), .ZN(n130) );
  NAND2_X1 U24 ( .A1(n226), .A2(n130), .ZN(n131) );
  NAND2_X1 U25 ( .A1(da1ca1ba1aa1[1]), .A2(n131), .ZN(n133) );
  NOR2_X1 U26 ( .A1(da1ca1ba1aa1[1]), .A2(da1ca1ba1aa1[0]), .ZN(n223) );
  NAND2_X1 U27 ( .A1(n223), .A2(n138), .ZN(n132) );
  NAND2_X1 U28 ( .A1(n133), .A2(n132), .ZN(n134) );
  NOR2_X1 U29 ( .A1(n135), .A2(n134), .ZN(n141) );
  XOR2_X1 U30 ( .A(rb3rb2rb1rb0[3]), .B(n141), .Z(N3) );
  NOR2_X1 U31 ( .A1(da1ca1ba1aa1[1]), .A2(da1ca1ba1aa1[2]), .ZN(n137) );
  XNOR2_X1 U32 ( .A(n137), .B(n136), .ZN(n140) );
  NAND2_X1 U33 ( .A1(da1ca1ba1aa1[1]), .A2(n138), .ZN(n139) );
  NAND2_X1 U34 ( .A1(n140), .A2(n139), .ZN(n142) );
  XNOR2_X1 U35 ( .A(rb3rb2rb1rb0[2]), .B(n142), .ZN(N7) );
  XOR2_X1 U36 ( .A(rb3rb2rb1rb0[1]), .B(n141), .Z(N11) );
  XNOR2_X1 U37 ( .A(rb3rb2rb1rb0[0]), .B(n142), .ZN(N15) );
  NAND2_X1 U38 ( .A1(db1cb1bb1ab1[1]), .A2(db1cb1bb1ab1[2]), .ZN(n143) );
  INV_X1 U39 ( .A(db1cb1bb1ab1[3]), .ZN(n151) );
  NOR2_X1 U40 ( .A1(db1cb1bb1ab1[0]), .A2(n151), .ZN(n149) );
  NAND2_X1 U41 ( .A1(n143), .A2(n149), .ZN(n148) );
  INV_X1 U42 ( .A(db1cb1bb1ab1[2]), .ZN(n144) );
  NOR2_X1 U43 ( .A1(n149), .A2(n144), .ZN(n146) );
  INV_X1 U44 ( .A(db1cb1bb1ab1[0]), .ZN(n201) );
  XNOR2_X1 U45 ( .A(db1cb1bb1ab1[1]), .B(n201), .ZN(n145) );
  NAND2_X1 U46 ( .A1(n146), .A2(n145), .ZN(n147) );
  NAND2_X1 U47 ( .A1(n148), .A2(n147), .ZN(n154) );
  XOR2_X1 U48 ( .A(ra3ra2ra1ra0[3]), .B(n154), .Z(N19) );
  NOR2_X1 U49 ( .A1(db1cb1bb1ab1[1]), .A2(db1cb1bb1ab1[2]), .ZN(n150) );
  XNOR2_X1 U50 ( .A(n150), .B(n149), .ZN(n153) );
  NAND2_X1 U51 ( .A1(db1cb1bb1ab1[1]), .A2(n151), .ZN(n152) );
  NAND2_X1 U52 ( .A1(n153), .A2(n152), .ZN(n155) );
  XNOR2_X1 U53 ( .A(ra3ra2ra1ra0[2]), .B(n155), .ZN(N23) );
  XOR2_X1 U54 ( .A(ra3ra2ra1ra0[1]), .B(n154), .Z(N27) );
  XNOR2_X1 U55 ( .A(ra3ra2ra1ra0[0]), .B(n155), .ZN(N31) );
  NAND2_X1 U56 ( .A1(da1ca1ba1aa1[2]), .A2(da0ca0ba0aa0[1]), .ZN(n157) );
  NAND2_X1 U57 ( .A1(da0ca0ba0aa0[0]), .A2(da1ca1ba1aa1[3]), .ZN(n156) );
  XNOR2_X1 U58 ( .A(n157), .B(n156), .ZN(n159) );
  NAND2_X1 U59 ( .A1(da1ca1ba1aa1[2]), .A2(da0ca0ba0aa0[0]), .ZN(n158) );
  XNOR2_X1 U60 ( .A(n159), .B(n158), .ZN(n161) );
  XNOR2_X1 U61 ( .A(rb3rb2rb1rb0[3]), .B(n161), .ZN(N1) );
  NAND2_X1 U62 ( .A1(da0ca0ba0aa0[1]), .A2(da1ca1ba1aa1[3]), .ZN(n160) );
  XNOR2_X1 U63 ( .A(n160), .B(n159), .ZN(n162) );
  XNOR2_X1 U64 ( .A(rb3rb2rb1rb0[2]), .B(n162), .ZN(N5) );
  XNOR2_X1 U65 ( .A(rb3rb2rb1rb0[1]), .B(n161), .ZN(N9) );
  XNOR2_X1 U66 ( .A(rb3rb2rb1rb0[0]), .B(n162), .ZN(N13) );
  INV_X1 U67 ( .A(da0ca0ba0aa0[1]), .ZN(n171) );
  NOR2_X1 U68 ( .A1(da0ca0ba0aa0[2]), .A2(n171), .ZN(n169) );
  NOR2_X1 U69 ( .A1(n169), .A2(da0ca0ba0aa0[0]), .ZN(n168) );
  INV_X1 U70 ( .A(da0ca0ba0aa0[2]), .ZN(n230) );
  NAND2_X1 U71 ( .A1(da0ca0ba0aa0[1]), .A2(da0ca0ba0aa0[0]), .ZN(n163) );
  NAND2_X1 U72 ( .A1(n230), .A2(n163), .ZN(n164) );
  NAND2_X1 U73 ( .A1(n164), .A2(da0ca0ba0aa0[3]), .ZN(n166) );
  NOR2_X1 U74 ( .A1(da0ca0ba0aa0[3]), .A2(da0ca0ba0aa0[2]), .ZN(n216) );
  NAND2_X1 U75 ( .A1(n216), .A2(n171), .ZN(n165) );
  NAND2_X1 U76 ( .A1(n166), .A2(n165), .ZN(n167) );
  NOR2_X1 U77 ( .A1(n168), .A2(n167), .ZN(n174) );
  XNOR2_X1 U78 ( .A(rb3rb2rb1rb0[3]), .B(random[0]), .ZN(n221) );
  XNOR2_X1 U79 ( .A(n174), .B(n221), .ZN(N0) );
  XOR2_X1 U80 ( .A(rb3rb2rb1rb0[2]), .B(random[1]), .Z(n237) );
  NOR2_X1 U81 ( .A1(da0ca0ba0aa0[3]), .A2(da0ca0ba0aa0[0]), .ZN(n170) );
  XNOR2_X1 U82 ( .A(n170), .B(n169), .ZN(n173) );
  NAND2_X1 U83 ( .A1(da0ca0ba0aa0[3]), .A2(n171), .ZN(n172) );
  NAND2_X1 U84 ( .A1(n173), .A2(n172), .ZN(n175) );
  XNOR2_X1 U85 ( .A(n237), .B(n175), .ZN(N4) );
  XNOR2_X1 U86 ( .A(rb3rb2rb1rb0[1]), .B(random[2]), .ZN(n220) );
  XNOR2_X1 U87 ( .A(n174), .B(n220), .ZN(N8) );
  XOR2_X1 U88 ( .A(rb3rb2rb1rb0[0]), .B(random[3]), .Z(n235) );
  XNOR2_X1 U89 ( .A(n235), .B(n175), .ZN(N12) );
  NAND2_X1 U90 ( .A1(db1cb1bb1ab1[2]), .A2(db0cb0bb0ab0[1]), .ZN(n177) );
  NAND2_X1 U91 ( .A1(db0cb0bb0ab0[0]), .A2(db1cb1bb1ab1[3]), .ZN(n176) );
  XNOR2_X1 U92 ( .A(n177), .B(n176), .ZN(n179) );
  NAND2_X1 U93 ( .A1(db1cb1bb1ab1[2]), .A2(db0cb0bb0ab0[0]), .ZN(n178) );
  XNOR2_X1 U94 ( .A(n179), .B(n178), .ZN(n181) );
  XNOR2_X1 U95 ( .A(ra3ra2ra1ra0[3]), .B(n181), .ZN(N17) );
  NAND2_X1 U96 ( .A1(db0cb0bb0ab0[1]), .A2(db1cb1bb1ab1[3]), .ZN(n180) );
  XNOR2_X1 U97 ( .A(n180), .B(n179), .ZN(n182) );
  XNOR2_X1 U98 ( .A(ra3ra2ra1ra0[2]), .B(n182), .ZN(N21) );
  XNOR2_X1 U99 ( .A(ra3ra2ra1ra0[1]), .B(n181), .ZN(N25) );
  XNOR2_X1 U100 ( .A(ra3ra2ra1ra0[0]), .B(n182), .ZN(N29) );
  XNOR2_X1 U101 ( .A(ra3ra2ra1ra0[3]), .B(random[4]), .ZN(n213) );
  NAND2_X1 U102 ( .A1(db0cb0bb0ab0[3]), .A2(db0cb0bb0ab0[0]), .ZN(n183) );
  INV_X1 U103 ( .A(db0cb0bb0ab0[1]), .ZN(n191) );
  NOR2_X1 U104 ( .A1(db0cb0bb0ab0[2]), .A2(n191), .ZN(n189) );
  NAND2_X1 U105 ( .A1(n183), .A2(n189), .ZN(n188) );
  INV_X1 U106 ( .A(db0cb0bb0ab0[0]), .ZN(n184) );
  NOR2_X1 U107 ( .A1(n189), .A2(n184), .ZN(n186) );
  INV_X1 U108 ( .A(db0cb0bb0ab0[2]), .ZN(n206) );
  XNOR2_X1 U109 ( .A(db0cb0bb0ab0[3]), .B(n206), .ZN(n185) );
  NAND2_X1 U110 ( .A1(n186), .A2(n185), .ZN(n187) );
  NAND2_X1 U111 ( .A1(n188), .A2(n187), .ZN(n194) );
  XNOR2_X1 U112 ( .A(n213), .B(n194), .ZN(N16) );
  XOR2_X1 U113 ( .A(ra3ra2ra1ra0[2]), .B(random[5]), .Z(n212) );
  NOR2_X1 U114 ( .A1(db0cb0bb0ab0[3]), .A2(db0cb0bb0ab0[0]), .ZN(n190) );
  XNOR2_X1 U115 ( .A(n190), .B(n189), .ZN(n193) );
  NAND2_X1 U116 ( .A1(db0cb0bb0ab0[3]), .A2(n191), .ZN(n192) );
  NAND2_X1 U117 ( .A1(n193), .A2(n192), .ZN(n195) );
  XNOR2_X1 U118 ( .A(n212), .B(n195), .ZN(N20) );
  XNOR2_X1 U119 ( .A(ra3ra2ra1ra0[1]), .B(random[6]), .ZN(n210) );
  XNOR2_X1 U120 ( .A(n194), .B(n210), .ZN(N24) );
  XOR2_X1 U121 ( .A(ra3ra2ra1ra0[0]), .B(random[7]), .Z(n199) );
  XNOR2_X1 U122 ( .A(n199), .B(n195), .ZN(N28) );
  NOR2_X1 U123 ( .A1(db1cb1bb1ab1[1]), .A2(db0cb0bb0ab0[2]), .ZN(n196) );
  NOR2_X1 U124 ( .A1(db1cb1bb1ab1[0]), .A2(db0cb0bb0ab0[3]), .ZN(n207) );
  XNOR2_X1 U125 ( .A(n196), .B(n207), .ZN(n198) );
  NAND2_X1 U126 ( .A1(db0cb0bb0ab0[3]), .A2(db1cb1bb1ab1[1]), .ZN(n197) );
  NAND2_X1 U127 ( .A1(n198), .A2(n197), .ZN(n211) );
  XOR2_X1 U128 ( .A(n199), .B(n211), .Z(n102) );
  AND2_X1 U129 ( .A1(n201), .A2(db0cb0bb0ab0[3]), .ZN(n200) );
  NOR2_X1 U130 ( .A1(db1cb1bb1ab1[1]), .A2(n200), .ZN(n205) );
  NOR2_X1 U131 ( .A1(db0cb0bb0ab0[3]), .A2(db0cb0bb0ab0[2]), .ZN(n203) );
  NAND2_X1 U132 ( .A1(db1cb1bb1ab1[1]), .A2(n201), .ZN(n202) );
  NOR2_X1 U133 ( .A1(n203), .A2(n202), .ZN(n204) );
  NOR2_X1 U134 ( .A1(n205), .A2(n204), .ZN(n209) );
  NOR2_X1 U135 ( .A1(n207), .A2(n206), .ZN(n208) );
  NOR2_X1 U136 ( .A1(n209), .A2(n208), .ZN(n214) );
  XOR2_X1 U137 ( .A(n214), .B(n210), .Z(n101) );
  XOR2_X1 U138 ( .A(n212), .B(n211), .Z(n100) );
  XOR2_X1 U139 ( .A(n214), .B(n213), .Z(n99) );
  INV_X1 U140 ( .A(da0ca0ba0aa0[3]), .ZN(n232) );
  NOR2_X1 U141 ( .A1(da0ca0ba0aa0[2]), .A2(n223), .ZN(n215) );
  NOR2_X1 U142 ( .A1(n232), .A2(n215), .ZN(n219) );
  NOR2_X1 U143 ( .A1(da1ca1ba1aa1[1]), .A2(da0ca0ba0aa0[2]), .ZN(n227) );
  NOR2_X1 U144 ( .A1(da1ca1ba1aa1[0]), .A2(n216), .ZN(n217) );
  NOR2_X1 U145 ( .A1(n227), .A2(n217), .ZN(n218) );
  NOR2_X1 U146 ( .A1(n219), .A2(n218), .ZN(n222) );
  XOR2_X1 U147 ( .A(n222), .B(n220), .Z(n98) );
  XOR2_X1 U148 ( .A(n222), .B(n221), .Z(n97) );
  INV_X1 U149 ( .A(n223), .ZN(n225) );
  NOR2_X1 U150 ( .A1(da0ca0ba0aa0[3]), .A2(n230), .ZN(n224) );
  NOR2_X1 U151 ( .A1(n225), .A2(n224), .ZN(n229) );
  NOR2_X1 U152 ( .A1(n227), .A2(n226), .ZN(n228) );
  NOR2_X1 U153 ( .A1(n229), .A2(n228), .ZN(n234) );
  NOR2_X1 U154 ( .A1(n230), .A2(da1ca1ba1aa1[1]), .ZN(n231) );
  NOR2_X1 U155 ( .A1(n232), .A2(n231), .ZN(n233) );
  NOR2_X1 U156 ( .A1(n234), .A2(n233), .ZN(n236) );
  XNOR2_X1 U157 ( .A(n235), .B(n236), .ZN(n96) );
  XNOR2_X1 U158 ( .A(n237), .B(n236), .ZN(n95) );
endmodule


module GF4Mul_Unit ( clk, da0ca0ba0aa0, da1ca1ba1aa1, ha0ga0fa0ea0, 
        ha1ga1fa1ea1, ra3ra2ra1ra0, xa, ya, za, ta, db0cb0bb0ab0, db1cb1bb1ab1, 
        hb0gb0fb0eb0, hb1gb1fb1eb1, rb3rb2rb1rb0, xb, yb, zb, tb );
  input [3:0] da0ca0ba0aa0;
  input [3:0] da1ca1ba1aa1;
  input [3:0] ha0ga0fa0ea0;
  input [3:0] ha1ga1fa1ea1;
  input [3:0] ra3ra2ra1ra0;
  output [1:0] xa;
  output [1:0] ya;
  output [1:0] za;
  output [1:0] ta;
  input [3:0] db0cb0bb0ab0;
  input [3:0] db1cb1bb1ab1;
  input [3:0] hb0gb0fb0eb0;
  input [3:0] hb1gb1fb1eb1;
  input [3:0] rb3rb2rb1rb0;
  output [1:0] xb;
  output [1:0] yb;
  output [1:0] zb;
  output [1:0] tb;
  input clk;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29,
         N30, N31, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, n249,
         n250, n251, n252, n253, n254, n255, n256, n257, n258, n259, n260,
         n261, n262, n263, n264, n265, n266;
  wire   [3:0] xa_r;
  wire   [3:0] ya_r;
  wire   [3:0] za_r;
  wire   [3:0] ta_r;
  wire   [3:0] xb_r;
  wire   [3:0] yb_r;
  wire   [3:0] zb_r;
  wire   [3:0] tb_r;

  DFF_X1 \xa_r_reg[3]  ( .D(N3), .CK(clk), .Q(xa_r[3]) );
  DFF_X1 \xa_r_reg[2]  ( .D(N2), .CK(clk), .Q(xa_r[2]) );
  DFF_X1 \xa_r_reg[1]  ( .D(N1), .CK(clk), .Q(xa_r[1]) );
  DFF_X1 \xa_r_reg[0]  ( .D(N0), .CK(clk), .Q(xa_r[0]) );
  DFF_X1 \ya_r_reg[3]  ( .D(N7), .CK(clk), .Q(ya_r[3]) );
  DFF_X1 \ya_r_reg[2]  ( .D(N6), .CK(clk), .Q(ya_r[2]) );
  DFF_X1 \ya_r_reg[1]  ( .D(N5), .CK(clk), .Q(ya_r[1]) );
  DFF_X1 \ya_r_reg[0]  ( .D(N4), .CK(clk), .Q(ya_r[0]) );
  DFF_X1 \za_r_reg[3]  ( .D(N11), .CK(clk), .Q(za_r[3]) );
  DFF_X1 \za_r_reg[2]  ( .D(N10), .CK(clk), .Q(za_r[2]) );
  DFF_X1 \za_r_reg[1]  ( .D(N9), .CK(clk), .Q(za_r[1]) );
  DFF_X1 \za_r_reg[0]  ( .D(N8), .CK(clk), .Q(za_r[0]) );
  DFF_X1 \ta_r_reg[3]  ( .D(N15), .CK(clk), .Q(ta_r[3]) );
  DFF_X1 \ta_r_reg[2]  ( .D(N14), .CK(clk), .Q(ta_r[2]) );
  DFF_X1 \ta_r_reg[1]  ( .D(N13), .CK(clk), .Q(ta_r[1]) );
  DFF_X1 \ta_r_reg[0]  ( .D(N12), .CK(clk), .Q(ta_r[0]) );
  DFF_X1 \xb_r_reg[3]  ( .D(N19), .CK(clk), .Q(xb_r[3]) );
  DFF_X1 \xb_r_reg[2]  ( .D(N18), .CK(clk), .Q(xb_r[2]) );
  DFF_X1 \xb_r_reg[1]  ( .D(N17), .CK(clk), .Q(xb_r[1]) );
  DFF_X1 \xb_r_reg[0]  ( .D(N16), .CK(clk), .Q(xb_r[0]) );
  DFF_X1 \yb_r_reg[3]  ( .D(N23), .CK(clk), .Q(yb_r[3]) );
  DFF_X1 \yb_r_reg[2]  ( .D(N22), .CK(clk), .Q(yb_r[2]) );
  DFF_X1 \yb_r_reg[1]  ( .D(N21), .CK(clk), .Q(yb_r[1]) );
  DFF_X1 \yb_r_reg[0]  ( .D(N20), .CK(clk), .Q(yb_r[0]) );
  DFF_X1 \zb_r_reg[3]  ( .D(N27), .CK(clk), .Q(zb_r[3]) );
  DFF_X1 \zb_r_reg[2]  ( .D(N26), .CK(clk), .Q(zb_r[2]) );
  DFF_X1 \zb_r_reg[1]  ( .D(N25), .CK(clk), .Q(zb_r[1]) );
  DFF_X1 \zb_r_reg[0]  ( .D(N24), .CK(clk), .Q(zb_r[0]) );
  DFF_X1 \tb_r_reg[3]  ( .D(N31), .CK(clk), .Q(tb_r[3]) );
  DFF_X1 \tb_r_reg[2]  ( .D(N30), .CK(clk), .Q(tb_r[2]) );
  DFF_X1 \tb_r_reg[1]  ( .D(N29), .CK(clk), .Q(tb_r[1]) );
  DFF_X1 \tb_r_reg[0]  ( .D(N28), .CK(clk), .Q(tb_r[0]) );
  XOR2_X1 U3 ( .A(zb_r[2]), .B(zb_r[3]), .Z(zb[1]) );
  XOR2_X1 U4 ( .A(zb_r[0]), .B(zb_r[1]), .Z(zb[0]) );
  XOR2_X1 U5 ( .A(za_r[2]), .B(za_r[3]), .Z(za[1]) );
  XOR2_X1 U6 ( .A(za_r[0]), .B(za_r[1]), .Z(za[0]) );
  XOR2_X1 U7 ( .A(yb_r[2]), .B(yb_r[3]), .Z(yb[1]) );
  XOR2_X1 U8 ( .A(yb_r[0]), .B(yb_r[1]), .Z(yb[0]) );
  XOR2_X1 U9 ( .A(ya_r[2]), .B(ya_r[3]), .Z(ya[1]) );
  XOR2_X1 U10 ( .A(ya_r[0]), .B(ya_r[1]), .Z(ya[0]) );
  XOR2_X1 U11 ( .A(xb_r[2]), .B(xb_r[3]), .Z(xb[1]) );
  XOR2_X1 U12 ( .A(xb_r[0]), .B(xb_r[1]), .Z(xb[0]) );
  XOR2_X1 U13 ( .A(xa_r[2]), .B(xa_r[3]), .Z(xa[1]) );
  XOR2_X1 U14 ( .A(xa_r[0]), .B(xa_r[1]), .Z(xa[0]) );
  XOR2_X1 U15 ( .A(tb_r[2]), .B(tb_r[3]), .Z(tb[1]) );
  XOR2_X1 U16 ( .A(tb_r[0]), .B(tb_r[1]), .Z(tb[0]) );
  XOR2_X1 U17 ( .A(ta_r[2]), .B(ta_r[3]), .Z(ta[1]) );
  XOR2_X1 U18 ( .A(ta_r[0]), .B(ta_r[1]), .Z(ta[0]) );
  NAND2_X1 U19 ( .A1(db1cb1bb1ab1[0]), .A2(hb1gb1fb1eb1[1]), .ZN(n142) );
  NAND2_X1 U20 ( .A1(db1cb1bb1ab1[1]), .A2(hb1gb1fb1eb1[0]), .ZN(n141) );
  XOR2_X1 U21 ( .A(n142), .B(n141), .Z(n192) );
  XOR2_X1 U22 ( .A(ra3ra2ra1ra0[1]), .B(n192), .Z(n145) );
  INV_X1 U23 ( .A(db1cb1bb1ab1[1]), .ZN(n143) );
  NAND2_X1 U24 ( .A1(hb1gb1fb1eb1[1]), .A2(n143), .ZN(n144) );
  XNOR2_X1 U25 ( .A(n145), .B(n144), .ZN(N27) );
  NAND2_X1 U26 ( .A1(ha0ga0fa0ea0[1]), .A2(da0ca0ba0aa0[0]), .ZN(n147) );
  NAND2_X1 U27 ( .A1(ha0ga0fa0ea0[0]), .A2(da0ca0ba0aa0[1]), .ZN(n146) );
  XOR2_X1 U28 ( .A(n147), .B(n146), .Z(n150) );
  XOR2_X1 U29 ( .A(rb3rb2rb1rb0[1]), .B(n150), .Z(n149) );
  NAND2_X1 U30 ( .A1(ha0ga0fa0ea0[1]), .A2(da0ca0ba0aa0[1]), .ZN(n148) );
  XNOR2_X1 U31 ( .A(n149), .B(n148), .ZN(N8) );
  XOR2_X1 U32 ( .A(n150), .B(rb3rb2rb1rb0[0]), .Z(n152) );
  NAND2_X1 U33 ( .A1(da0ca0ba0aa0[0]), .A2(ha0ga0fa0ea0[0]), .ZN(n151) );
  XNOR2_X1 U34 ( .A(n152), .B(n151), .ZN(N12) );
  NAND2_X1 U35 ( .A1(da1ca1ba1aa1[0]), .A2(ha0ga0fa0ea0[1]), .ZN(n154) );
  NAND2_X1 U36 ( .A1(da1ca1ba1aa1[1]), .A2(ha0ga0fa0ea0[0]), .ZN(n153) );
  XOR2_X1 U37 ( .A(n154), .B(n153), .Z(n157) );
  XOR2_X1 U38 ( .A(rb3rb2rb1rb0[1]), .B(n157), .Z(n156) );
  NAND2_X1 U39 ( .A1(da1ca1ba1aa1[1]), .A2(ha0ga0fa0ea0[1]), .ZN(n155) );
  XNOR2_X1 U40 ( .A(n156), .B(n155), .ZN(N10) );
  XOR2_X1 U41 ( .A(rb3rb2rb1rb0[0]), .B(n157), .Z(n159) );
  NAND2_X1 U42 ( .A1(da1ca1ba1aa1[0]), .A2(ha0ga0fa0ea0[0]), .ZN(n158) );
  XNOR2_X1 U43 ( .A(n159), .B(n158), .ZN(N14) );
  NAND2_X1 U44 ( .A1(hb0gb0fb0eb0[1]), .A2(db1cb1bb1ab1[0]), .ZN(n161) );
  NAND2_X1 U45 ( .A1(hb0gb0fb0eb0[0]), .A2(db1cb1bb1ab1[1]), .ZN(n160) );
  XOR2_X1 U46 ( .A(n161), .B(n160), .Z(n164) );
  XOR2_X1 U47 ( .A(ra3ra2ra1ra0[1]), .B(n164), .Z(n163) );
  NAND2_X1 U48 ( .A1(hb0gb0fb0eb0[1]), .A2(db1cb1bb1ab1[1]), .ZN(n162) );
  XNOR2_X1 U49 ( .A(n163), .B(n162), .ZN(N26) );
  XOR2_X1 U50 ( .A(n164), .B(ra3ra2ra1ra0[0]), .Z(n166) );
  NAND2_X1 U51 ( .A1(hb0gb0fb0eb0[0]), .A2(db1cb1bb1ab1[0]), .ZN(n165) );
  XNOR2_X1 U52 ( .A(n166), .B(n165), .ZN(N30) );
  INV_X1 U53 ( .A(ha1ga1fa1ea1[3]), .ZN(n183) );
  NOR2_X1 U54 ( .A1(da0ca0ba0aa0[3]), .A2(n183), .ZN(n167) );
  XNOR2_X1 U55 ( .A(rb3rb2rb1rb0[3]), .B(n167), .ZN(n170) );
  NAND2_X1 U56 ( .A1(da0ca0ba0aa0[2]), .A2(ha1ga1fa1ea1[3]), .ZN(n169) );
  NAND2_X1 U57 ( .A1(ha1ga1fa1ea1[2]), .A2(da0ca0ba0aa0[3]), .ZN(n168) );
  XOR2_X1 U58 ( .A(n169), .B(n168), .Z(n201) );
  XNOR2_X1 U59 ( .A(n170), .B(n201), .ZN(N1) );
  NAND2_X1 U60 ( .A1(db1cb1bb1ab1[2]), .A2(hb1gb1fb1eb1[3]), .ZN(n172) );
  NAND2_X1 U61 ( .A1(db1cb1bb1ab1[3]), .A2(hb1gb1fb1eb1[2]), .ZN(n171) );
  XOR2_X1 U62 ( .A(n172), .B(n171), .Z(n188) );
  XOR2_X1 U63 ( .A(ra3ra2ra1ra0[3]), .B(n188), .Z(n175) );
  INV_X1 U64 ( .A(db1cb1bb1ab1[3]), .ZN(n173) );
  NAND2_X1 U65 ( .A1(hb1gb1fb1eb1[3]), .A2(n173), .ZN(n174) );
  XNOR2_X1 U66 ( .A(n175), .B(n174), .ZN(N19) );
  NAND2_X1 U67 ( .A1(hb0gb0fb0eb0[3]), .A2(db1cb1bb1ab1[2]), .ZN(n177) );
  NAND2_X1 U68 ( .A1(hb0gb0fb0eb0[2]), .A2(db1cb1bb1ab1[3]), .ZN(n176) );
  XOR2_X1 U69 ( .A(n177), .B(n176), .Z(n180) );
  XOR2_X1 U70 ( .A(ra3ra2ra1ra0[3]), .B(n180), .Z(n179) );
  NAND2_X1 U71 ( .A1(hb0gb0fb0eb0[3]), .A2(db1cb1bb1ab1[3]), .ZN(n178) );
  XNOR2_X1 U72 ( .A(n179), .B(n178), .ZN(N18) );
  XOR2_X1 U73 ( .A(n180), .B(ra3ra2ra1ra0[2]), .Z(n182) );
  NAND2_X1 U74 ( .A1(hb0gb0fb0eb0[2]), .A2(db1cb1bb1ab1[2]), .ZN(n181) );
  XNOR2_X1 U75 ( .A(n182), .B(n181), .ZN(N22) );
  NOR2_X1 U76 ( .A1(da1ca1ba1aa1[3]), .A2(n183), .ZN(n184) );
  XNOR2_X1 U77 ( .A(rb3rb2rb1rb0[3]), .B(n184), .ZN(n187) );
  NAND2_X1 U78 ( .A1(da1ca1ba1aa1[3]), .A2(ha1ga1fa1ea1[2]), .ZN(n186) );
  NAND2_X1 U79 ( .A1(da1ca1ba1aa1[2]), .A2(ha1ga1fa1ea1[3]), .ZN(n185) );
  XOR2_X1 U80 ( .A(n186), .B(n185), .Z(n197) );
  XNOR2_X1 U81 ( .A(n187), .B(n197), .ZN(N3) );
  XOR2_X1 U82 ( .A(n188), .B(ra3ra2ra1ra0[2]), .Z(n191) );
  INV_X1 U83 ( .A(db1cb1bb1ab1[2]), .ZN(n189) );
  NAND2_X1 U84 ( .A1(hb1gb1fb1eb1[2]), .A2(n189), .ZN(n190) );
  XNOR2_X1 U85 ( .A(n191), .B(n190), .ZN(N23) );
  XOR2_X1 U86 ( .A(n192), .B(ra3ra2ra1ra0[0]), .Z(n195) );
  INV_X1 U87 ( .A(db1cb1bb1ab1[0]), .ZN(n193) );
  NAND2_X1 U88 ( .A1(hb1gb1fb1eb1[0]), .A2(n193), .ZN(n194) );
  XNOR2_X1 U89 ( .A(n195), .B(n194), .ZN(N31) );
  INV_X1 U90 ( .A(ha1ga1fa1ea1[2]), .ZN(n199) );
  NOR2_X1 U91 ( .A1(da1ca1ba1aa1[2]), .A2(n199), .ZN(n196) );
  XNOR2_X1 U92 ( .A(n196), .B(rb3rb2rb1rb0[2]), .ZN(n198) );
  XNOR2_X1 U93 ( .A(n198), .B(n197), .ZN(N7) );
  NOR2_X1 U94 ( .A1(da0ca0ba0aa0[2]), .A2(n199), .ZN(n200) );
  XNOR2_X1 U95 ( .A(n200), .B(rb3rb2rb1rb0[2]), .ZN(n202) );
  XNOR2_X1 U96 ( .A(n202), .B(n201), .ZN(N5) );
  NAND2_X1 U97 ( .A1(ha0ga0fa0ea0[3]), .A2(da0ca0ba0aa0[2]), .ZN(n204) );
  NAND2_X1 U98 ( .A1(ha0ga0fa0ea0[2]), .A2(da0ca0ba0aa0[3]), .ZN(n203) );
  XOR2_X1 U99 ( .A(n204), .B(n203), .Z(n207) );
  XOR2_X1 U100 ( .A(rb3rb2rb1rb0[3]), .B(n207), .Z(n206) );
  NAND2_X1 U101 ( .A1(ha0ga0fa0ea0[3]), .A2(da0ca0ba0aa0[3]), .ZN(n205) );
  XNOR2_X1 U102 ( .A(n206), .B(n205), .ZN(N0) );
  XOR2_X1 U103 ( .A(rb3rb2rb1rb0[2]), .B(n207), .Z(n209) );
  NAND2_X1 U104 ( .A1(ha0ga0fa0ea0[2]), .A2(da0ca0ba0aa0[2]), .ZN(n208) );
  XNOR2_X1 U105 ( .A(n209), .B(n208), .ZN(N4) );
  NAND2_X1 U106 ( .A1(db0cb0bb0ab0[2]), .A2(hb1gb1fb1eb1[3]), .ZN(n211) );
  NAND2_X1 U107 ( .A1(db0cb0bb0ab0[3]), .A2(hb1gb1fb1eb1[2]), .ZN(n210) );
  XOR2_X1 U108 ( .A(n211), .B(n210), .Z(n215) );
  XOR2_X1 U109 ( .A(ra3ra2ra1ra0[3]), .B(n215), .Z(n214) );
  INV_X1 U110 ( .A(db0cb0bb0ab0[3]), .ZN(n212) );
  NAND2_X1 U111 ( .A1(hb1gb1fb1eb1[3]), .A2(n212), .ZN(n213) );
  XNOR2_X1 U112 ( .A(n214), .B(n213), .ZN(N17) );
  XOR2_X1 U113 ( .A(ra3ra2ra1ra0[2]), .B(n215), .Z(n218) );
  INV_X1 U114 ( .A(db0cb0bb0ab0[2]), .ZN(n216) );
  NAND2_X1 U115 ( .A1(hb1gb1fb1eb1[2]), .A2(n216), .ZN(n217) );
  XNOR2_X1 U116 ( .A(n218), .B(n217), .ZN(N21) );
  NAND2_X1 U117 ( .A1(ha0ga0fa0ea0[3]), .A2(da1ca1ba1aa1[2]), .ZN(n220) );
  NAND2_X1 U118 ( .A1(ha0ga0fa0ea0[2]), .A2(da1ca1ba1aa1[3]), .ZN(n219) );
  XOR2_X1 U119 ( .A(n220), .B(n219), .Z(n223) );
  XOR2_X1 U120 ( .A(rb3rb2rb1rb0[3]), .B(n223), .Z(n222) );
  NAND2_X1 U121 ( .A1(ha0ga0fa0ea0[3]), .A2(da1ca1ba1aa1[3]), .ZN(n221) );
  XNOR2_X1 U122 ( .A(n222), .B(n221), .ZN(N2) );
  XOR2_X1 U123 ( .A(rb3rb2rb1rb0[2]), .B(n223), .Z(n225) );
  NAND2_X1 U124 ( .A1(ha0ga0fa0ea0[2]), .A2(da1ca1ba1aa1[2]), .ZN(n224) );
  XNOR2_X1 U125 ( .A(n225), .B(n224), .ZN(N6) );
  NAND2_X1 U126 ( .A1(ha1ga1fa1ea1[1]), .A2(da1ca1ba1aa1[0]), .ZN(n227) );
  NAND2_X1 U127 ( .A1(ha1ga1fa1ea1[0]), .A2(da1ca1ba1aa1[1]), .ZN(n226) );
  XOR2_X1 U128 ( .A(n227), .B(n226), .Z(n231) );
  XOR2_X1 U129 ( .A(rb3rb2rb1rb0[1]), .B(n231), .Z(n230) );
  INV_X1 U130 ( .A(da1ca1ba1aa1[1]), .ZN(n228) );
  NAND2_X1 U131 ( .A1(ha1ga1fa1ea1[1]), .A2(n228), .ZN(n229) );
  XNOR2_X1 U132 ( .A(n230), .B(n229), .ZN(N11) );
  XOR2_X1 U133 ( .A(rb3rb2rb1rb0[0]), .B(n231), .Z(n234) );
  INV_X1 U134 ( .A(da1ca1ba1aa1[0]), .ZN(n232) );
  NAND2_X1 U135 ( .A1(ha1ga1fa1ea1[0]), .A2(n232), .ZN(n233) );
  XNOR2_X1 U136 ( .A(n234), .B(n233), .ZN(N15) );
  NAND2_X1 U137 ( .A1(db0cb0bb0ab0[2]), .A2(hb0gb0fb0eb0[3]), .ZN(n236) );
  NAND2_X1 U138 ( .A1(db0cb0bb0ab0[3]), .A2(hb0gb0fb0eb0[2]), .ZN(n235) );
  XOR2_X1 U139 ( .A(n236), .B(n235), .Z(n239) );
  XOR2_X1 U140 ( .A(ra3ra2ra1ra0[3]), .B(n239), .Z(n238) );
  NAND2_X1 U141 ( .A1(db0cb0bb0ab0[3]), .A2(hb0gb0fb0eb0[3]), .ZN(n237) );
  XNOR2_X1 U142 ( .A(n238), .B(n237), .ZN(N16) );
  XOR2_X1 U143 ( .A(ra3ra2ra1ra0[2]), .B(n239), .Z(n241) );
  NAND2_X1 U144 ( .A1(db0cb0bb0ab0[2]), .A2(hb0gb0fb0eb0[2]), .ZN(n240) );
  XNOR2_X1 U145 ( .A(n241), .B(n240), .ZN(N20) );
  NAND2_X1 U146 ( .A1(db0cb0bb0ab0[0]), .A2(hb1gb1fb1eb1[1]), .ZN(n243) );
  NAND2_X1 U147 ( .A1(db0cb0bb0ab0[1]), .A2(hb1gb1fb1eb1[0]), .ZN(n242) );
  XOR2_X1 U148 ( .A(n243), .B(n242), .Z(n247) );
  XOR2_X1 U149 ( .A(ra3ra2ra1ra0[1]), .B(n247), .Z(n246) );
  INV_X1 U150 ( .A(db0cb0bb0ab0[1]), .ZN(n244) );
  NAND2_X1 U151 ( .A1(hb1gb1fb1eb1[1]), .A2(n244), .ZN(n245) );
  XNOR2_X1 U152 ( .A(n246), .B(n245), .ZN(N25) );
  XOR2_X1 U153 ( .A(ra3ra2ra1ra0[0]), .B(n247), .Z(n250) );
  INV_X1 U154 ( .A(db0cb0bb0ab0[0]), .ZN(n248) );
  NAND2_X1 U155 ( .A1(hb1gb1fb1eb1[0]), .A2(n248), .ZN(n249) );
  XNOR2_X1 U156 ( .A(n250), .B(n249), .ZN(N29) );
  NAND2_X1 U157 ( .A1(ha1ga1fa1ea1[1]), .A2(da0ca0ba0aa0[0]), .ZN(n252) );
  NAND2_X1 U158 ( .A1(ha1ga1fa1ea1[0]), .A2(da0ca0ba0aa0[1]), .ZN(n251) );
  XOR2_X1 U159 ( .A(n252), .B(n251), .Z(n256) );
  XOR2_X1 U160 ( .A(rb3rb2rb1rb0[1]), .B(n256), .Z(n255) );
  INV_X1 U161 ( .A(da0ca0ba0aa0[1]), .ZN(n253) );
  NAND2_X1 U162 ( .A1(ha1ga1fa1ea1[1]), .A2(n253), .ZN(n254) );
  XNOR2_X1 U163 ( .A(n255), .B(n254), .ZN(N9) );
  XOR2_X1 U164 ( .A(rb3rb2rb1rb0[0]), .B(n256), .Z(n259) );
  INV_X1 U165 ( .A(da0ca0ba0aa0[0]), .ZN(n257) );
  NAND2_X1 U166 ( .A1(ha1ga1fa1ea1[0]), .A2(n257), .ZN(n258) );
  XNOR2_X1 U167 ( .A(n259), .B(n258), .ZN(N13) );
  NAND2_X1 U168 ( .A1(db0cb0bb0ab0[0]), .A2(hb0gb0fb0eb0[1]), .ZN(n261) );
  NAND2_X1 U169 ( .A1(db0cb0bb0ab0[1]), .A2(hb0gb0fb0eb0[0]), .ZN(n260) );
  XOR2_X1 U170 ( .A(n261), .B(n260), .Z(n264) );
  XOR2_X1 U171 ( .A(ra3ra2ra1ra0[1]), .B(n264), .Z(n263) );
  NAND2_X1 U172 ( .A1(db0cb0bb0ab0[1]), .A2(hb0gb0fb0eb0[1]), .ZN(n262) );
  XNOR2_X1 U173 ( .A(n263), .B(n262), .ZN(N24) );
  XOR2_X1 U174 ( .A(ra3ra2ra1ra0[0]), .B(n264), .Z(n266) );
  NAND2_X1 U175 ( .A1(db0cb0bb0ab0[0]), .A2(hb0gb0fb0eb0[0]), .ZN(n265) );
  XNOR2_X1 U176 ( .A(n266), .B(n265), .ZN(N28) );
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


module AffineInput_Unit_2 ( A, Z );
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


module GF256InvDoubleSboxPartA_Unit ( clk, ha0ga0fa0ea0da0ca0ba0aa0, 
        ha1ga1fa1ea1da1ca1ba1aa1, va0ua0sa0ra0ta0za0ya0xa0, 
        va1ua1sa1ra1ta1za1ya1xa1, GF4MulASh0, GF4MulASh1, 
        hb0gb0fb0eb0db0cb0bb0ab0, hb1gb1fb1eb1db1cb1bb1ab1, 
        vb0ub0sb0rb0tb0zb0yb0xb0, vb1ub1sb1rb1tb1zb1yb1xb1, GF4MulBSh0, 
        GF4MulBSh1, random );

(* SILVER="[7:0]_0" *)  input [7:0] ha0ga0fa0ea0da0ca0ba0aa0;
(* SILVER="[7:0]_1" *)  input [7:0] ha1ga1fa1ea1da1ca1ba1aa1;
(* SILVER="[7:0]_0" *)  output [7:0] va0ua0sa0ra0ta0za0ya0xa0;
(* SILVER="[7:0]_1" *)  output [7:0] va1ua1sa1ra1ta1za1ya1xa1;
(* SILVER="[19:16]_0" *)  output [3:0] GF4MulASh0;
(* SILVER="[19:16]_1" *)  output [3:0] GF4MulASh1;
(* SILVER="[15:8]_0" *)  input [7:0] hb0gb0fb0eb0db0cb0bb0ab0;
(* SILVER="[15:8]_1" *)  input [7:0] hb1gb1fb1eb1db1cb1bb1ab1;
(* SILVER="[15:8]_0" *)  output [7:0] vb0ub0sb0rb0tb0zb0yb0xb0;
(* SILVER="[15:8]_1" *)  output [7:0] vb1ub1sb1rb1tb1zb1yb1xb1;
(* SILVER="[23:20]_0" *)  output [3:0] GF4MulBSh0;
(* SILVER="[23:20]_1" *)  output [3:0] GF4MulBSh1;
(* SILVER="refresh" *)  input [7:0] random;
(* SILVER="clock" *)   input clk;

  wire   [7:0] AffineInputASh0_r;
  wire   [7:0] AffineInputASh0;
  wire   [7:0] AffineInputASh1_r;
  wire   [7:0] AffineInputASh1;
  wire   [7:0] AffineInputBSh0_r;
  wire   [7:0] AffineInputBSh0;
  wire   [7:0] AffineInputBSh1_r;
  wire   [7:0] AffineInputBSh1;
  wire   [7:0] AffineInputASh0_r0;
  wire   [7:0] AffineInputASh1_r0;
  wire   [7:0] AffineInputBSh0_r0;
  wire   [7:0] AffineInputBSh1_r0;
  wire   [7:0] AffineInputASh0_r1;
  wire   [7:0] AffineInputASh1_r1;
  wire   [7:0] AffineInputBSh0_r1;
  wire   [7:0] AffineInputBSh1_r1;
  wire   [3:0] Gf16MulXorSqScASh0_r;
  wire   [3:0] Gf16MulXorSqScASh0;
  wire   [3:0] Gf16MulXorSqScASh1_r;
  wire   [3:0] Gf16MulXorSqScASh1;
  wire   [3:0] Gf16MulXorSqScBSh0_r;
  wire   [3:0] Gf16MulXorSqScBSh0;
  wire   [3:0] Gf16MulXorSqScBSh1_r;
  wire   [3:0] Gf16MulXorSqScBSh1;
  wire   [1:0] GF4MulXorSqScB1Sh0;
  wire   [1:0] GF4MulXorSqScB1Sh1;
  wire   [1:0] GF4MulXorSqScB0Sh0;
  wire   [1:0] GF4MulXorSqScB0Sh1;
  wire   [1:0] GF4MulXorSqScA1Sh0;
  wire   [1:0] GF4MulXorSqScA1Sh1;
  wire   [1:0] GF4MulXorSqScA0Sh0;
  wire   [1:0] GF4MulXorSqScA0Sh1;

  AffineInput_Unit_0 Inst_AffineInputA_Unit0 ( .A(ha0ga0fa0ea0da0ca0ba0aa0), 
        .Z(AffineInputASh0) );
  AffineInput_Unit_3 Inst_AffineInputA_Unit1 ( .A(ha1ga1fa1ea1da1ca1ba1aa1), 
        .Z(AffineInputASh1) );
  AffineInput_Unit_2 Inst_AffineInputB_Unit0 ( .A(hb0gb0fb0eb0db0cb0bb0ab0), 
        .Z(AffineInputBSh0) );
  AffineInput_Unit_1 Inst_AffineInputB_Unit1 ( .A(hb1gb1fb1eb1db1cb1bb1ab1), 
        .Z(AffineInputBSh1) );
  GF16MulXorSqSc_Unit Inst_GF16MulXorSqSc_Unit ( .clk(clk), .ha0ga0fa0ea0(
        AffineInputASh0_r[7:4]), .ha1ga1fa1ea1(AffineInputASh1_r[7:4]), 
        .da0ca0ba0aa0(AffineInputASh0_r[3:0]), .da1ca1ba1aa1(
        AffineInputASh1_r[3:0]), .xa({Gf16MulXorSqScASh0[0], 
        Gf16MulXorSqScASh1[0]}), .ya({Gf16MulXorSqScASh0[1], 
        Gf16MulXorSqScASh1[1]}), .za({Gf16MulXorSqScASh0[2], 
        Gf16MulXorSqScASh1[2]}), .ta({Gf16MulXorSqScASh0[3], 
        Gf16MulXorSqScASh1[3]}), .hb0gb0fb0eb0(AffineInputBSh0_r[7:4]), 
        .hb1gb1fb1eb1(AffineInputBSh1_r[7:4]), .db0cb0bb0ab0(
        AffineInputBSh0_r[3:0]), .db1cb1bb1ab1(AffineInputBSh1_r[3:0]), .xb({
        Gf16MulXorSqScBSh0[0], Gf16MulXorSqScBSh1[0]}), .yb({
        Gf16MulXorSqScBSh0[1], Gf16MulXorSqScBSh1[1]}), .zb({
        Gf16MulXorSqScBSh0[2], Gf16MulXorSqScBSh1[2]}), .tb({
        Gf16MulXorSqScBSh0[3], Gf16MulXorSqScBSh1[3]}) );
  GF4MulXorSqSc_Unit Inst_GF4MulXorSqSc_Unit ( .clk(clk), .da0ca0ba0aa0(
        Gf16MulXorSqScASh0), .da1ca1ba1aa1(Gf16MulXorSqScASh1), .ra3ra2ra1ra0(
        AffineInputASh0_r0[7:4]), .xa({GF4MulXorSqScA0Sh0[0], 
        GF4MulXorSqScA0Sh1[0]}), .ya({GF4MulXorSqScA0Sh0[1], 
        GF4MulXorSqScA0Sh1[1]}), .za({GF4MulXorSqScA1Sh0[0], 
        GF4MulXorSqScA1Sh1[0]}), .ta({GF4MulXorSqScA1Sh0[1], 
        GF4MulXorSqScA1Sh1[1]}), .db0cb0bb0ab0(Gf16MulXorSqScBSh0), 
        .db1cb1bb1ab1(Gf16MulXorSqScBSh1), .rb3rb2rb1rb0(
        AffineInputBSh0_r0[7:4]), .xb({GF4MulXorSqScB0Sh0[0], 
        GF4MulXorSqScB0Sh1[0]}), .yb({GF4MulXorSqScB0Sh0[1], 
        GF4MulXorSqScB0Sh1[1]}), .zb({GF4MulXorSqScB1Sh0[0], 
        GF4MulXorSqScB1Sh1[0]}), .tb({GF4MulXorSqScB1Sh0[1], 
        GF4MulXorSqScB1Sh1[1]}), .random(random) );
  GF4Mul_Unit Inst_GF4Mul_Unit ( .clk(clk), .da0ca0ba0aa0(Gf16MulXorSqScASh0_r), .da1ca1ba1aa1(Gf16MulXorSqScASh1_r), .ha0ga0fa0ea0({GF4MulXorSqScA1Sh0, 
        GF4MulXorSqScA0Sh0}), .ha1ga1fa1ea1({GF4MulXorSqScA1Sh1, 
        GF4MulXorSqScA0Sh1}), .ra3ra2ra1ra0(AffineInputASh0_r1[3:0]), .xa({
        GF4MulASh0[0], GF4MulASh1[0]}), .ya({GF4MulASh0[1], GF4MulASh1[1]}), 
        .za({GF4MulASh0[2], GF4MulASh1[2]}), .ta({GF4MulASh0[3], GF4MulASh1[3]}), .db0cb0bb0ab0(Gf16MulXorSqScBSh0_r), .db1cb1bb1ab1(Gf16MulXorSqScBSh1_r), 
        .hb0gb0fb0eb0({GF4MulXorSqScB1Sh0, GF4MulXorSqScB0Sh0}), 
        .hb1gb1fb1eb1({GF4MulXorSqScB1Sh1, GF4MulXorSqScB0Sh1}), 
        .rb3rb2rb1rb0(AffineInputBSh0_r1[3:0]), .xb({GF4MulBSh0[0], 
        GF4MulBSh1[0]}), .yb({GF4MulBSh0[1], GF4MulBSh1[1]}), .zb({
        GF4MulBSh0[2], GF4MulBSh1[2]}), .tb({GF4MulBSh0[3], GF4MulBSh1[3]}) );
  DFF_X1 \AffineInputASh0_r_reg[7]  ( .D(AffineInputASh0[7]), .CK(clk), .Q(
        AffineInputASh0_r[7]) );
  DFF_X1 \AffineInputASh0_r_reg[6]  ( .D(AffineInputASh0[6]), .CK(clk), .Q(
        AffineInputASh0_r[6]) );
  DFF_X1 \AffineInputASh0_r_reg[5]  ( .D(AffineInputASh0[5]), .CK(clk), .Q(
        AffineInputASh0_r[5]) );
  DFF_X1 \AffineInputASh0_r_reg[4]  ( .D(AffineInputASh0[4]), .CK(clk), .Q(
        AffineInputASh0_r[4]) );
  DFF_X1 \AffineInputASh0_r_reg[3]  ( .D(AffineInputASh0[3]), .CK(clk), .Q(
        AffineInputASh0_r[3]) );
  DFF_X1 \AffineInputASh0_r_reg[2]  ( .D(AffineInputASh0[2]), .CK(clk), .Q(
        AffineInputASh0_r[2]) );
  DFF_X1 \AffineInputASh0_r_reg[1]  ( .D(AffineInputASh0[1]), .CK(clk), .Q(
        AffineInputASh0_r[1]) );
  DFF_X1 \AffineInputASh0_r_reg[0]  ( .D(AffineInputASh0[0]), .CK(clk), .Q(
        AffineInputASh0_r[0]) );
  DFF_X1 \AffineInputASh1_r_reg[7]  ( .D(AffineInputASh1[7]), .CK(clk), .Q(
        AffineInputASh1_r[7]) );
  DFF_X1 \AffineInputASh1_r_reg[6]  ( .D(AffineInputASh1[6]), .CK(clk), .Q(
        AffineInputASh1_r[6]) );
  DFF_X1 \AffineInputASh1_r_reg[5]  ( .D(AffineInputASh1[5]), .CK(clk), .Q(
        AffineInputASh1_r[5]) );
  DFF_X1 \AffineInputASh1_r_reg[4]  ( .D(AffineInputASh1[4]), .CK(clk), .Q(
        AffineInputASh1_r[4]) );
  DFF_X1 \AffineInputASh1_r_reg[3]  ( .D(AffineInputASh1[3]), .CK(clk), .Q(
        AffineInputASh1_r[3]) );
  DFF_X1 \AffineInputASh1_r_reg[2]  ( .D(AffineInputASh1[2]), .CK(clk), .Q(
        AffineInputASh1_r[2]) );
  DFF_X1 \AffineInputASh1_r_reg[1]  ( .D(AffineInputASh1[1]), .CK(clk), .Q(
        AffineInputASh1_r[1]) );
  DFF_X1 \AffineInputASh1_r_reg[0]  ( .D(AffineInputASh1[0]), .CK(clk), .Q(
        AffineInputASh1_r[0]) );
  DFF_X1 \AffineInputBSh0_r_reg[7]  ( .D(AffineInputBSh0[7]), .CK(clk), .Q(
        AffineInputBSh0_r[7]) );
  DFF_X1 \AffineInputBSh0_r_reg[6]  ( .D(AffineInputBSh0[6]), .CK(clk), .Q(
        AffineInputBSh0_r[6]) );
  DFF_X1 \AffineInputBSh0_r_reg[5]  ( .D(AffineInputBSh0[5]), .CK(clk), .Q(
        AffineInputBSh0_r[5]) );
  DFF_X1 \AffineInputBSh0_r_reg[4]  ( .D(AffineInputBSh0[4]), .CK(clk), .Q(
        AffineInputBSh0_r[4]) );
  DFF_X1 \AffineInputBSh0_r_reg[3]  ( .D(AffineInputBSh0[3]), .CK(clk), .Q(
        AffineInputBSh0_r[3]) );
  DFF_X1 \AffineInputBSh0_r_reg[2]  ( .D(AffineInputBSh0[2]), .CK(clk), .Q(
        AffineInputBSh0_r[2]) );
  DFF_X1 \AffineInputBSh0_r_reg[1]  ( .D(AffineInputBSh0[1]), .CK(clk), .Q(
        AffineInputBSh0_r[1]) );
  DFF_X1 \AffineInputBSh0_r_reg[0]  ( .D(AffineInputBSh0[0]), .CK(clk), .Q(
        AffineInputBSh0_r[0]) );
  DFF_X1 \AffineInputBSh1_r_reg[7]  ( .D(AffineInputBSh1[7]), .CK(clk), .Q(
        AffineInputBSh1_r[7]) );
  DFF_X1 \AffineInputBSh1_r_reg[6]  ( .D(AffineInputBSh1[6]), .CK(clk), .Q(
        AffineInputBSh1_r[6]) );
  DFF_X1 \AffineInputBSh1_r_reg[5]  ( .D(AffineInputBSh1[5]), .CK(clk), .Q(
        AffineInputBSh1_r[5]) );
  DFF_X1 \AffineInputBSh1_r_reg[4]  ( .D(AffineInputBSh1[4]), .CK(clk), .Q(
        AffineInputBSh1_r[4]) );
  DFF_X1 \AffineInputBSh1_r_reg[3]  ( .D(AffineInputBSh1[3]), .CK(clk), .Q(
        AffineInputBSh1_r[3]) );
  DFF_X1 \AffineInputBSh1_r_reg[2]  ( .D(AffineInputBSh1[2]), .CK(clk), .Q(
        AffineInputBSh1_r[2]) );
  DFF_X1 \AffineInputBSh1_r_reg[1]  ( .D(AffineInputBSh1[1]), .CK(clk), .Q(
        AffineInputBSh1_r[1]) );
  DFF_X1 \AffineInputBSh1_r_reg[0]  ( .D(AffineInputBSh1[0]), .CK(clk), .Q(
        AffineInputBSh1_r[0]) );
  DFF_X1 \AffineInputASh0_r0_reg[7]  ( .D(AffineInputASh0_r[7]), .CK(clk), .Q(
        AffineInputASh0_r0[7]) );
  DFF_X1 \AffineInputASh0_r0_reg[6]  ( .D(AffineInputASh0_r[6]), .CK(clk), .Q(
        AffineInputASh0_r0[6]) );
  DFF_X1 \AffineInputASh0_r0_reg[5]  ( .D(AffineInputASh0_r[5]), .CK(clk), .Q(
        AffineInputASh0_r0[5]) );
  DFF_X1 \AffineInputASh0_r0_reg[4]  ( .D(AffineInputASh0_r[4]), .CK(clk), .Q(
        AffineInputASh0_r0[4]) );
  DFF_X1 \AffineInputASh0_r0_reg[3]  ( .D(AffineInputASh0_r[3]), .CK(clk), .Q(
        AffineInputASh0_r0[3]) );
  DFF_X1 \AffineInputASh0_r0_reg[2]  ( .D(AffineInputASh0_r[2]), .CK(clk), .Q(
        AffineInputASh0_r0[2]) );
  DFF_X1 \AffineInputASh0_r0_reg[1]  ( .D(AffineInputASh0_r[1]), .CK(clk), .Q(
        AffineInputASh0_r0[1]) );
  DFF_X1 \AffineInputASh0_r0_reg[0]  ( .D(AffineInputASh0_r[0]), .CK(clk), .Q(
        AffineInputASh0_r0[0]) );
  DFF_X1 \AffineInputASh1_r0_reg[7]  ( .D(AffineInputASh1_r[7]), .CK(clk), .Q(
        AffineInputASh1_r0[7]) );
  DFF_X1 \AffineInputASh1_r0_reg[6]  ( .D(AffineInputASh1_r[6]), .CK(clk), .Q(
        AffineInputASh1_r0[6]) );
  DFF_X1 \AffineInputASh1_r0_reg[5]  ( .D(AffineInputASh1_r[5]), .CK(clk), .Q(
        AffineInputASh1_r0[5]) );
  DFF_X1 \AffineInputASh1_r0_reg[4]  ( .D(AffineInputASh1_r[4]), .CK(clk), .Q(
        AffineInputASh1_r0[4]) );
  DFF_X1 \AffineInputASh1_r0_reg[3]  ( .D(AffineInputASh1_r[3]), .CK(clk), .Q(
        AffineInputASh1_r0[3]) );
  DFF_X1 \AffineInputASh1_r0_reg[2]  ( .D(AffineInputASh1_r[2]), .CK(clk), .Q(
        AffineInputASh1_r0[2]) );
  DFF_X1 \AffineInputASh1_r0_reg[1]  ( .D(AffineInputASh1_r[1]), .CK(clk), .Q(
        AffineInputASh1_r0[1]) );
  DFF_X1 \AffineInputASh1_r0_reg[0]  ( .D(AffineInputASh1_r[0]), .CK(clk), .Q(
        AffineInputASh1_r0[0]) );
  DFF_X1 \AffineInputBSh0_r0_reg[7]  ( .D(AffineInputBSh0_r[7]), .CK(clk), .Q(
        AffineInputBSh0_r0[7]) );
  DFF_X1 \AffineInputBSh0_r0_reg[6]  ( .D(AffineInputBSh0_r[6]), .CK(clk), .Q(
        AffineInputBSh0_r0[6]) );
  DFF_X1 \AffineInputBSh0_r0_reg[5]  ( .D(AffineInputBSh0_r[5]), .CK(clk), .Q(
        AffineInputBSh0_r0[5]) );
  DFF_X1 \AffineInputBSh0_r0_reg[4]  ( .D(AffineInputBSh0_r[4]), .CK(clk), .Q(
        AffineInputBSh0_r0[4]) );
  DFF_X1 \AffineInputBSh0_r0_reg[3]  ( .D(AffineInputBSh0_r[3]), .CK(clk), .Q(
        AffineInputBSh0_r0[3]) );
  DFF_X1 \AffineInputBSh0_r0_reg[2]  ( .D(AffineInputBSh0_r[2]), .CK(clk), .Q(
        AffineInputBSh0_r0[2]) );
  DFF_X1 \AffineInputBSh0_r0_reg[1]  ( .D(AffineInputBSh0_r[1]), .CK(clk), .Q(
        AffineInputBSh0_r0[1]) );
  DFF_X1 \AffineInputBSh0_r0_reg[0]  ( .D(AffineInputBSh0_r[0]), .CK(clk), .Q(
        AffineInputBSh0_r0[0]) );
  DFF_X1 \AffineInputBSh1_r0_reg[7]  ( .D(AffineInputBSh1_r[7]), .CK(clk), .Q(
        AffineInputBSh1_r0[7]) );
  DFF_X1 \AffineInputBSh1_r0_reg[6]  ( .D(AffineInputBSh1_r[6]), .CK(clk), .Q(
        AffineInputBSh1_r0[6]) );
  DFF_X1 \AffineInputBSh1_r0_reg[5]  ( .D(AffineInputBSh1_r[5]), .CK(clk), .Q(
        AffineInputBSh1_r0[5]) );
  DFF_X1 \AffineInputBSh1_r0_reg[4]  ( .D(AffineInputBSh1_r[4]), .CK(clk), .Q(
        AffineInputBSh1_r0[4]) );
  DFF_X1 \AffineInputBSh1_r0_reg[3]  ( .D(AffineInputBSh1_r[3]), .CK(clk), .Q(
        AffineInputBSh1_r0[3]) );
  DFF_X1 \AffineInputBSh1_r0_reg[2]  ( .D(AffineInputBSh1_r[2]), .CK(clk), .Q(
        AffineInputBSh1_r0[2]) );
  DFF_X1 \AffineInputBSh1_r0_reg[1]  ( .D(AffineInputBSh1_r[1]), .CK(clk), .Q(
        AffineInputBSh1_r0[1]) );
  DFF_X1 \AffineInputBSh1_r0_reg[0]  ( .D(AffineInputBSh1_r[0]), .CK(clk), .Q(
        AffineInputBSh1_r0[0]) );
  DFF_X1 \AffineInputASh0_r1_reg[7]  ( .D(AffineInputASh0_r0[7]), .CK(clk), 
        .Q(AffineInputASh0_r1[7]) );
  DFF_X1 \AffineInputASh0_r1_reg[6]  ( .D(AffineInputASh0_r0[6]), .CK(clk), 
        .Q(AffineInputASh0_r1[6]) );
  DFF_X1 \AffineInputASh0_r1_reg[5]  ( .D(AffineInputASh0_r0[5]), .CK(clk), 
        .Q(AffineInputASh0_r1[5]) );
  DFF_X1 \AffineInputASh0_r1_reg[4]  ( .D(AffineInputASh0_r0[4]), .CK(clk), 
        .Q(AffineInputASh0_r1[4]) );
  DFF_X1 \AffineInputASh0_r1_reg[3]  ( .D(AffineInputASh0_r0[3]), .CK(clk), 
        .Q(AffineInputASh0_r1[3]) );
  DFF_X1 \AffineInputASh0_r1_reg[2]  ( .D(AffineInputASh0_r0[2]), .CK(clk), 
        .Q(AffineInputASh0_r1[2]) );
  DFF_X1 \AffineInputASh0_r1_reg[1]  ( .D(AffineInputASh0_r0[1]), .CK(clk), 
        .Q(AffineInputASh0_r1[1]) );
  DFF_X1 \AffineInputASh0_r1_reg[0]  ( .D(AffineInputASh0_r0[0]), .CK(clk), 
        .Q(AffineInputASh0_r1[0]) );
  DFF_X1 \AffineInputASh1_r1_reg[7]  ( .D(AffineInputASh1_r0[7]), .CK(clk), 
        .Q(AffineInputASh1_r1[7]) );
  DFF_X1 \AffineInputASh1_r1_reg[6]  ( .D(AffineInputASh1_r0[6]), .CK(clk), 
        .Q(AffineInputASh1_r1[6]) );
  DFF_X1 \AffineInputASh1_r1_reg[5]  ( .D(AffineInputASh1_r0[5]), .CK(clk), 
        .Q(AffineInputASh1_r1[5]) );
  DFF_X1 \AffineInputASh1_r1_reg[4]  ( .D(AffineInputASh1_r0[4]), .CK(clk), 
        .Q(AffineInputASh1_r1[4]) );
  DFF_X1 \AffineInputASh1_r1_reg[3]  ( .D(AffineInputASh1_r0[3]), .CK(clk), 
        .Q(AffineInputASh1_r1[3]) );
  DFF_X1 \AffineInputASh1_r1_reg[2]  ( .D(AffineInputASh1_r0[2]), .CK(clk), 
        .Q(AffineInputASh1_r1[2]) );
  DFF_X1 \AffineInputASh1_r1_reg[1]  ( .D(AffineInputASh1_r0[1]), .CK(clk), 
        .Q(AffineInputASh1_r1[1]) );
  DFF_X1 \AffineInputASh1_r1_reg[0]  ( .D(AffineInputASh1_r0[0]), .CK(clk), 
        .Q(AffineInputASh1_r1[0]) );
  DFF_X1 \AffineInputBSh0_r1_reg[7]  ( .D(AffineInputBSh0_r0[7]), .CK(clk), 
        .Q(AffineInputBSh0_r1[7]) );
  DFF_X1 \AffineInputBSh0_r1_reg[6]  ( .D(AffineInputBSh0_r0[6]), .CK(clk), 
        .Q(AffineInputBSh0_r1[6]) );
  DFF_X1 \AffineInputBSh0_r1_reg[5]  ( .D(AffineInputBSh0_r0[5]), .CK(clk), 
        .Q(AffineInputBSh0_r1[5]) );
  DFF_X1 \AffineInputBSh0_r1_reg[4]  ( .D(AffineInputBSh0_r0[4]), .CK(clk), 
        .Q(AffineInputBSh0_r1[4]) );
  DFF_X1 \AffineInputBSh0_r1_reg[3]  ( .D(AffineInputBSh0_r0[3]), .CK(clk), 
        .Q(AffineInputBSh0_r1[3]) );
  DFF_X1 \AffineInputBSh0_r1_reg[2]  ( .D(AffineInputBSh0_r0[2]), .CK(clk), 
        .Q(AffineInputBSh0_r1[2]) );
  DFF_X1 \AffineInputBSh0_r1_reg[1]  ( .D(AffineInputBSh0_r0[1]), .CK(clk), 
        .Q(AffineInputBSh0_r1[1]) );
  DFF_X1 \AffineInputBSh0_r1_reg[0]  ( .D(AffineInputBSh0_r0[0]), .CK(clk), 
        .Q(AffineInputBSh0_r1[0]) );
  DFF_X1 \AffineInputBSh1_r1_reg[7]  ( .D(AffineInputBSh1_r0[7]), .CK(clk), 
        .Q(AffineInputBSh1_r1[7]) );
  DFF_X1 \AffineInputBSh1_r1_reg[6]  ( .D(AffineInputBSh1_r0[6]), .CK(clk), 
        .Q(AffineInputBSh1_r1[6]) );
  DFF_X1 \AffineInputBSh1_r1_reg[5]  ( .D(AffineInputBSh1_r0[5]), .CK(clk), 
        .Q(AffineInputBSh1_r1[5]) );
  DFF_X1 \AffineInputBSh1_r1_reg[4]  ( .D(AffineInputBSh1_r0[4]), .CK(clk), 
        .Q(AffineInputBSh1_r1[4]) );
  DFF_X1 \AffineInputBSh1_r1_reg[3]  ( .D(AffineInputBSh1_r0[3]), .CK(clk), 
        .Q(AffineInputBSh1_r1[3]) );
  DFF_X1 \AffineInputBSh1_r1_reg[2]  ( .D(AffineInputBSh1_r0[2]), .CK(clk), 
        .Q(AffineInputBSh1_r1[2]) );
  DFF_X1 \AffineInputBSh1_r1_reg[1]  ( .D(AffineInputBSh1_r0[1]), .CK(clk), 
        .Q(AffineInputBSh1_r1[1]) );
  DFF_X1 \AffineInputBSh1_r1_reg[0]  ( .D(AffineInputBSh1_r0[0]), .CK(clk), 
        .Q(AffineInputBSh1_r1[0]) );
  DFF_X1 \AffineInputASh0_r2_reg[7]  ( .D(AffineInputASh0_r1[7]), .CK(clk), 
        .Q(va0ua0sa0ra0ta0za0ya0xa0[7]) );
  DFF_X1 \AffineInputASh0_r2_reg[6]  ( .D(AffineInputASh0_r1[6]), .CK(clk), 
        .Q(va0ua0sa0ra0ta0za0ya0xa0[6]) );
  DFF_X1 \AffineInputASh0_r2_reg[5]  ( .D(AffineInputASh0_r1[5]), .CK(clk), 
        .Q(va0ua0sa0ra0ta0za0ya0xa0[5]) );
  DFF_X1 \AffineInputASh0_r2_reg[4]  ( .D(AffineInputASh0_r1[4]), .CK(clk), 
        .Q(va0ua0sa0ra0ta0za0ya0xa0[4]) );
  DFF_X1 \AffineInputASh0_r2_reg[3]  ( .D(AffineInputASh0_r1[3]), .CK(clk), 
        .Q(va0ua0sa0ra0ta0za0ya0xa0[3]) );
  DFF_X1 \AffineInputASh0_r2_reg[2]  ( .D(AffineInputASh0_r1[2]), .CK(clk), 
        .Q(va0ua0sa0ra0ta0za0ya0xa0[2]) );
  DFF_X1 \AffineInputASh0_r2_reg[1]  ( .D(AffineInputASh0_r1[1]), .CK(clk), 
        .Q(va0ua0sa0ra0ta0za0ya0xa0[1]) );
  DFF_X1 \AffineInputASh0_r2_reg[0]  ( .D(AffineInputASh0_r1[0]), .CK(clk), 
        .Q(va0ua0sa0ra0ta0za0ya0xa0[0]) );
  DFF_X1 \AffineInputASh1_r2_reg[7]  ( .D(AffineInputASh1_r1[7]), .CK(clk), 
        .Q(va1ua1sa1ra1ta1za1ya1xa1[7]) );
  DFF_X1 \AffineInputASh1_r2_reg[6]  ( .D(AffineInputASh1_r1[6]), .CK(clk), 
        .Q(va1ua1sa1ra1ta1za1ya1xa1[6]) );
  DFF_X1 \AffineInputASh1_r2_reg[5]  ( .D(AffineInputASh1_r1[5]), .CK(clk), 
        .Q(va1ua1sa1ra1ta1za1ya1xa1[5]) );
  DFF_X1 \AffineInputASh1_r2_reg[4]  ( .D(AffineInputASh1_r1[4]), .CK(clk), 
        .Q(va1ua1sa1ra1ta1za1ya1xa1[4]) );
  DFF_X1 \AffineInputASh1_r2_reg[3]  ( .D(AffineInputASh1_r1[3]), .CK(clk), 
        .Q(va1ua1sa1ra1ta1za1ya1xa1[3]) );
  DFF_X1 \AffineInputASh1_r2_reg[2]  ( .D(AffineInputASh1_r1[2]), .CK(clk), 
        .Q(va1ua1sa1ra1ta1za1ya1xa1[2]) );
  DFF_X1 \AffineInputASh1_r2_reg[1]  ( .D(AffineInputASh1_r1[1]), .CK(clk), 
        .Q(va1ua1sa1ra1ta1za1ya1xa1[1]) );
  DFF_X1 \AffineInputASh1_r2_reg[0]  ( .D(AffineInputASh1_r1[0]), .CK(clk), 
        .Q(va1ua1sa1ra1ta1za1ya1xa1[0]) );
  DFF_X1 \AffineInputBSh0_r2_reg[7]  ( .D(AffineInputBSh0_r1[7]), .CK(clk), 
        .Q(vb0ub0sb0rb0tb0zb0yb0xb0[7]) );
  DFF_X1 \AffineInputBSh0_r2_reg[6]  ( .D(AffineInputBSh0_r1[6]), .CK(clk), 
        .Q(vb0ub0sb0rb0tb0zb0yb0xb0[6]) );
  DFF_X1 \AffineInputBSh0_r2_reg[5]  ( .D(AffineInputBSh0_r1[5]), .CK(clk), 
        .Q(vb0ub0sb0rb0tb0zb0yb0xb0[5]) );
  DFF_X1 \AffineInputBSh0_r2_reg[4]  ( .D(AffineInputBSh0_r1[4]), .CK(clk), 
        .Q(vb0ub0sb0rb0tb0zb0yb0xb0[4]) );
  DFF_X1 \AffineInputBSh0_r2_reg[3]  ( .D(AffineInputBSh0_r1[3]), .CK(clk), 
        .Q(vb0ub0sb0rb0tb0zb0yb0xb0[3]) );
  DFF_X1 \AffineInputBSh0_r2_reg[2]  ( .D(AffineInputBSh0_r1[2]), .CK(clk), 
        .Q(vb0ub0sb0rb0tb0zb0yb0xb0[2]) );
  DFF_X1 \AffineInputBSh0_r2_reg[1]  ( .D(AffineInputBSh0_r1[1]), .CK(clk), 
        .Q(vb0ub0sb0rb0tb0zb0yb0xb0[1]) );
  DFF_X1 \AffineInputBSh0_r2_reg[0]  ( .D(AffineInputBSh0_r1[0]), .CK(clk), 
        .Q(vb0ub0sb0rb0tb0zb0yb0xb0[0]) );
  DFF_X1 \AffineInputBSh1_r2_reg[7]  ( .D(AffineInputBSh1_r1[7]), .CK(clk), 
        .Q(vb1ub1sb1rb1tb1zb1yb1xb1[7]) );
  DFF_X1 \AffineInputBSh1_r2_reg[6]  ( .D(AffineInputBSh1_r1[6]), .CK(clk), 
        .Q(vb1ub1sb1rb1tb1zb1yb1xb1[6]) );
  DFF_X1 \AffineInputBSh1_r2_reg[5]  ( .D(AffineInputBSh1_r1[5]), .CK(clk), 
        .Q(vb1ub1sb1rb1tb1zb1yb1xb1[5]) );
  DFF_X1 \AffineInputBSh1_r2_reg[4]  ( .D(AffineInputBSh1_r1[4]), .CK(clk), 
        .Q(vb1ub1sb1rb1tb1zb1yb1xb1[4]) );
  DFF_X1 \AffineInputBSh1_r2_reg[3]  ( .D(AffineInputBSh1_r1[3]), .CK(clk), 
        .Q(vb1ub1sb1rb1tb1zb1yb1xb1[3]) );
  DFF_X1 \AffineInputBSh1_r2_reg[2]  ( .D(AffineInputBSh1_r1[2]), .CK(clk), 
        .Q(vb1ub1sb1rb1tb1zb1yb1xb1[2]) );
  DFF_X1 \AffineInputBSh1_r2_reg[1]  ( .D(AffineInputBSh1_r1[1]), .CK(clk), 
        .Q(vb1ub1sb1rb1tb1zb1yb1xb1[1]) );
  DFF_X1 \AffineInputBSh1_r2_reg[0]  ( .D(AffineInputBSh1_r1[0]), .CK(clk), 
        .Q(vb1ub1sb1rb1tb1zb1yb1xb1[0]) );
  DFF_X1 \Gf16MulXorSqScASh0_r_reg[3]  ( .D(Gf16MulXorSqScASh0[3]), .CK(clk), 
        .Q(Gf16MulXorSqScASh0_r[3]) );
  DFF_X1 \Gf16MulXorSqScASh0_r_reg[2]  ( .D(Gf16MulXorSqScASh0[2]), .CK(clk), 
        .Q(Gf16MulXorSqScASh0_r[2]) );
  DFF_X1 \Gf16MulXorSqScASh0_r_reg[1]  ( .D(Gf16MulXorSqScASh0[1]), .CK(clk), 
        .Q(Gf16MulXorSqScASh0_r[1]) );
  DFF_X1 \Gf16MulXorSqScASh0_r_reg[0]  ( .D(Gf16MulXorSqScASh0[0]), .CK(clk), 
        .Q(Gf16MulXorSqScASh0_r[0]) );
  DFF_X1 \Gf16MulXorSqScASh1_r_reg[3]  ( .D(Gf16MulXorSqScASh1[3]), .CK(clk), 
        .Q(Gf16MulXorSqScASh1_r[3]) );
  DFF_X1 \Gf16MulXorSqScASh1_r_reg[2]  ( .D(Gf16MulXorSqScASh1[2]), .CK(clk), 
        .Q(Gf16MulXorSqScASh1_r[2]) );
  DFF_X1 \Gf16MulXorSqScASh1_r_reg[1]  ( .D(Gf16MulXorSqScASh1[1]), .CK(clk), 
        .Q(Gf16MulXorSqScASh1_r[1]) );
  DFF_X1 \Gf16MulXorSqScASh1_r_reg[0]  ( .D(Gf16MulXorSqScASh1[0]), .CK(clk), 
        .Q(Gf16MulXorSqScASh1_r[0]) );
  DFF_X1 \Gf16MulXorSqScBSh0_r_reg[3]  ( .D(Gf16MulXorSqScBSh0[3]), .CK(clk), 
        .Q(Gf16MulXorSqScBSh0_r[3]) );
  DFF_X1 \Gf16MulXorSqScBSh0_r_reg[2]  ( .D(Gf16MulXorSqScBSh0[2]), .CK(clk), 
        .Q(Gf16MulXorSqScBSh0_r[2]) );
  DFF_X1 \Gf16MulXorSqScBSh0_r_reg[1]  ( .D(Gf16MulXorSqScBSh0[1]), .CK(clk), 
        .Q(Gf16MulXorSqScBSh0_r[1]) );
  DFF_X1 \Gf16MulXorSqScBSh0_r_reg[0]  ( .D(Gf16MulXorSqScBSh0[0]), .CK(clk), 
        .Q(Gf16MulXorSqScBSh0_r[0]) );
  DFF_X1 \Gf16MulXorSqScBSh1_r_reg[3]  ( .D(Gf16MulXorSqScBSh1[3]), .CK(clk), 
        .Q(Gf16MulXorSqScBSh1_r[3]) );
  DFF_X1 \Gf16MulXorSqScBSh1_r_reg[2]  ( .D(Gf16MulXorSqScBSh1[2]), .CK(clk), 
        .Q(Gf16MulXorSqScBSh1_r[2]) );
  DFF_X1 \Gf16MulXorSqScBSh1_r_reg[1]  ( .D(Gf16MulXorSqScBSh1[1]), .CK(clk), 
        .Q(Gf16MulXorSqScBSh1_r[1]) );
  DFF_X1 \Gf16MulXorSqScBSh1_r_reg[0]  ( .D(Gf16MulXorSqScBSh1[0]), .CK(clk), 
        .Q(Gf16MulXorSqScBSh1_r[0]) );
endmodule

