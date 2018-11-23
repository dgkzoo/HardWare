// 全加算器
`default_nettype none
module FullAdder(
	input wire a,		// 値１
	input wire b,		// 値２
	input wire c,		// 値３
	output wire sum,		// 結果
	output wire carry);	// キャリーフラグ
 
	wire half_sum1;
	wire half_carry1;
	wire half_sum2;
	wire half_carry2;

	HalfAdder ha1(a, b, half_sum1, half_carry1);
	HalfAdder ha2(half_sum1, c, half_sum2, half_carry2);

	assign sum = (half_sum1 ^ c);
	assign carry = half_carry1 | half_carry2;
endmodule
