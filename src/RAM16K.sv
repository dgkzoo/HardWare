/**
 * # RAM16K
 *
 * ## author
 * dgkzoo
 */
`default_nettype none
module RAM16K(
	input wire clk,				// clk
	input wire[15:0] in,		// in値
	input wire[14:0] address,	// アドレス
	input wire load,			// write enable
	output wire[15:0] out);		// out

	// アドレスをセレクタとして、load値をload0～3に振り分ける
	wire load0,load1,load2,load3;
	DMux4Way dmux4(
		.in(load),
		.sel(address[13:12]),
		.a(load0), .b(load1), .c(load2), .d(load3));

	// load0～3でRegister0～3をロード、またはリードする
	wire[15:0] out0,out1,out2,out3;
	RAM4K ram0(.clk(clk), .in(in), .load(load0), .address(address[11:0]), .out(out0));
	RAM4K ram1(.clk(clk), .in(in), .load(load1), .address(address[11:0]), .out(out1));
	RAM4K ram2(.clk(clk), .in(in), .load(load2), .address(address[11:0]), .out(out2));
	RAM4K ram3(.clk(clk), .in(in), .load(load3), .address(address[11:0]), .out(out3));

	// ロード、またはリードしたout0～3をアドレスをセレクタにしてoutに出力する
	Mux4Way16 mux8(
		.a(out0), .b(out1), .c(out2), .d(out3),
		.sel(address[13:12]),
		.out(out));

endmodule
