// Bit
module Bit(
	input clk,			// clk
	input in,			// in値
	input load,			// load
	output out);		// out

	reg val;

	always @(posedge clk) begin
		if(load == 1'b1) begin
			val <= in;
		end
	end

	assign out = val;

endmodule
