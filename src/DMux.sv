// 1ビット2入力デマルチプレクサ
`default_nettype none
module DMux(
	input wire in,		// in
	input wire sel,		// セレクタ
	output wire a,		// 出力a
	output wire b		// 出力b
	);

	wire notSel;
	_Not not1(.in(sel), .out(notSel));
	_And and1(.a(notSel), .b(in), .out(a));
	_And and2(.a(sel), .b(in), .out(b));
	
endmodule
