/**
 * # RAM4K
 *
 * ## author
 * dgkzoo
 */
`default_nettype none
module RAM4K(
	input wire clk,				// clk
	input wire[15:0] in,		// in値
	input wire[11:0] address,	// アドレス
	input wire load,			// write enable
	output wire[15:0] out);		// out

	reg[15:0] RAM[4096-1:0];

	initial begin
		integer ii;
		for(ii = 0; ii < 4096; ii = ii + 1) begin
			RAM[ii] <= 16'd0;
		end
	end

	always @(posedge clk) begin
		if(load == 1'b1) begin
			RAM[address] <= in;
		end
	end

	assign out = RAM[address];

	// // アドレスをセレクタとして、load値をload0～7に振り分ける
	// wire load0,load1,load2,load3,load4,load5,load6,load7;
	// DMux8Way dmux8(
	// 	.in(load),
	// 	.sel(address[11:9]),
	// 	.a(load0), .b(load1), .c(load2), .d(load3),
	// 	.e(load4), .f(load5), .g(load6), .h(load7));

	// // load0～7でRegister0～7をロード、またはリードする
	// wire[15:0] out0,out1,out2,out3,out4,out5,out6,out7;
	// RAM512 ram0(.clk(clk), .in(in), .load(load0), .address(address[8:0]), .out(out0));
	// RAM512 ram1(.clk(clk), .in(in), .load(load1), .address(address[8:0]), .out(out1));
	// RAM512 ram2(.clk(clk), .in(in), .load(load2), .address(address[8:0]), .out(out2));
	// RAM512 ram3(.clk(clk), .in(in), .load(load3), .address(address[8:0]), .out(out3));
	// RAM512 ram4(.clk(clk), .in(in), .load(load4), .address(address[8:0]), .out(out4));
	// RAM512 ram5(.clk(clk), .in(in), .load(load5), .address(address[8:0]), .out(out5));
	// RAM512 ram6(.clk(clk), .in(in), .load(load6), .address(address[8:0]), .out(out6));
	// RAM512 ram7(.clk(clk), .in(in), .load(load7), .address(address[8:0]), .out(out7));

	// // ロード、またはリードしたout0～7をアドレスをセレクタにしてoutに出力する
	// Mux8Way16 mux8(
	// 	.a(out0), .b(out1), .c(out2), .d(out3),
	// 	.e(out4), .f(out5), .g(out6), .h(out7),
	// 	.sel(address[11:9]),
	// 	.out(out));

endmodule
