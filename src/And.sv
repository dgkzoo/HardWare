/**
 * # And
 *
 * ## author
 * k-daigo
 */
module And(
	input a,
	input b,
	output out);

	wire nandOut;
	Nand nand1(.a(a), .b(b), .out(nandOut));
	assign out = ~nandOut;
endmodule
