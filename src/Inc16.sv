// インクリメンタ16
module Inc16(
	input[15:0] a,		// 値
	output[15:0] out);	// 結果

	Add16 add(a, 1, out);

endmodule
