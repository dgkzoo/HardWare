/**
 * # Bit
 *
 * ## author
 * dgkzoo
 */
`default_nettype none
module Bit(
	input wire clk,			// clk
	input wire in,			// in値
	input wire load,			// load
	output wire out);		// out

	reg val;

	always @(posedge clk) begin
		if(load == 1'b1) begin
			val <= in;
		end
	end

	assign out = val;

endmodule
