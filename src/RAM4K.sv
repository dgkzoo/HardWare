// RAM4K
module RAM4K(
	input clk,				// clk
	input[15:0] in,			// in値
	input[15:0] address,	// アドレス
	input load,				// write enable
	output[15:0] out);		// out

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
