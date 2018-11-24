// Register
`default_nettype none
module Register(
	input wire clk,			// clk
	input wire[15:0] in,	// in値
	input wire load,		// load
	output wire[15:0] out);	// out

	reg[15:0] val;

	always @(posedge clk) begin
		if(load == 1'b1) begin
			val <= in;
		end
	end

	assign out = val;

endmodule
