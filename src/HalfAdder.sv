// 半加算器
`default_nettype none
module HalfAdder(
	input wire a,		// 値１
	input wire b,		// 値２
	output wire sum,		// 結果
	output wire carry);	// キャリーフラグ
 
	assign sum = a ^ b;
	assign carry = a & b;
endmodule
