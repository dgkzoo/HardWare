// テストベンチ
// 半加算器
module HalfAdder_tb();
	reg clk;
	reg a;
	reg b;
	reg sum;
	reg carry;

	always #1 clk = !clk;

	HalfAdder ha(
		.a(a),
		.b(b),
		.sum(sum),
		.carry(carry)
	);

	initial begin
	  $display("start test");
	  
		#10
		a <= 1'b0;
		b <= 1'b0;
		#20
		if (sum != 0) $display("ng");
		if (carry != 0) $display("ng");

		#30
		a <= 1'b0;
		b <= 1'b1;
		#40
		if (sum != 1) $display("ng");
		if (carry != 0) $display("ng");

		#50
		a <= 1'b1;
		b <= 1'b0;
		#60
		if (sum != 1) $display("ng");
		if (carry != 0) $display("ng");

		#70
		a <= 1'b1;
		b <= 1'b1;
		#80
		if (sum != 0) $display("ng");
		if (carry != 1) $display("ng");

		#90
		$display("success!");
		$stop;
	end

endmodule
