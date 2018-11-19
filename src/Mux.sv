// マルチプレクサ
module Mux(
	input a,			// 値a
	input b,			// 値b
	input sel,			// セレクタ
	output out);		// out

	assign out = (sel == 1'b0) ? a : b;

endmodule
