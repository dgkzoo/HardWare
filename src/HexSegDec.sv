// 7 segment decoder
module HexSegDec(
	input[3:0] data,
	output[7:0] out);

	function [7:0] Decoder;
		input [3:0] num;
		begin
			case (num)
				4'h0:	Decoder = 8'b11000000; //0
				4'h1:	Decoder = 8'b11111001; //1
				4'h2:	Decoder = 8'b10100100; //2
				4'h3:	Decoder = 8'b10110000; //3
				4'h4:	Decoder = 8'b10011001; //4
				4'h5:	Decoder = 8'b10010010; //5
				4'h6:	Decoder = 8'b10000010; //6
				4'h7:	Decoder = 8'b11111000; //7
				4'h8:	Decoder = 8'b10000000; //8
				4'h9:	Decoder = 8'b10011000; //9
				4'ha:	Decoder = 8'b10001000; //A
				4'hb:	Decoder = 8'b10000011; //B
				4'hc:	Decoder = 8'b10100111; //C
				4'hd:	Decoder = 8'b10100001; //D
				4'he:	Decoder = 8'b10000110; //E
				4'hf:	Decoder = 8'b10001110; //F
				default: Decoder = 8'b11111111; // LED OFF
			endcase
		end
	endfunction
	
	assign out = Decoder(data);
endmodule
