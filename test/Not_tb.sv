// テストベンチ
// Not
module Not_tb();
	reg in;
	wire out;

	parameter RATE = 1;

	_Not not1(
		.in(in),
		.out(out)
	);

	initial begin
		$display("start test");

		#(RATE)
		in <= 0;
		#(RATE)
		if (out != 1) $display("#1 ng");

		#(RATE)
		in <= 1;
		#(RATE)
		if (out != 0) $display("#2 ng");

		#99999
		$display("end test");
		$stop;
	end

endmodule
