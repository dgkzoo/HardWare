/**
 * # Not
 *
 * ## author
 * dgkzoo
 */
`default_nettype none
module Not(
	input wire in,
	output wire out);

	_Nand nand1(
		.a(1'b1),
		.b(in),
		.out(out));
endmodule
