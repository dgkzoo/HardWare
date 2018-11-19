// 16ビットカウンタ
module PC(
	input clk,				// clk
	input[15:0] in,			// in値
	input inc,				// incliment flg
	input load,				// write enable flg
	input reset,			// reset flg
	output[15:0] out);		// out

	reg[15:0] counter = 0;

	always @(posedge clk) begin
		if(reset == 1'b1) begin
			counter <= 16'd0;

		end else if(load == 1'b1) begin
			counter <= in;

		end else if(inc == 1'b1) begin
			counter <= counter + 1;
		end
	end

	assign out = counter;
endmodule
