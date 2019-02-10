/**
 * # ハードウェア
 * Qualtus// トップレベルモジュール
 * 
 * ## author
 * dgkzoo
 */
module HardWare(
	input wire clk,
	input wire[2:0] btn,
	input wire[9:0] sw,
	output wire[9:0] led,
	output wire[7:0] hled0,
	output wire[7:0] hled1,
	output wire[7:0] hled2,
	output wire[7:0] hled3,
	output wire[3:0] vga_r,	// VGA R
	output wire[3:0] vga_g,	// VGA G
	output wire[3:0] vga_b,	// VGA B
	output wire vga_hs,		// VGA horizontal signal
	output wire vga_vs		// VGA vertical signal
);
	wire[14:0] debug_pc;
	wire[15:0] debug_inst, outM, addressM;
	wire writeM;

	// コンピュータ本体
	Computer computer(
		.clk(clk),
		.reset(0),
		// 以下、デバッグ用の配線
		.debug_pc(debug_pc),
		.debug_inst(debug_inst),
		.addressM(addressM),
		.outM(outM),
		.writeM(writeM)
	);

	wire[15:0] vram_addr = {1'b0, addressM - 15'd16384};
	Vga vga(
		.clk(clk),
		.vram_write_addr(vram_addr),
		.vram_write_data(vram_write_data),
		.vram_write_en(vram_write_en),
		.vga_r(vga_r),
		.vga_g(vga_g),
		.vga_b(vga_b),
		.vga_h_sync(vga_hs),
		.vga_v_sync(vga_vs)
	);

	// Screen領域のメモリ書き込みを出力
	wire[15:0] vram_write_data;
	wire[1:0] vram_write_en;
	reg[15:0] count = 0;
	always @(posedge clk) begin

		// VRAM書き込み
		if(writeM == 1'b1 && 16'd16384 <= addressM && addressM < 16'd323584) begin
//		if(writeM && 16'd16384 <= addressM && addressM < 16'd24576) begin
			vram_write_data <= outM;
			vram_write_en <= 1'b1;
		end else begin
			vram_write_en <= 1'b0;
		end

		// メモリ書き込みがHighの場合にoutM値をcountに保持
		if (writeM == 1'b1) begin
			count <= outM;
		end
	end

	// DE0の7セグLEDへCPUからのoutMを出力する
	HexSegDec hsd0(count[3:0], hled0);
	HexSegDec hsd1(count[7:4], hled1);
	HexSegDec hsd2(count[11:8], hled2);
	HexSegDec hsd3(count[15:12], hled3);

	assign led = 0;
endmodule
