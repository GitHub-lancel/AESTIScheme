#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

const int AESSbox[256] = {
			0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5, 0x30, 0x01, 0x67, 0x2b, 0xfe, 0xd7, 0xab, 0x76,
			0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0, 0xad, 0xd4, 0xa2, 0xaf, 0x9c, 0xa4, 0x72, 0xc0,
			0xb7, 0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7, 0xcc, 0x34, 0xa5, 0xe5, 0xf1, 0x71, 0xd8, 0x31, 0x15,
			0x04, 0xc7, 0x23, 0xc3, 0x18, 0x96, 0x05, 0x9a, 0x07, 0x12, 0x80, 0xe2, 0xeb, 0x27, 0xb2, 0x75,
			0x09, 0x83, 0x2c, 0x1a, 0x1b, 0x6e, 0x5a, 0xa0, 0x52, 0x3b, 0xd6, 0xb3, 0x29, 0xe3, 0x2f, 0x84,
			0x53, 0xd1, 0x00, 0xed, 0x20, 0xfc, 0xb1, 0x5b, 0x6a, 0xcb, 0xbe, 0x39, 0x4a, 0x4c, 0x58, 0xcf,
			0xd0, 0xef, 0xaa, 0xfb, 0x43, 0x4d, 0x33, 0x85, 0x45, 0xf9, 0x02, 0x7f, 0x50, 0x3c, 0x9f, 0xa8,
			0x51, 0xa3, 0x40, 0x8f, 0x92, 0x9d, 0x38, 0xf5, 0xbc, 0xb6, 0xda, 0x21, 0x10, 0xff, 0xf3, 0xd2,
			0xcd, 0x0c, 0x13, 0xec, 0x5f, 0x97, 0x44, 0x17, 0xc4, 0xa7, 0x7e, 0x3d, 0x64, 0x5d, 0x19, 0x73,
			0x60, 0x81, 0x4f, 0xdc, 0x22, 0x2a, 0x90, 0x88, 0x46, 0xee, 0xb8, 0x14, 0xde, 0x5e, 0x0b, 0xdb,
			0xe0, 0x32, 0x3a, 0x0a, 0x49, 0x06, 0x24, 0x5c, 0xc2, 0xd3, 0xac, 0x62, 0x91, 0x95, 0xe4, 0x79,
			0xe7, 0xc8, 0x37, 0x6d, 0x8d, 0xd5, 0x4e, 0xa9, 0x6c, 0x56, 0xf4, 0xea, 0x65, 0x7a, 0xae, 0x08,
			0xba, 0x78, 0x25, 0x2e, 0x1c, 0xa6, 0xb4, 0xc6, 0xe8, 0xdd, 0x74, 0x1f, 0x4b, 0xbd, 0x8b, 0x8a,
			0x70, 0x3e, 0xb5, 0x66, 0x48, 0x03, 0xf6, 0x0e, 0x61, 0x35, 0x57, 0xb9, 0x86, 0xc1, 0x1d, 0x9e,
			0xe1, 0xf8, 0x98, 0x11, 0x69, 0xd9, 0x8e, 0x94, 0x9b, 0x1e, 0x87, 0xe9, 0xce, 0x55, 0x28, 0xdf,
			0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68, 0x41, 0x99, 0x2d, 0x0f, 0xb0, 0x54, 0xbb, 0x16
};
// byte to bit;
int ByteToBit(int datByte, int* datBit)
{
	for (int i = 0; i < 8; i++)
	{
		datBit[i] = (datByte >> i) & 1;
	}
	return 1;
}
// nibble to bit;
int NibbleToBit(int datNibble, int* datBit)
{
	for (int i = 0; i < 4; i++)
	{
		datBit[i] = (datNibble >> i) & 1;
	}
	return 1;
}
// GF256ToGF16 module
int GF256MapIntoGF16(int din, int* dout1, int* dout2)
{
	int dinbit[8];
	int doutbit[8];

	ByteToBit(din, dinbit);

	doutbit[0] = dinbit[0] ^ dinbit[1] ^ dinbit[2] ^ dinbit[3] ^ dinbit[6];
	doutbit[1] = dinbit[0] ^ dinbit[5] ^ dinbit[6];
	doutbit[2] = dinbit[0];
	doutbit[3] = dinbit[0] ^ dinbit[1] ^ dinbit[3] ^ dinbit[4] ^ dinbit[7];

	doutbit[4] = dinbit[0] ^ dinbit[5] ^ dinbit[6] ^ dinbit[7];
	doutbit[5] = dinbit[0] ^ dinbit[1] ^ dinbit[5] ^ dinbit[6];
	doutbit[6] = dinbit[0] ^ dinbit[4] ^ dinbit[5] ^ dinbit[6];
	doutbit[7] = dinbit[0] ^ dinbit[1] ^ dinbit[2] ^ dinbit[5] ^ dinbit[6] ^ dinbit[7];

	dout1[0] = (doutbit[7] << 3) | (doutbit[6] << 2) | (doutbit[5] << 1) | (doutbit[4]);
	dout2[0] = (doutbit[3] << 3) | (doutbit[2] << 2) | (doutbit[1] << 1) | (doutbit[0]);

	return 1;
}
// GF256ToGF16 Masking Scheme;
int GF256ToGF16MaskingSchemeParallel(int ha0ga0fa0ea0da0ca0ba0aa0, int ha1ga1fa1ea1da1ca1ba1aa1,
	int hb0gb0fb0eb0db0cb0bb0ab0, int hb1gb1fb1eb1db1cb1bb1ab1,
	int* aha30aha20aha10aha00, int* aha31aha21aha11aha01,
	int* ala30ala20ala10ala00, int* ala31ala21ala11ala01,
	int* ahb30ahb20ahb10ahb00, int* ahb31ahb21ahb11ahb01,
	int* alb30alb20alb10alb00, int* alb31alb21alb11alb01)
{
	// Sboxa;
	GF256MapIntoGF16(ha0ga0fa0ea0da0ca0ba0aa0, aha30aha20aha10aha00, ala30ala20ala10ala00);
	GF256MapIntoGF16(ha1ga1fa1ea1da1ca1ba1aa1, aha31aha21aha11aha01, ala31ala21ala11ala01);

	// Sboxb;							   
	GF256MapIntoGF16(hb0gb0fb0eb0db0cb0bb0ab0, ahb30ahb20ahb10ahb00, alb30alb20alb10alb00);
	GF256MapIntoGF16(hb1gb1fb1eb1db1cb1bb1ab1, ahb31ahb21ahb11ahb01, alb31alb21alb11alb01);

	return 1;
}
// GF16.MulXorSqSc module
int GF16MulXorSqSc(int dcba, int hgfe, int* tzyx)
{
	int dcbabit[4];
	int hgfebit[4];

	int a, b, c, d;
	int e, f, g, h;
	int x, y, z, t;

	NibbleToBit(dcba, dcbabit);
	NibbleToBit(hgfe, hgfebit);

	a = dcbabit[0];
	b = dcbabit[1];
	c = dcbabit[2];
	d = dcbabit[3];

	e = hgfebit[0];
	f = hgfebit[1];
	g = hgfebit[2];
	h = hgfebit[3];

	x = (a & e) ^ (a & f) ^ (a & g) ^ (b & e) ^ (b & h) ^ (c & e) ^ (c & g) ^ (d & f) ^ (d & h) ^ a ^ e;
	y = (a & e) ^ (a & h) ^ (b & f) ^ (b & g) ^ (b & h) ^ (c & f) ^ (c & h) ^ (d & e) ^ (d & f) ^ (d & g) ^ (d & h) ^ a ^ b ^ e ^ f;
	z = (a & e) ^ (a & g) ^ (b & f) ^ (b & h) ^ (c & e) ^ (c & g) ^ (c & h) ^ (d & f) ^ (d & g) ^ b ^ d ^ f ^ h;
	t = (a & f) ^ (a & h) ^ (b & e) ^ (b & f) ^ (b & g) ^ (b & h) ^ (c & f) ^ (c & g) ^ (d & e) ^ (d & f) ^ (d & h) ^ a ^ c ^ e ^ g;

	tzyx[0] = (t << 3) | (z << 2) | (y << 1) | (x << 0);

	return 1;
}
int GF16MulXorSqScMaskingSchemeParallel(int ha0ga0fa0ea0, int ha1ga1fa1ea1, int da0ca0ba0aa0, int da1ca1ba1aa1,
	int hb0gb0fb0eb0, int hb1gb1fb1eb1, int db0cb0bb0ab0, int db1cb1bb1ab1,
	int* ta, int* za, int* ya, int* xa,
	int* tb, int* zb, int* yb, int* xb)
{
	// Sboxa
	int ha0 = (ha0ga0fa0ea0 >> 3) & 1;
	int ga0 = (ha0ga0fa0ea0 >> 2) & 1;
	int fa0 = (ha0ga0fa0ea0 >> 1) & 1;
	int ea0 = (ha0ga0fa0ea0 >> 0) & 1;

	int da0 = (da0ca0ba0aa0 >> 3) & 1;
	int ca0 = (da0ca0ba0aa0 >> 2) & 1;
	int ba0 = (da0ca0ba0aa0 >> 1) & 1;
	int aa0 = (da0ca0ba0aa0 >> 0) & 1;

	int ha1 = (ha1ga1fa1ea1 >> 3) & 1;
	int ga1 = (ha1ga1fa1ea1 >> 2) & 1;
	int fa1 = (ha1ga1fa1ea1 >> 1) & 1;
	int ea1 = (ha1ga1fa1ea1 >> 0) & 1;

	int da1 = (da1ca1ba1aa1 >> 3) & 1;
	int ca1 = (da1ca1ba1aa1 >> 2) & 1;
	int ba1 = (da1ca1ba1aa1 >> 1) & 1;
	int aa1 = (da1ca1ba1aa1 >> 0) & 1;

	// Sboxb
	int hb0 = (hb0gb0fb0eb0 >> 3) & 1;
	int gb0 = (hb0gb0fb0eb0 >> 2) & 1;
	int fb0 = (hb0gb0fb0eb0 >> 1) & 1;
	int eb0 = (hb0gb0fb0eb0 >> 0) & 1;

	int db0 = (db0cb0bb0ab0 >> 3) & 1;
	int cb0 = (db0cb0bb0ab0 >> 2) & 1;
	int bb0 = (db0cb0bb0ab0 >> 1) & 1;
	int ab0 = (db0cb0bb0ab0 >> 0) & 1;

	int hb1 = (hb1gb1fb1eb1 >> 3) & 1;
	int gb1 = (hb1gb1fb1eb1 >> 2) & 1;
	int fb1 = (hb1gb1fb1eb1 >> 1) & 1;
	int eb1 = (hb1gb1fb1eb1 >> 0) & 1;

	int db1 = (db1cb1bb1ab1 >> 3) & 1;
	int cb1 = (db1cb1bb1ab1 >> 2) & 1;
	int bb1 = (db1cb1bb1ab1 >> 1) & 1;
	int ab1 = (db1cb1bb1ab1 >> 0) & 1;

	// Sboxa;
	xa[0] =				(aa0 & ea0) ^ (ba0 & ea0) ^ (ca0 & ea0) ^ (aa0 & fa0) ^ (da0 & fa0) ^ (aa0 & ga0) ^ (ca0 & ga0) ^ (ba0 & ha0) ^ (da0 & ha0) ^ ab0;
	xa[1] = aa0 ^ ea1 ^ (aa0 & ea1) ^ (ba0 & ea1) ^ (ca0 & ea1) ^ (aa0 & fa1) ^ (da0 & fa1) ^ (aa0 & ga1) ^ (ca0 & ga1) ^ (ba0 & ha1) ^ (da0 & ha1) ^ ab0;
	xa[2] = da1 ^ ea0 ^ (aa1 & ea0) ^ (ba1 & ea0) ^ (ca1 & ea0) ^ (aa1 & fa0) ^ (da1 & fa0) ^ (aa1 & ga0) ^ (ca1 & ga0) ^ (ba1 & ha0) ^ (da1 & ha0) ^ ab0;
	xa[3] = aa1 ^ da1 ^ (aa1 & ea1) ^ (ba1 & ea1) ^ (ca1 & ea1) ^ (aa1 & fa1) ^ (da1 & fa1) ^ (aa1 & ga1) ^ (ca1 & ga1) ^ (ba1 & ha1) ^ (da1 & ha1) ^ ab0;

	ya[0] =				da0		  ^ (aa0 & ea0) ^ (da0 & ea0) ^ (ba0 & fa0) ^ (ca0 & fa0) ^ (da0 & fa0) ^ (ba0 & ga0) ^ (da0 & ga0) ^ (aa0 & ha0) ^ (ba0 & ha0) ^ (ca0 & ha0) ^ (da0 & ha0) ^ bb0;
	ya[1] = aa0 ^ ba0 ^ da0 ^ fa1 ^ (aa0 & ea1) ^ (da0 & ea1) ^ (ba0 & fa1) ^ (ca0 & fa1) ^ (da0 & fa1) ^ (ba0 & ga1) ^ (da0 & ga1) ^ (aa0 & ha1) ^ (ba0 & ha1) ^ (ca0 & ha1) ^ (da0 & ha1) ^ bb0;
	ya[2] = aa1 ^ ba1 ^ ea0 ^ fa0 ^ (aa1 & ea0) ^ (da1 & ea0) ^ (ba1 & fa0) ^ (ca1 & fa0) ^ (da1 & fa0) ^ (ba1 & ga0) ^ (da1 & ga0) ^ (aa1 & ha0) ^ (ba1 & ha0) ^ (ca1 & ha0) ^ (da1 & ha0) ^ bb0;
	ya[3] =				ea1		  ^ (aa1 & ea1) ^ (da1 & ea1) ^ (ba1 & fa1) ^ (ca1 & fa1) ^ (da1 & fa1) ^ (ba1 & ga1) ^ (da1 & ga1) ^ (aa1 & ha1) ^ (ba1 & ha1) ^ (ca1 & ha1) ^ (da1 & ha1) ^ bb0;

	za[0] = aa0							^ (aa0 & ea0) ^ (ca0 & ea0) ^ (ba0 & fa0) ^ (da0 & fa0) ^ (aa0 & ga0) ^ (ca0 & ga0) ^ (da0 & ga0) ^ (ba0 & ha0) ^ (ca0 & ha0) ^ cb0;
	za[1] = aa0 ^ ba0 ^ da0 ^ ga1		^ (aa0 & ea1) ^ (ca0 & ea1) ^ (ba0 & fa1) ^ (da0 & fa1) ^ (aa0 & ga1) ^ (ca0 & ga1) ^ (da0 & ga1) ^ (ba0 & ha1) ^ (ca0 & ha1) ^ cb0;
	za[2] = aa1 ^ ba1 ^ da1 ^ fa0 ^ ha0 ^ (aa1 & ea0) ^ (ca1 & ea0) ^ (ba1 & fa0) ^ (da1 & fa0) ^ (aa1 & ga0) ^ (ca1 & ga0) ^ (da1 & ga0) ^ (ba1 & ha0) ^ (ca1 & ha0) ^ cb0;
	za[3] = aa1 ^ fa1 ^ ga1 ^ ha1		^ (aa1 & ea1) ^ (ca1 & ea1) ^ (ba1 & fa1) ^ (da1 & fa1) ^ (aa1 & ga1) ^ (ca1 & ga1) ^ (da1 & ga1) ^ (ba1 & ha1) ^ (ca1 & ha1) ^ cb0;

	ta[0] =		  ba0					^ (ba0 & ea0) ^ (da0 & ea0) ^ (aa0 & fa0) ^ (ba0 & fa0) ^ (ca0 & fa0) ^ (da0 & fa0) ^ (ba0 & ga0) ^ (ca0 & ga0) ^ (aa0 & ha0) ^ (ba0 & ha0) ^ (da0 & ha0) ^ db0;
	ta[1] = aa0 ^ ba0 ^ ca0 ^ ha1		^ (ba0 & ea1) ^ (da0 & ea1) ^ (aa0 & fa1) ^ (ba0 & fa1) ^ (ca0 & fa1) ^ (da0 & fa1) ^ (ba0 & ga1) ^ (ca0 & ga1) ^ (aa0 & ha1) ^ (ba0 & ha1) ^ (da0 & ha1) ^ db0;
	ta[2] = aa1 ^ ba1 ^ ca1 ^ ea0 ^ ga0 ^ (ba1 & ea0) ^ (da1 & ea0) ^ (aa1 & fa0) ^ (ba1 & fa0) ^ (ca1 & fa0) ^ (da1 & fa0) ^ (ba1 & ga0) ^ (ca1 & ga0) ^ (aa1 & ha0) ^ (ba1 & ha0) ^ (da1 & ha0) ^ db0;
	ta[3] = ba1 ^ ea1 ^ ga1 ^ ha1		^ (ba1 & ea1) ^ (da1 & ea1) ^ (aa1 & fa1) ^ (ba1 & fa1) ^ (ca1 & fa1) ^ (da1 & fa1) ^ (ba1 & ga1) ^ (ca1 & ga1) ^ (aa1 & ha1) ^ (ba1 & ha1) ^ (da1 & ha1) ^ db0;

	// Sboxb;
	xb[0] =			    (ab0 & eb0) ^ (bb0 & eb0) ^ (cb0 & eb0) ^ (ab0 & fb0) ^ (db0 & fb0) ^ (ab0 & gb0) ^ (cb0 & gb0) ^ (bb0 & hb0) ^ (db0 & hb0) ^ aa0;
	xb[1] = ab0 ^ eb1 ^ (ab0 & eb1) ^ (bb0 & eb1) ^ (cb0 & eb1) ^ (ab0 & fb1) ^ (db0 & fb1) ^ (ab0 & gb1) ^ (cb0 & gb1) ^ (bb0 & hb1) ^ (db0 & hb1) ^ aa0;
	xb[2] = db1 ^ eb0 ^ (ab1 & eb0) ^ (bb1 & eb0) ^ (cb1 & eb0) ^ (ab1 & fb0) ^ (db1 & fb0) ^ (ab1 & gb0) ^ (cb1 & gb0) ^ (bb1 & hb0) ^ (db1 & hb0) ^ aa0;
	xb[3] = ab1 ^ db1 ^ (ab1 & eb1) ^ (bb1 & eb1) ^ (cb1 & eb1) ^ (ab1 & fb1) ^ (db1 & fb1) ^ (ab1 & gb1) ^ (cb1 & gb1) ^ (bb1 & hb1) ^ (db1 & hb1) ^ aa0;

	yb[0] =				db0		  ^ (ab0 & eb0) ^ (db0 & eb0) ^ (bb0 & fb0) ^ (cb0 & fb0) ^ (db0 & fb0) ^ (bb0 & gb0) ^ (db0 & gb0) ^ (ab0 & hb0) ^ (bb0 & hb0) ^ (cb0 & hb0) ^ (db0 & hb0) ^ ba0;
	yb[1] = ab0 ^ bb0 ^ db0 ^ fb1 ^ (ab0 & eb1) ^ (db0 & eb1) ^ (bb0 & fb1) ^ (cb0 & fb1) ^ (db0 & fb1) ^ (bb0 & gb1) ^ (db0 & gb1) ^ (ab0 & hb1) ^ (bb0 & hb1) ^ (cb0 & hb1) ^ (db0 & hb1) ^ ba0;
	yb[2] = ab1 ^ bb1 ^ eb0 ^ fb0 ^ (ab1 & eb0) ^ (db1 & eb0) ^ (bb1 & fb0) ^ (cb1 & fb0) ^ (db1 & fb0) ^ (bb1 & gb0) ^ (db1 & gb0) ^ (ab1 & hb0) ^ (bb1 & hb0) ^ (cb1 & hb0) ^ (db1 & hb0) ^ ba0;
	yb[3] = eb1					  ^ (ab1 & eb1) ^ (db1 & eb1) ^ (bb1 & fb1) ^ (cb1 & fb1) ^ (db1 & fb1) ^ (bb1 & gb1) ^ (db1 & gb1) ^ (ab1 & hb1) ^ (bb1 & hb1) ^ (cb1 & hb1) ^ (db1 & hb1) ^ ba0;

	zb[0] = ab0							^ (ab0 & eb0) ^ (cb0 & eb0) ^ (bb0 & fb0) ^ (db0 & fb0) ^ (ab0 & gb0) ^ (cb0 & gb0) ^ (db0 & gb0) ^ (bb0 & hb0) ^ (cb0 & hb0) ^ ca0;
	zb[1] = ab0 ^ bb0 ^ db0 ^ gb1		^ (ab0 & eb1) ^ (cb0 & eb1) ^ (bb0 & fb1) ^ (db0 & fb1) ^ (ab0 & gb1) ^ (cb0 & gb1) ^ (db0 & gb1) ^ (bb0 & hb1) ^ (cb0 & hb1) ^ ca0;
	zb[2] = ab1 ^ bb1 ^ db1 ^ fb0 ^ hb0 ^ (ab1 & eb0) ^ (cb1 & eb0) ^ (bb1 & fb0) ^ (db1 & fb0) ^ (ab1 & gb0) ^ (cb1 & gb0) ^ (db1 & gb0) ^ (bb1 & hb0) ^ (cb1 & hb0) ^ ca0;
	zb[3] = ab1 ^ fb1 ^ gb1 ^ hb1		^ (ab1 & eb1) ^ (cb1 & eb1) ^ (bb1 & fb1) ^ (db1 & fb1) ^ (ab1 & gb1) ^ (cb1 & gb1) ^ (db1 & gb1) ^ (bb1 & hb1) ^ (cb1 & hb1) ^ ca0;

	tb[0] = bb0							^ (bb0 & eb0) ^ (db0 & eb0) ^ (ab0 & fb0) ^ (bb0 & fb0) ^ (cb0 & fb0) ^ (db0 & fb0) ^ (bb0 & gb0) ^ (cb0 & gb0) ^ (ab0 & hb0) ^ (bb0 & hb0) ^ (db0 & hb0) ^ da0;
	tb[1] = ab0 ^ bb0 ^ cb0 ^ hb1		^ (bb0 & eb1) ^ (db0 & eb1) ^ (ab0 & fb1) ^ (bb0 & fb1) ^ (cb0 & fb1) ^ (db0 & fb1) ^ (bb0 & gb1) ^ (cb0 & gb1) ^ (ab0 & hb1) ^ (bb0 & hb1) ^ (db0 & hb1) ^ da0;
	tb[2] = ab1 ^ bb1 ^ cb1 ^ eb0 ^ gb0 ^ (bb1 & eb0) ^ (db1 & eb0) ^ (ab1 & fb0) ^ (bb1 & fb0) ^ (cb1 & fb0) ^ (db1 & fb0) ^ (bb1 & gb0) ^ (cb1 & gb0) ^ (ab1 & hb0) ^ (bb1 & hb0) ^ (db1 & hb0) ^ da0;
	tb[3] = bb1 ^ eb1 ^ gb1 ^ hb1		^ (bb1 & eb1) ^ (db1 & eb1) ^ (ab1 & fb1) ^ (bb1 & fb1) ^ (cb1 & fb1) ^ (db1 & fb1) ^ (bb1 & gb1) ^ (cb1 & gb1) ^ (ab1 & hb1) ^ (bb1 & hb1) ^ (db1 & hb1) ^ da0;

	return 1;
}
// GF4.MulXorSqSc module
int GF4MulXorSqSc(int dcba, int* yx)
{
	int a, b;
	int c, d;
	int x, y;

	a = (dcba >> 0) & 1;
	b = (dcba >> 1) & 1;

	c = (dcba >> 2) & 1;
	d = (dcba >> 3) & 1;

	x = (a & c) ^ (a & d) ^ (b & c) ^ b ^ d;
	y = (a & d) ^ (b & c) ^ (b & d) ^ a ^ b ^ c ^ d;

	yx[0] = (y << 1) | (x << 0);

	return 1;
}
int GF4MulXorSqScMaskingSchemeParallel(int da0ca0ba0aa0, int da1ca1ba1aa1, int aa30aa20aa10aa00, int randnuma,
	int db0cb0bb0ab0, int db1cb1bb1ab1, int ab30ab20ab10ab00, int randnumb,
	int* ta, int* za, int* ya, int* xa, int* tb, int* zb, int* yb, int* xb)
{
	// Sboxa;
	int da0 = (da0ca0ba0aa0 >> 3) & 1;
	int ca0 = (da0ca0ba0aa0 >> 2) & 1;
	int ba0 = (da0ca0ba0aa0 >> 1) & 1;
	int aa0 = (da0ca0ba0aa0 >> 0) & 1;

	int da1 = (da1ca1ba1aa1 >> 3) & 1;
	int ca1 = (da1ca1ba1aa1 >> 2) & 1;
	int ba1 = (da1ca1ba1aa1 >> 1) & 1;
	int aa1 = (da1ca1ba1aa1 >> 0) & 1;

	int aa30 = (aa30aa20aa10aa00 >> 3) & 1;
	int aa20 = (aa30aa20aa10aa00 >> 2) & 1;
	int aa10 = (aa30aa20aa10aa00 >> 1) & 1;
	int aa00 = (aa30aa20aa10aa00 >> 0) & 1;

	int ra3 = (randnuma >> 3) & 1;
	int ra2 = (randnuma >> 2) & 1;
	int ra1 = (randnuma >> 1) & 1;
	int ra0 = (randnuma >> 0) & 1;

	// Sboxb;
	int db0 = (db0cb0bb0ab0 >> 3) & 1;
	int cb0 = (db0cb0bb0ab0 >> 2) & 1;
	int bb0 = (db0cb0bb0ab0 >> 1) & 1;
	int ab0 = (db0cb0bb0ab0 >> 0) & 1;

	int db1 = (db1cb1bb1ab1 >> 3) & 1;
	int cb1 = (db1cb1bb1ab1 >> 2) & 1;
	int bb1 = (db1cb1bb1ab1 >> 1) & 1;
	int ab1 = (db1cb1bb1ab1 >> 0) & 1;

	int ab30 = (ab30ab20ab10ab00 >> 3) & 1;
	int ab20 = (ab30ab20ab10ab00 >> 2) & 1;
	int ab10 = (ab30ab20ab10ab00 >> 1) & 1;
	int ab00 = (ab30ab20ab10ab00 >> 0) & 1;

	int rb3 = (randnumb >> 3) & 1;
	int rb2 = (randnumb >> 2) & 1;
	int rb1 = (randnumb >> 1) & 1;
	int rb0 = (randnumb >> 0) & 1;

	// Sboxa;
	xa[0] = ba0		  ^ (aa0 & ca0) ^ (ba0 & ca0) ^ (aa0 & da0) ^ ab30 ^ ra0;
	xa[1] =				(aa0 & ca1) ^ (ba0 & ca1) ^ (aa0 & da1) ^ ab30;
	xa[2] = ba1 ^ da0 ^ (aa1 & ca0) ^ (ba1 & ca0) ^ (aa1 & da0) ^ ab30 ^ ra0;
	xa[3] = da1		  ^ (aa1 & ca1) ^ (ba1 & ca1) ^ (aa1 & da1) ^ ab30;

	ya[0] = aa0 ^ ba0			  ^ (ba0 & ca0) ^ (aa0 & da0) ^ (ba0 & da0) ^ ab20 ^ ra1;
	ya[1] =							(ba0 & ca1) ^ (aa0 & da1) ^ (ba0 & da1) ^ ab20;
	ya[2] = aa1 ^ ba1 ^ ca0 ^ da0 ^ (ba1 & ca0) ^ (aa1 & da0) ^ (ba1 & da0) ^ ab20 ^ ra1;
	ya[3] = ca1 ^ da1			  ^ (ba1 & ca1) ^ (aa1 & da1) ^ (ba1 & da1) ^ ab20;

	za[0] = ba0			^ (aa0 & ca0) ^ (ba0 & ca0) ^ (aa0 & da0) ^ ab10 ^ ra2;
	za[1] =				  (aa0 & ca1) ^ (ba0 & ca1) ^ (aa0 & da1) ^ ab10;
	za[2] = ba1 ^ da0	^ (aa1 & ca0) ^ (ba1 & ca0) ^ (aa1 & da0) ^ ab10 ^ ra2;
	za[3] = da1			^ (aa1 & ca1) ^ (ba1 & ca1) ^ (aa1 & da1) ^ ab10;

	ta[0] = aa0 ^ ba0			  ^ (ba0 & ca0) ^ (aa0 & da0) ^ (ba0 & da0) ^ ab00 ^ ra3;
	ta[1] =							(ba0 & ca1) ^ (aa0 & da1) ^ (ba0 & da1) ^ ab00;
	ta[2] = aa1 ^ ba1 ^ ca0 ^ da0 ^ (ba1 & ca0) ^ (aa1 & da0) ^ (ba1 & da0) ^ ab00 ^ ra3;
	ta[3] = ca1 ^ da1			  ^ (ba1 & ca1) ^ (aa1 & da1) ^ (ba1 & da1) ^ ab00;

	// Sboxb
	xb[0] = bb0			^ (ab0 & cb0) ^ (bb0 & cb0) ^ (ab0 & db0) ^ aa30 ^ rb0;
	xb[1] =				  (ab0 & cb1) ^ (bb0 & cb1) ^ (ab0 & db1) ^ aa30;
	xb[2] = bb1 ^ db0	^ (ab1 & cb0) ^ (bb1 & cb0) ^ (ab1 & db0) ^ aa30 ^ rb0;
	xb[3] = db1			^ (ab1 & cb1) ^ (bb1 & cb1) ^ (ab1 & db1) ^ aa30;

	yb[0] = ab0 ^ bb0			  ^ (bb0 & cb0) ^ (ab0 & db0) ^ (bb0 & db0) ^ aa20 ^ rb1;
	yb[1] =							(bb0 & cb1) ^ (ab0 & db1) ^ (bb0 & db1) ^ aa20;
	yb[2] = ab1 ^ bb1 ^ cb0 ^ db0 ^ (bb1 & cb0) ^ (ab1 & db0) ^ (bb1 & db0) ^ aa20 ^ rb1;
	yb[3] = cb1 ^ db1			  ^ (bb1 & cb1) ^ (ab1 & db1) ^ (bb1 & db1) ^ aa20;

	zb[0] = bb0			^ (ab0 & cb0) ^ (bb0 & cb0) ^ (ab0 & db0) ^ aa10 ^ rb2;
	zb[1] =				  (ab0 & cb1) ^ (bb0 & cb1) ^ (ab0 & db1) ^ aa10;
	zb[2] = bb1 ^ db0	^ (ab1 & cb0) ^ (bb1 & cb0) ^ (ab1 & db0) ^ aa10 ^ rb2;
	zb[3] = db1			^ (ab1 & cb1) ^ (bb1 & cb1) ^ (ab1 & db1) ^ aa10;

	tb[0] = ab0 ^ bb0			  ^ (bb0 & cb0) ^ (ab0 & db0) ^ (bb0 & db0) ^ aa00 ^ rb3;
	tb[1] =							(bb0 & cb1) ^ (ab0 & db1) ^ (bb0 & db1) ^ aa00;
	tb[2] = ab1 ^ bb1 ^ cb0 ^ db0 ^ (bb1 & cb0) ^ (ab1 & db0) ^ (bb1 & db0) ^ aa00 ^ rb3;
	tb[3] = cb1 ^ db1			  ^ (bb1 & cb1) ^ (ab1 & db1) ^ (bb1 & db1) ^ aa00;

	return 1;
}
// GF4Mul module
// GF4.Mul;
int GF4Mul(int dc, int ba, int* yx)
{
	int a, b;
	int c, d;
	int x, y;

	d = (dc >> 1) & 1;
	c = (dc >> 0) & 1;

	b = (ba >> 1) & 1;
	a = (ba >> 0) & 1;

	x = (a & d) ^ (b & c) ^ (b & d);
	y = (a & c) ^ (a & d) ^ (b & c);

	yx[0] = (y << 1) | (x << 0);

	return 1;
}
int GF4MulMaskingSchemeParallel(
	int da0ca0ba0aa0, int da1ca1ba1aa1, int ha0ga0fa0ea0, int ha1ga1fa1ea1, int aa30aa20aa10aa00,
	int db0cb0bb0ab0, int db1cb1bb1ab1, int hb0gb0fb0eb0, int hb1gb1fb1eb1, int ab30ab20ab10ab00,
	int* ta, int* za, int* ya, int* xa,
	int* tb, int* zb, int* yb, int* xb)
{
	// MulA0, MulA1;
	int da0 = (da0ca0ba0aa0 >> 3) & 1;
	int ca0 = (da0ca0ba0aa0 >> 2) & 1;
	int ba0 = (da0ca0ba0aa0 >> 1) & 1;
	int aa0 = (da0ca0ba0aa0 >> 0) & 1;

	int da1 = (da1ca1ba1aa1 >> 3) & 1;
	int ca1 = (da1ca1ba1aa1 >> 2) & 1;
	int ba1 = (da1ca1ba1aa1 >> 1) & 1;
	int aa1 = (da1ca1ba1aa1 >> 0) & 1;

	int ha0 = (ha0ga0fa0ea0 >> 3) & 1;
	int ga0 = (ha0ga0fa0ea0 >> 2) & 1;
	int fa0 = (ha0ga0fa0ea0 >> 1) & 1;
	int ea0 = (ha0ga0fa0ea0 >> 0) & 1;

	int ha1 = (ha1ga1fa1ea1 >> 3) & 1;
	int ga1 = (ha1ga1fa1ea1 >> 2) & 1;
	int fa1 = (ha1ga1fa1ea1 >> 1) & 1;
	int ea1 = (ha1ga1fa1ea1 >> 0) & 1;

	int aa30 = (aa30aa20aa10aa00 >> 3) & 1;
	int aa20 = (aa30aa20aa10aa00 >> 2) & 1;
	int aa10 = (aa30aa20aa10aa00 >> 1) & 1;
	int aa00 = (aa30aa20aa10aa00 >> 0) & 1;

	// MulB0, MulB1;
	int db0 = (db0cb0bb0ab0 >> 3) & 1;
	int cb0 = (db0cb0bb0ab0 >> 2) & 1;
	int bb0 = (db0cb0bb0ab0 >> 1) & 1;
	int ab0 = (db0cb0bb0ab0 >> 0) & 1;

	int db1 = (db1cb1bb1ab1 >> 3) & 1;
	int cb1 = (db1cb1bb1ab1 >> 2) & 1;
	int bb1 = (db1cb1bb1ab1 >> 1) & 1;
	int ab1 = (db1cb1bb1ab1 >> 0) & 1;

	int hb0 = (hb0gb0fb0eb0 >> 3) & 1;
	int gb0 = (hb0gb0fb0eb0 >> 2) & 1;
	int fb0 = (hb0gb0fb0eb0 >> 1) & 1;
	int eb0 = (hb0gb0fb0eb0 >> 0) & 1;

	int hb1 = (hb1gb1fb1eb1 >> 3) & 1;
	int gb1 = (hb1gb1fb1eb1 >> 2) & 1;
	int fb1 = (hb1gb1fb1eb1 >> 1) & 1;
	int eb1 = (hb1gb1fb1eb1 >> 0) & 1;

	int ab30 = (ab30ab20ab10ab00 >> 3) & 1;
	int ab20 = (ab30ab20ab10ab00 >> 2) & 1;
	int ab10 = (ab30ab20ab10ab00 >> 1) & 1;
	int ab00 = (ab30ab20ab10ab00 >> 0) & 1;

	// Sboxa;
	xa[0] =	(da0 & ga0) ^ (ca0 & ha0) ^ (da0 & ha0) ^ ab00;
	xa[1] = ha1 ^ (da0 & ga1) ^ (ca0 & ha1) ^ (da0 & ha1) ^ ab00;
	xa[2] = (da1 & ga0) ^ (ca1 & ha0) ^ (da1 & ha0) ^ ab00;
	xa[3] = ha1 ^ (da1 & ga1) ^ (ca1 & ha1) ^ (da1 & ha1) ^ ab00;

	ya[0] = (ca0 & ga0) ^ (da0 & ga0) ^ (ca0 & ha0) ^ ab10;
	ya[1] = ga1 ^ (ca0 & ga1) ^ (da0 & ga1) ^ (ca0 & ha1) ^ ab10;
	ya[2] = (ca1 & ga0) ^ (da1 & ga0) ^ (ca1 & ha0) ^ ab10;
	ya[3] = ga1 ^ (ca1 & ga1) ^ (da1 & ga1) ^ (ca1 & ha1) ^ ab10;

	za[0] = (ba0 & ea0) ^ (aa0 & fa0) ^ (ba0 & fa0) ^ ab20;
	za[1] = fa1 ^ (ba0 & ea1) ^ (aa0 & fa1) ^ (ba0 & fa1) ^ ab20;
	za[2] = (ba1 & ea0) ^ (aa1 & fa0) ^ (ba1 & fa0) ^ ab20;
	za[3] = fa1 ^ (ba1 & ea1) ^ (aa1 & fa1) ^ (ba1 & fa1) ^ ab20;

	ta[0] = (aa0 & ea0) ^ (ba0 & ea0) ^ (aa0 & fa0) ^ ab30;
	ta[1] = ea1 ^ (aa0 & ea1) ^ (ba0 & ea1) ^ (aa0 & fa1) ^ ab30;
	ta[2] = (aa1 & ea0) ^ (ba1 & ea0) ^ (aa1 & fa0) ^ ab30;
	ta[3] = ea1 ^ (aa1 & ea1) ^ (ba1 & ea1) ^ (aa1 & fa1) ^ ab30;

	// Sboxb;
	xb[0] = (db0 & gb0) ^ (cb0 & hb0) ^ (db0 & hb0) ^ aa00;
	xb[1] = hb1 ^ (db0 & gb1) ^ (cb0 & hb1) ^ (db0 & hb1) ^ aa00;
	xb[2] = (db1 & gb0) ^ (cb1 & hb0) ^ (db1 & hb0) ^ aa00;
	xb[3] = hb1 ^ (db1 & gb1) ^ (cb1 & hb1) ^ (db1 & hb1) ^ aa00;

	yb[0] = (cb0 & gb0) ^ (db0 & gb0) ^ (cb0 & hb0) ^ aa10;
	yb[1] = gb1 ^ (cb0 & gb1) ^ (db0 & gb1) ^ (cb0 & hb1) ^ aa10;
	yb[2] = (cb1 & gb0) ^ (db1 & gb0) ^ (cb1 & hb0) ^ aa10;
	yb[3] = gb1 ^ (cb1 & gb1) ^ (db1 & gb1) ^ (cb1 & hb1) ^ aa10;

	zb[0] = (bb0 & eb0) ^ (ab0 & fb0) ^ (bb0 & fb0) ^ aa20;
	zb[1] = fb1 ^ (bb0 & eb1) ^ (ab0 & fb1) ^ (bb0 & fb1) ^ aa20;
	zb[2] = (bb1 & eb0) ^ (ab1 & fb0) ^ (bb1 & fb0) ^ aa20;
	zb[3] = fb1 ^ (bb1 & eb1) ^ (ab1 & fb1) ^ (bb1 & fb1) ^ aa20;

	tb[0] = (ab0 & eb0) ^ (bb0 & eb0) ^ (ab0 & fb0) ^ aa30;
	tb[1] = eb1 ^ (ab0 & eb1) ^ (bb0 & eb1) ^ (ab0 & fb1) ^ aa30;
	tb[2] = (ab1 & eb0) ^ (bb1 & eb0) ^ (ab1 & fb0) ^ aa30;
	tb[3] = eb1 ^ (ab1 & eb1) ^ (bb1 & eb1) ^ (ab1 & fb1) ^ aa30;

	return 1;
}
// GF16.Mul module
int GF16Mul(int dcba, int hgfe, int* tzyx)
{
	int dcbabit[4];
	int hgfebit[4];

	int a, b, c, d;
	int e, f, g, h;
	int x, y, z, t;

	NibbleToBit(dcba, dcbabit);
	NibbleToBit(hgfe, hgfebit);

	a = dcbabit[0];
	b = dcbabit[1];
	c = dcbabit[2];
	d = dcbabit[3];

	e = hgfebit[0];
	f = hgfebit[1];
	g = hgfebit[2];
	h = hgfebit[3];

	x = (a & e) ^ (a & f) ^ (a & g) ^ (b & e) ^ (b & h) ^ (c & e) ^ (c & g) ^ (d & f) ^ (d & h);
	y = (a & e) ^ (a & h) ^ (b & f) ^ (b & g) ^ (b & h) ^ (c & f) ^ (c & h) ^ (d & e) ^ (d & f) ^ (d & g) ^ (d & h);
	z = (a & e) ^ (a & g) ^ (b & f) ^ (b & h) ^ (c & e) ^ (c & g) ^ (c & h) ^ (d & f) ^ (d & g);
	t = (a & f) ^ (a & h) ^ (b & e) ^ (b & f) ^ (b & g) ^ (b & h) ^ (c & f) ^ (c & g) ^ (d & e) ^ (d & f) ^ (d & h);
	tzyx[0] = (t << 3) | (z << 2) | (y << 1) | (x << 0);

	return 1;
}
int GF16MulMaskingSchemeParallel(int da0ca0ba0aa0, int da1ca1ba1aa1, int ha0ga0fa0ea0, int ha1ga1fa1ea1, int qa0pa0na0ma0, int qa1pa1na1ma1,
	int db0cb0bb0ab0, int db1cb1bb1ab1, int hb0gb0fb0eb0, int hb1gb1fb1eb1, int qb0pb0nb0mb0, int qb1pb1nb1mb1,
	int* va, int* ua, int* sa, int* ra, int* ta, int* za, int* ya, int* xa,
	int* vb, int* ub, int* sb, int* rb, int* tb, int* zb, int* yb, int* xb)
{
	// Sboxa;
	int da0 = (da0ca0ba0aa0 >> 3) & 1;
	int ca0 = (da0ca0ba0aa0 >> 2) & 1;
	int ba0 = (da0ca0ba0aa0 >> 1) & 1;
	int aa0 = (da0ca0ba0aa0 >> 0) & 1;

	int ha0 = (ha0ga0fa0ea0 >> 3) & 1;
	int ga0 = (ha0ga0fa0ea0 >> 2) & 1;
	int fa0 = (ha0ga0fa0ea0 >> 1) & 1;
	int ea0 = (ha0ga0fa0ea0 >> 0) & 1;

	int da1 = (da1ca1ba1aa1 >> 3) & 1;
	int ca1 = (da1ca1ba1aa1 >> 2) & 1;
	int ba1 = (da1ca1ba1aa1 >> 1) & 1;
	int aa1 = (da1ca1ba1aa1 >> 0) & 1;

	int ha1 = (ha1ga1fa1ea1 >> 3) & 1;
	int ga1 = (ha1ga1fa1ea1 >> 2) & 1;
	int fa1 = (ha1ga1fa1ea1 >> 1) & 1;
	int ea1 = (ha1ga1fa1ea1 >> 0) & 1;

	int qa0 = (qa0pa0na0ma0 >> 3) & 1;
	int pa0 = (qa0pa0na0ma0 >> 2) & 1;
	int na0 = (qa0pa0na0ma0 >> 1) & 1;
	int ma0 = (qa0pa0na0ma0 >> 0) & 1;

	int qa1 = (qa1pa1na1ma1 >> 3) & 1;
	int pa1 = (qa1pa1na1ma1 >> 2) & 1;
	int na1 = (qa1pa1na1ma1 >> 1) & 1;
	int ma1 = (qa1pa1na1ma1 >> 0) & 1;

	// Sboxb;
	int db0 = (db0cb0bb0ab0 >> 3) & 1;
	int cb0 = (db0cb0bb0ab0 >> 2) & 1;
	int bb0 = (db0cb0bb0ab0 >> 1) & 1;
	int ab0 = (db0cb0bb0ab0 >> 0) & 1;

	int hb0 = (hb0gb0fb0eb0 >> 3) & 1;
	int gb0 = (hb0gb0fb0eb0 >> 2) & 1;
	int fb0 = (hb0gb0fb0eb0 >> 1) & 1;
	int eb0 = (hb0gb0fb0eb0 >> 0) & 1;

	int db1 = (db1cb1bb1ab1 >> 3) & 1;
	int cb1 = (db1cb1bb1ab1 >> 2) & 1;
	int bb1 = (db1cb1bb1ab1 >> 1) & 1;
	int ab1 = (db1cb1bb1ab1 >> 0) & 1;

	int hb1 = (hb1gb1fb1eb1 >> 3) & 1;
	int gb1 = (hb1gb1fb1eb1 >> 2) & 1;
	int fb1 = (hb1gb1fb1eb1 >> 1) & 1;
	int eb1 = (hb1gb1fb1eb1 >> 0) & 1;

	int qb0 = (qb0pb0nb0mb0 >> 3) & 1;
	int pb0 = (qb0pb0nb0mb0 >> 2) & 1;
	int nb0 = (qb0pb0nb0mb0 >> 1) & 1;
	int mb0 = (qb0pb0nb0mb0 >> 0) & 1;

	int qb1 = (qb1pb1nb1mb1 >> 3) & 1;
	int pb1 = (qb1pb1nb1mb1 >> 2) & 1;
	int nb1 = (qb1pb1nb1mb1 >> 1) & 1;
	int mb1 = (qb1pb1nb1mb1 >> 0) & 1;

	// Sboxa;
	// Mul0;
	xa[0] = ma0 ^ na0 ^ (ma0 & ea0) ^ (na0 & ea0) ^ (pa0 & ea0) ^ (ma0 & fa0) ^ (qa0 & fa0) ^ (ma0 & ga0) ^ (pa0 & ga0) ^ (na0 & ha0) ^ (qa0 & ha0) ^ aa0;
	xa[1] = ma0 ^ na0 ^ fa1 ^ (ma0 & ea1) ^ (na0 & ea1) ^ (pa0 & ea1) ^ (ma0 & fa1) ^ (qa0 & fa1) ^ (ma0 & ga1) ^ (pa0 & ga1) ^ (na0 & ha1) ^ (qa0 & ha1) ^ aa0;
	xa[2] = ma1 ^ na1 ^ (ma1 & ea0) ^ (na1 & ea0) ^ (pa1 & ea0) ^ (ma1 & fa0) ^ (qa1 & fa0) ^ (ma1 & ga0) ^ (pa1 & ga0) ^ (na1 & ha0) ^ (qa1 & ha0) ^ aa0;
	xa[3] = ma1 ^ na1 ^ fa1 ^ (ma1 & ea1) ^ (na1 & ea1) ^ (pa1 & ea1) ^ (ma1 & fa1) ^ (qa1 & fa1) ^ (ma1 & ga1) ^ (pa1 & ga1) ^ (na1 & ha1) ^ (qa1 & ha1) ^ aa0;

	ya[0] = na0 ^ (ma0 & ea0) ^ (qa0 & ea0) ^ (na0 & fa0) ^ (pa0 & fa0) ^ (qa0 & fa0) ^ (na0 & ga0) ^ (qa0 & ga0) ^ (ma0 & ha0) ^ (na0 & ha0) ^ (pa0 & ha0) ^ (qa0 & ha0) ^ ba0;
	ya[1] = na0 ^ ga1 ^ (ma0 & ea1) ^ (qa0 & ea1) ^ (na0 & fa1) ^ (pa0 & fa1) ^ (qa0 & fa1) ^ (na0 & ga1) ^ (qa0 & ga1) ^ (ma0 & ha1) ^ (na0 & ha1) ^ (pa0 & ha1) ^ (qa0 & ha1) ^ ba0;
	ya[2] = na1 ^ (ma1 & ea0) ^ (qa1 & ea0) ^ (na1 & fa0) ^ (pa1 & fa0) ^ (qa1 & fa0) ^ (na1 & ga0) ^ (qa1 & ga0) ^ (ma1 & ha0) ^ (na1 & ha0) ^ (pa1 & ha0) ^ (qa1 & ha0) ^ ba0;
	ya[3] = na1 ^ ga1 ^ (ma1 & ea1) ^ (qa1 & ea1) ^ (na1 & fa1) ^ (pa1 & fa1) ^ (qa1 & fa1) ^ (na1 & ga1) ^ (qa1 & ga1) ^ (ma1 & ha1) ^ (na1 & ha1) ^ (pa1 & ha1) ^ (qa1 & ha1) ^ ba0;

	za[0] = ma0 ^ (ma0 & ea0) ^ (pa0 & ea0) ^ (na0 & fa0) ^ (qa0 & fa0) ^ (ma0 & ga0) ^ (pa0 & ga0) ^ (qa0 & ga0) ^ (na0 & ha0) ^ (pa0 & ha0) ^ ca0;
	za[1] = ma0 ^ ha1 ^ (ma0 & ea1) ^ (pa0 & ea1) ^ (na0 & fa1) ^ (qa0 & fa1) ^ (ma0 & ga1) ^ (pa0 & ga1) ^ (qa0 & ga1) ^ (na0 & ha1) ^ (pa0 & ha1) ^ ca0;
	za[2] = ma1 ^ (ma1 & ea0) ^ (pa1 & ea0) ^ (na1 & fa0) ^ (qa1 & fa0) ^ (ma1 & ga0) ^ (pa1 & ga0) ^ (qa1 & ga0) ^ (na1 & ha0) ^ (pa1 & ha0) ^ ca0;
	za[3] = ma1 ^ ha1 ^ (ma1 & ea1) ^ (pa1 & ea1) ^ (na1 & fa1) ^ (qa1 & fa1) ^ (ma1 & ga1) ^ (pa1 & ga1) ^ (qa1 & ga1) ^ (na1 & ha1) ^ (pa1 & ha1) ^ ca0;

	ta[0] = pa0 ^ qa0 ^ ea0 ^ ha0 ^ (na0 & ea0) ^ (qa0 & ea0) ^ (ma0 & fa0) ^ (na0 & fa0) ^ (pa0 & fa0) ^ (qa0 & fa0) ^ (na0 & ga0) ^ (pa0 & ga0) ^ (ma0 & ha0) ^ (na0 & ha0) ^ (qa0 & ha0) ^ da0;
	ta[1] = pa0 ^ qa0 ^ fa1 ^ ga1 ^ (na0 & ea1) ^ (qa0 & ea1) ^ (ma0 & fa1) ^ (na0 & fa1) ^ (pa0 & fa1) ^ (qa0 & fa1) ^ (na0 & ga1) ^ (pa0 & ga1) ^ (ma0 & ha1) ^ (na0 & ha1) ^ (qa0 & ha1) ^ da0;
	ta[2] = pa1 ^ qa1 ^ ea0 ^ ha0 ^ (na1 & ea0) ^ (qa1 & ea0) ^ (ma1 & fa0) ^ (na1 & fa0) ^ (pa1 & fa0) ^ (qa1 & fa0) ^ (na1 & ga0) ^ (pa1 & ga0) ^ (ma1 & ha0) ^ (na1 & ha0) ^ (qa1 & ha0) ^ da0;
	ta[3] = pa1 ^ qa1 ^ fa1 ^ ga1 ^ (na1 & ea1) ^ (qa1 & ea1) ^ (ma1 & fa1) ^ (na1 & fa1) ^ (pa1 & fa1) ^ (qa1 & fa1) ^ (na1 & ga1) ^ (pa1 & ga1) ^ (ma1 & ha1) ^ (na1 & ha1) ^ (qa1 & ha1) ^ da0;

	// Mul1;
	ra[0] = ma0 ^ na0 ^ (ma0 & aa0) ^ (na0 & aa0) ^ (pa0 & aa0) ^ (ma0 & ba0) ^ (qa0 & ba0) ^ (ma0 & ca0) ^ (pa0 & ca0) ^ (na0 & da0) ^ (qa0 & da0) ^ ea0;
	ra[1] = ma0 ^ na0 ^ ba1 ^ (ma0 & aa1) ^ (na0 & aa1) ^ (pa0 & aa1) ^ (ma0 & ba1) ^ (qa0 & ba1) ^ (ma0 & ca1) ^ (pa0 & ca1) ^ (na0 & da1) ^ (qa0 & da1) ^ ea0;
	ra[2] = ma1 ^ na1 ^ (ma1 & aa0) ^ (na1 & aa0) ^ (pa1 & aa0) ^ (ma1 & ba0) ^ (qa1 & ba0) ^ (ma1 & ca0) ^ (pa1 & ca0) ^ (na1 & da0) ^ (qa1 & da0) ^ ea0;
	ra[3] = ma1 ^ na1 ^ ba1 ^ (ma1 & aa1) ^ (na1 & aa1) ^ (pa1 & aa1) ^ (ma1 & ba1) ^ (qa1 & ba1) ^ (ma1 & ca1) ^ (pa1 & ca1) ^ (na1 & da1) ^ (qa1 & da1) ^ ea0;

	sa[0] = na0 ^ (ma0 & aa0) ^ (qa0 & aa0) ^ (na0 & ba0) ^ (pa0 & ba0) ^ (qa0 & ba0) ^ (na0 & ca0) ^ (qa0 & ca0) ^ (ma0 & da0) ^ (na0 & da0) ^ (pa0 & da0) ^ (qa0 & da0) ^ fa0;
	sa[1] = na0 ^ ca1 ^ (ma0 & aa1) ^ (qa0 & aa1) ^ (na0 & ba1) ^ (pa0 & ba1) ^ (qa0 & ba1) ^ (na0 & ca1) ^ (qa0 & ca1) ^ (ma0 & da1) ^ (na0 & da1) ^ (pa0 & da1) ^ (qa0 & da1) ^ fa0;
	sa[2] = na1 ^ (ma1 & aa0) ^ (qa1 & aa0) ^ (na1 & ba0) ^ (pa1 & ba0) ^ (qa1 & ba0) ^ (na1 & ca0) ^ (qa1 & ca0) ^ (ma1 & da0) ^ (na1 & da0) ^ (pa1 & da0) ^ (qa1 & da0) ^ fa0;
	sa[3] = na1 ^ ca1 ^ (ma1 & aa1) ^ (qa1 & aa1) ^ (na1 & ba1) ^ (pa1 & ba1) ^ (qa1 & ba1) ^ (na1 & ca1) ^ (qa1 & ca1) ^ (ma1 & da1) ^ (na1 & da1) ^ (pa1 & da1) ^ (qa1 & da1) ^ fa0;

	ua[0] = ma0 ^ (ma0 & aa0) ^ (pa0 & aa0) ^ (na0 & ba0) ^ (qa0 & ba0) ^ (ma0 & ca0) ^ (pa0 & ca0) ^ (qa0 & ca0) ^ (na0 & da0) ^ (pa0 & da0) ^ ga0;
	ua[1] = ma0 ^ da1 ^ (ma0 & aa1) ^ (pa0 & aa1) ^ (na0 & ba1) ^ (qa0 & ba1) ^ (ma0 & ca1) ^ (pa0 & ca1) ^ (qa0 & ca1) ^ (na0 & da1) ^ (pa0 & da1) ^ ga0;
	ua[2] = ma1 ^ (ma1 & aa0) ^ (pa1 & aa0) ^ (na1 & ba0) ^ (qa1 & ba0) ^ (ma1 & ca0) ^ (pa1 & ca0) ^ (qa1 & ca0) ^ (na1 & da0) ^ (pa1 & da0) ^ ga0;
	ua[3] = ma1 ^ da1 ^ (ma1 & aa1) ^ (pa1 & aa1) ^ (na1 & ba1) ^ (qa1 & ba1) ^ (ma1 & ca1) ^ (pa1 & ca1) ^ (qa1 & ca1) ^ (na1 & da1) ^ (pa1 & da1) ^ ga0;

	va[0] = pa0 ^ qa0 ^ aa0 ^ da0 ^ (na0 & aa0) ^ (qa0 & aa0) ^ (ma0 & ba0) ^ (na0 & ba0) ^ (pa0 & ba0) ^ (qa0 & ba0) ^ (na0 & ca0) ^ (pa0 & ca0) ^ (ma0 & da0) ^ (na0 & da0) ^ (qa0 & da0) ^ ha0;
	va[1] = pa0 ^ qa0 ^ ba1 ^ ca1 ^ (na0 & aa1) ^ (qa0 & aa1) ^ (ma0 & ba1) ^ (na0 & ba1) ^ (pa0 & ba1) ^ (qa0 & ba1) ^ (na0 & ca1) ^ (pa0 & ca1) ^ (ma0 & da1) ^ (na0 & da1) ^ (qa0 & da1) ^ ha0;
	va[2] = pa1 ^ qa1 ^ aa0 ^ da0 ^ (na1 & aa0) ^ (qa1 & aa0) ^ (ma1 & ba0) ^ (na1 & ba0) ^ (pa1 & ba0) ^ (qa1 & ba0) ^ (na1 & ca0) ^ (pa1 & ca0) ^ (ma1 & da0) ^ (na1 & da0) ^ (qa1 & da0) ^ ha0;
	va[3] = pa1 ^ qa1 ^ ba1 ^ ca1 ^ (na1 & aa1) ^ (qa1 & aa1) ^ (ma1 & ba1) ^ (na1 & ba1) ^ (pa1 & ba1) ^ (qa1 & ba1) ^ (na1 & ca1) ^ (pa1 & ca1) ^ (ma1 & da1) ^ (na1 & da1) ^ (qa1 & da1) ^ ha0;


	// Sboxb;
	// Mul0;
	xb[0] = mb0 ^ nb0 ^ (mb0 & eb0) ^ (nb0 & eb0) ^ (pb0 & eb0) ^ (mb0 & fb0) ^ (qb0 & fb0) ^ (mb0 & gb0) ^ (pb0 & gb0) ^ (nb0 & hb0) ^ (qb0 & hb0) ^ ab0;
	xb[1] = mb0 ^ nb0 ^ fb1 ^ (mb0 & eb1) ^ (nb0 & eb1) ^ (pb0 & eb1) ^ (mb0 & fb1) ^ (qb0 & fb1) ^ (mb0 & gb1) ^ (pb0 & gb1) ^ (nb0 & hb1) ^ (qb0 & hb1) ^ ab0;
	xb[2] = mb1 ^ nb1 ^ (mb1 & eb0) ^ (nb1 & eb0) ^ (pb1 & eb0) ^ (mb1 & fb0) ^ (qb1 & fb0) ^ (mb1 & gb0) ^ (pb1 & gb0) ^ (nb1 & hb0) ^ (qb1 & hb0) ^ ab0;
	xb[3] = mb1 ^ nb1 ^ fb1 ^ (mb1 & eb1) ^ (nb1 & eb1) ^ (pb1 & eb1) ^ (mb1 & fb1) ^ (qb1 & fb1) ^ (mb1 & gb1) ^ (pb1 & gb1) ^ (nb1 & hb1) ^ (qb1 & hb1) ^ ab0;

	yb[0] = nb0 ^ (mb0 & eb0) ^ (qb0 & eb0) ^ (nb0 & fb0) ^ (pb0 & fb0) ^ (qb0 & fb0) ^ (nb0 & gb0) ^ (qb0 & gb0) ^ (mb0 & hb0) ^ (nb0 & hb0) ^ (pb0 & hb0) ^ (qb0 & hb0) ^ bb0;
	yb[1] = nb0 ^ gb1 ^ (mb0 & eb1) ^ (qb0 & eb1) ^ (nb0 & fb1) ^ (pb0 & fb1) ^ (qb0 & fb1) ^ (nb0 & gb1) ^ (qb0 & gb1) ^ (mb0 & hb1) ^ (nb0 & hb1) ^ (pb0 & hb1) ^ (qb0 & hb1) ^ bb0;
	yb[2] = nb1 ^ (mb1 & eb0) ^ (qb1 & eb0) ^ (nb1 & fb0) ^ (pb1 & fb0) ^ (qb1 & fb0) ^ (nb1 & gb0) ^ (qb1 & gb0) ^ (mb1 & hb0) ^ (nb1 & hb0) ^ (pb1 & hb0) ^ (qb1 & hb0) ^ bb0;
	yb[3] = nb1 ^ gb1 ^ (mb1 & eb1) ^ (qb1 & eb1) ^ (nb1 & fb1) ^ (pb1 & fb1) ^ (qb1 & fb1) ^ (nb1 & gb1) ^ (qb1 & gb1) ^ (mb1 & hb1) ^ (nb1 & hb1) ^ (pb1 & hb1) ^ (qb1 & hb1) ^ bb0;

	zb[0] = mb0 ^ (mb0 & eb0) ^ (pb0 & eb0) ^ (nb0 & fb0) ^ (qb0 & fb0) ^ (mb0 & gb0) ^ (pb0 & gb0) ^ (qb0 & gb0) ^ (nb0 & hb0) ^ (pb0 & hb0) ^ cb0;
	zb[1] = mb0 ^ hb1 ^ (mb0 & eb1) ^ (pb0 & eb1) ^ (nb0 & fb1) ^ (qb0 & fb1) ^ (mb0 & gb1) ^ (pb0 & gb1) ^ (qb0 & gb1) ^ (nb0 & hb1) ^ (pb0 & hb1) ^ cb0;
	zb[2] = mb1 ^ (mb1 & eb0) ^ (pb1 & eb0) ^ (nb1 & fb0) ^ (qb1 & fb0) ^ (mb1 & gb0) ^ (pb1 & gb0) ^ (qb1 & gb0) ^ (nb1 & hb0) ^ (pb1 & hb0) ^ cb0;
	zb[3] = mb1 ^ hb1 ^ (mb1 & eb1) ^ (pb1 & eb1) ^ (nb1 & fb1) ^ (qb1 & fb1) ^ (mb1 & gb1) ^ (pb1 & gb1) ^ (qb1 & gb1) ^ (nb1 & hb1) ^ (pb1 & hb1) ^ cb0;

	tb[0] = pb0 ^ qb0 ^ eb0 ^ hb0 ^ (nb0 & eb0) ^ (qb0 & eb0) ^ (mb0 & fb0) ^ (nb0 & fb0) ^ (pb0 & fb0) ^ (qb0 & fb0) ^ (nb0 & gb0) ^ (pb0 & gb0) ^ (mb0 & hb0) ^ (nb0 & hb0) ^ (qb0 & hb0) ^ db0;
	tb[1] = pb0 ^ qb0 ^ fb1 ^ gb1 ^ (nb0 & eb1) ^ (qb0 & eb1) ^ (mb0 & fb1) ^ (nb0 & fb1) ^ (pb0 & fb1) ^ (qb0 & fb1) ^ (nb0 & gb1) ^ (pb0 & gb1) ^ (mb0 & hb1) ^ (nb0 & hb1) ^ (qb0 & hb1) ^ db0;
	tb[2] = pb1 ^ qb1 ^ eb0 ^ hb0 ^ (nb1 & eb0) ^ (qb1 & eb0) ^ (mb1 & fb0) ^ (nb1 & fb0) ^ (pb1 & fb0) ^ (qb1 & fb0) ^ (nb1 & gb0) ^ (pb1 & gb0) ^ (mb1 & hb0) ^ (nb1 & hb0) ^ (qb1 & hb0) ^ db0;
	tb[3] = pb1 ^ qb1 ^ fb1 ^ gb1 ^ (nb1 & eb1) ^ (qb1 & eb1) ^ (mb1 & fb1) ^ (nb1 & fb1) ^ (pb1 & fb1) ^ (qb1 & fb1) ^ (nb1 & gb1) ^ (pb1 & gb1) ^ (mb1 & hb1) ^ (nb1 & hb1) ^ (qb1 & hb1) ^ db0;

	// Mul1;
	rb[0] = mb0 ^ nb0 ^ (mb0 & ab0) ^ (nb0 & ab0) ^ (pb0 & ab0) ^ (mb0 & bb0) ^ (qb0 & bb0) ^ (mb0 & cb0) ^ (pb0 & cb0) ^ (nb0 & db0) ^ (qb0 & db0) ^ eb0;
	rb[1] = mb0 ^ nb0 ^ bb1 ^ (mb0 & ab1) ^ (nb0 & ab1) ^ (pb0 & ab1) ^ (mb0 & bb1) ^ (qb0 & bb1) ^ (mb0 & cb1) ^ (pb0 & cb1) ^ (nb0 & db1) ^ (qb0 & db1) ^ eb0;
	rb[2] = mb1 ^ nb1 ^ (mb1 & ab0) ^ (nb1 & ab0) ^ (pb1 & ab0) ^ (mb1 & bb0) ^ (qb1 & bb0) ^ (mb1 & cb0) ^ (pb1 & cb0) ^ (nb1 & db0) ^ (qb1 & db0) ^ eb0;
	rb[3] = mb1 ^ nb1 ^ bb1 ^ (mb1 & ab1) ^ (nb1 & ab1) ^ (pb1 & ab1) ^ (mb1 & bb1) ^ (qb1 & bb1) ^ (mb1 & cb1) ^ (pb1 & cb1) ^ (nb1 & db1) ^ (qb1 & db1) ^ eb0;

	sb[0] = nb0 ^ (mb0 & ab0) ^ (qb0 & ab0) ^ (nb0 & bb0) ^ (pb0 & bb0) ^ (qb0 & bb0) ^ (nb0 & cb0) ^ (qb0 & cb0) ^ (mb0 & db0) ^ (nb0 & db0) ^ (pb0 & db0) ^ (qb0 & db0) ^ fb0;
	sb[1] = nb0 ^ cb1 ^ (mb0 & ab1) ^ (qb0 & ab1) ^ (nb0 & bb1) ^ (pb0 & bb1) ^ (qb0 & bb1) ^ (nb0 & cb1) ^ (qb0 & cb1) ^ (mb0 & db1) ^ (nb0 & db1) ^ (pb0 & db1) ^ (qb0 & db1) ^ fb0;
	sb[2] = nb1 ^ (mb1 & ab0) ^ (qb1 & ab0) ^ (nb1 & bb0) ^ (pb1 & bb0) ^ (qb1 & bb0) ^ (nb1 & cb0) ^ (qb1 & cb0) ^ (mb1 & db0) ^ (nb1 & db0) ^ (pb1 & db0) ^ (qb1 & db0) ^ fb0;
	sb[3] = nb1 ^ cb1 ^ (mb1 & ab1) ^ (qb1 & ab1) ^ (nb1 & bb1) ^ (pb1 & bb1) ^ (qb1 & bb1) ^ (nb1 & cb1) ^ (qb1 & cb1) ^ (mb1 & db1) ^ (nb1 & db1) ^ (pb1 & db1) ^ (qb1 & db1) ^ fb0;

	ub[0] = mb0 ^ (mb0 & ab0) ^ (pb0 & ab0) ^ (nb0 & bb0) ^ (qb0 & bb0) ^ (mb0 & cb0) ^ (pb0 & cb0) ^ (qb0 & cb0) ^ (nb0 & db0) ^ (pb0 & db0) ^ gb0;
	ub[1] = mb0 ^ db1 ^ (mb0 & ab1) ^ (pb0 & ab1) ^ (nb0 & bb1) ^ (qb0 & bb1) ^ (mb0 & cb1) ^ (pb0 & cb1) ^ (qb0 & cb1) ^ (nb0 & db1) ^ (pb0 & db1) ^ gb0;
	ub[2] = mb1 ^ (mb1 & ab0) ^ (pb1 & ab0) ^ (nb1 & bb0) ^ (qb1 & bb0) ^ (mb1 & cb0) ^ (pb1 & cb0) ^ (qb1 & cb0) ^ (nb1 & db0) ^ (pb1 & db0) ^ gb0;
	ub[3] = mb1 ^ db1 ^ (mb1 & ab1) ^ (pb1 & ab1) ^ (nb1 & bb1) ^ (qb1 & bb1) ^ (mb1 & cb1) ^ (pb1 & cb1) ^ (qb1 & cb1) ^ (nb1 & db1) ^ (pb1 & db1) ^ gb0;

	vb[0] = pb0 ^ qb0 ^ ab0 ^ db0 ^ (nb0 & ab0) ^ (qb0 & ab0) ^ (mb0 & bb0) ^ (nb0 & bb0) ^ (pb0 & bb0) ^ (qb0 & bb0) ^ (nb0 & cb0) ^ (pb0 & cb0) ^ (mb0 & db0) ^ (nb0 & db0) ^ (qb0 & db0) ^ hb0;
	vb[1] = pb0 ^ qb0 ^ bb1 ^ cb1 ^ (nb0 & ab1) ^ (qb0 & ab1) ^ (mb0 & bb1) ^ (nb0 & bb1) ^ (pb0 & bb1) ^ (qb0 & bb1) ^ (nb0 & cb1) ^ (pb0 & cb1) ^ (mb0 & db1) ^ (nb0 & db1) ^ (qb0 & db1) ^ hb0;
	vb[2] = pb1 ^ qb1 ^ ab0 ^ db0 ^ (nb1 & ab0) ^ (qb1 & ab0) ^ (mb1 & bb0) ^ (nb1 & bb0) ^ (pb1 & bb0) ^ (qb1 & bb0) ^ (nb1 & cb0) ^ (pb1 & cb0) ^ (mb1 & db0) ^ (nb1 & db0) ^ (qb1 & db0) ^ hb0;
	vb[3] = pb1 ^ qb1 ^ bb1 ^ cb1 ^ (nb1 & ab1) ^ (qb1 & ab1) ^ (mb1 & bb1) ^ (nb1 & bb1) ^ (pb1 & bb1) ^ (qb1 & bb1) ^ (nb1 & cb1) ^ (pb1 & cb1) ^ (mb1 & db1) ^ (nb1 & db1) ^ (qb1 & db1) ^ hb0;

	return 1;
}
// GF16ToGF256 module
int GF16ToGF256(int dina, int dinb, int* dout)
{
	int dinabit[4];
	int dinbbit[4];
	int datbit[8];

	NibbleToBit(dina, dinabit);
	NibbleToBit(dinb, dinbbit);

	datbit[0] = dinbbit[0];
	datbit[1] = dinbbit[1];
	datbit[2] = dinbbit[2];
	datbit[3] = dinbbit[3];

	datbit[4] = dinabit[0];
	datbit[5] = dinabit[1];
	datbit[6] = dinabit[2];
	datbit[7] = dinabit[3];

	dout[0] = datbit[2];
	dout[1] = datbit[1] ^ datbit[5];
	dout[2] = datbit[1] ^ datbit[4] ^ datbit[5] ^ datbit[7];
	dout[3] = datbit[1] ^ datbit[2] ^ datbit[3] ^ datbit[4] ^ datbit[5] ^ datbit[6];

	dout[4] = datbit[1] ^ datbit[6];
	dout[5] = datbit[0] ^ datbit[2] ^ datbit[3] ^ datbit[5] ^ datbit[6] ^ datbit[7];
	dout[6] = datbit[0] ^ datbit[1] ^ datbit[3] ^ datbit[5] ^ datbit[6] ^ datbit[7];
	dout[7] = datbit[1] ^ datbit[4];

	return 1;
}
// Matrix A Xor X;
int MatrixAXorX(int din, int* dout)
{
	int dinbit[8];
	int temp[8];

	ByteToBit(din, dinbit);

	temp[0] = dinbit[0] ^ dinbit[4] ^ dinbit[5] ^ dinbit[6] ^ dinbit[7];
	temp[1] = dinbit[0] ^ dinbit[1] ^ dinbit[5] ^ dinbit[6] ^ dinbit[7];
	temp[2] = dinbit[0] ^ dinbit[1] ^ dinbit[2] ^ dinbit[6] ^ dinbit[7];
	temp[3] = dinbit[0] ^ dinbit[1] ^ dinbit[2] ^ dinbit[3] ^ dinbit[7];

	temp[4] = dinbit[0] ^ dinbit[1] ^ dinbit[2] ^ dinbit[3] ^ dinbit[4];
	temp[5] = dinbit[1] ^ dinbit[2] ^ dinbit[3] ^ dinbit[4] ^ dinbit[5];
	temp[6] = dinbit[2] ^ dinbit[3] ^ dinbit[4] ^ dinbit[5] ^ dinbit[6];
	temp[7] = dinbit[3] ^ dinbit[4] ^ dinbit[5] ^ dinbit[6] ^ dinbit[7];

	dout[0] = (temp[7] << 7) | (temp[6] << 6) | (temp[5] << 5) | (temp[4] << 4) | (temp[3] << 3) | (temp[2] << 2) | (temp[1] << 1) | (temp[0] << 0);

	return 1;
}

int VerifyAESTISchemeCorrection()
{
	//// Sboxa, Sboxb
	// input variables
	int xa7xa6xa5xa4xa3xa2xa1xa0;
	int xb7xb6xb5xb4xb3xb2xb1xb0;

	// Sboxa input variable;
	for (xa7xa6xa5xa4xa3xa2xa1xa0 = 0; xa7xa6xa5xa4xa3xa2xa1xa0 < 256; xa7xa6xa5xa4xa3xa2xa1xa0++)
	{
		// Sboxb input variable;
		for (xb7xb6xb5xb4xb3xb2xb1xb0 = 0; xb7xb6xb5xb4xb3xb2xb1xb0 < 256; xb7xb6xb5xb4xb3xb2xb1xb0++)
		{
			int flag = 0;
			printf("\txa7xa6xa5xa4xa3xa2xa1xa0 = %d, xb7xb6xb5xb4xb3xb2xb1xb0 = %d:\t", xa7xa6xa5xa4xa3xa2xa1xa0, xb7xb6xb5xb4xb3xb2xb1xb0);

			// int xa70xa60xa50xa40xa30xa20xa10xa00, xa71xa61xa51xa41xa31xa21xa11xa01;
			// int xb70xb60xb50xb40xb30xb20xb10xb00, xb71xb61xb51xb41xb31xb21xb11xb01;

#pragma omp parallel for
			// Sboxa input share;
			for (int xa70xa60xa50xa40xa30xa20xa10xa00 = 0; xa70xa60xa50xa40xa30xa20xa10xa00 < 256; xa70xa60xa50xa40xa30xa20xa10xa00++)
			{
				// printf("the current thread id %d.\n", omp_get_thread_num());
				// Sboxb input share;
				for (int xb70xb60xb50xb40xb30xb20xb10xb00 = 0; xb70xb60xb50xb40xb30xb20xb10xb00 < 256; xb70xb60xb50xb40xb30xb20xb10xb00++)
				{
					// calc another share;
					int xa71xa61xa51xa41xa31xa21xa11xa01 = xa7xa6xa5xa4xa3xa2xa1xa0 ^ xa70xa60xa50xa40xa30xa20xa10xa00;
					int xb71xb61xb51xb41xb31xb21xb11xb01 = xb7xb6xb5xb4xb3xb2xb1xb0 ^ xb70xb60xb50xb40xb30xb20xb10xb00;

					//// GF256ToGF16 module
					// output variable
					int aa7aa6aa5aa4, aa3aa2aa1aa0;
					int ab7ab6ab5ab4, ab3ab2ab1ab0;

					GF256MapIntoGF16(xa7xa6xa5xa4xa3xa2xa1xa0, &aa7aa6aa5aa4, &aa3aa2aa1aa0);
					GF256MapIntoGF16(xb7xb6xb5xb4xb3xb2xb1xb0, &ab7ab6ab5ab4, &ab3ab2ab1ab0);

					// output shares
					int aa70aa60aa50aa40, aa30aa20aa10aa00;
					int aa71aa61aa51aa41, aa31aa21aa11aa01;

					int ab70ab60ab50ab40, ab30ab20ab10ab00;
					int ab71ab61ab51ab41, ab31ab21ab11ab01;

					GF256ToGF16MaskingSchemeParallel(xa70xa60xa50xa40xa30xa20xa10xa00, xa71xa61xa51xa41xa31xa21xa11xa01,
						xb70xb60xb50xb40xb30xb20xb10xb00, xb71xb61xb51xb41xb31xb21xb11xb01,
						&aa70aa60aa50aa40, &aa71aa61aa51aa41, &aa30aa20aa10aa00, &aa31aa21aa11aa01,
						&ab70ab60ab50ab40, &ab71ab61ab51ab41, &ab30ab20ab10ab00, &ab31ab21ab11ab01);

					// determine;
					if (aa7aa6aa5aa4 != (aa70aa60aa50aa40 ^ aa71aa61aa51aa41))
					{
						printf("\tThere are some errors in the calculation of GF256ToGF16 module's aa7aa6aa5aa4 for Sboxa.\n");
						flag = 1;
					}
					if (aa3aa2aa1aa0 != (aa30aa20aa10aa00 ^ aa31aa21aa11aa01))
					{
						printf("\tThere are some errors in the calculation of GF256ToGF16 module's aa3aa2aa1aa0 for Sboxa.\n");
						flag = 1;
					}
					if (ab7ab6ab5ab4 != (ab70ab60ab50ab40 ^ ab71ab61ab51ab41))
					{
						printf("\tThere are some errors in the calculation of GF256ToGF16 module's aa7aa6aa5aa4 for Sboxb.\n");
						flag = 1;
					}
					if (ab3ab2ab1ab0 != (ab30ab20ab10ab00 ^ ab31ab21ab11ab01))
					{
						printf("\tThere are some errors in the calculation of GF256ToGF16 module's aa3aa2aa1aa0 for Sboxb.\n");
						flag = 1;
					}

					//// GF16.MulXorSqSc module;
					// output variables
					int ba3ba2ba1ba0;
					int bb3bb2bb1bb0;

					GF16MulXorSqSc(aa7aa6aa5aa4, aa3aa2aa1aa0, &ba3ba2ba1ba0);
					GF16MulXorSqSc(ab7ab6ab5ab4, ab3ab2ab1ab0, &bb3bb2bb1bb0);

					// output shares
					int ba3[4], ba2[4], ba1[4], ba0[4];
					int ba30ba20ba10ba00, ba31ba21ba11ba01;

					int bb3[4], bb2[4], bb1[4], bb0[4];
					int bb30bb20bb10bb00, bb31bb21bb11bb01;

					GF16MulXorSqScMaskingSchemeParallel(aa70aa60aa50aa40, aa71aa61aa51aa41, aa30aa20aa10aa00, aa31aa21aa11aa01,
						ab70ab60ab50ab40, ab71ab61ab51ab41, ab30ab20ab10ab00, ab31ab21ab11ab01,
						ba3, ba2, ba1, ba0, bb3, bb2, bb1, bb0);

					ba30ba20ba10ba00 = ((ba3[0] ^ ba3[1]) << 3) | ((ba2[0] ^ ba2[1]) << 2) | ((ba1[0] ^ ba1[1]) << 1) | ((ba0[0] ^ ba0[1]) << 0);
					ba31ba21ba11ba01 = ((ba3[2] ^ ba3[3]) << 3) | ((ba2[2] ^ ba2[3]) << 2) | ((ba1[2] ^ ba1[3]) << 1) | ((ba0[2] ^ ba0[3]) << 0);

					bb30bb20bb10bb00 = ((bb3[0] ^ bb3[1]) << 3) | ((bb2[0] ^ bb2[1]) << 2) | ((bb1[0] ^ bb1[1]) << 1) | ((bb0[0] ^ bb0[1]) << 0);
					bb31bb21bb11bb01 = ((bb3[2] ^ bb3[3]) << 3) | ((bb2[2] ^ bb2[3]) << 2) | ((bb1[2] ^ bb1[3]) << 1) | ((bb0[2] ^ bb0[3]) << 0);

					// determine;
					if (ba3ba2ba1ba0 != (ba30ba20ba10ba00 ^ ba31ba21ba11ba01))
					{
						printf("\tThere are some errors in the calculation of GF16MulXorSqSc module's ba3ba2ba1ba0 for Sboxa.\n");
						flag = 1;
					}
					if (bb3bb2bb1bb0 != (bb30bb20bb10bb00 ^ bb31bb21bb11bb01))
					{
						printf("\tThere are some errors in the calculation of GF16MulXorSqSc module's ba3ba2ba1ba0 for Sboxb.\n");
						flag = 1;
					}

					//// GF4.MulXorSqSc module;
					for (int random = 0; random < 256; random++)
					{
						int randoma = (random >> 4) & 0x0f;
						int randomb = (random >> 0) & 0x0f;

						// output variables
						int ca1ca0;
						int cb1cb0;

						GF4MulXorSqSc(ba3ba2ba1ba0, &ca1ca0);
						GF4MulXorSqSc(bb3bb2bb1bb0, &cb1cb0);

						// output shares;
						int ca3[4], ca2[4], ca1[4], ca0[4];
						int ca30ca20, ca31ca21, ca10ca00, ca11ca01;
						int ca30ca20ca10ca00, ca31ca21ca11ca01;

						int cb3[4], cb2[4], cb1[4], cb0[4];
						int cb30cb20, cb31cb21, cb10cb00, cb11cb01;
						int cb30cb20cb10cb00, cb31cb21cb11cb01;

						GF4MulXorSqScMaskingSchemeParallel(ba30ba20ba10ba00, ba31ba21ba11ba01, aa70aa60aa50aa40, aa70aa60aa50aa40,
							bb30bb20bb10bb00, bb31bb21bb11bb01, ab70ab60ab50ab40, ab70ab60ab50ab40,
							ca3, ca2, ca1, ca0, cb3, cb2, cb1, cb0);

						ca30ca20 = ((ca3[0] ^ ca3[1]) << 1) ^ ((ca2[0] ^ ca2[1]) << 0);
						ca31ca21 = ((ca3[2] ^ ca3[3]) << 1) ^ ((ca2[2] ^ ca2[3]) << 0);

						ca10ca00 = ((ca1[0] ^ ca1[1]) << 1) ^ ((ca0[0] ^ ca0[1]) << 0);
						ca11ca01 = ((ca1[2] ^ ca1[3]) << 1) ^ ((ca0[2] ^ ca0[3]) << 0);

						ca30ca20ca10ca00 = (ca30ca20 << 2) | (ca10ca00 << 0);
						ca31ca21ca11ca01 = (ca31ca21 << 2) | (ca11ca01 << 0);

						cb30cb20 = ((cb3[0] ^ cb3[1]) << 1) ^ ((cb2[0] ^ cb2[1]) << 0);
						cb31cb21 = ((cb3[2] ^ cb3[3]) << 1) ^ ((cb2[2] ^ cb2[3]) << 0);

						cb10cb00 = ((cb1[0] ^ cb1[1]) << 1) ^ ((cb0[0] ^ cb0[1]) << 0);
						cb11cb01 = ((cb1[2] ^ cb1[3]) << 1) ^ ((cb0[2] ^ cb0[3]) << 0);

						cb30cb20cb10cb00 = (cb30cb20 << 2) | (cb10cb00 << 0);
						cb31cb21cb11cb01 = (cb31cb21 << 2) | (cb11cb01 << 0);

						// determine;
						if (ca1ca0 != (ca30ca20 ^ ca31ca21))
						{
							printf("\tThere are some errors in the calculation of GF4MulXorSqSc module's ca1ca0 for Sboxa.\n");
							flag = 1;
						}
						if (ca1ca0 != (ca10ca00 ^ ca11ca01))
						{
							printf("\tThere are some errors in the calculation of GF4MulXorSqSc module's ca1ca0 for Sboxa.\n");
							flag = 1;
						}
						if (cb1cb0 != (cb30cb20 ^ cb31cb21))
						{
							printf("\tThere are some errors in the calculation of GF4MulXorSqSc module's cb1cb0 for Sboxb.\n");
							flag = 1;
						}
						if (cb1cb0 != (cb10cb00 ^ cb11cb01))
						{
							printf("\tThere are some errors in the calculation of GF4MulXorSqSc module's cb1cb0 for Sboxb.\n");
							flag = 1;
						}

						//// GF4.Mul module;
						// output variables
						int da1da0, da3da2;
						int db1db0, db3db2;
						GF4Mul(ca1ca0, ((ba3ba2ba1ba0 >> 2) & 3), &da1da0);
						GF4Mul(ca1ca0, ((ba3ba2ba1ba0 >> 0) & 3), &da3da2);

						GF4Mul(cb1cb0, ((bb3bb2bb1bb0 >> 2) & 3), &db1db0);
						GF4Mul(cb1cb0, ((bb3bb2bb1bb0 >> 0) & 3), &db3db2);

						int da3da2da1da0 = (da3da2 << 2) | (da1da0 << 0);
						int db3db2db1db0 = (db3db2 << 2) | (db1db0 << 0);


						// output shares
						int da3[4], da2[4], da1[4], da0[4];
						int db3[4], db2[4], db1[4], db0[4];
						GF4MulMaskingSchemeParallel(ba30ba20ba10ba00, ba31ba21ba11ba01, ca30ca20ca10ca00, ca31ca21ca11ca01, aa30aa20aa10aa00,
							bb30bb20bb10bb00, bb31bb21bb11bb01, cb30cb20cb10cb00, cb31cb21cb11cb01, ab30ab20ab10ab00,
							da3, da2, da1, da0, db3, db2, db1, db0);

						int da10da00 = ((da1[0] ^ da1[1]) << 1) | ((da0[0] ^ da0[1]) << 0);
						int da11da01 = ((da1[2] ^ da1[3]) << 1) | ((da0[2] ^ da0[3]) << 0);

						int da30da20 = ((da3[0] ^ da3[1]) << 1) | ((da2[0] ^ da2[1]) << 0);
						int da31da21 = ((da3[2] ^ da3[3]) << 1) | ((da2[2] ^ da2[3]) << 0);

						int db10db00 = ((db1[0] ^ db1[1]) << 1) | ((db0[0] ^ db0[1]) << 0);
						int db11db01 = ((db1[2] ^ db1[3]) << 1) | ((db0[2] ^ db0[3]) << 0);

						int db30db20 = ((db3[0] ^ db3[1]) << 1) | ((db2[0] ^ db2[1]) << 0);
						int db31db21 = ((db3[2] ^ db3[3]) << 1) | ((db2[2] ^ db2[3]) << 0);

						int da30da20da10da00 = (da30da20 << 2) | (da10da00 << 0);
						int da31da21da11da01 = (da31da21 << 2) | (da11da01 << 0);

						int db30db20db10db00 = (db30db20 << 2) | (db10db00 << 0);
						int db31db21db11db01 = (db31db21 << 2) | (db11db01 << 0);

						// determine;
						if (da3da2da1da0 != (da30da20da10da00 ^ da31da21da11da01))
						{
							printf("\tThere are some errors in the calculation of GF4Mul module's da3da2da1da0 for Sboxa.\n");
							flag = 1;
						}
						if (db3db2db1db0 != (db30db20db10db00 ^ db31db21db11db01))
						{
							printf("\tThere are some errors in the calculation of GF4Mul module's db3db2db1db0 for Sboxb.\n");
							flag = 1;
						}

						//// GF16.Mul module
						// output variables
						int ea3ea2ea1ea0, ea7ea6ea5ea4;
						int eb3eb2eb1eb0, eb7eb6eb5eb4;
						GF16Mul(aa3aa2aa1aa0, da3da2da1da0, &ea7ea6ea5ea4);
						GF16Mul(aa7aa6aa5aa4, da3da2da1da0, &ea3ea2ea1ea0);
						GF16Mul(ab3ab2ab1ab0, db3db2db1db0, &eb7eb6eb5eb4);
						GF16Mul(ab7ab6ab5ab4, db3db2db1db0, &eb3eb2eb1eb0);


						// output shares
						int ea7[4], ea6[4], ea5[4], ea4[4], ea3[4], ea2[4], ea1[4], ea0[4];
						int eb7[4], eb6[4], eb5[4], eb4[4], eb3[4], eb2[4], eb1[4], eb0[4];
						GF16MulMaskingSchemeParallel(aa30aa20aa10aa00, aa31aa21aa11aa01, aa70aa60aa50aa40, aa71aa61aa51aa41, da30da20da10da00, da31da21da11da01,
							ab30ab20ab10ab00, ab31ab21ab11ab01, ab70ab60ab50ab40, ab71ab61ab51ab41, db30db20db10db00, db31db21db11db01,
							ea7, ea6, ea5, ea4, ea3, ea2, ea1, ea0, eb7, eb6, eb5, eb4, eb3, eb2, eb1, eb0);

						int ea70ea60ea50ea40 = ((ea7[0] ^ ea7[1]) << 3) | ((ea6[0] ^ ea6[1]) << 2) | ((ea5[0] ^ ea5[1]) << 1) | ((ea4[0] ^ ea4[1]) << 0);
						int ea71ea61ea51ea41 = ((ea7[2] ^ ea7[3]) << 3) | ((ea6[2] ^ ea6[3]) << 2) | ((ea5[2] ^ ea5[3]) << 1) | ((ea4[2] ^ ea4[3]) << 0);

						int ea30ea20ea10ea00 = ((ea3[0] ^ ea3[1]) << 3) | ((ea2[0] ^ ea2[1]) << 2) | ((ea1[0] ^ ea1[1]) << 1) | ((ea0[0] ^ ea0[1]) << 0);
						int ea31ea21ea11ea01 = ((ea3[2] ^ ea3[3]) << 3) | ((ea2[2] ^ ea2[3]) << 2) | ((ea1[2] ^ ea1[3]) << 1) | ((ea0[2] ^ ea0[3]) << 0);

						int eb70eb60eb50eb40 = ((eb7[0] ^ eb7[1]) << 3) | ((eb6[0] ^ eb6[1]) << 2) | ((eb5[0] ^ eb5[1]) << 1) | ((eb4[0] ^ eb4[1]) << 0);
						int eb71eb61eb51eb41 = ((eb7[2] ^ eb7[3]) << 3) | ((eb6[2] ^ eb6[3]) << 2) | ((eb5[2] ^ eb5[3]) << 1) | ((eb4[2] ^ eb4[3]) << 0);

						int eb30eb20eb10eb00 = ((eb3[0] ^ eb3[1]) << 3) | ((eb2[0] ^ eb2[1]) << 2) | ((eb1[0] ^ eb1[1]) << 1) | ((eb0[0] ^ eb0[1]) << 0);
						int eb31eb21eb11eb01 = ((eb3[2] ^ eb3[3]) << 3) | ((eb2[2] ^ eb2[3]) << 2) | ((eb1[2] ^ eb1[3]) << 1) | ((eb0[2] ^ eb0[3]) << 0);

						// determine;
						if (ea7ea6ea5ea4 != (ea70ea60ea50ea40 ^ ea71ea61ea51ea41))
						{
							printf("\tThere are some errors in the calculation of GF16Mul module's ea7ea6ea5ea4 for Sboxa.\n");
							flag = 1;
						}
						if (ea3ea2ea1ea0 != (ea30ea20ea10ea00 ^ ea31ea21ea11ea01))
						{
							printf("\tThere are some errors in the calculation of GF16Mul module's ea3ea2ea1ea0 for Sboxa.\n");
							flag = 1;
						}
						if (eb7eb6eb5eb4 != (eb70eb60eb50eb40 ^ eb71eb61eb51eb41))
						{
							printf("\tThere are some errors in the calculation of GF16Mul module's eb7eb6eb5eb4 for Sboxb.\n");
							flag = 1;
						}
						if (eb3eb2eb1eb0 != (eb30eb20eb10eb00 ^ eb31eb21eb11eb01))
						{
							printf("\tThere are some errors in the calculation of GF16Mul module's eb3eb2eb1eb0 for Sboxb.\n");
							flag = 1;
						}

						//// GF16MapIntoGF256 module;
						// output variables
						int fa7fa6fa5fa4fa3fa2fa1fa0;
						int fb7fb6fb5fb4fb3fb2fb1fb0;
						int fa[8];
						int fb[8];

						GF16ToGF256(ea7ea6ea5ea4, ea3ea2ea1ea0, fa);
						GF16ToGF256(eb7eb6eb5eb4, eb3eb2eb1eb0, fb);

						// output variables
						int ya7ya6ya5ya4ya3ya2ya1ya0;
						int ya7ya6ya5ya4ya3ya2ya1ya0_real;

						fa7fa6fa5fa4fa3fa2fa1fa0 = (fa[7] << 7) | (fa[6] << 6) | (fa[5] << 5) | (fa[4] << 4) | (fa[3] << 3) | (fa[2] << 2) | (fa[1] << 1) | (fa[0] << 0);
						MatrixAXorX(fa7fa6fa5fa4fa3fa2fa1fa0, &ya7ya6ya5ya4ya3ya2ya1ya0);

						int yb7yb6yb5yb4yb3yb2yb1yb0;
						int yb7yb6yb5yb4yb3yb2yb1yb0_real;

						fb7fb6fb5fb4fb3fb2fb1fb0 = (fb[7] << 7) | (fb[6] << 6) | (fb[5] << 5) | (fb[4] << 4) | (fb[3] << 3) | (fb[2] << 2) | (fb[1] << 1) | (fb[0] << 0);
						MatrixAXorX(fb7fb6fb5fb4fb3fb2fb1fb0, &yb7yb6yb5yb4yb3yb2yb1yb0);

						// Sboxa;
						ya7ya6ya5ya4ya3ya2ya1ya0 = ya7ya6ya5ya4ya3ya2ya1ya0 ^ 0x63;
						ya7ya6ya5ya4ya3ya2ya1ya0_real = AESSbox[xa7xa6xa5xa4xa3xa2xa1xa0];

						// Sboxb;
						yb7yb6yb5yb4yb3yb2yb1yb0 = yb7yb6yb5yb4yb3yb2yb1yb0 ^ 0x63;
						yb7yb6yb5yb4yb3yb2yb1yb0_real = AESSbox[xb7xb6xb5xb4xb3xb2xb1xb0];

						if (ya7ya6ya5ya4ya3ya2ya1ya0_real != ya7ya6ya5ya4ya3ya2ya1ya0)
						{
							printf("\tThere are some errors in Implemation for Sboxa.\n");
							flag = 1;
						}
						// µÚ¶þ¸öSºÐ;
						if (yb7yb6yb5yb4yb3yb2yb1yb0_real != yb7yb6yb5yb4yb3yb2yb1yb0)
						{
							printf("\tThere are some errors in Implemation for Sboxb.\n");
							flag = 1;
						}
					}
				}
			}

			if (flag == 0)
			{
				printf("right.\n");
			}
			else
			{
				printf("wrong.\n");
				return -1;
			}
		}
	}

	return 0;
}

// Verify the jointly uniform of GF4.Mul, GF16.Mul;
int VerifyAESTISchemeDistribution()
{
	//// Sboxa, Sboxb
	// 
	// Sboxa input variable;
	for (int xa7xa6xa5xa4xa3xa2xa1xa0 = 0; xa7xa6xa5xa4xa3xa2xa1xa0 < 256; xa7xa6xa5xa4xa3xa2xa1xa0++)
	{
		int flag = 0;
#pragma omp parallel for 
		// Sboxb input variable;
		for (int xb7xb6xb5xb4xb3xb2xb1xb0 = 0; xb7xb6xb5xb4xb3xb2xb1xb0 < 256; xb7xb6xb5xb4xb3xb2xb1xb0++)
		{
			// int xa70xa60xa50xa40xa30xa20xa10xa00, xa71xa61xa51xa41xa31xa21xa11xa01;
			// int xb70xb60xb50xb40xb30xb20xb10xb00, xb71xb61xb51xb41xb31xb21xb11xb01;

			int disaa70aa60aa50aa40aa30aa20aa10aa00da30da20da10da00[4096] = { 0 };
			int disaa70aa60aa50aa40aa30aa20aa10aa00db30db20db10db00[4096] = { 0 };

			int disab70ab60ab50ab40ab30ab20ab10ab00db30db20db10db00[4096] = { 0 };
			int disab70ab60ab50ab40ab30ab20ab10ab00da30da20da10da00[4096] = { 0 };

			int disea70ea60ea50ea40ea30ea20ea10ea00eb70eb60eb50eb40eb30eb20eb10eb00[65536] = { 0 };

			// Sboxa input share;
			for (int xa70xa60xa50xa40xa30xa20xa10xa00 = 0; xa70xa60xa50xa40xa30xa20xa10xa00 < 256; xa70xa60xa50xa40xa30xa20xa10xa00++)
			{
				// Sboxb input share;
				for (int xb70xb60xb50xb40xb30xb20xb10xb00 = 0; xb70xb60xb50xb40xb30xb20xb10xb00 < 256; xb70xb60xb50xb40xb30xb20xb10xb00++)
				{
					// calc another share;
					int xa71xa61xa51xa41xa31xa21xa11xa01 = xa7xa6xa5xa4xa3xa2xa1xa0 ^ xa70xa60xa50xa40xa30xa20xa10xa00;
					int xb71xb61xb51xb41xb31xb21xb11xb01 = xb7xb6xb5xb4xb3xb2xb1xb0 ^ xb70xb60xb50xb40xb30xb20xb10xb00;

					//// GF256ToGF16 module
					// output variable
					int aa7aa6aa5aa4, aa3aa2aa1aa0;
					int ab7ab6ab5ab4, ab3ab2ab1ab0;

					GF256MapIntoGF16(xa7xa6xa5xa4xa3xa2xa1xa0, &aa7aa6aa5aa4, &aa3aa2aa1aa0);
					GF256MapIntoGF16(xb7xb6xb5xb4xb3xb2xb1xb0, &ab7ab6ab5ab4, &ab3ab2ab1ab0);

					// output shares
					int aa70aa60aa50aa40, aa30aa20aa10aa00;
					int aa71aa61aa51aa41, aa31aa21aa11aa01;

					int ab70ab60ab50ab40, ab30ab20ab10ab00;
					int ab71ab61ab51ab41, ab31ab21ab11ab01;

					GF256ToGF16MaskingSchemeParallel(
						xa70xa60xa50xa40xa30xa20xa10xa00, xa71xa61xa51xa41xa31xa21xa11xa01,
						xb70xb60xb50xb40xb30xb20xb10xb00, xb71xb61xb51xb41xb31xb21xb11xb01,
						&aa70aa60aa50aa40, &aa71aa61aa51aa41, &aa30aa20aa10aa00, &aa31aa21aa11aa01,
						&ab70ab60ab50ab40, &ab71ab61ab51ab41, &ab30ab20ab10ab00, &ab31ab21ab11ab01);

					//// GF16.MulXorSqSc module;
					// output variables
					int ba3ba2ba1ba0;
					int bb3bb2bb1bb0;

					GF16MulXorSqSc(aa7aa6aa5aa4, aa3aa2aa1aa0, &ba3ba2ba1ba0);
					GF16MulXorSqSc(ab7ab6ab5ab4, ab3ab2ab1ab0, &bb3bb2bb1bb0);

					// output shares
					int ba3[4], ba2[4], ba1[4], ba0[4];
					int ba30ba20ba10ba00, ba31ba21ba11ba01;

					int bb3[4], bb2[4], bb1[4], bb0[4];
					int bb30bb20bb10bb00, bb31bb21bb11bb01;

					GF16MulXorSqScMaskingSchemeParallel(
						aa70aa60aa50aa40, aa71aa61aa51aa41, aa30aa20aa10aa00, aa31aa21aa11aa01,
						ab70ab60ab50ab40, ab71ab61ab51ab41, ab30ab20ab10ab00, ab31ab21ab11ab01,
						ba3, ba2, ba1, ba0, bb3, bb2, bb1, bb0);

					ba30ba20ba10ba00 = ((ba3[0] ^ ba3[1]) << 3) | ((ba2[0] ^ ba2[1]) << 2) | ((ba1[0] ^ ba1[1]) << 1) | ((ba0[0] ^ ba0[1]) << 0);
					ba31ba21ba11ba01 = ((ba3[2] ^ ba3[3]) << 3) | ((ba2[2] ^ ba2[3]) << 2) | ((ba1[2] ^ ba1[3]) << 1) | ((ba0[2] ^ ba0[3]) << 0);

					bb30bb20bb10bb00 = ((bb3[0] ^ bb3[1]) << 3) | ((bb2[0] ^ bb2[1]) << 2) | ((bb1[0] ^ bb1[1]) << 1) | ((bb0[0] ^ bb0[1]) << 0);
					bb31bb21bb11bb01 = ((bb3[2] ^ bb3[3]) << 3) | ((bb2[2] ^ bb2[3]) << 2) | ((bb1[2] ^ bb1[3]) << 1) | ((bb0[2] ^ bb0[3]) << 0);

					//// GF4.MulXorSqSc module;
					// output variables
					int ca1ca0;
					int cb1cb0;

					GF4MulXorSqSc(ba3ba2ba1ba0, &ca1ca0);
					GF4MulXorSqSc(bb3bb2bb1bb0, &cb1cb0);

					for (int random = 0; random < 256; random++)
					{
						int randoma = (random >> 4) & 0x0f;
						int randomb = (random >> 0) & 0x0f;

						// output shares;
						int ca3[4], ca2[4], ca1[4], ca0[4];
						int ca30ca20, ca31ca21, ca10ca00, ca11ca01;
						int ca30ca20ca10ca00, ca31ca21ca11ca01;

						int cb3[4], cb2[4], cb1[4], cb0[4];
						int cb30cb20, cb31cb21, cb10cb00, cb11cb01;
						int cb30cb20cb10cb00, cb31cb21cb11cb01;

						GF4MulXorSqScMaskingSchemeParallel(
							ba30ba20ba10ba00, ba31ba21ba11ba01, aa70aa60aa50aa40, randoma,
							bb30bb20bb10bb00, bb31bb21bb11bb01, ab70ab60ab50ab40, randomb,
							ca3, ca2, ca1, ca0, cb3, cb2, cb1, cb0);

						ca30ca20 = ((ca3[0] ^ ca3[1]) << 1) ^ ((ca2[0] ^ ca2[1]) << 0);
						ca31ca21 = ((ca3[2] ^ ca3[3]) << 1) ^ ((ca2[2] ^ ca2[3]) << 0);

						ca10ca00 = ((ca1[0] ^ ca1[1]) << 1) ^ ((ca0[0] ^ ca0[1]) << 0);
						ca11ca01 = ((ca1[2] ^ ca1[3]) << 1) ^ ((ca0[2] ^ ca0[3]) << 0);

						ca30ca20ca10ca00 = (ca30ca20 << 2) | (ca10ca00 << 0);
						ca31ca21ca11ca01 = (ca31ca21 << 2) | (ca11ca01 << 0);

						cb30cb20 = ((cb3[0] ^ cb3[1]) << 1) ^ ((cb2[0] ^ cb2[1]) << 0);
						cb31cb21 = ((cb3[2] ^ cb3[3]) << 1) ^ ((cb2[2] ^ cb2[3]) << 0);

						cb10cb00 = ((cb1[0] ^ cb1[1]) << 1) ^ ((cb0[0] ^ cb0[1]) << 0);
						cb11cb01 = ((cb1[2] ^ cb1[3]) << 1) ^ ((cb0[2] ^ cb0[3]) << 0);

						cb30cb20cb10cb00 = (cb30cb20 << 2) | (cb10cb00 << 0);
						cb31cb21cb11cb01 = (cb31cb21 << 2) | (cb11cb01 << 0);

						//// GF4.Mul module;
						// output variables
						int da1da0, da3da2;
						int db1db0, db3db2;
						GF4Mul(ca1ca0, ((ba3ba2ba1ba0 >> 2) & 3), &da1da0);
						GF4Mul(ca1ca0, ((ba3ba2ba1ba0 >> 0) & 3), &da3da2);

						GF4Mul(cb1cb0, ((bb3bb2bb1bb0 >> 2) & 3), &db1db0);
						GF4Mul(cb1cb0, ((bb3bb2bb1bb0 >> 0) & 3), &db3db2);

						int da3da2da1da0 = (da3da2 << 2) | (da1da0 << 0);
						int db3db2db1db0 = (db3db2 << 2) | (db1db0 << 0);

						// output shares
						int da3[4], da2[4], da1[4], da0[4];
						int db3[4], db2[4], db1[4], db0[4];
						GF4MulMaskingSchemeParallel(
							ba30ba20ba10ba00, ba31ba21ba11ba01, ca30ca20ca10ca00, ca31ca21ca11ca01, aa30aa20aa10aa00,
							bb30bb20bb10bb00, bb31bb21bb11bb01, cb30cb20cb10cb00, cb31cb21cb11cb01, ab30ab20ab10ab00,
							da3, da2, da1, da0, db3, db2, db1, db0);

						int da10da00 = ((da1[0] ^ da1[1]) << 1) | ((da0[0] ^ da0[1]) << 0);
						int da11da01 = ((da1[2] ^ da1[3]) << 1) | ((da0[2] ^ da0[3]) << 0);

						int da30da20 = ((da3[0] ^ da3[1]) << 1) | ((da2[0] ^ da2[1]) << 0);
						int da31da21 = ((da3[2] ^ da3[3]) << 1) | ((da2[2] ^ da2[3]) << 0);

						int db10db00 = ((db1[0] ^ db1[1]) << 1) | ((db0[0] ^ db0[1]) << 0);
						int db11db01 = ((db1[2] ^ db1[3]) << 1) | ((db0[2] ^ db0[3]) << 0);

						int db30db20 = ((db3[0] ^ db3[1]) << 1) | ((db2[0] ^ db2[1]) << 0);
						int db31db21 = ((db3[2] ^ db3[3]) << 1) | ((db2[2] ^ db2[3]) << 0);

						int da30da20da10da00 = (da30da20 << 2) | (da10da00 << 0);
						int da31da21da11da01 = (da31da21 << 2) | (da11da01 << 0);

						int db30db20db10db00 = (db30db20 << 2) | (db10db00 << 0);
						int db31db21db11db01 = (db31db21 << 2) | (db11db01 << 0);

						int aa70aa60aa50aa40aa30aa20aa10aa00da30da20da10da00 = (aa70aa60aa50aa40 << 8) | (aa30aa20aa10aa00 << 4) | (da30da20da10da00 << 0);
						int aa70aa60aa50aa40aa30aa20aa10aa00db30db20db10db00 = (aa70aa60aa50aa40 << 8) | (aa30aa20aa10aa00 << 4) | (db30db20db10db00 << 0);

						int ab70ab60ab50ab40ab30ab20ab10ab00db30db20db10db00 = (ab70ab60ab50ab40 << 8) | (ab30ab20ab10ab00 << 4) | (db30db20db10db00 << 0);
						int ab70ab60ab50ab40ab30ab20ab10ab00da30da20da10da00 = (ab70ab60ab50ab40 << 8) | (ab30ab20ab10ab00 << 4) | (da30da20da10da00 << 0);

						disaa70aa60aa50aa40aa30aa20aa10aa00da30da20da10da00[aa70aa60aa50aa40aa30aa20aa10aa00da30da20da10da00]++;
						disaa70aa60aa50aa40aa30aa20aa10aa00db30db20db10db00[aa70aa60aa50aa40aa30aa20aa10aa00db30db20db10db00]++;

						disab70ab60ab50ab40ab30ab20ab10ab00db30db20db10db00[ab70ab60ab50ab40ab30ab20ab10ab00db30db20db10db00]++;
						disab70ab60ab50ab40ab30ab20ab10ab00da30da20da10da00[ab70ab60ab50ab40ab30ab20ab10ab00da30da20da10da00]++;

						//// GF16.Mul module
						// output variables
						int ea3ea2ea1ea0, ea7ea6ea5ea4;
						int eb3eb2eb1eb0, eb7eb6eb5eb4;
						GF16Mul(aa3aa2aa1aa0, da3da2da1da0, &ea7ea6ea5ea4);
						GF16Mul(aa7aa6aa5aa4, da3da2da1da0, &ea3ea2ea1ea0);
						GF16Mul(ab3ab2ab1ab0, db3db2db1db0, &eb7eb6eb5eb4);
						GF16Mul(ab7ab6ab5ab4, db3db2db1db0, &eb3eb2eb1eb0);

						// output shares
						int ea7[4], ea6[4], ea5[4], ea4[4], ea3[4], ea2[4], ea1[4], ea0[4];
						int eb7[4], eb6[4], eb5[4], eb4[4], eb3[4], eb2[4], eb1[4], eb0[4];
						GF16MulMaskingSchemeParallel(aa30aa20aa10aa00, aa31aa21aa11aa01, aa70aa60aa50aa40, aa71aa61aa51aa41, da30da20da10da00, da31da21da11da01,
							ab30ab20ab10ab00, ab31ab21ab11ab01, ab70ab60ab50ab40, ab71ab61ab51ab41, db30db20db10db00, db31db21db11db01,
							ea7, ea6, ea5, ea4, ea3, ea2, ea1, ea0, eb7, eb6, eb5, eb4, eb3, eb2, eb1, eb0);

						int ea70ea60ea50ea40 = ((ea7[0] ^ ea7[1]) << 3) | ((ea6[0] ^ ea6[1]) << 2) | ((ea5[0] ^ ea5[1]) << 1) | ((ea4[0] ^ ea4[1]) << 0);
						int ea71ea61ea51ea41 = ((ea7[2] ^ ea7[3]) << 3) | ((ea6[2] ^ ea6[3]) << 2) | ((ea5[2] ^ ea5[3]) << 1) | ((ea4[2] ^ ea4[3]) << 0);

						int ea30ea20ea10ea00 = ((ea3[0] ^ ea3[1]) << 3) | ((ea2[0] ^ ea2[1]) << 2) | ((ea1[0] ^ ea1[1]) << 1) | ((ea0[0] ^ ea0[1]) << 0);
						int ea31ea21ea11ea01 = ((ea3[2] ^ ea3[3]) << 3) | ((ea2[2] ^ ea2[3]) << 2) | ((ea1[2] ^ ea1[3]) << 1) | ((ea0[2] ^ ea0[3]) << 0);

						int eb70eb60eb50eb40 = ((eb7[0] ^ eb7[1]) << 3) | ((eb6[0] ^ eb6[1]) << 2) | ((eb5[0] ^ eb5[1]) << 1) | ((eb4[0] ^ eb4[1]) << 0);
						int eb71eb61eb51eb41 = ((eb7[2] ^ eb7[3]) << 3) | ((eb6[2] ^ eb6[3]) << 2) | ((eb5[2] ^ eb5[3]) << 1) | ((eb4[2] ^ eb4[3]) << 0);

						int eb30eb20eb10eb00 = ((eb3[0] ^ eb3[1]) << 3) | ((eb2[0] ^ eb2[1]) << 2) | ((eb1[0] ^ eb1[1]) << 1) | ((eb0[0] ^ eb0[1]) << 0);
						int eb31eb21eb11eb01 = ((eb3[2] ^ eb3[3]) << 3) | ((eb2[2] ^ eb2[3]) << 2) | ((eb1[2] ^ eb1[3]) << 1) | ((eb0[2] ^ eb0[3]) << 0);

						int ea70ea60ea50ea40ea30ea20ea10ea00 = (ea70ea60ea50ea40 << 4) | (ea30ea20ea10ea00 << 0);
						int eb70eb60eb50eb40eb30eb20eb10eb00 = (eb70eb60eb50eb40 << 4) | (eb30eb20eb10eb00 << 0);

						int ea70ea60ea50ea40ea30ea20ea10ea00eb70eb60eb50eb40eb30eb20eb10eb00 = (ea70ea60ea50ea40ea30ea20ea10ea00 << 8) | (eb70eb60eb50eb40eb30eb20eb10eb00 << 0);

						disea70ea60ea50ea40ea30ea20ea10ea00eb70eb60eb50eb40eb30eb20eb10eb00[ea70ea60ea50ea40ea30ea20ea10ea00eb70eb60eb50eb40eb30eb20eb10eb00]++;
					}
				}
			}

			// determine the output shares of GF4.Mul;
			for (int i = 0; i < 4096; i++)
			{
				if (disaa70aa60aa50aa40aa30aa20aa10aa00da30da20da10da00[i] != 4096)
				{
					printf("The output shares aa70aa60aa50aa40aa30aa20aa10aa00da30da20da10da00 of GF4.Mul do not follow the jointly uniform distribution.\n");
					flag = 1;
				}
				if (disaa70aa60aa50aa40aa30aa20aa10aa00db30db20db10db00[i] != 4096)
				{
					printf("The output shares disaa70aa60aa50aa40aa30aa20aa10aa00db30db20db10db00 of GF4.Mul do not follow the jointly uniform distribution.\n");
					flag = 1;
				}

				if (disab70ab60ab50ab40ab30ab20ab10ab00db30db20db10db00[i] != 4096)
				{
					printf("The output shares disab70ab60ab50ab40ab30ab20ab10ab00db30db20db10db00 of GF4.Mul do not follow the jointly uniform distribution.\n");
					flag = 1;
				}
				if (disab70ab60ab50ab40ab30ab20ab10ab00da30da20da10da00[i] != 4096)
				{
					printf("The output shares disab70ab60ab50ab40ab30ab20ab10ab00da30da20da10da00 of GF4.Mul do not follow the jointly uniform distribution.\n");
					flag = 1;
				}
			}

			// determine the output shares of GF16.Mul;
			for (int i = 0; i < 65536; i++)
			{
				if (disea70ea60ea50ea40ea30ea20ea10ea00eb70eb60eb50eb40eb30eb20eb10eb00[i] != 256)
				{
					printf("The output shares disea70ea60ea50ea40ea30ea20ea10ea00eb70eb60eb50eb40eb30eb20eb10eb00 of GF16.Mul do not follow the jointly uniform distribution.\n");
					flag = 1;
				}
			}
			printf("\n\txa7xa6xa5xa4xa3xa2xa1xa0 = %d, xb7xb6xb5xb4xb3xb2xb1xb0 = %d:\toutput shares pass.", xa7xa6xa5xa4xa3xa2xa1xa0, xb7xb6xb5xb4xb3xb2xb1xb0);
			// printf("\n\t\tThe output shares of GF4.Mul and GF16.Mul of Sboxa and Sboxb follow the jointly-uniform distribution.\n");
		}

		if (flag == 0)
		{
			continue;
		}
		else
		{
			return -1;
		}
	}

	return 0;
}

int main(int argc, char* argv)
{

	const char		NumberOfCPUs = 64;
	omp_set_num_threads(NumberOfCPUs);

	// Verify the correction of AES TI scheme;
	printf("Verify the correction of AES TI scheme:\n");
	VerifyAESTISchemeCorrection();

	// Verify the jointly uniform of GF4.Mul, GF16.Mul;
	printf("Verify the distribution of AES TI scheme:\n");
	VerifyAESTISchemeDistribution();

	return 0;
}