// テストベンチ
// 加算器16
module Add16_tb();
	reg clk;
	reg[15:0] a;
	reg[15:0] b;
	wire[15:0] sum;

	always #1 clk = !clk;

	Add16 add16(
		.a(a),
		.b(b),
		.out(sum)
	);

	initial begin
		$display("start test");

		#1
		a <= 0;
		b <= 0;
		#2
		if (sum != 0) $display("0 0 sum ng");

		#3
		a <= 1;
		b <= 0;
		#4
		if (sum != 1) $display("0 0 sum ng");

		#5
		a <= 16'b1111111111111111;
		b <= 16'b1111111111111111;
		#6
		if (sum != 16'b1111111111111110) $display("16'b1111111111111111 16'b1111111111111111 sum ng");

		#9999999
		$display("success!");
		$stop;
	end

endmodule
