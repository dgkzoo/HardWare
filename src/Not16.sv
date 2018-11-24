/**
 * # Not16
 *
 * ## author
 * dgkzoo
 */
`default_nettype none
module Not16(
	input wire[15:0] in,
	output wire[15:0] out);

	_Not not0(.in(in[0]), .out(out[0]));
	_Not not1(.in(in[1]), .out(out[1]));
	_Not not2(.in(in[2]), .out(out[2]));
	_Not not3(.in(in[3]), .out(out[3]));
	_Not not4(.in(in[4]), .out(out[4]));
	_Not not5(.in(in[5]), .out(out[5]));
	_Not not6(.in(in[6]), .out(out[6]));
	_Not not7(.in(in[7]), .out(out[7]));
	_Not not8(.in(in[8]), .out(out[8]));
	_Not not9(.in(in[9]), .out(out[9]));
	_Not not10(.in(in[10]), .out(out[10]));
	_Not not11(.in(in[11]), .out(out[11]));
	_Not not12(.in(in[12]), .out(out[12]));
	_Not not13(.in(in[13]), .out(out[13]));
	_Not not14(.in(in[14]), .out(out[14]));
	_Not not15(.in(in[15]), .out(out[15]));
endmodule
