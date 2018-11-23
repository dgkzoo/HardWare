/**
 * # Not
 *
 * ## author
 * k-daigo
 */
module Not(
	input in,
	output out);

	assign out = in == 0 ? 1 : 0;
endmodule
