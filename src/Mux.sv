/**
 * # 1ビット2入力マルチプレクサ
 *
 * ## author
 * dgkzoo
 */
`default_nettype none
module Mux(
	input wire a,			// 値a
	input wire b,			// 値b
	input wire sel,			// セレクタ
	output wire out);		// out

	assign out = (sel == 1'b0) ? a : b;

endmodule
