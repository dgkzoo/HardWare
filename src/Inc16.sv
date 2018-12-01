/**
 * # インクリメンタ
 *
 * ## author
 * dgkzoo
 */
`default_nettype none
module Inc16(
	input wire[15:0] a,		// 値
	output wire[15:0] out);	// 結果

	Add16 add(a, 16'd1, out);
endmodule
