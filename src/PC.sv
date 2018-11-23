// 16ビットカウンタ
`default_nettype none
module PC(
	input wire clk,				// clk
	input wire[15:0] in,			// in値
	input wire inc,				// incliment flg
	input wire load,				// write enable flg
	input wire reset,			// reset flg
	output wire[15:0] out);		// out

	reg[15:0] counter = 0;

	always @(posedge clk) begin
		if(reset == 1'b1) begin
			counter <= 16'd0;

		end else if(load == 1'b1) begin
			counter <= in;

		end else if(inc == 1'b1) begin
			counter <= counter + 16'd1;
		end
	end

	assign out = counter;
endmodule
