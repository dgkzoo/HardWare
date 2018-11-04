// テストベンチ
// 半加算器
module FullfAdder_tb();
	reg clk;
	reg a;
	reg b;
	reg c;
	reg sum;
	reg carry;

	always #1 clk = !clk;

	FullAdder fa(
		.a(a),
		.b(b),
		.c(c),
		.sum(sum),
		.carry(carry)
	);

	initial begin
	  $display("start test");
	  
		#10
		a <= 1'b0;
		b <= 1'b0;
		c <= 1'b0;
		#20
		if (sum != 0) $display("0 0 0 sum ng");
		if (carry != 0) $display("0 0 0 carry ng");

		#30
		a <= 1'b0;
		b <= 1'b0;
		c <= 1'b1;
		#40
		if (sum != 1) $display("0 0 1 sum ng");
		if (carry != 0) $display("0 0 1 carry ng");

		#50
		a <= 1'b0;
		b <= 1'b1;
		c <= 1'b0;
		#60
		if (sum != 1) $display("0 1 0 sum ng");
		if (carry != 0) $display("0 1 0 carry ng");

		#70
		a <= 1'b0;
		b <= 1'b1;
		c <= 1'b1;
		#80
		if (sum != 0) $display("0 1 1 sum ng");
		if (carry != 1) $display("0 1 1 carry ng");

		#90
		a <= 1'b1;
		b <= 1'b0;
		c <= 1'b0;
		#100
		if (sum != 1) $display("1 0 0 sum ng");
		if (carry != 0) $display("1 0 0 carry ng");

		#110
		a <= 1'b1;
		b <= 1'b0;
		c <= 1'b1;
		#120
		if (sum != 0) $display("1 0 1 sum ng");
		if (carry != 1) $display("1 0 1 carry ng");

		#130
		a <= 1'b1;
		b <= 1'b1;
		c <= 1'b0;
		#140
		if (sum != 0) $display("1 1 0 sum ng");
		if (carry != 1) $display("1 1 0 carry ng");

		#150
		a <= 1'b1;
		b <= 1'b1;
		c <= 1'b1;
		#160
		if (sum != 1) $display("1 1 1 sum ng");
		if (carry != 1) $display("1 1 1 carry ng");

		#170
		$display("success!");
		$stop;
	end

endmodule
