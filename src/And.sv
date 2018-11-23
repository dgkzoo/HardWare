/**
 * # And
 *
 * ## author
 * k-daigo
 */
`default_nettype none
module And(
	input wire a,
	input wire b,
	output wire out);

	wire nandOut;
	Nand nand1(.a(a), .b(b), .out(nandOut));
	assign out = ~nandOut;
endmodule
