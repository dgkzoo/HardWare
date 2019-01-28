/**
 * # VGAドライバ
 *
 * ## author
 * dgkzoo
 */
`default_nettype none
module Vga(
    input wire clk,
    input wire[15:0] vram_write_addr,
    input wire[15:0] vram_write_data,
    input wire vram_write_en,
    output wire[3:0] vga_r,
    output wire[3:0] vga_g,
    output wire[3:0] vga_b,
    output wire vga_hs,
    output wire vga_vs
);
    reg[9:0] hs_cnt = 10'd0;
    reg[9:0] vs_cnt = 10'd0;
    reg vga_clk, i_vs, i_hs, i_hdisp, i_vdisp;
    wire [2:0] rgb;

    // vga clock
    always @(posedge clk) begin
        vga_clk = ~vga_clk;
    end

    // hs_counter
    always @(posedge vga_clk) begin
        if(hs_cnt == 10'd799) begin
            hs_cnt = 10'd0;
        end else begin
            hs_cnt = hs_cnt + 9'd1;
        end
    end

    // h-sync
    always @(posedge vga_clk) begin
        if(hs_cnt == 10'd0)
            i_hs = 1'b0;
        else if(hs_cnt == 10'd96)
            i_hs = 1'b1;
    end

    // h-disp
    always @(posedge vga_clk) begin
        if(hs_cnt == 10'd144)
            i_hdisp = 1'b1;
        else if(hs_cnt == 10'd784)
            i_hdisp = 1'b0;
    end

    // vs_counter
    always @(posedge i_hs) begin
        if(vs_cnt == 10'd520)
            vs_cnt = 10'd0;
        else
            vs_cnt = vs_cnt + 9'd1;
    end

    // v-sync
    always @(posedge i_hs) begin
        if(vs_cnt == 10'd0)
            i_vs = 1'b0;
        else if(vs_cnt == 10'd2)
            i_vs = 1'b1;
    end

    // v-disp
    always @(posedge i_hs) begin
        if(vs_cnt == 10'd31)
            i_vdisp = 1'b1;
        else if(hs_cnt == 10'd511)
            i_vdisp = 1'b0;
    end

    // read position
    reg[15:0] pos;
    always @(posedge vga_clk) begin
        if(i_hdisp && i_vdisp)
            pos <= pos + 16'd1;
        if(pos == 16'd420000)
            pos <= 16'd0;
    end

    // VGA X,Y
    wire[9:0] vga_x, vga_y;
    wire[15:0] read_addr;
    assign vga_x = hs_cnt - 10'd144;
    assign vga_y = vs_cnt - 10'd32;
    assign read_addr = (vga_y * 10'd480) + vga_x;
    //assign read_addr = pos;

    // VRAM
    wire [15:0] px;
    VRAM VRAM_inst(
        .clock(clk),
        // write
        .address_a(vram_write_addr),
        .data_a(vram_write_data),
        .wren_a(vram_write_en),
        // read
        .address_b(read_addr),
        .wren_b(1'b0),
        .q_b(px)
    );

    // // RGB
    // assign rgb = (hs_cnt < 10'd224) ? 3'd0 :
    //             (hs_cnt < 10'd304) ? 3'd1 : 
    //             (hs_cnt < 10'd384) ? 3'd2 : 
    //             (hs_cnt < 10'd464) ? 3'd3 : 
    //             (hs_cnt < 10'd544) ? 3'd4 : 
    //             (hs_cnt < 10'd624) ? 3'd5 : 
    //             (hs_cnt < 10'd704) ? 3'd6 : 3'd7;

    // output signal
    assign vga_hs = i_hs;
    assign vga_vs = i_vs;
    // assign vga_r = (i_hdisp && i_vdisp && rgb[0]) ? 4'hf : 4'd0;
    // assign vga_g = (i_hdisp && i_vdisp && rgb[1]) ? 4'hf : 4'd0;
    // assign vga_b = (i_hdisp && i_vdisp && rgb[2]) ? 4'hf : 4'd0;
    assign vga_r = (i_hdisp && i_vdisp) ? px[3:0] : 4'd0;
    assign vga_g = (i_hdisp && i_vdisp) ? px[7:4] : 4'd0;
    assign vga_b = (i_hdisp && i_vdisp) ? px[11:8] : 4'd0;

endmodule
