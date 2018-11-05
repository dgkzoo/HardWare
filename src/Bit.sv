// Bit
module Bit(
	input clk,			// clk
	input in,			// in値
	input load,			// load?
	output out);		// out

	reg val;

	always @(posedge clk) begin
		if(load == 1'b1) begin
			val <= in;
		end
	end
	// Mux mux(
	// 	.a(val),
	// 	.b(in),
	// 	.sel(load),
	// 	.out(val));

	// assign out = val;
	assign out = val;
	

endmodule
