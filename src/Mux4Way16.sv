/**
 * # 16ビット4入力マルチプレクサ
 *
 * ## author
 * dgkzoo
 */
`default_nettype none
module Mux4Way16(
	input wire[15:0] a,			// 値a
	input wire[15:0] b,			// 値b
	input wire[15:0] c,			// 値b
	input wire[15:0] d,			// 値b
	input wire[1:0] sel,		// セレクタ
	output wire[15:0] out);		// out

	wire[15:0] muxOutAB,muxOutCD;
	Mux16 muxAB(.a(a), .b(b), .sel(sel[0]), .out(muxOutAB));
	Mux16 muxCD(.a(c), .b(d), .sel(sel[0]), .out(muxOutCD));

	Mux16 mux(.a(muxOutAB), .b(muxOutCD), .sel(sel[1]), .out(out));
endmodule
