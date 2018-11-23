/**
 * # Not
 *
 * ## author
 * k-daigo
 */
module Not(
	input in,
	output out);

	wire nandOut;
	Nand nand1(.a(1), .b(in), .out(nandOut));
	assign out = ~nandOut;
endmodule
