/**
 * # 半加算器
 *
 * ## author
 * dgkzoo
 */
`default_nettype none
module HalfAdder(
	input wire a,		// 値１
	input wire b,		// 値２
	output wire sum,	// 結果
	output wire carry);	// キャリーフラグ
 
	_Xor xor1(.a(a), .b(b), .out(sum));
	_And and1(.a(a), .b(b), .out(carry));
endmodule
