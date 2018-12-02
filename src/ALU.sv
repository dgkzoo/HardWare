/**
 * # ALU
 *
 * ## author
 * dgkzoo
 */
`default_nettype none
module ALU(
	input wire[15:0] x,		// 値x
	input wire[15:0] y,		// 値y
	input wire zx,			// 入力xをゼロにする
	input wire nx,			// 入力xを反転する
	input wire zy,			// 入力yをゼロにする
	input wire ny,			// 入力yを反転する
	input wire f,			// 関数コード（1：加算、0：And演算）
	input wire no,			// 出力outを反転する
	output wire[15:0] out,	// 結果
	output wire zr,			// out=0 の場合にtrue
	output wire ng);		// out<0 の場合にtrue

	// 入力xをゼロにする
	wire [15:0] zxX;
	assign zxX = zx ? 16'b0 : x;

	// 入力xを反転する
	wire[15:0] notZxX;
	Not16 not16x(.in(zxX), .out(notZxX));
	wire[15:0] nxX;
	assign nxX = nx ? notZxX : zxX;
	
	// 入力yをゼロにする
	wire [15:0] zyY;
	assign zyY = zy ? 1'b0 : y;

	// 入力yを反転する
	wire[15:0] notZyY;
	Not16 not16y(.in(zyY), .out(notZyY));
	wire[15:0] nyY;
	assign nyY = ny ? notZyY : zyY;

	// 関数コード（1：加算、0：And演算）
	// 1：加算　用
	wire [15:0] workAdd16;
	Add16 add16(
		.a(nxX),
		.b(nyY),
		.out(workAdd16));

	// 0：And演算 用
	wire[15:0] andXY;
	And16 and16(.a(nxX), .b(nyY), .out(andXY));

	// 関数実行
	wire[15:0] fOut;
	assign fOut = f ? workAdd16 : andXY;

	// 出力outを反転する
	wire[15:0] fNotOut;
	Not16 not16forOut(.in(fOut), .out(fNotOut));
	assign out = no ? fNotOut : fOut;

	// out=0 の場合にtrue
	assign zr = (out == 16'd0) ? 1'b1 : 1'b0;

	// out<0 の場合にtrue
	assign ng = (out[15] == 1'b1) ? 1'b1 : 1'b0;
endmodule
