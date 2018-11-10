// テストベンチ
// ALU
module ALU_tb();
	reg clk;
	reg[15:0] x;
	reg[15:0] y;
	reg zx;				// 入力xをゼロにする
	reg nx;				// 入力xを反転する
	reg zy;				// 入力yをゼロにする
	reg ny;				// 入力yを反転する
	reg f;				// 関数コード（1：加算、0：And演算）
	reg no;				// 出力outを反転する
	wire[15:0] out;		// 結果
	wire zr;			// out=0 の場合にtrue
	wire ng;			// out<0 の場合にtrue

	always #1 clk = !clk;

	ALU alu(
		.x(x),
		.y(y),
		.zx(zx),
		.nx(nx),
		.zy(zy),
		.ny(ny),
		.f(f),
		.no(no),
		.out(out),
		.zr(zr),
		.ng(ng)
	);

	initial begin
		$display("start test");
		clk <= 1;

		#100
		x <= 16'b0000000000000000; y <= 16'b1111111111111111; zx <= 1; nx <= 0; zy <= 1; ny <= 0; f <= 1; no <= 0;
		#110
		if (out != 16'b0000000000000000) $display("#100 out ng");
		if (zr != 1'b1) $display("#110 zr ng");
		if (ng != 1'b0) $display("#110 ng ng");

		#200
		x <= 16'b0000000000000000; y <= 16'b1111111111111111; zx <= 1; nx <= 1; zy <= 1; ny <= 1; f <= 1; no <= 1;
		#210
		if (out != 16'b0000000000000001) $display("#200 out ng");
		if (zr != 1'b0) $display("#210 zr ng");
		if (ng != 1'b0) $display("#210 ng ng");

		#300
		x <= 16'b0000000000000000; y <= 16'b1111111111111111; zx <= 1; nx <= 1; zy <= 1; ny <= 0; f <= 1; no <= 0;
		#310
		if (out != 16'b1111111111111111) $display("#300 out ng");
		if (zr != 1'b0) $display("#310 zr ng");
		if (ng != 1'b1) $display("#310 ng ng");

		#400
		x <= 16'b0000000000000000; y <= 16'b1111111111111111; zx <= 0; nx <= 0; zy <= 1; ny <= 1; f <= 0; no <= 0;
		#410
		if (out != 16'b0000000000000000) $display("#400 out ng");
		if (zr != 1'b1) $display("#410 zr ng");
		if (ng != 1'b0) $display("#410 ng ng");

		#500
		x <= 16'b0000000000000000; y <= 16'b1111111111111111; zx <= 1; nx <= 1; zy <= 0; ny <= 0; f <= 0; no <= 0;
		#510
		if (out != 16'b1111111111111111) $display("#500 out ng");
		if (zr != 1'b0) $display("#510 zr ng");
		if (ng != 1'b1) $display("#510 ng ng");

		#600
		x <= 16'b0000000000000000; y <= 16'b1111111111111111; zx <= 0; nx <= 0; zy <= 1; ny <= 1; f <= 0; no <= 1;
		#610
		if (out != 16'b1111111111111111) $display("#600 out ng");
		if (zr != 1'b0) $display("#610 zr ng");
		if (ng != 1'b1) $display("#610 ng ng");

		#700
		x <= 16'b0000000000000000; y <= 16'b1111111111111111; zx <= 1; nx <= 1; zy <= 0; ny <= 0; f <= 0; no <= 1;
		#710
		if (out != 16'b0000000000000000) $display("#700 out ng");
		if (zr != 1'b1) $display("#710 zr ng");
		if (ng != 1'b0) $display("#710 ng ng");


		#800
		x <= 16'b0000000000000000; y <= 16'b1111111111111111; zx <= 0; nx <= 0; zy <= 1; ny <= 1; f <= 1; no <= 1;
		#810
		if (out != 16'b0000000000000000) $display("#800 out ng");
		if (zr != 1'b1) $display("#810 zr ng");
		if (ng != 1'b0) $display("#810 ng ng");


		#900
		x <= 16'b0000000000000000; y <= 16'b1111111111111111; zx <= 1; nx <= 1; zy <= 0; ny <= 0; f <= 1; no <= 1;
		#910
		if (out != 16'b0000000000000001) $display("#900 out ng");
		if (zr != 1'b0) $display("#910 zr ng");
		if (ng != 1'b0) $display("#910 ng ng");

		#1000
		x <= 16'b0000000000000000; y <= 16'b1111111111111111; zx <= 0; nx <= 1; zy <= 1; ny <= 1; f <= 1; no <= 1;
		#1010
		if (out != 16'b0000000000000001) $display("#1000 out ng");
		if (zr != 1'b0) $display("#1010 zr ng");
		if (ng != 1'b0) $display("#1010 ng ng");

		#1100
		x <= 16'b0000000000000000; y <= 16'b1111111111111111; zx <= 1; nx <= 1; zy <= 0; ny <= 1; f <= 1; no <= 1;
		#1110
		if (out != 16'b0000000000000000) $display("#1100 out ng");
		if (zr != 1'b1) $display("#1110 zr ng");
		if (ng != 1'b0) $display("#1110 ng ng");


		#1200
		x <= 16'b0000000000000000; y <= 16'b1111111111111111; zx <= 0; nx <= 0; zy <= 1; ny <= 1; f <= 1; no <= 0;
		#1210
		if (out != 16'b1111111111111111) $display("#1200 out ng");
		if (zr != 1'b0) $display("#1210 zr ng");
		if (ng != 1'b1) $display("#1210 ng ng");

		#1300
		x <= 16'b0000000000000000; y <= 16'b1111111111111111; zx <= 1; nx <= 1; zy <= 0; ny <= 0; f <= 1; no <= 0;
		#1310
		if (out != 16'b1111111111111110) $display("#1300 out ng");
		if (zr != 1'b0) $display("#1310 zr ng");
		if (ng != 1'b1) $display("#1310 ng ng");

		#1400
		x <= 16'b0000000000000000; y <= 16'b1111111111111111; zx <= 0; nx <= 0; zy <= 0; ny <= 0; f <= 1; no <= 0;
		#1410
		if (out != 16'b1111111111111111) $display("#1400 out ng");
		if (zr != 1'b0) $display("#1410 zr ng");
		if (ng != 1'b1) $display("#1410 ng ng");

		#1500
		x <= 16'b0000000000000000; y <= 16'b1111111111111111; zx <= 0; nx <= 1; zy <= 0; ny <= 0; f <= 1; no <= 1;
		#1510
		if (out != 16'b0000000000000001) $display("#1500 out ng");
		if (zr != 1'b0) $display("#1510 zr ng");
		if (ng != 1'b0) $display("#1510 ng ng");

		#1600
		x <= 16'b0000000000000000; y <= 16'b1111111111111111; zx <= 0; nx <= 0; zy <= 0; ny <= 1; f <= 1; no <= 1;
		#1610
		if (out != 16'b1111111111111111) $display("#1600 out ng");
		if (zr != 1'b0) $display("#1610 zr ng");
		if (ng != 1'b1) $display("#1610 ng ng");

		#1700
		x <= 16'b0000000000000000; y <= 16'b1111111111111111; zx <= 0; nx <= 0; zy <= 0; ny <= 0; f <= 0; no <= 0;
		#1710
		if (out != 16'b0000000000000000) $display("#1700 out ng");
		if (zr != 1'b1) $display("#1710 zr ng");
		if (ng != 1'b0) $display("#1710 ng ng");

		#1800
		x <= 16'b0000000000000000; y <= 16'b1111111111111111; zx <= 0; nx <= 1; zy <= 0; ny <= 1; f <= 0; no <= 1;
		#1810
		if (out != 16'b1111111111111111) $display("#1800 out ng");
		if (zr != 1'b0) $display("#1810 zr ng");
		if (ng != 1'b1) $display("#1810 ng ng");

		#1900
		x <= 16'b0000000000010001; y <= 16'b0000000000000011; zx <= 1; nx <= 0; zy <= 1; ny <= 0; f <= 1; no <= 0;
		#1910
		if (out != 16'b0000000000000000) $display("#1900 out ng");
		if (zr != 1'b1) $display("#1810 zr ng");
		if (ng != 1'b0) $display("#1810 ng ng");

		#2000
		x <= 16'b0000000000010001; y <= 16'b0000000000000011; zx <= 1; nx <= 1; zy <= 1; ny <= 1; f <= 1; no <= 1;
		#2010
		if (out != 16'b0000000000000001) $display("#2000 out ng");
		if (zr != 1'b0) $display("#2010 zr ng");
		if (ng != 1'b0) $display("#2010 ng ng");

		#2100
		x <= 16'b0000000000010001; y <= 16'b0000000000000011; zx <= 1; nx <= 1; zy <= 1; ny <= 0; f <= 1; no <= 0;
		#2110
		if (out != 16'b1111111111111111) $display("#2100 out ng");
		if (zr != 1'b0) $display("#2110 zr ng");
		if (ng != 1'b1) $display("#2110 ng ng");

		#2200
		x <= 16'b0000000000010001; y <= 16'b0000000000000011; zx <= 0; nx <= 0; zy <= 1; ny <= 1; f <= 0; no <= 0;
		#2210
		if (out != 16'b0000000000010001) $display("#2200 out ng");
		if (zr != 1'b0) $display("#2210 zr ng");
		if (ng != 1'b0) $display("#2210 ng ng");

		#2300
		x <= 16'b0000000000010001; y <= 16'b0000000000000011; zx <= 1; nx <= 1; zy <= 0; ny <= 0; f <= 0; no <= 0;
		#2310
		if (out != 16'b0000000000000011) $display("#2300 out ng");
		if (zr != 1'b0) $display("#2310 zr ng");
		if (ng != 1'b0) $display("#2310 ng ng");

		#2400
		x <= 16'b0000000000010001; y <= 16'b0000000000000011; zx <= 0; nx <= 0; zy <= 1; ny <= 1; f <= 0; no <= 1;
		#2410
		if (out != 16'b1111111111101110) $display("#2400 out ng");
		if (zr != 1'b0) $display("#2410 zr ng");
		if (ng != 1'b1) $display("#2410 ng ng");

		#2500
		x <= 16'b0000000000010001; y <= 16'b0000000000000011; zx <= 1; nx <= 1; zy <= 0; ny <= 0; f <= 0; no <= 1;
		#2510
		if (out != 16'b1111111111111100) $display("#2500 out ng");
		if (zr != 1'b0) $display("#2510 zr ng");
		if (ng != 1'b1) $display("#2510 ng ng");

		#2600
		x <= 16'b0000000000010001; y <= 16'b0000000000000011; zx <= 0; nx <= 0; zy <= 1; ny <= 1; f <= 1; no <= 1;
		#2610
		if (out != 16'b1111111111101111) $display("#2600 out ng");
		if (zr != 1'b0) $display("#2610 zr ng");
		if (ng != 1'b1) $display("#2610 ng ng");

		#2700
		x <= 16'b0000000000010001; y <= 16'b0000000000000011; zx <= 1; nx <= 1; zy <= 0; ny <= 0; f <= 1; no <= 1;
		#2710
		if (out != 16'b1111111111111101) $display("#2700 out ng");
		if (zr != 1'b0) $display("#2710 zr ng");
		if (ng != 1'b1) $display("#2710 ng ng");

		#2800
		x <= 16'b0000000000010001; y <= 16'b0000000000000011; zx <= 0; nx <= 1; zy <= 1; ny <= 1; f <= 1; no <= 1;
		#2810
		if (out != 16'b0000000000010010) $display("#2800 out ng");
		if (zr != 1'b0) $display("#2810 zr ng");
		if (ng != 1'b0) $display("#2810 ng ng");

		#2900
		x <= 16'b0000000000010001; y <= 16'b0000000000000011; zx <= 1; nx <= 1; zy <= 0; ny <= 1; f <= 1; no <= 1;
		#2910
		if (out != 16'b0000000000000100) $display("#2900 out ng");
		if (zr != 1'b0) $display("#2910 zr ng");
		if (ng != 1'b0) $display("#2910 ng ng");

		#3000
		x <= 16'b0000000000010001; y <= 16'b0000000000000011; zx <= 0; nx <= 0; zy <= 1; ny <= 1; f <= 1; no <= 0;
		#3010
		if (out != 16'b0000000000010000) $display("#3000 out ng");
		if (zr != 1'b0) $display("#3010 zr ng");
		if (ng != 1'b0) $display("#3010 ng ng");

		#3100
		x <= 16'b0000000000010001; y <= 16'b0000000000000011; zx <= 1; nx <= 1; zy <= 0; ny <= 0; f <= 1; no <= 0;
		#3110
		if (out != 16'b0000000000000010) $display("#3100 out ng");
		if (zr != 1'b0) $display("#3110 zr ng");
		if (ng != 1'b0) $display("#3110 ng ng");

		#3200
		x <= 16'b0000000000010001; y <= 16'b0000000000000011; zx <= 0; nx <= 0; zy <= 0; ny <= 0; f <= 1; no <= 0;
		#3210
		if (out != 16'b0000000000010100) $display("#3200 out ng");
		if (zr != 1'b0) $display("#3210 zr ng");
		if (ng != 1'b0) $display("#3210 ng ng");

		#3300
		x <= 16'b0000000000010001; y <= 16'b0000000000000011; zx <= 0; nx <= 1; zy <= 0; ny <= 0; f <= 1; no <= 1;
		#3310
		if (out != 16'b0000000000001110) $display("#3300 out ng");
		if (zr != 1'b0) $display("#3310 zr ng");
		if (ng != 1'b0) $display("#3310 ng ng");

		#3400
		x <= 16'b0000000000010001; y <= 16'b0000000000000011; zx <= 0; nx <= 0; zy <= 0; ny <= 1; f <= 1; no <= 1;
		#3410
		if (out != 16'b1111111111110010) $display("#00 out ng");
		if (zr != 1'b0) $display("#3410 zr ng");
		if (ng != 1'b1) $display("#3410 ng ng");

		#3500
		x <= 16'b0000000000010001; y <= 16'b0000000000000011; zx <= 0; nx <= 0; zy <= 0; ny <= 0; f <= 0; no <= 0;
		#3510
		if (out != 16'b0000000000000001) $display("#3500 out ng");
		if (ng != 1'b0) $display("#3510 ng ng");
		if (ng != 1'b0) $display("#3510 ng ng");

		#3600
		x <= 16'b0000000000010001; y <= 16'b0000000000000011; zx <= 0; nx <= 1; zy <= 0; ny <= 1; f <= 0; no <= 1;
		#3610
		if (out != 16'b0000000000010011) $display("#3600 out ng");
		if (zr != 1'b0) $display("#3610 zr ng");
		if (ng != 1'b0) $display("#3610 ng ng");

		#9999999
		$display("success!");
		$stop;
	end

endmodule
