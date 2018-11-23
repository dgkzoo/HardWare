/**
 * # Nand
 * ## function
 * | a b | Nand(a, b) |
 * |:---:|:----------:|
 * | 0 0 | 1          |
 * | 0 1 | 1          |
 * | 1 0 | 1          |
 * | 1 1 | 0          |
 *
 * ## author
 * k-daigo
 */
`default_nettype none
module Nand(
	input wire a,
	input wire b,
	output wire out);

	assign out = ~(a & b);
endmodule
