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

	wire [15:0] work_x1, work_x2;
	wire [15:0] work_y1, work_y2;
	wire [15:0] work_out1, work_add16;

	Add16 add16(
		.a(work_x2),
		.b(work_y2),
		.out(work_add16));

	assign work_x1 = zx ? 1'b0 : x;
	assign work_x2 = nx ? ~work_x1 : work_x1;
	assign work_y1 = zy ? 1'b0 : y;
	assign work_y2 = ny ? ~work_y1 : work_y1;
	assign work_out1 = f ? work_add16 : work_x2 & work_y2;

	assign out = no ? ~work_out1 : work_out1;
	assign zr = (out == 0) ? 1'b1 : 1'b0;
	assign ng = (out[15] == 1'b1) ? 1'b1 : 1'b0;

endmodule
