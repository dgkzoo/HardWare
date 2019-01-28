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
	wire[14:0] debug_pc, addressM;
	wire[15:0] debug_inst, outM;
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

	wire vram_addr = addressM - 16'd16384;
	Vga vga(
		.clk(clk),
//		.vram_write_addr(addressM - 16'd16384),
		.vram_write_addr(test_adrress),
		.vram_write_data(vram_data),
		.vram_write_en(vram_write_en),
		.vga_r(vga_r),
		.vga_g(vga_g),
		.vga_b(vga_b),
		.vga_hs(vga_hs),
		.vga_vs(vga_vs)
	);

	reg[15:0] test_adrress;
    always @(posedge clk) begin
        if(test_adrress == 16'd307200)
            test_adrress <= 16'd0;
        else
            test_adrress <= test_adrress + 16'd1;
	    vram_data <= (test_adrress % 10'd640 <= 10'd80) ? 16'h0000 :
                (test_adrress % 10'd640  <= 10'd80*2) ? 16'h000F : 
                (test_adrress % 10'd640  <= 10'd80*3) ? 16'h00F0 : 
                (test_adrress % 10'd640  <= 10'd80*4) ? 16'h00FF : 
                (test_adrress % 10'd640  <= 10'd80*5) ? 16'h0F00 : 
                (test_adrress % 10'd640  <= 10'd80*6) ? 16'h0F0F : 
                (test_adrress % 10'd640  <= 10'd80*7) ? 16'h0FF0 : 16'h0FFF;
    end

	// Screen領域のメモリ書き込みを出力
	wire[15:0] vram_data;
	wire vram_write_en;
	// always @(posedge addressM) begin
	// 	if(writeM && 16'd16384 <= addressM && addressM < 16'd24575) begin
	// 		vram_data <= outM;
	// 		vram_write_en <= 1'b1;
	// 	end else begin
	// 		vram_write_en <= 1'b0;
	// 	end
	// end
	always @(posedge clk) begin
		if (writeM == 1'b1) begin
//			vram_data <= outM;
			vram_write_en <= 1'b1;
		end else begin
			vram_write_en <= 1'b1;
		end
	end

	// カウンタを動かすための実装
	reg[15:0] count = 0;
	always @(posedge clk) begin
		// メモリ書き込みがHighの場合にoutM値をcountに保持
		if (writeM == 1'b1) begin
			count <= outM;
			//vram_data <= outM;
		end
	end

	// DE0の7セグLEDへCPUからのoutMを出力する
	HexSegDec hsd0(count[3:0], hled0);
	HexSegDec hsd1(count[7:4], hled1);
	HexSegDec hsd2(count[11:8], hled2);
	HexSegDec hsd3(count[15:12], hled3);
	// HexSegDec hsd0(rdata[3:0], hled0);
	// HexSegDec hsd1(rdata[7:4], hled1);
	// HexSegDec hsd2(rdata[11:8], hled2);
	// HexSegDec hsd3(rdata[15:12], hled3);

	assign led = 0;
endmodule
