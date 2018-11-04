// テストベンチ
// インクリメンタ16
module Inc16_tb();
	reg clk;
	reg[15:0] a;
	wire[15:0] out;

	always #1 clk = !clk;

	Inc16 inc16(
		.a(a),
		.out(out)
	);

	initial begin
		$display("start test");

		#10
		a <= 0;
		#20
		if (out != 1) $display("0 out ng");

		#30
		a <= 1;
		#40
		if (out != 2) $display("1 out ng");

		#50
		a <= 16'b1111111111111110;
		#60
		if (out != 16'b1111111111111111) $display("16'b1111111111111110 out ng");

		#70
		a <= 16'b1111111111111111;
		#80
		if (out != 0) $display("16'b1111111111111111 out ng");

		#170
		$display("success!");
		$stop;
	end

endmodule
