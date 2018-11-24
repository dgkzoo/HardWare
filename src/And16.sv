/**
 * # And16
 *
 * ## author
 * dgkzoo
 */
`default_nettype none
module And16(
	input wire[15:0] a,
	input wire[15:0] b,
	output wire[15:0] out);

	_And and0(.a(a[0]), .b(b[0]), .out(out[0]));
	_And and1(.a(a[1]), .b(b[1]), .out(out[1]));
	_And and2(.a(a[2]), .b(b[2]), .out(out[2]));
	_And and3(.a(a[3]), .b(b[3]), .out(out[3]));
	_And and4(.a(a[4]), .b(b[4]), .out(out[4]));
	_And and5(.a(a[5]), .b(b[5]), .out(out[5]));
	_And and6(.a(a[6]), .b(b[6]), .out(out[6]));
	_And and7(.a(a[7]), .b(b[7]), .out(out[7]));
	_And and8(.a(a[8]), .b(b[8]), .out(out[8]));
	_And and9(.a(a[9]), .b(b[9]), .out(out[9]));
	_And and10(.a(a[10]), .b(b[10]), .out(out[10]));
	_And and11(.a(a[11]), .b(b[11]), .out(out[11]));
	_And and12(.a(a[12]), .b(b[12]), .out(out[12]));
	_And and13(.a(a[13]), .b(b[13]), .out(out[13]));
	_And and14(.a(a[14]), .b(b[14]), .out(out[14]));
	_And and15(.a(a[15]), .b(b[15]), .out(out[15]));
endmodule
