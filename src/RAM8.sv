// RAM8
`default_nettype none
module RAM8(
	input wire clk,				// clk
	input wire[15:0] in,		// in値
	input wire[15:0] address,	// アドレス
	input wire load,			// write enable
	output wire[15:0] out);		// out

	reg[15:0] RAM[4096-1:0];

	initial begin
		integer ii;
		for(ii = 0; ii < 4096; ii = ii + 1) begin
			RAM[ii] <= 16'd0;
		end
	end

	always @(posedge clk) begin
		if(load == 1'b1) begin
			RAM[address] <= in;
		end
	end

	assign out = RAM[address];

endmodule
