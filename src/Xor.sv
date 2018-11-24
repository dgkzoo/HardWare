/**
 * # Xor
 *
 * ## author
 * dgkzoo
 */
`default_nettype none
module _Xor(
	input wire a,
	input wire b,
	output wire out);

	wire notA, notB, andnAB, andAnB, andOut;

	_Not not1(.in(a), .out(notA));
	_Not not2(.in(b), .out(notB));
	_And and1(.a(notA), .b(b), .out(andnAB));
	_And and2(.a(a), .b(notB), .out(andAnB));
	_Or or1(.a(andnAB), .b(andAnB), .out(out));
endmodule
