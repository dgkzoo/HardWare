/**
 * # Or
 *
 * ## author
 * k-daigo
 */
 `default_nettype none
module Or(
	input wire a,
	input wire b,
	output wire out);

	wire not1Out, not2Out, andOut;

	Not not1(.in(a), .out(not1Out));
	Not not2(.in(b), .out(not2Out));
	And and1(.a(~not1Out), .b(~not2Out), .out(andOut));
	assign out = ~andOut;
endmodule
