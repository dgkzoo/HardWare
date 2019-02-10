/**
 * # VGAドライバ
 *
 * ## author
 * dgkzoo
 */
`default_nettype none
module Vga(
    input wire clk,
    input wire[15:0] vram_write_addr,   // VRAMアドレス
    input wire[15:0] vram_write_data,   // VRAM書き込みデータ
    input wire vram_write_en,           // VRAM書き込みEnable
    output wire[3:0] vga_r,             // R
    output wire[3:0] vga_g,             // G
    output wire[3:0] vga_b,             // B
    output wire vga_h_sync,             // 水平同期信号
    output wire vga_v_sync              // 垂直同期信号
);
    reg[9:0] hs_cnt = 10'd0;
    reg[9:0] vs_cnt = 10'd0;
    reg vga_clk, v_sync, h_sync, h_disp, v_disp;

    // vga clock
    always @(posedge clk) begin
        vga_clk <= ~vga_clk;
    end

    // 水平同期のカウンタ
    always @(posedge vga_clk) begin
        if(hs_cnt == 10'd799) begin
            hs_cnt <= 10'd0;
        end else begin
            hs_cnt <= hs_cnt + 9'd1;
        end
    end

    // 水平同期信号
    always @(posedge vga_clk) begin
        if(hs_cnt == 10'd0) begin
            h_sync <= 1'b0;
        end else if(hs_cnt == 10'd96) begin
            h_sync <= 1'b1;
        end
    end

    // RGB出力期間（水平側）
    always @(posedge vga_clk) begin
        if(hs_cnt == 10'd144) begin
            h_disp <= 1'b1;
//        end else if(hs_cnt == 10'd784) begin
        end else if(hs_cnt == 10'd784 - (10'd640 - 10'd512)) begin
            h_disp <= 1'b0;
        end
    end

    // 垂直同期カウンタ
    always @(posedge h_sync) begin
        if(vs_cnt == 10'd520) begin
            vs_cnt <= 10'd0;
        end else begin
            vs_cnt <= vs_cnt + 10'd1;
        end
    end

    // 垂直同期信号
    always @(posedge h_sync) begin
        if(vs_cnt == 10'd0) begin
            v_sync <= 1'b0;
        end else if(vs_cnt == 10'd2) begin
            v_sync <= 1'b1;
        end
    end

    // RGB出力期間（垂直側）
    always @(posedge h_sync) begin
        if(vs_cnt == 10'd31) begin
            v_disp <= 1'b1;
        end else if(hs_cnt == 10'd511) begin
//        else if(hs_cnt == 10'd511 - (10'd520 - 10'd256))
            v_disp <= 1'b0;
        end
    end

    // VGA X,Y
    wire[16:0] vram_read_addr;
    wire[16:0] vga_x, vga_y;
    assign vga_x = hs_cnt > 10'd144 ? {7'd0, hs_cnt - 10'd144} : 17'd0;
    assign vga_y = vs_cnt > 10'd31 ? {7'd0, vs_cnt - 10'd31} : 17'd0;
    assign vram_read_addr = vga_y * 17'd512 + vga_x;

    // VRAM
//    wire [15:0] px;
    wire px;
    VRAM VRAM_inst(
        .clock(clk),
        // write
        .address_a({1'b0, vram_write_addr}),
        .data_a(vram_write_data[2:0]),
        .wren_a(vram_write_en),
        // read
        .address_b(vram_read_addr),
        .wren_b(1'b0),
        .q_b(px)
    );

    // output signal
    assign vga_h_sync = h_sync;
    assign vga_v_sync = v_sync;

    wire[15:0] px16 = px ? 16'hFFFF : 16'h0000;
    wire[15:0] test = ((hs_cnt - 10'd144) % 10'd100 == 0 || (vs_cnt - 10'd12) % 10'd100 == 0) ? 16'h3333 | px16
                         : ((hs_cnt - 10'd144) % 10 == 0 || (vs_cnt - 10'd12) % 10 == 0) ? 16'h1111 | px16 : px16;

    // assign vga_r = (h_disp && v_disp && px) ? 4'hF : 4'h0;
    // assign vga_g = (h_disp && v_disp && px) ? 4'hF : 4'h0;
    // assign vga_b = (h_disp && v_disp && px) ? 4'hF : 4'h0;
    assign vga_r = (h_disp && v_disp) ? test[11:8] : 4'h0;
    assign vga_g = (h_disp && v_disp) ? test[7:4] : 4'h0;
    assign vga_b = (h_disp && v_disp) ? test[3:0] : 4'h0;

endmodule
