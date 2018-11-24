/**
 * # Xor
 *
 * ## author
 * dgkzoo
 */
`default_nettype none
module Xor(
	input wire a,
	input wire b,
	output wire out);

	wire notA, notB, andnAB, andAnB, andOut;

	Not not1(.in(a), .out(notA));
	Not not2(.in(b), .out(notB));
	_And and1(.a(notA), .b(b), .out(andnAB));
	_And and2(.a(a), .b(notB), .out(andAnB));
	_Or or1(.a(andnAB), .b(andAnB), .out(out));
endmodule
