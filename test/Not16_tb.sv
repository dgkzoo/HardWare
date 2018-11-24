// テストベンチ
// Not16
module Not16_tb();
	reg[15:0] in;
	reg[15:0] out;

	parameter RATE = 1;

	Not16 not16(
		.in(in),
		.out(out)
	);

	initial begin
		$display("start test");

		#(RATE)
		in <= 16'b0000000000000000;
		#(RATE)
		if (out != 16'b1111111111111111) $display("#1 ng");

		#(RATE)
		in <= 16'b1111111111111111;
		#(RATE)
		if (out != 16'b0000000000000000) $display("#2 ng");

		#(RATE)
		in <= 16'b1010101010101010;
		#(RATE)
		if (out != 16'b0101010101010101) $display("#3 ng");

		#(RATE)
		in <= 16'b0011110011000011;
		#(RATE)
		if (out != 16'b1100001100111100) $display("#4 ng");

		#(RATE)
		in <= 16'b0001001000110100;
		#(RATE)
		if (out != 16'b1110110111001011) $display("#5 ng");

		#99999
		$display("end test");
		$stop;
	end

endmodule
