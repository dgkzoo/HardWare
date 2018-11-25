// テストベンチ
// DMux4Way
module DMux4Way_tb();
	reg clk;
	reg in;
	reg sel;
	reg a,b,c,d;

	parameter RATE = 2;

	always #1 clk = !clk;

	DMux4Way dmux4way(
		.in(in),
		.sel(sel),
		.a(a),
		.b(b),
		.c(c),
		.d(d)
	);

	initial begin
		$display("start test");
		clk <= 1;

		#(RATE)
		in <= 1'b0; sel <= 2'b00;
		#(RATE)
		if (a != 1'b0 && b != 1'b0 && c != 1'b0 && d != 1'b0) $display("#1 ng");

		#(RATE)
		in <= 1'b0; sel <= 2'b01;
		#(RATE)
		if (a != 1'b0 && b != 1'b0 && c != 1'b0 && d != 1'b0) $display("#1 ng");

		#(RATE)
		in <= 1'b0; sel <= 2'b10;
		#(RATE)
		if (a != 1'b0 && b != 1'b0 && c != 1'b0 && d != 1'b0) $display("#1 ng");

		#(RATE)
		in <= 1'b0; sel <= 2'b11;
		#(RATE)
		if (a != 1'b0 && b != 1'b0 && c != 1'b0 && d != 1'b0) $display("#1 ng");

		#(RATE)
		in <= 1'b1; sel <= 2'b00;
		#(RATE)
		if (a != 1'b1 && b != 1'b0 && c != 1'b0 && d != 1'b0) $display("#1 ng");

		#(RATE)
		in <= 1'b1; sel <= 2'b01;
		#(RATE)
		if (a != 1'b0 && b != 1'b1 && c != 1'b0 && d != 1'b0) $display("#1 ng");

		#(RATE)
		in <= 1'b1; sel <= 2'b10;
		#(RATE)
		if (a != 1'b0 && b != 1'b0 && c != 1'b1 && d != 1'b0) $display("#1 ng");

		#(RATE)
		in <= 1'b1; sel <= 2'b11;
		#(RATE)
		if (a != 1'b0 && b != 1'b0 && c != 1'b0 && d != 1'b1) $display("#1 ng");

		#99999
		$display("success!");
		$stop;
	end

endmodule
