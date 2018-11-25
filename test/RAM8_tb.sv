`timescale 1ns/1ns

// テストベンチ
// RAM8
module RAM8_tb();
	reg clk = 0;
	reg[15:0] in;
	reg load;
	reg[2:0] address;
	reg[15:0] out;

	parameter RATE = 2;

	always #1 clk = ~clk;	// Clock Generation

	RAM8 ram8(
		.clk(clk),
		.in(in),
		.load(load),
		.address(address),
		.out(out)
	);

	initial begin
		$display("start test");

		// clear
		#(RATE) in <= 16'd0; load <= 1'b1; address <= 3'd0;
		#(RATE) in <= 16'd0; load <= 1'b1; address <= 3'd1;
		#(RATE) in <= 16'd0; load <= 1'b1; address <= 3'd2;
		#(RATE) in <= 16'd0; load <= 1'b1; address <= 3'd3;
		#(RATE) in <= 16'd0; load <= 1'b1; address <= 3'd4;
		#(RATE) in <= 16'd0; load <= 1'b1; address <= 3'd5;
		#(RATE) in <= 16'd0; load <= 1'b1; address <= 3'd6;

		// test
		#(RATE)
		in <= 16'd0; load <= 1'b0; address <= 3'd0;
		#(RATE)
		if (out != 16'd0) $display("#1 ng");

		#(RATE)
		in <= 16'd0; load <= 1'b0; address <= 3'd0;
		#(RATE)
		if (out != 16'd0) $display("#2 ng");
		
		#(RATE)
		in <= 16'd0; load <= 1'b1; address <= 3'd0;
//		#(RATE)
//		if (out != 16'd0) $display("#3 ng");
		
		#(RATE)
		in <= 16'd0; load <= 1'b1; address <= 3'd0;
//		#(RATE)
//		if (out != 16'd0) $display("#4 ng");
		
		#(RATE)
		in <= 16'd11111; load <= 1'b0; address <= 3'd0;
		#(RATE)
		if (out != 16'd0) $display("#5 ng");
		
		#(RATE)
		in <= 16'd11111; load <= 1'b0; address <= 3'd0;
		#(RATE)
		if (out != 16'd0) $display("#6 ng");
		
		#(RATE)
		in <= 16'd11111; load <= 1'b1; address <= 3'd1;
//		#(RATE)
//		if (out != 16'd0) $display("#7 ng");
		
		#(RATE)
		in <= 16'd11111; load <= 1'b1; address <= 3'd1;
//		#(RATE)
//		if (out != 16'd11111) $display("#7-2 ng");
		
		#(RATE)
		in <= 16'd11111; load <= 1'b0; address <= 3'd0;
		#(RATE)
		if (out != 16'd0) $display("#8 ng");
		
		#(RATE)
		in <= 16'd11111; load <= 1'b0; address <= 3'd0;
		#(RATE)
		if (out != 16'd0) $display("#9 ng");
		
		#(RATE)
		in <= 16'd3333; load <= 1'b0; address <= 3'd3;
		#(RATE)
		if (out != 16'd0) $display("#10 ng");
		
		#(RATE)
		in <= 16'd3333; load <= 1'b0; address <= 3'd3;
		#(RATE)
		if (out != 16'd0) $display("#11ng");
		
		#(RATE)
		in <= 16'd3333; load <= 1'b1; address <= 3'd3;
//		#(RATE)
//		if (out != 16'd0) $display("#12ng");
		
		#(RATE)
		in <= 16'd3333; load <= 1'b1; address <= 3'd3;
//		#(RATE)
//		if (out != 16'd3333) $display("#13ng");
		
		#(RATE)
		in <= 16'd3333; load <= 1'b0; address <= 3'd3;
		#(RATE)
		if (out != 16'd3333) $display("#14ng");
		
		#(RATE)
		in <= 16'd3333; load <= 1'b0; address <= 3'd3;
		#(RATE)
		if (out != 16'd3333) $display("#15ng");
		
		#(RATE)
		in <= 16'd3333; load <= 1'b0; address <= 3'd1;
		#(RATE)
		if (out != 16'd11111) $display("#16ng");
		
		#(RATE)
		in <= 16'd7777; load <= 1'b0; address <= 3'd1;
		#(RATE)
		if (out != 16'd11111) $display("#17ng");
		
		#(RATE)
		in <= 16'd7777; load <= 1'b0; address <= 3'd1;
		#(RATE)
		if (out != 16'd11111) $display("#18ng");
		
		#(RATE)
		in <= 16'd7777; load <= 1'b1; address <= 3'd7;
//		#(RATE)
//		if (out != 16'd0) $display("#19ng");
		
		#(RATE)
		in <= 16'd7777; load <= 1'b1; address <= 3'd7;
//		#(RATE)
//		if (out != 16'd7777) $display("#20ng");
		
		#(RATE)
		in <= 16'd7777; load <= 1'b0; address <= 3'd7;
		#(RATE)
		if (out != 16'd7777) $display("#21ng");
		
		#(RATE)
		in <= 16'd7777; load <= 1'b0; address <= 3'd7;
		#(RATE)
		if (out != 16'd7777) $display("#22ng");
		
		#(RATE)
		in <= 16'd7777; load <= 1'b0; address <= 3'd3;
		#(RATE)
		if (out != 16'd3333) $display("#23ng");
		
		#(RATE)
		in <= 16'd7777; load <= 1'b0; address <= 3'd7;
		#(RATE)
		if (out != 16'd7777) $display("#24ng");
		
		#(RATE)
		in <= 16'd7777; load <= 1'b0; address <= 3'd0;
		#(RATE)
		if (out != 16'd0) $display("#25ng");
		
		#(RATE)
		in <= 16'd7777; load <= 1'b0; address <= 3'd0;
		#(RATE)
		if (out != 16'd0) $display("#26ng");
		
		#(RATE)
		in <= 16'd7777; load <= 1'b0; address <= 3'd1;
		#(RATE)
		if (out != 16'd11111) $display("#27ng");
		
		#(RATE)
		in <= 16'd7777; load <= 1'b0; address <= 3'd2;
		#(RATE)
		if (out != 16'd0) $display("#28ng");
		
		#(RATE)
		in <= 16'd7777; load <= 1'b0; address <= 3'd3;
		#(RATE)
		if (out != 16'd3333) $display("#29ng");
		
		#(RATE)
		in <= 16'd7777; load <= 1'b0; address <= 3'd4;
		#(RATE)
		if (out != 16'd0) $display("#30ng");
		
		#(RATE)
		in <= 16'd7777; load <= 1'b0; address <= 3'd5;
		#(RATE)
		if (out != 16'd0) $display("#31ng");
		
		#(RATE)
		in <= 16'd7777; load <= 1'b0; address <= 3'd6;
		#(RATE)
		if (out != 16'd0) $display("#32ng");
		
		#(RATE)
		in <= 16'd7777; load <= 1'b0; address <= 3'd7;
		#(RATE)
		if (out != 16'd7777) $display("#33ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd0;
//		#(RATE)
//		if (out != 16'd0) $display("#34ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd0;
//		#(RATE)
//		if (out != 16'd21845) $display("#35ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd1;
//		#(RATE)
//		if (out != 16'd11111) $display("#36ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd1;
//		#(RATE)
//		if (out != 16'd21845) $display("#37ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd2;
//		#(RATE)
//		if (out != 16'd0) $display("#38ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd2;
//		#(RATE)
//		if (out != 16'd21845) $display("#39ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd3;
//		#(RATE)
//		if (out != 16'd3333) $display("#40ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd3;
//		#(RATE)
//		if (out != 16'd21845) $display("#41ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd4;
//		#(RATE)
//		if (out != 16'd0) $display("#42ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd4;
//		#(RATE)
//		if (out != 16'd21845) $display("#43ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd5;
//		#(RATE)
//		if (out != 16'd0) $display("#44ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd5;
//		#(RATE)
//		if (out != 16'd21845) $display("#45ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd6;
//		#(RATE)
//		if (out != 16'd0) $display("#46ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd6;
//		#(RATE)
//		if (out != 16'd21845) $display("#47ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd7;
//		#(RATE)
//		if (out != 16'd7777) $display("#48ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd7;
//		#(RATE)
//		if (out != 16'd21845) $display("#48ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b0; address <= 3'd0;
		#(RATE)
		if (out != 16'd21845) $display("#49ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b0; address <= 3'd0;
		#(RATE)
		if (out != 16'd21845) $display("#50ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b0; address <= 3'd1;
		#(RATE)
		if (out != 16'd21845) $display("#51ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b0; address <= 3'd2;
		#(RATE)
		if (out != 16'd21845) $display("#52ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b0; address <= 3'd3;
		#(RATE)
		if (out != 16'd21845) $display("#53ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b0; address <= 3'd4;
		#(RATE)
		if (out != 16'd21845) $display("#54ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b0; address <= 3'd5;
		#(RATE)
		if (out != 16'd21845) $display("#55ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b0; address <= 3'd6;
		#(RATE)
		if (out != 16'd21845) $display("#56ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b0; address <= 3'd7;
		#(RATE)
		if (out != 16'd21845) $display("#57ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b1; address <= 3'd0;
//		#(RATE)
//		if (out != 16'd21845) $display("#58ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b1; address <= 3'd0;
//		#(RATE)
//		if (out != 16'd21846) $display("#59ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd0;
		#(RATE)
		if (out != 16'd21846) $display("#60ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd0;
		#(RATE)
		if (out != 16'd21846) $display("#61ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd1;
		#(RATE)
		if (out != 16'd21845) $display("#62ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd2;
		#(RATE)
		if (out != 16'd21845) $display("#63ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd3;
		#(RATE)
		if (out != 16'd21845) $display("#64ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd4;
		#(RATE)
		if (out != 16'd21845) $display("#65ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd5;
		#(RATE)
		if (out != 16'd21845) $display("#66ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd6;
		#(RATE)
		if (out != 16'd21845) $display("#67ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd7;
		#(RATE)
		if (out != 16'd21845) $display("#68ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd0;
//		#(RATE)
//		if (out != 16'd21846) $display("#69ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd0;
//		#(RATE)
//		if (out != 16'd21845) $display("#70ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b1; address <= 3'd1;
//		#(RATE)
//		if (out != 16'd21845) $display("#71ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b1; address <= 3'd1;
//		#(RATE)
//		if (out != 16'd21846) $display("#72ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd0;
		#(RATE)
		if (out != 16'd21845) $display("#73ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd0;
		#(RATE)
		if (out != 16'd21845) $display("#74ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd1;
		#(RATE)
		if (out != 16'd21846) $display("#75ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd2;
		#(RATE)
		if (out != 16'd21845) $display("#76ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd3;
		#(RATE)
		if (out != 16'd21845) $display("#77ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd4;
		#(RATE)
		if (out != 16'd21845) $display("#78ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd5;
		#(RATE)
		if (out != 16'd21845) $display("#79ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd6;
		#(RATE)
		if (out != 16'd21845) $display("#80ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd7;
		#(RATE)
		if (out != 16'd21845) $display("#81ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd1;
//		#(RATE)
//		if (out != 16'd21846) $display("#82ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd1;
//		#(RATE)
//		if (out != 16'd21845) $display("#83ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b1; address <= 3'd2;
//		#(RATE)
//		if (out != 16'd21845) $display("#84ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b1; address <= 3'd2;
//		#(RATE)
//		if (out != 16'd21846) $display("#85ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd0;
		#(RATE)
		if (out != 16'd21845) $display("#86ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd0;
		#(RATE)
		if (out != 16'd21845) $display("#87ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd1;
		#(RATE)
		if (out != 16'd21845) $display("#88ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd2;
		#(RATE)
		if (out != 16'd21846) $display("#89ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd3;
		#(RATE)
		if (out != 16'd21845) $display("#90ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd4;
		#(RATE)
		if (out != 16'd21845) $display("#91ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd5;
		#(RATE)
		if (out != 16'd21845) $display("#92ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd6;
		#(RATE)
		if (out != 16'd21845) $display("#93ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd7;
		#(RATE)
		if (out != 16'd21845) $display("#94ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd2;
//		#(RATE)
//		if (out != 16'd21846) $display("#95ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd2;
//		#(RATE)
//		if (out != 16'd21845) $display("#96ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b1; address <= 3'd3;
//		#(RATE)
//		if (out != 16'd21845) $display("#97ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b1; address <= 3'd3;
//		#(RATE)
//		if (out != 16'd21846) $display("#98ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd0;
		#(RATE)
		if (out != 16'd21845) $display("#99ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd0;
		#(RATE)
		if (out != 16'd21845) $display("#100ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd1;
		#(RATE)
		if (out != 16'd21845) $display("#101ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd2;
		#(RATE)
		if (out != 16'd21845) $display("#102ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd3;
		#(RATE)
		if (out != 16'd21846) $display("#103ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd4;
		#(RATE)
		if (out != 16'd21845) $display("#104ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd5;
		#(RATE)
		if (out != 16'd21845) $display("#105ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd6;
		#(RATE)
		if (out != 16'd21845) $display("#106ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd7;
		#(RATE)
		if (out != 16'd21845) $display("#107ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd3;
//		#(RATE)
//		if (out != 16'd21846) $display("#108ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd3;
//		#(RATE)
//		if (out != 16'd21845) $display("#109ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b1; address <= 3'd4;
//		#(RATE)
//		if (out != 16'd21845) $display("#110ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b1; address <= 3'd4;
//		#(RATE)
//		if (out != 16'd21846) $display("#111ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd0;
		#(RATE)
		if (out != 16'd21845) $display("#112ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd0;
		#(RATE)
		if (out != 16'd21845) $display("#113ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd1;
		#(RATE)
		if (out != 16'd21845) $display("#114ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd2;
		#(RATE)
		if (out != 16'd21845) $display("#115ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd3;
		#(RATE)
		if (out != 16'd21845) $display("#116ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd4;
		#(RATE)
		if (out != 16'd21846) $display("#117ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd5;
		#(RATE)
		if (out != 16'd21845) $display("#118ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd6;
		#(RATE)
		if (out != 16'd21845) $display("#119ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd7;
		#(RATE)
		if (out != 16'd21845) $display("#120ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd4;
//		#(RATE)
//		if (out != 16'd21846) $display("#121ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd4;
//		#(RATE)
//		if (out != 16'd21845) $display("#122ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b1; address <= 3'd5;
//		#(RATE)
//		if (out != 16'd21845) $display("#123ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b1; address <= 3'd5;
//		#(RATE)
//		if (out != 16'd21846) $display("#124ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd0;
		#(RATE)
		if (out != 16'd21845) $display("#125ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd0;
		#(RATE)
		if (out != 16'd21845) $display("#126ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd1;
		#(RATE)
		if (out != 16'd21845) $display("#127ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd2;
		#(RATE)
		if (out != 16'd21845) $display("#128ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd3;
		#(RATE)
		if (out != 16'd21845) $display("#129ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd4;
		#(RATE)
		if (out != 16'd21845) $display("#130ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd5;
		#(RATE)
		if (out != 16'd21846) $display("#131ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd6;
		#(RATE)
		if (out != 16'd21845) $display("#132ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd7;
		#(RATE)
		if (out != 16'd21845) $display("#133ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd5;
//		#(RATE)
//		if (out != 16'd21846) $display("#134ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd5;
//		#(RATE)
//		if (out != 16'd21845) $display("#135ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b1; address <= 3'd6;
//		#(RATE)
//		if (out != 16'd21845) $display("#136ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b1; address <= 3'd6;
//		#(RATE)
//		if (out != 16'd21846) $display("#137ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd0;
		#(RATE)
		if (out != 16'd21845) $display("#138ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd0;
		#(RATE)
		if (out != 16'd21845) $display("#139ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd1;
		#(RATE)
		if (out != 16'd21845) $display("#140ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd2;
		#(RATE)
		if (out != 16'd21845) $display("#141ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd3;
		#(RATE)
		if (out != 16'd21845) $display("#142ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd4;
		#(RATE)
		if (out != 16'd21845) $display("#143ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd5;
		#(RATE)
		if (out != 16'd21845) $display("#144ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd6;
		#(RATE)
		if (out != 16'd21846) $display("#145ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd7;
		#(RATE)
		if (out != 16'd21845) $display("#146ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd6;
//		#(RATE)
//		if (out != 16'd21846) $display("#147ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd6;
//		#(RATE)
//		if (out != 16'd21845) $display("#148ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b1; address <= 3'd7;
//		#(RATE)
//		if (out != 16'd21845) $display("#149ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b1; address <= 3'd7;
//		#(RATE)
//		if (out != 16'd21846) $display("#150ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd0;
		#(RATE)
		if (out != 16'd21845) $display("#151ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd0;
		#(RATE)
		if (out != 16'd21845) $display("#152ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd1;
		#(RATE)
		if (out != 16'd21845) $display("#153ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd2;
		#(RATE)
		if (out != 16'd21845) $display("#154ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd3;
		#(RATE)
		if (out != 16'd21845) $display("#155ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd4;
		#(RATE)
		if (out != 16'd21845) $display("#156ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd5;
		#(RATE)
		if (out != 16'd21845) $display("#157ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd6;
		#(RATE)
		if (out != 16'd21845) $display("#158ng");
		
		#(RATE)
		in <= -16'd21846; load <= 1'b0; address <= 3'd7;
		#(RATE)
		if (out != 16'd21846) $display("#159ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd7;
//		#(RATE)
//		if (out != 16'd21846) $display("#160ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b1; address <= 3'd7;
//		#(RATE)
//		if (out != 16'd21845) $display("#161ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b0; address <= 3'd0;
		#(RATE)
		if (out != 16'd21845) $display("#162ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b0; address <= 3'd0;
		#(RATE)
		if (out != 16'd21845) $display("#163ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b0; address <= 3'd1;
		#(RATE)
		if (out != 16'd21845) $display("#164ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b0; address <= 3'd2;
		#(RATE)
		if (out != 16'd21845) $display("#165ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b0; address <= 3'd3;
		#(RATE)
		if (out != 16'd21845) $display("#166ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b0; address <= 3'd4;
		#(RATE)
		if (out != 16'd21845) $display("#167ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b0; address <= 3'd5;
		#(RATE)
		if (out != 16'd21845) $display("#168ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b0; address <= 3'd6;
		#(RATE)
		if (out != 16'd21845) $display("#169ng");
		
		#(RATE)
		in <= 16'd21845; load <= 1'b0; address <= 3'd7;
		#(RATE)
		if (out != 16'd21845) $display("#170ng");

		#99999
		$display("success!");
		$stop;
	end

endmodule
