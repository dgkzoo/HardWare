// テストベンチ
// DMux8Way
module DMux8Way_tb();
	reg clk;
	reg in;
	reg[2:0] sel;
	reg a,b,c,d,e,f,g,h;

	parameter RATE = 1;

	always #1 clk = !clk;

	DMux8Way dmux8way(
		.in(in),
		.sel(sel),
		.a(a),
		.b(b),
		.c(c),
		.d(d),
		.e(e),
		.f(f),
		.g(g),
		.h(h)
	);

	initial begin
		$display("start test");
		clk <= 1;

		#(RATE)
		in <= 1'b0; sel <= 3'b000;
		#(RATE)
		if (a != 1'b0 && b != 1'b0 && c != 1'b0 && d != 1'b0
		 && e != 1'b0 && f != 1'b0 && g != 1'b0 && h != 1'b0) $display("#1 ng");

		#(RATE)
		in <= 1'b0; sel <= 3'b001;
		#(RATE)
		if (a != 1'b0 && b != 1'b0 && c != 1'b0 && d != 1'b0
		 && e != 1'b0 && f != 1'b0 && g != 1'b0 && h != 1'b0) $display("#1 ng");

		#(RATE)
		in <= 1'b0; sel <= 3'b010;
		#(RATE)
		if (a != 1'b0 && b != 1'b0 && c != 1'b0 && d != 1'b0
		 && e != 1'b0 && f != 1'b0 && g != 1'b0 && h != 1'b0) $display("#1 ng");

		#(RATE)
		in <= 1'b0; sel <= 3'b011;
		#(RATE)
		if (a != 1'b0 && b != 1'b0 && c != 1'b0 && d != 1'b0
		 && e != 1'b0 && f != 1'b0 && g != 1'b0 && h != 1'b0) $display("#1 ng");

		#(RATE)
		in <= 1'b0; sel <= 3'b100;
		#(RATE)
		if (a != 1'b0 && b != 1'b0 && c != 1'b0 && d != 1'b0
		 && e != 1'b0 && f != 1'b0 && g != 1'b0 && h != 1'b0) $display("#1 ng");

		#(RATE)
		in <= 1'b0; sel <= 3'b101;
		#(RATE)
		if (a != 1'b0 && b != 1'b0 && c != 1'b0 && d != 1'b0
		 && e != 1'b0 && f != 1'b0 && g != 1'b0 && h != 1'b0) $display("#1 ng");

		#(RATE)
		in <= 1'b0; sel <= 3'b110;
		#(RATE)
		if (a != 1'b0 && b != 1'b0 && c != 1'b0 && d != 1'b0
		 && e != 1'b0 && f != 1'b0 && g != 1'b0 && h != 1'b0) $display("#1 ng");

		#(RATE)
		in <= 1'b0; sel <= 3'b111;
		#(RATE)
		if (a != 1'b0 && b != 1'b0 && c != 1'b0 && d != 1'b0
		 && e != 1'b0 && f != 1'b0 && g != 1'b0 && h != 1'b0) $display("#1 ng");

		#(RATE)
		in <= 1'b1; sel <= 3'b000;
		#(RATE)
		if (a != 1'b1 && b != 1'b0 && c != 1'b0 && d != 1'b0
		 && e != 1'b0 && f != 1'b0 && g != 1'b0 && h != 1'b0) $display("#1 ng");

		#(RATE)
		in <= 1'b1; sel <= 3'b001;
		#(RATE)
		if (a != 1'b0 && b != 1'b1 && c != 1'b0 && d != 1'b0
		 && e != 1'b0 && f != 1'b0 && g != 1'b0 && h != 1'b0) $display("#1 ng");

		#(RATE)
		in <= 1'b1; sel <= 3'b010;
		#(RATE)
		if (a != 1'b0 && b != 1'b0 && c != 1'b1 && d != 1'b0
		 && e != 1'b0 && f != 1'b0 && g != 1'b0 && h != 1'b0) $display("#1 ng");

		#(RATE)
		in <= 1'b1; sel <= 3'b011;
		#(RATE)
		if (a != 1'b0 && b != 1'b0 && c != 1'b0 && d != 1'b1
		 && e != 1'b0 && f != 1'b0 && g != 1'b0 && h != 1'b0) $display("#1 ng");

		#(RATE)
		in <= 1'b1; sel <= 3'b100;
		#(RATE)
		if (a != 1'b0 && b != 1'b0 && c != 1'b0 && d != 1'b0
		 && e != 1'b1 && f != 1'b0 && g != 1'b0 && h != 1'b0) $display("#1 ng");

		#(RATE)
		in <= 1'b1; sel <= 3'b101;
		#(RATE)
		if (a != 1'b0 && b != 1'b0 && c != 1'b0 && d != 1'b0
		 && e != 1'b0 && f != 1'b1 && g != 1'b0 && h != 1'b0) $display("#1 ng");

		#(RATE)
		in <= 1'b1; sel <= 3'b110;
		#(RATE)
		if (a != 1'b0 && b != 1'b0 && c != 1'b0 && d != 1'b0
		 && e != 1'b0 && f != 1'b0 && g != 1'b1 && h != 1'b0) $display("#1 ng");

		#(RATE)
		in <= 1'b1; sel <= 3'b111;
		#(RATE)
		if (a != 1'b0 && b != 1'b0 && c != 1'b0 && d != 1'b0
		 && e != 1'b0 && f != 1'b0 && g != 1'b0 && h != 1'b1) $display("#1 ng");

		#99999
		$display("success!");
		$stop;
	end

endmodule
