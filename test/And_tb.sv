// テストベンチ
// And
`default_nettype none
module And_tb();
	reg a;
	reg b;
	wire out;

	parameter RATE = 1;

	And and1(
		.a(a),
		.b(b),
		.out(out)
	);

	initial begin
		$display("start test");

		#(RATE)
		a <= 0; b <= 0;
		#(RATE)
		if (out != 0) $display("#1 ng");

		#(RATE)
		a <= 0; b <= 1;
		#(RATE)
		if (out != 0) $display("#2 ng");

		#(RATE)
		a <= 1; b <= 0;
		#(RATE)
		if (out != 0) $display("#3 ng");

		#(RATE)
		a <= 1; b <= 1;
		#(RATE)
		if (out != 1) $display("#4 ng");

		#99999
		$display("end test");
		$stop;
	end

endmodule
