// ALU
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
	output wire ng);			// out<0 の場合にtrue

	wire [15:0] workX1, workX2;
	wire [15:0] workY1, workY2;
	wire [15:0] workOut1, workAdd16;

	assign workX1 = zx ? 16'b0 : x;

	wire[15:0] notX1;
	Not16 not16forX2(.in(workX1), .out(notX1));
	assign workX2 = nx ? notX1 : workX1;
	
	assign workY1 = zy ? 1'b0 : y;

	wire[15:0] notY1;
	Not16 not16forY2(.in(workY1), .out(notY1));
	assign workY2 = ny ? notY1 : workY1;

	Add16 add16(
		.a(workX2),
		.b(workY2),
		.out(workAdd16));

	assign workOut1 = f ? workAdd16 : workX2 & workY2;

	assign out = no ? ~workOut1 : workOut1;
	assign zr = (out == 0) ? 1'b1 : 1'b0;
	assign ng = (out[15] == 1'b1) ? 1'b1 : 1'b0;

endmodule
