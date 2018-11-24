// テストベンチ
// 加算器16
module Add16_tb();
	reg clk;
	reg[15:0] a;
	reg[15:0] b;
	wire[15:0] sum;

	parameter RATE = 1;

	always #1 clk = !clk;

	Add16 add16(
		.a(a),
		.b(b),
		.out(sum)
	);

	initial begin
		$display("start test");
		clk <= 1;

		#(RATE)
		a <= 0;
		b <= 0;
		#(RATE)
		if (sum != 0) $display("0 0 sum ng");

		#(RATE)
		a <= 1;
		b <= 0;
		#(RATE)
		if (sum != 1) $display("0 0 sum ng");

		#(RATE)
		a <= 16'd1;
		b <= 16'd1;
		#(RATE)
		if (sum != 16'd2) $display("1 1 sum ng");

		#(RATE)
		a <= -16'd1;
		b <= 16'd1;
		#(RATE)
		if (sum != 16'd0) $display("-1 1 sum ng");

		#(RATE)
		a <= 16'd123;
		b <= 16'd456;
		#(RATE)
		if (sum != 16'd579) $display("123 456 sum ng");

		#(RATE)
		a <= 16'd123;
		b <= -16'd456;
		#(RATE)
		if (sum != -16'd333) $display("123 -456 sum ng");

		#(RATE)
		a <= 16'b1111111111111111;
		b <= 16'b1111111111111111;
		#(RATE)
		if (sum != 16'b1111111111111110) $display("16'b1111111111111111 16'b1111111111111111 sum ng");

		#9999999
		$display("success!");
		$stop;
	end

endmodule
