// RAM512
`default_nettype none
module RAM512(
	input wire clk,				// clk
	input wire[15:0] in,		// in値
	input wire load,			// write enable
	input wire[9:0] address,	// アドレス
	output wire[15:0] out);		// out

	// アドレスをセレクタとして、load値をload0～7に振り分ける
	wire load0,load1,load2,load3,load4,load5,load6,load7;
	DMux8Way dmux8(
		.in(load),
		.sel(address[8:6]),
		.a(load0), .b(load1), .c(load2), .d(load3),
		.e(load4), .f(load5), .g(load6), .h(load7));

	// load0～7でRegister0～7をロード、またはリードする
	wire[15:0] out0,out1,out2,out3,out4,out5,out6,out7;
	RAM64 ram0(.clk(clk), .in(in), .load(load0), .address(address[5:0]), .out(out0));
	RAM64 ram1(.clk(clk), .in(in), .load(load1), .address(address[5:0]), .out(out1));
	RAM64 ram2(.clk(clk), .in(in), .load(load2), .address(address[5:0]), .out(out2));
	RAM64 ram3(.clk(clk), .in(in), .load(load3), .address(address[5:0]), .out(out3));
	RAM64 ram4(.clk(clk), .in(in), .load(load4), .address(address[5:0]), .out(out4));
	RAM64 ram5(.clk(clk), .in(in), .load(load5), .address(address[5:0]), .out(out5));
	RAM64 ram6(.clk(clk), .in(in), .load(load6), .address(address[5:0]), .out(out6));
	RAM64 ram7(.clk(clk), .in(in), .load(load7), .address(address[5:0]), .out(out7));

	// ロード、またはリードしたout0～7をアドレスをセレクタにしてoutに出力する
	Mux8Way16 mux8(
		.a(out0), .b(out1), .c(out2), .d(out3),
		.e(out4), .f(out5), .g(out6), .h(out7),
		.sel(address[8:6]),
		.out(out));

endmodule
