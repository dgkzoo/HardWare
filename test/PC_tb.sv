`timescale 1ns/1ns

// テストベンチ
// PC
module PC_tb();
	reg clk = 0;
	reg[15:0] in;
	reg inc = 0;
	reg load = 0;
	reg reset = 0;
	wire[15:0] out;

	parameter RATE = 2;

	always #(RATE/2) clk = ~clk;	// Clock Generation

	PC pc(
		.clk(clk),
		.in(in),
		.inc(inc),
		.load(load),
		.reset(reset),
		.out(out)
	);

	initial begin
		$display("start test");
		
		in <= 16'd0;
		reset <= 0;
		load <= 0;
		inc <= 0;
		
		#(RATE)
		if (out != 16'd0 ) $display("#1001 ng");
		
		in <= 16'd0;
		reset <= 0;
		load <= 0;
		inc <= 1;
		
		#(RATE)
		if (out != 16'd1 ) $display("#1003 ng");
		
		in <= -16'd32123;
		reset <= 0;
		load <= 0;
		inc <= 1;
		
		#(RATE)
		if (out != 16'd2 ) $display("#1005 ng");
		
		in <= -16'd32123;
		reset <= 0;
		load <= 1;
		inc <= 1;
		
		#(RATE)
		if (out !=-16'd32123 ) $display("#1007 ng");
		
		in <= -16'd32123;
		reset <= 0;
		load <= 0;
		inc <= 1;
		
		#(RATE)
		if (out !=-16'd32122 ) $display("#1009 ng");
		
		in <= -16'd32123;
		reset <= 0;
		load <= 0;
		inc <= 1;
		
		#(RATE)
		if (out !=-16'd32121 ) $display("#1011 ng");
		
		in <=  16'd12345;
		reset <= 0;
		load <= 1;
		inc <= 0;
		
		#(RATE)
		if (out != 16'd12345 ) $display("#1013 ng");
		
		in <=  16'd12345;
		reset <= 1;
		load <= 1;
		inc <= 0;
		
		#(RATE)
		if (out != 16'd0 ) $display("#1015 ng");
		
		in <=  16'd12345;
		reset <= 0;
		load <= 1;
		inc <= 1;
		
		#(RATE)
		if (out != 16'd12345 ) $display("#1017 ng");
		
		in <=  16'd12345;
		reset <= 1;
		load <= 1;
		inc <= 1;
		
		#(RATE)
		if (out != 16'd0 ) $display("#1019 ng");
		
		in <=  16'd12345;
		reset <= 0;
		load <= 0;
		inc <= 1;
		
		#(RATE)
		if (out != 16'd1 ) $display("#1021 ng");
		
		in <=  16'd12345;
		reset <= 1;
		load <= 0;
		inc <= 1;
		
		#(RATE)
		if (out != 16'd0 ) $display("#1023 ng");
		
		in <= 16'd0;
		reset <= 0;
		load <= 1;
		inc <= 1;
		
		#(RATE)
		if (out != 16'd0 ) $display("#1025 ng");
		
		in <= 16'd0;
		reset <= 0;
		load <= 0;
		inc <= 1;
		
		#(RATE)
		if (out != 16'd1 ) $display("#1027 ng");
		
		in <=  16'd22222;
		reset <= 1;
		load <= 0;
		inc <= 0;
		
		#(RATE)
		if (out != 0 ) $display("#1029 ng");

		#99999
		$display("success!");
		$stop;
	end

endmodule
