// テストベンチ
// Register
module Register_tb();
	reg clk;
	reg[15:0] in;
	reg load;
	reg[15:0] out;

	always #1 clk = !clk;

	Register register(
		.clk(clk),
		.in(in),
		.load(load),
		.out(out)
	);

	initial begin
		$display("start test");
		clk <= 1;
		in <= 0;
		load <= 0;

		#1000
		in <= 0; load <=  0 ;
		if (out !=       0) $display("#1000 out ng");
		#1010
		in <= 0; load <=  0 ;
		if (out !=       0) $display("#1010 out ng");
		#1020
		in <= 0; load <=  1 ;
		if (out !=       0) $display("#1020 out ng");
		#1030
		in <= 0; load <=  1 ;
		if (out !=       0) $display("#1030 out ng");
		#1040
		in <= -16'd32123; load <=  0 ;
		if (out !=       0) $display("#1040 out ng");
		#1050
		in <= -16'd32123; load <=  0 ;
		if (out !=       0) $display("#1050 out ng");
		#1060
		in <= 16'd11111; load <=  0 ;
		if (out !=       0) $display("#1060 out ng");
		#1070
		in <= 16'd11111; load <=  0 ;
		if (out !=       0) $display("#1070 out ng");
		#1080
		in <= -16'd32123; load <=  1 ;
		if (out !=       0) $display("#1080 out ng");
		#1090
		in <= -16'd32123; load <=  1 ;
		if (out !=  -16'd32123) $display("#1090 out ng");
		#1100
		in <= -16'd32123; load <=  1 ;
		if (out !=  -16'd32123) $display("#1100 out ng");
		#1110
		in <= -16'd32123; load <=  1 ;
		if (out !=  -16'd32123) $display("#1110 out ng");
		#1120
		in <= -16'd32123; load <=  0 ;
		if (out !=  -16'd32123) $display("#1120 out ng");
		#1130
		in <= -16'd32123; load <=  0 ;
		if (out !=  -16'd32123) $display("#1130 out ng");
		#1140
		in <= 16'd12345; load <=  1 ;
		if (out !=  -16'd32123) $display("#1140 out ng");
		#1150
		in <= 16'd12345; load <=  1 ;
		if (out !=   16'd12345) $display("#1150 out ng");
		#1160
		in <= 0; load <=  0 ;
		if (out !=   16'd12345) $display("#1160 out ng");
		#1170
		in <= 0; load <=  0 ;
		if (out !=   16'd12345) $display("#1170 out ng");
		#1180
		in <= 0; load <=  1 ;
		if (out !=   12345) $display("#1180 out ng");
		#1190
		in <= 0; load <=  1 ;
		if (out !=       0) $display("#1190 out ng");
		#1200
		in <= 1; load <=  0 ;
		if (out !=       0) $display("#1200 out ng");
		#1210
		in <= 1; load <=  0 ;
		if (out !=       0) $display("#1210 out ng");
		#1220
		in <= 1; load <=  1 ;
		if (out !=       0) $display("#1220 out ng");
		#1230
		in <= 1; load <=  1 ;
		if (out !=       16'd1) $display("#1230 out ng");
		#1240
		in <= 2; load <=  0 ;
		if (out !=       16'd1) $display("#1240 out ng");
		#1250
		in <= 2; load <=  0 ;
		if (out !=       16'd1) $display("#1250 out ng");
		#1260
		in <= 2; load <=  1 ;
		if (out !=       16'd1) $display("#1260 out ng");
		#1270
		in <= 2; load <=  1 ;
		if (out !=       16'd2) $display("#1270 out ng");
		#1280
		in <= 4; load <=  0 ;
		if (out !=       16'd2) $display("#1280 out ng");
		#1290
		in <= 4; load <=  0 ;
		if (out !=       16'd2) $display("#1290 out ng");
		#1300
		in <= 4; load <=  1 ;
		if (out !=       16'd2) $display("#1300 out ng");
		#1310
		in <= 4; load <=  1 ;
		if (out !=       16'd4) $display("#1310 out ng");
		#1320
		in <= 8; load <=  0 ;
		if (out !=       16'd4) $display("#1320 out ng");
		#1330
		in <= 8; load <=  0 ;
		if (out !=       4) $display("#1330 out ng");
		#1340
		in <= 8; load <=  1 ;
		if (out !=       4) $display("#1340 out ng");
		#1350
		in <= 8; load <=  1 ;
		if (out !=       8) $display("#1350 out ng");
		#1360
		in <= 16; load <=  0 ;
		if (out !=       8) $display("#1360 out ng");
		#1370
		in <= 16; load <=  0 ;
		if (out !=       8) $display("#1370 out ng");
		#1380
		in <= 16; load <=  1 ;
		if (out !=       8) $display("#1380 out ng");
		#1390
		in <= 16; load <=  1 ;
		if (out !=      16) $display("#1390 out ng");
		#1400
		in <= 32; load <=  0 ;
		if (out !=      16) $display("#1400 out ng");
		#1410
		in <= 32; load <=  0 ;
		if (out !=      16) $display("#1410 out ng");
		#1420
		in <= 32; load <=  1 ;
		if (out !=      16) $display("#1420 out ng");
		#1430
		in <= 32; load <=  1 ;
		if (out !=      32) $display("#1430 out ng");
		#1440
		in <= 64; load <=  0 ;
		if (out !=      32) $display("#1440 out ng");
		#1450
		in <= 64; load <=  0 ;
		if (out !=      32) $display("#1450 out ng");
		#1460
		in <= 64; load <=  1 ;
		if (out !=      32) $display("#1460 out ng");
		#1470
		in <= 64; load <=  1 ;
		if (out !=      64) $display("#1470 out ng");
		#1480
		in <= 128; load <=  0 ;
		if (out !=      64) $display("#1480 out ng");
		#1490
		in <= 128; load <=  0 ;
		if (out !=      64) $display("#1490 out ng");
		#1500
		in <= 128; load <=  1 ;
		if (out !=      64) $display("#1500 out ng");
		#1510
		in <= 128; load <=  1 ;
		if (out !=     128) $display("#1510 out ng");
		#1520
		in <= 256; load <=  0 ;
		if (out !=     128) $display("#1520 out ng");
		#1530
		in <= 256; load <=  0 ;
		if (out !=     128) $display("#1530 out ng");
		#1540
		in <= 256; load <=  1 ;
		if (out !=     128) $display("#1540 out ng");
		#1550
		in <= 256; load <=  1 ;
		if (out !=     256) $display("#1550 out ng");
		#1560
		in <= 512; load <=  0 ;
		if (out !=     256) $display("#1560 out ng");
		#1570
		in <= 512; load <=  0 ;
		if (out !=     256) $display("#1570 out ng");
		#1580
		in <= 512; load <=  1 ;
		if (out !=     256) $display("#1580 out ng");
		#1590
		in <= 512; load <=  1 ;
		if (out !=     512) $display("#1590 out ng");
		#1600
		in <= 1024; load <=  0 ;
		if (out !=     512) $display("#1600 out ng");
		#1610
		in <= 1024; load <=  0 ;
		if (out !=     512) $display("#1610 out ng");
		#1620
		in <= 1024; load <=  1 ;
		if (out !=     512) $display("#1620 out ng");
		#1630
		in <= 1024; load <=  1 ;
		if (out !=    1024) $display("#1630 out ng");
		#1640
		in <= 2048; load <=  0 ;
		if (out !=    1024) $display("#1640 out ng");
		#1650
		in <= 2048; load <=  0 ;
		if (out !=    1024) $display("#1650 out ng");
		#1660
		in <= 2048; load <=  1 ;
		if (out !=    1024) $display("#1660 out ng");
		#1670
		in <= 2048; load <=  1 ;
		if (out !=    2048) $display("#1670 out ng");
		#1680
		in <= 4096; load <=  0 ;
		if (out !=    2048) $display("#1680 out ng");
		#1690
		in <= 4096; load <=  0 ;
		if (out !=    2048) $display("#1690 out ng");
		#1700
		in <= 4096; load <=  1 ;
		if (out !=    2048) $display("#1700 out ng");
		#1710
		in <= 4096; load <=  1 ;
		if (out !=    4096) $display("#1710 out ng");
		#1720
		in <= 8192; load <=  0 ;
		if (out !=    4096) $display("#1720 out ng");
		#1730
		in <= 8192; load <=  0 ;
		if (out !=    4096) $display("#1730 out ng");
		#1740
		in <= 8192; load <=  1 ;
		if (out !=    4096) $display("#1740 out ng");
		#1750
		in <= 8192; load <=  1 ;
		if (out !=    8192) $display("#1750 out ng");
		#1760
		in <= 16384; load <=  0 ;
		if (out !=    8192) $display("#1760 out ng");
		#1770
		in <= 16384; load <=  0 ;
		if (out !=    8192) $display("#1770 out ng");
		#1780
		in <= 16384; load <=  1 ;
		if (out !=    8192) $display("#1780 out ng");
		#1790
		in <= 16384; load <=  1 ;
		if (out !=   16384) $display("#1790 out ng");
		#1800
		in <= -16'd32768; load <=  0 ;
		if (out !=   16384) $display("#1800 out ng");
		#1810
		in <= -16'd32768; load <=  0 ;
		if (out !=   16384) $display("#1810 out ng");
		#1820
		in <= -16'd32768; load <=  1 ;
		if (out !=   16384) $display("#1820 out ng");
		#1830
		in <= -16'd32768; load <=  1 ;
		if (out !=  -16'd32768) $display("#1830 out ng");
		#1840
		in <= -16'd2; load <=  0 ;
		if (out !=  -16'd32768) $display("#1840 out ng");
		#1850
		in <= -16'd2; load <=  0 ;
		if (out !=  -16'd32768) $display("#1850 out ng");
		#1860
		in <= -16'd2; load <=  1 ;
		if (out !=  -16'd32768) $display("#1860 out ng");
		#1870
		in <= -16'd2; load <=  1 ;
		if (out !=      -16'd2) $display("#1870 out ng");
		#1880
		in <= -16'd3; load <=  0 ;
		if (out !=      -16'd2) $display("#1880 out ng");
		#1890
		in <= -16'd3; load <=  0 ;
		if (out !=      -16'd2) $display("#1890 out ng");
		#1900
		in <= -16'd3; load <=  1 ;
		if (out !=      -16'd2) $display("#1900 out ng");
		#1910
		in <= -16'd3; load <=  1 ;
		if (out !=      -16'd3) $display("#1910 out ng");
		#1920
		in <= -16'd5; load <=  0 ;
		if (out !=      -16'd3) $display("#1920 out ng");
		#1930
		in <= -16'd5; load <=  0 ;
		if (out !=      -16'd3) $display("#1930 out ng");
		#1940
		in <= -16'd5; load <=  1 ;
		if (out !=      -16'd3) $display("#1940 out ng");
		#1950
		in <= -16'd5; load <=  1 ;
		if (out !=      -16'd5) $display("#1950 out ng");
		#1960
		in <= -16'd9; load <=  0 ;
		if (out !=      -16'd5) $display("#1960 out ng");
		#1970
		in <= -16'd9; load <=  0 ;
		if (out !=      -16'd5) $display("#1970 out ng");
		#1980
		in <= -16'd9; load <=  1 ;
		if (out !=      -16'd5) $display("#1980 out ng");
		#1990
		in <= -16'd9; load <=  1 ;
		if (out !=      -16'd9) $display("#1990 out ng");
		#2000
		in <= -16'd17; load <=  0 ;
		if (out !=      -16'd9) $display("#2000 out ng");
		#2010
		in <= -16'd17; load <=  0 ;
		if (out !=      -16'd9) $display("#2010 out ng");
		#2020
		in <= -16'd17; load <=  1 ;
		if (out !=      -16'd9) $display("#2020 out ng");
		#2030
		in <= -16'd17; load <=  1 ;
		if (out !=     -16'd17) $display("#2030 out ng");
		#2040
		in <= -16'd33; load <=  0 ;
		if (out !=     -16'd17) $display("#2040 out ng");
		#2050
		in <= -16'd33; load <=  0 ;
		if (out !=     -16'd17) $display("#2050 out ng");
		#2060
		in <= -16'd33; load <=  1 ;
		if (out !=     -16'd17) $display("#2060 out ng");
		#2070
		in <= -16'd33; load <=  1 ;
		if (out !=     -16'd33) $display("#2070 out ng");
		#2080
		in <= -16'd65; load <=  0 ;
		if (out !=     -16'd33) $display("#2080 out ng");
		#2090
		in <= -16'd65; load <=  0 ;
		if (out !=     -16'd33) $display("#2090 out ng");
		#2100
		in <= -16'd65; load <=  1 ;
		if (out !=     -16'd33) $display("#2100 out ng");
		#2110
		in <= -16'd65; load <=  1 ;
		if (out !=     -16'd65) $display("#2110 out ng");
		#2120
		in <= -16'd129; load <=  0 ;
		if (out !=     -16'd65) $display("#2120 out ng");
		#2130
		in <= -16'd129; load <=  0 ;
		if (out !=     -16'd65) $display("#2130 out ng");
		#2140
		in <= -16'd129; load <=  1 ;
		if (out !=     -16'd65) $display("#2140 out ng");
		#2150
		in <= -16'd129; load <=  1 ;
		if (out !=    -16'd129) $display("#2150 out ng");
		#2160
		in <= -16'd257; load <=  0 ;
		if (out !=    -16'd129) $display("#2160 out ng");
		#2170
		in <= -16'd257; load <=  0 ;
		if (out !=    -16'd129) $display("#2170 out ng");
		#2180
		in <= -16'd257; load <=  1 ;
		if (out !=    -16'd129) $display("#2180 out ng");
		#2190
		in <= -16'd257; load <=  1 ;
		if (out !=    -16'd257) $display("#2190 out ng");
		#2200
		in <= -16'd513; load <=  0 ;
		if (out !=    -16'd257) $display("#2200 out ng");
		#2210
		in <= -16'd513; load <=  0 ;
		if (out !=    -16'd257) $display("#2210 out ng");
		#2220
		in <= -16'd513; load <=  1 ;
		if (out !=    -16'd257) $display("#2220 out ng");
		#2230
		in <= -16'd513; load <=  1 ;
		if (out !=    -16'd513) $display("#2230 out ng");
		#2240
		in <= -16'd1025; load <=  0 ;
		if (out !=    -16'd513) $display("#2240 out ng");
		#2250
		in <= -16'd1025; load <=  0 ;
		if (out !=    -16'd513) $display("#2250 out ng");
		#2260
		in <= -16'd1025; load <=  1 ;
		if (out !=    -16'd513) $display("#2260 out ng");
		#2270
		in <= -16'd1025; load <=  1 ;
		if (out !=   -16'd1025) $display("#2270 out ng");
		#2280
		in <= -16'd2049; load <=  0 ;
		if (out !=   -16'd1025) $display("#2280 out ng");
		#2290
		in <= -16'd2049; load <=  0 ;
		if (out !=   -16'd1025) $display("#2290 out ng");
		#2300
		in <= -16'd2049; load <=  1 ;
		if (out !=   -16'd1025) $display("#2300 out ng");
		#2310
		in <= -16'd2049; load <=  1 ;
		if (out !=   -16'd2049) $display("#2310 out ng");
		#2320
		in <= -16'd4097; load <=  0 ;
		if (out !=   -16'd2049) $display("#2320 out ng");
		#2330
		in <= -16'd4097; load <=  0 ;
		if (out !=   -16'd2049) $display("#2330 out ng");
		#2340
		in <= -16'd4097; load <=  1 ;
		if (out !=   -16'd2049) $display("#2340 out ng");
		#2350
		in <= -16'd4097; load <=  1 ;
		if (out !=   -16'd4097) $display("#2350 out ng");
		#2360
		in <= -16'd8193; load <=  0 ;
		if (out !=   -16'd4097) $display("#2360 out ng");
		#2370
		in <= -16'd8193; load <=  0 ;
		if (out !=   -16'd4097) $display("#2370 out ng");
		#2380
		in <= -16'd8193; load <=  1 ;
		if (out !=   -16'd4097) $display("#2380 out ng");
		#2390
		in <= -16'd8193; load <=  1 ;
		if (out !=   -16'd8193) $display("#2390 out ng");
		#2400
		in <= -16'd16385; load <=  0 ;
		if (out !=   -16'd8193) $display("#2400 out ng");
		#2410
		in <= -16'd16385; load <=  0 ;
		if (out !=   -16'd8193) $display("#2410 out ng");
		#2420
		in <= -16'd16385; load <=  1 ;
		if (out !=   -16'd8193) $display("#2420 out ng");
		#2430
		in <= -16'd16385; load <=  1 ;
		if (out !=  -16'd16385) $display("#2430 out ng");
		#2440
		in <= 32767; load <=  0 ;
		if (out !=  -16'd16385) $display("#2440 out ng");
		#2450
		in <= 32767; load <=  0 ;
		if (out !=  -16'd16385) $display("#2450 out ng");
		#2460
		in <= 32767; load <=  1 ;
		if (out !=  -16'd16385) $display("#2460 out ng");
		#2470
		in <= 32767; load <=  1 ;
		if (out !=   32767) $display("#2470 out ng");

		#99999
		$display("success!");
		$stop;
	end

endmodule
