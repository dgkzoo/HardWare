/**
 * # 16ビット8入力マルチプレクサ
 *
 * ## author
 * dgkzoo
 */
`default_nettype none
module Mux8Way16(
	input wire[15:0] a,			// 値a
	input wire[15:0] b,			// 値b
	input wire[15:0] c,			// 値c
	input wire[15:0] d,			// 値d
	input wire[15:0] e,			// 値e
	input wire[15:0] f,			// 値f
	input wire[15:0] g,			// 値g
	input wire[15:0] h,			// 値h
	input wire[2:0] sel,		// セレクタ
	output wire[15:0] out);		// out

	wire[15:0] muxOut1,muxOut2;
	Mux4Way16 mux1(.a(a), .b(b), .c(c), .d(d), .sel(sel[1:0]), .out(muxOut1));
	Mux4Way16 mux2(.a(e), .b(f), .c(g), .d(h), .sel(sel[1:0]), .out(muxOut2));

	Mux16 mux3(.a(muxOut1), .b(muxOut2), .sel(sel[2]), .out(out));
endmodule
