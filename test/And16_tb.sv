// テストベンチ
// And16
module And16_tb();
	reg[15:0] a, b;
	reg[15:0] out;

	parameter RATE = 1;

	And16 and16(
		.a(a),
		.b(b),
		.out(out)
	);

	initial begin
		$display("start test");

		#(RATE)
		a <= 16'b0000000000000000;
		b <= 16'b0000000000000000;
		#(RATE)
		if (out != 16'b0000000000000000) $display("#1 ng");

		#(RATE)
		a <= 16'b0000000000000000;
		b <= 16'b1111111111111111;
		#(RATE)
		if (out != 16'b0000000000000000) $display("#2 ng");

		#(RATE)
		a <= 16'b1111111111111111;
		b <= 16'b1111111111111111;
		#(RATE)
		if (out != 16'b1111111111111111) $display("#3 ng");

		#(RATE)
		a <= 16'b1010101010101010;
		b <= 16'b0101010101010101;
		#(RATE)
		if (out != 16'b0000000000000000) $display("#4 ng");

		#(RATE)
		a <= 16'b0011110011000011;
		b <= 16'b0000111111110000;
		#(RATE)
		if (out != 16'b0000110011000000) $display("#5 ng");

		#(RATE)
		a <= 16'b0001001000110100;
		b <= 16'b1001100001110110;
		#(RATE)
		if (out != 16'b0001000000110100) $display("#6 ng");

		#99999
		$display("end test");
		$stop;
	end

endmodule
