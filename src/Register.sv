// Register
module Register(
	input clk,			// clk
	input[15:0] in,		// in値
	input load,			// load?
	output[15:0] out);	// out

	reg[15:0] val;

	always @(posedge clk) begin
		if(load == 1'b1) begin
			val <= in;
		end
	end

	assign out = val;

endmodule
