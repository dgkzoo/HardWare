`timescale 1ns/1ns

// テストベンチ
// CPU
module CPU_tb();
	reg clk = 0;
	reg[15:0] inM;
	reg[15:0] inst;
	reg reset;
	reg[15:0] outM;
	reg writeM;
	reg[14:0] addressM;
	reg[14:0] pc;

	parameter RATE = 10;

	always #(RATE/2) clk = ~clk;	// Clock Generation

	CPU cpu(
		.clk(clk),
		.inM(inM),
		.inst(inst),
		.reset(reset),
		.outM(outM),
		.writeM(writeM),
		.addressM(addressM),
		.pc(pc));

	initial begin
		$display("start test");
		
		inM=     0; inst = 16'b0011000000111001;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#1    writeM ng");if(addressM != 12345) $display("#1    addressM ng");if(pc !=     1) $display("#1    pc ng");
		inM=     0; inst = 16'b1110110000010000;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#2    writeM ng");if(addressM != 12345) $display("#2    addressM ng");if(pc !=     2) $display("#2    pc ng");
		inM=     0; inst = 16'b0101101110100000;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#3    writeM ng");if(addressM != 23456) $display("#3    addressM ng");if(pc !=     3) $display("#3    pc ng");
		inM=     0; inst = 16'b1110000111010000;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#4    writeM ng");if(addressM != 23456) $display("#4    addressM ng");if(pc !=     4) $display("#4    pc ng");
		inM=     0; inst = 16'b0000001111101000;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#5    writeM ng");if(addressM != 1000) $display("#5    addressM ng");if(pc !=     5) $display("#5    pc ng");
		inM=     0; inst = 16'b1110001100001000;reset=  0  ;
		#(RATE) if(writeM !=    1   ) $display("#6    writeM ng");if(addressM != 1000) $display("#6    addressM ng");if(pc !=     6) $display("#6    pc ng");
		inM=     0; inst = 16'b0000001111101001;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#7    writeM ng");if(addressM != 1001) $display("#7    addressM ng");if(pc !=     7) $display("#7    pc ng");
		inM=     0; inst = 16'b1110001110011000;reset=  0  ;
		#(RATE) if(writeM !=    1   ) $display("#8    writeM ng");if(addressM != 1001) $display("#8    addressM ng");if(pc !=     8) $display("#8    pc ng");
		inM=     0; inst = 16'b0000001111101000;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#9    writeM ng");if(addressM != 1000) $display("#9    addressM ng");if(pc !=     9) $display("#9    pc ng");
		inM= 11111; inst = 16'b1111010011010000;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#10   writeM ng");if(addressM != 1000) $display("#10   addressM ng");if(pc !=    10) $display("#10   pc ng");
		inM= 11111; inst = 16'b0000000000001110;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#11   writeM ng");if(addressM != 14) $display("#11   addressM ng");if(pc !=    11) $display("#11   pc ng");
		inM= 11111; inst = 16'b1110001100000100;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#12   writeM ng");if(addressM != 14) $display("#12   addressM ng");if(pc !=    14) $display("#12   pc ng");
		inM= 11111; inst = 16'b0000001111100111;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#13   writeM ng");if(addressM != 999) $display("#13   addressM ng");if(pc !=    15) $display("#13   pc ng");
		inM= 11111; inst = 16'b1110110111100000;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#14   writeM ng");if(addressM != 1000) $display("#14   addressM ng");if(pc !=    16) $display("#14   pc ng");
		inM= 11111; inst = 16'b1110001100001000;reset=  0  ;
		#(RATE) if(writeM !=    1   ) $display("#15   writeM ng");if(addressM != 1000) $display("#15   addressM ng");if(pc !=    17) $display("#15   pc ng");
		inM= 11111; inst = 16'b0000000000010101;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#16   writeM ng");if(addressM != 21) $display("#16   addressM ng");if(pc !=    18) $display("#16   pc ng");
		inM= 11111; inst = 16'b1110011111000010;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#17   writeM ng");if(addressM != 21) $display("#17   addressM ng");if(pc !=    21) $display("#17   pc ng");
		inM= 11111; inst = 16'b0000000000000010;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#18   writeM ng");if(addressM != 2) $display("#18   addressM ng");if(pc !=    22) $display("#18   pc ng");
		inM= 11111; inst = 16'b1110000010010000;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#19   writeM ng");if(addressM != 2) $display("#19   addressM ng");if(pc !=    23) $display("#19   pc ng");
		inM= 11111; inst = 16'b0000001111101000;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#20   writeM ng");if(addressM != 1000) $display("#20   addressM ng");if(pc !=    24) $display("#20   pc ng");
		inM= 11111; inst = 16'b1110111010010000;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#21   writeM ng");if(addressM != 1000) $display("#21   addressM ng");if(pc !=    25) $display("#21   pc ng");
		inM= 11111; inst = 16'b1110001100000001;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#22   writeM ng");if(addressM != 1000) $display("#22   addressM ng");if(pc !=    26) $display("#22   pc ng");
		inM= 11111; inst = 16'b1110001100000010;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#23   writeM ng");if(addressM != 1000) $display("#23   addressM ng");if(pc !=    27) $display("#23   pc ng");
		inM= 11111; inst = 16'b1110001100000011;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#24   writeM ng");if(addressM != 1000) $display("#24   addressM ng");if(pc !=    28) $display("#24   pc ng");
		inM= 11111; inst = 16'b1110001100000100;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#25   writeM ng");if(addressM != 1000) $display("#25   addressM ng");if(pc !=  1000) $display("#25   pc ng");
		inM= 11111; inst = 16'b1110001100000101;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#26   writeM ng");if(addressM != 1000) $display("#26   addressM ng");if(pc !=  1000) $display("#26   pc ng");
		inM= 11111; inst = 16'b1110001100000110;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#27   writeM ng");if(addressM != 1000) $display("#27   addressM ng");if(pc !=  1000) $display("#27   pc ng");
		inM= 11111; inst = 16'b1110001100000111;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#28   writeM ng");if(addressM != 1000) $display("#28   addressM ng");if(pc !=  1000) $display("#28   pc ng");
		inM= 11111; inst = 16'b1110101010010000;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#29   writeM ng");if(addressM != 1000) $display("#29   addressM ng");if(pc !=  1001) $display("#29   pc ng");
		inM= 11111; inst = 16'b1110001100000001;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#30   writeM ng");if(addressM != 1000) $display("#30   addressM ng");if(pc !=  1002) $display("#30   pc ng");
		inM= 11111; inst = 16'b1110001100000010;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#31   writeM ng");if(addressM != 1000) $display("#31   addressM ng");if(pc !=  1000) $display("#31   pc ng");
		inM= 11111; inst = 16'b1110001100000011;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#32   writeM ng");if(addressM != 1000) $display("#32   addressM ng");if(pc !=  1000) $display("#32   pc ng");
		inM= 11111; inst = 16'b1110001100000100;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#33   writeM ng");if(addressM != 1000) $display("#33   addressM ng");if(pc !=  1001) $display("#33   pc ng");
		inM= 11111; inst = 16'b1110001100000101;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#34   writeM ng");if(addressM != 1000) $display("#34   addressM ng");if(pc !=  1002) $display("#34   pc ng");
		inM= 11111; inst = 16'b1110001100000110;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#35   writeM ng");if(addressM != 1000) $display("#35   addressM ng");if(pc !=  1000) $display("#35   pc ng");
		inM= 11111; inst = 16'b1110001100000111;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#36   writeM ng");if(addressM != 1000) $display("#36   addressM ng");if(pc !=  1000) $display("#36   pc ng");
		inM= 11111; inst = 16'b1110111111010000;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#37   writeM ng");if(addressM != 1000) $display("#37   addressM ng");if(pc !=  1001) $display("#37   pc ng");
		inM= 11111; inst = 16'b1110001100000001;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#38   writeM ng");if(addressM != 1000) $display("#38   addressM ng");if(pc !=  1000) $display("#38   pc ng");
		inM= 11111; inst = 16'b1110001100000010;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#39   writeM ng");if(addressM != 1000) $display("#39   addressM ng");if(pc !=  1001) $display("#39   pc ng");
		inM= 11111; inst = 16'b1110001100000011;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#40   writeM ng");if(addressM != 1000) $display("#40   addressM ng");if(pc !=  1000) $display("#40   pc ng");
		inM= 11111; inst = 16'b1110001100000100;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#41   writeM ng");if(addressM != 1000) $display("#41   addressM ng");if(pc !=  1001) $display("#41   pc ng");
		inM= 11111; inst = 16'b1110001100000101;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#42   writeM ng");if(addressM != 1000) $display("#42   addressM ng");if(pc !=  1000) $display("#42   pc ng");
		inM= 11111; inst = 16'b1110001100000110;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#43   writeM ng");if(addressM != 1000) $display("#43   addressM ng");if(pc !=  1001) $display("#43   pc ng");
		inM= 11111; inst = 16'b1110001100000111;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#44   writeM ng");if(addressM != 1000) $display("#44   addressM ng");if(pc !=  1000) $display("#44   pc ng");
		inM= 11111; inst = 16'b1110001100000111;reset=  1  ;
		#(RATE) if(writeM !=    0   ) $display("#45   writeM ng");if(addressM != 1000) $display("#45   addressM ng");if(pc !=     0) $display("#45   pc ng");
		inM= 11111; inst = 16'b0111111111111111;reset=  0  ;
		#(RATE) if(writeM !=    0   ) $display("#46   writeM ng");if(addressM != 32767) $display("#46   addressM ng");if(pc !=     1) $display("#46   pc ng");

		$display("success!");
		$stop;
	end

endmodule
