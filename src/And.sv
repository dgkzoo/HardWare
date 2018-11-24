/**
 * # And
 *
 * ## author
 * dgkzoo
 */
`default_nettype none
module _And(
	input wire a,
	input wire b,
	output wire out);

	wire nandOut;
	_Nand nand1(.a(a), .b(b), .out(nandOut));
	Not not1(.in(nandOut), .out(out));
endmodule
