// 16ビット4入力デマルチプレクサ
`default_nettype none
module DMux4Way(
	input wire in,			// in
	input wire[1:0] sel,	// セレクタ
	output wire a,			// 出力a
	output wire b,			// 出力b
	output wire c,			// 出力c
	output wire d			// 出力d
	);

	wire abOut,cdOut;
	DMux dmux1(.in(in), .sel(sel[1]), .a(abOut), .b(cdOut));
	DMux dmux2(.in(abOut), .sel(sel[0]), .a(a), .b(b));
	DMux dmux3(.in(cdOut), .sel(sel[0]), .a(c), .b(d));

endmodule
