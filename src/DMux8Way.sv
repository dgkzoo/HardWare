/**
 * # 1ビット8入力デマルチプレクサ
 *
 * ## author
 * dgkzoo
 */
`default_nettype none
module DMux8Way(
	input wire in,			// in
	input wire[2:0] sel,	// セレクタ
	output wire a,			// 出力a
	output wire b,			// 出力b
	output wire c,			// 出力c
	output wire d,			// 出力d
	output wire e,			// 出力e
	output wire f,			// 出力f
	output wire g,			// 出力g
	output wire h			// 出力h
	);

	wire abcdOut,cdefOut;
	DMux dmux1(.in(in), .sel(sel[2]), .a(abcdOut), .b(cdefOut));
	DMux4Way dmux4way1(.in(abcdOut), .sel(sel[1:0]), .a(a), .b(b), .c(c), .d(d));
	DMux4Way dmux4way2(.in(cdefOut), .sel(sel[1:0]), .a(e), .b(f), .c(g), .d(h));

endmodule
