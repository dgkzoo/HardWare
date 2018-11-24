// 全加算器
`default_nettype none
module FullAdder(
	input wire a,		// 値１
	input wire b,		// 値２
	input wire c,		// 下位の桁上がり
	output wire sum,	// 加算結果
	output wire carry);	// 桁上がり
 
	wire ha1Sum;
	wire ha1Carry;
	wire ha2Carry;

	HalfAdder ha1(a, b, ha1Sum, ha1Carry);
	HalfAdder ha2(ha1Sum, c, sum, ha2Carry);

	_Or or1(.a(ha1Carry), .b(ha2Carry), .out(carry));
endmodule
