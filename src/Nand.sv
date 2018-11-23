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
module Nand(
	input a,
	input b,
	output out);

	assign out = ~(a & b);
endmodule
