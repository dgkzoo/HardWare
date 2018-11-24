/**
 * # Or
 *
 * ## author
 * dgkzoo
 */
`default_nettype none
module _Or(
	input wire a,
	input wire b,
	output wire out);

	wire not1Out, not2Out, andOut;

	_Not not1(.in(a), .out(not1Out));
	_Not not2(.in(b), .out(not2Out));
	_And and1(.a(not1Out), .b(not2Out), .out(andOut));
	_Not not3(.in(andOut), .out(out));
endmodule
