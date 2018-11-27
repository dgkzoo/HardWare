// 16ビットカウンタ
`default_nettype none
module PC(
	input wire clk,				// clk
	input wire[15:0] in,		// in値
	input wire inc,				// incliment flg
	input wire load,			// write enable flg
	input wire reset,			// reset flg
	output wire[15:0] out);		// out

	// インクリメント	
	wire[15:0] regOut, incOut;
	Inc16 inc16(.a(regOut), .out(incOut));

	// inc値により、Register値かインクリメント値かをregOrIncOutに配線
	wire[15:0] regOrIncOut;
	Mux16 mux1(.a(regOut), .b(incOut), .sel(inc), .out(regOrIncOut));

	// load値により、Reg/Inc値かin値をloadOutに配線
	wire[15:0] loadOut;
	Mux16 mux2(.a(regOrIncOut), .b(in), .sel(load), .out(loadOut));

	// reset値により、loadOutか0かをtoRegに配線
	// toRegはInc16にフィードバックされる
	wire[15:0] toReg;
	Mux16 mux3(.a(loadOut), .b(16'b0), .sel(reset), .out(toReg));

	Register reg1(.clk(clk), .in(toReg), .load(1'b1), .out(out));
	assign regOut = out;

endmodule
