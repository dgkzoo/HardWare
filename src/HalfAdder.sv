// 半加算器
module HalfAdder(
	input a,		// 値１
	input b,		// 値２
	output sum,		// 結果
	output carry);	// キャリーフラグ
 
	assign sum = a ^ b;
	assign carry = a & b;
endmodule
