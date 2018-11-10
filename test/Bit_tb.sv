// テストベンチ
// Bit
module Bit_tb();
	reg clk;
	reg in;
	reg load;
	wire out;

	always #1 clk = !clk;

	Bit bit1(
		.clk(clk),
		.in(in),
		.load(load),
		.out(out)
	);

	initial begin
		$display("start test");
		clk <= 1;

		#1000
		in <= 0; load <= 0;
		if (out != 0) $display("#1000 out ng");

		#1020
		in <= 0; load <= 0;
		if (out != 0) $display("#1020 out ng");
			
		#1040
		in <= 0; load <= 1;
		if (out != 0) $display("#1040 out ng");
			
		#1060
		in <= 0; load <= 1;
		if (out != 0) $display("#1060 out ng");
			
		#1080
		in <= 1; load <= 0;
		if (out != 0) $display("#1080 out ng");
			
		#1100
		in <= 1; load <= 0;
		if (out != 0) $display("#1100 out ng");
			
		#1120
		in <= 1; load <= 1;
		if (out != 0) $display("#1120 out ng");
			
		#1140
		in <= 1; load <= 1;
		if (out != 1) $display("#1140 out ng");
			
		#1160
		in <= 0; load <= 0;
		if (out != 1) $display("#1160 out ng");
			
		#1180
		in <= 0; load <= 0;
		if (out != 1) $display("#1180 out ng");
			
		#1200
		in <= 1; load <= 0;
		if (out != 1) $display("#1200 out ng");
			
		#1220
		in <= 1; load <= 0;
		if (out != 1) $display("#1220 out ng");
			
		#1240
		in <= 0; load <= 1;
		if (out != 1) $display("#1240 out ng");
			
		#1260
		in <= 0; load <= 1;
		if (out != 0) $display("#1260 out ng");
			
		#1280
		in <= 1; load <= 1;
		if (out != 0) $display("#1280 out ng");
			
		#1300
		in <= 1; load <= 1;
		if (out != 1) $display("#1300 out ng");
			
		#1320
		in <= 0; load <= 0;
		if (out != 1) $display("#1320 out ng");
			
		#1340
		in <= 0; load <= 0;
		if (out != 1) $display("#1340 out ng");
			
		#1360
		in <= 0; load <= 0;
		if (out != 1) $display("#1360 out ng");
			
		#1380
		in <= 0; load <= 0;
		if (out != 1) $display("#1380 out ng");
			
		#1400
		in <= 0; load <= 0;
		if (out != 1) $display("#1400 out ng");
			
		#1420
		in <= 0; load <= 0;
		if (out != 1) $display("#1420 out ng");
			
		#1440
		in <= 0; load <= 0;
		if (out != 1) $display("#1440 out ng");
			
		#1460
		in <= 0; load <= 0;
		if (out != 1) $display("#1460 out ng");
			
		#1480
		in <= 0; load <= 0;
		if (out != 1) $display("#1480 out ng");
			
		#1500
		in <= 0; load <= 0;
		if (out != 1) $display("#1500 out ng");
			
		#1520
		in <= 0; load <= 0;
		if (out != 1) $display("#1520 out ng");
			
		#1540
		in <= 0; load <= 0;
		if (out != 1) $display("#1540 out ng");
			
		#1560
		in <= 0; load <= 0;
		if (out != 1) $display("#1560 out ng");
			
		#1580
		in <= 0; load <= 0;
		if (out != 1) $display("#1580 out ng");
			
		#1600
		in <= 0; load <= 0;
		if (out != 1) $display("#1600 out ng");
			
		#1620
		in <= 0; load <= 0;
		if (out != 1) $display("#1620 out ng");
			
		#1640
		in <= 0; load <= 0;
		if (out != 1) $display("#1640 out ng");
			
		#1660
		in <= 0; load <= 0;
		if (out != 1) $display("#1660 out ng");
			
		#1680
		in <= 0; load <= 0;
		if (out != 1) $display("#1680 out ng");
			
		#1700
		in <= 0; load <= 0;
		if (out != 1) $display("#1700 out ng");
			
		#1720
		in <= 0; load <= 0;
		if (out != 1) $display("#1720 out ng");
			
		#1740
		in <= 0; load <= 0;
		if (out != 1) $display("#1740 out ng");
			
		#1760
		in <= 0; load <= 0;
		if (out != 1) $display("#1760 out ng");
			
		#1780
		in <= 0; load <= 0;
		if (out != 1) $display("#1780 out ng");
			
		#1800
		in <= 0; load <= 0;
		if (out != 1) $display("#1800 out ng");
			
		#1820
		in <= 0; load <= 0;
		if (out != 1) $display("#1820 out ng");
			
		#1840
		in <= 0; load <= 0;
		if (out != 1) $display("#1840 out ng");
			
		#1860
		in <= 0; load <= 0;
		if (out != 1) $display("#1860 out ng");
			
		#1880
		in <= 0; load <= 0;
		if (out != 1) $display("#1880 out ng");
			
		#1900
		in <= 0; load <= 0;
		if (out != 1) $display("#1900 out ng");
			
		#1920
		in <= 0; load <= 0;
		if (out != 1) $display("#1920 out ng");
			
		#1940
		in <= 0; load <= 0;
		if (out != 1) $display("#1940 out ng");
			
		#1960
		in <= 0; load <= 0;
		if (out != 1) $display("#1960 out ng");
			
		#1980
		in <= 0; load <= 0;
		if (out != 1) $display("#1980 out ng");
			
		#2000
		in <= 0; load <= 0;
		if (out != 1) $display("#2000 out ng");
			
		#2020
		in <= 0; load <= 0;
		if (out != 1) $display("#2020 out ng");
			
		#2040
		in <= 0; load <= 0;
		if (out != 1) $display("#2040 out ng");
			
		#2060
		in <= 0; load <= 0;
		if (out != 1) $display("#2060 out ng");
			
		#2080
		in <= 0; load <= 0;
		if (out != 1) $display("#2080 out ng");
			
		#2100
		in <= 0; load <= 0;
		if (out != 1) $display("#2100 out ng");
			
		#2120
		in <= 0; load <= 0;
		if (out != 1) $display("#2120 out ng");
			
		#2140
		in <= 0; load <= 0;
		if (out != 1) $display("#2140 out ng");
			
		#2160
		in <= 0; load <= 0;
		if (out != 1) $display("#2160 out ng");
			
		#2180
		in <= 0; load <= 0;
		if (out != 1) $display("#2180 out ng");
			
		#2200
		in <= 0; load <= 0;
		if (out != 1) $display("#2200 out ng");
			
		#2220
		in <= 0; load <= 0;
		if (out != 1) $display("#2220 out ng");
			
		#2240
		in <= 0; load <= 0;
		if (out != 1) $display("#2240 out ng");
			
		#2260
		in <= 0; load <= 0;
		if (out != 1) $display("#2260 out ng");
			
		#2280
		in <= 0; load <= 0;
		if (out != 1) $display("#2280 out ng");
			
		#2300
		in <= 0; load <= 0;
		if (out != 1) $display("#2300 out ng");
			
		#2320
		in <= 0; load <= 0;
		if (out != 1) $display("#2320 out ng");
			
		#2340
		in <= 0; load <= 0;
		if (out != 1) $display("#2340 out ng");
			
		#2360
		in <= 0; load <= 0;
		if (out != 1) $display("#2360 out ng");
			
		#2380
		in <= 0; load <= 0;
		if (out != 1) $display("#2380 out ng");
			
		#2400
		in <= 0; load <= 0;
		if (out != 1) $display("#2400 out ng");
			
		#2420
		in <= 0; load <= 0;
		if (out != 1) $display("#2420 out ng");
			
		#2440
		in <= 0; load <= 0;
		if (out != 1) $display("#2440 out ng");
			
		#2460
		in <= 0; load <= 0;
		if (out != 1) $display("#2460 out ng");
			
		#2480
		in <= 0; load <= 0;
		if (out != 1) $display("#2480 out ng");
			
		#2500
		in <= 0; load <= 0;
		if (out != 1) $display("#2500 out ng");
			
		#2520
		in <= 0; load <= 0;
		if (out != 1) $display("#2520 out ng");
			
		#2540
		in <= 0; load <= 0;
		if (out != 1) $display("#2540 out ng");
			
		#2560
		in <= 0; load <= 0;
		if (out != 1) $display("#2560 out ng");
			
		#2580
		in <= 0; load <= 0;
		if (out != 1) $display("#2580 out ng");
			
		#2600
		in <= 0; load <= 0;
		if (out != 1) $display("#2600 out ng");
			
		#2620
		in <= 0; load <= 0;
		if (out != 1) $display("#2620 out ng");
			
		#2640
		in <= 0; load <= 0;
		if (out != 1) $display("#2640 out ng");
			
		#2660
		in <= 0; load <= 0;
		if (out != 1) $display("#2660 out ng");
			
		#2680
		in <= 0; load <= 0;
		if (out != 1) $display("#2680 out ng");
			
		#2700
		in <= 0; load <= 0;
		if (out != 1) $display("#2700 out ng");
			
		#2720
		in <= 0; load <= 0;
		if (out != 1) $display("#2720 out ng");
			
		#2740
		in <= 0; load <= 0;
		if (out != 1) $display("#2740 out ng");
			
		#2760
		in <= 0; load <= 0;
		if (out != 1) $display("#2760 out ng");
			
		#2780
		in <= 0; load <= 0;
		if (out != 1) $display("#2780 out ng");
			
		#2800
		in <= 0; load <= 0;
		if (out != 1) $display("#2800 out ng");
			
		#2820
		in <= 0; load <= 0;
		if (out != 1) $display("#2820 out ng");
			
		#2840
		in <= 0; load <= 0;
		if (out != 1) $display("#2840 out ng");
			
		#2860
		in <= 0; load <= 0;
		if (out != 1) $display("#2860 out ng");
			
		#2880
		in <= 0; load <= 0;
		if (out != 1) $display("#2880 out ng");
			
		#2900
		in <= 0; load <= 0;
		if (out != 1) $display("#2900 out ng");
			
		#2920
		in <= 0; load <= 0;
		if (out != 1) $display("#2920 out ng");
			
		#2940
		in <= 0; load <= 0;
		if (out != 1) $display("#2940 out ng");
			
		#2960
		in <= 0; load <= 0;
		if (out != 1) $display("#2960 out ng");
			
		#2980
		in <= 0; load <= 0;
		if (out != 1) $display("#2980 out ng");
			
		#3000
		in <= 0; load <= 0;
		if (out != 1) $display("#3000 out ng");
			
		#3020
		in <= 0; load <= 0;
		if (out != 1) $display("#3020 out ng");
			
		#3040
		in <= 0; load <= 0;
		if (out != 1) $display("#3040 out ng");
			
		#3060
		in <= 0; load <= 0;
		if (out != 1) $display("#3060 out ng");
			
		#3080
		in <= 0; load <= 0;
		if (out != 1) $display("#3080 out ng");
			
		#3100
		in <= 0; load <= 0;
		if (out != 1) $display("#3100 out ng");
			
		#3120
		in <= 0; load <= 0;
		if (out != 1) $display("#3120 out ng");
			
		#3140
		in <= 0; load <= 0;
		if (out != 1) $display("#3140 out ng");
			
		#3160
		in <= 0; load <= 0;
		if (out != 1) $display("#3160 out ng");
			
		#3180
		in <= 0; load <= 0;
		if (out != 1) $display("#3180 out ng");
			
		#3200
		in <= 0; load <= 0;
		if (out != 1) $display("#3200 out ng");
			
		#3220
		in <= 0; load <= 0;
		if (out != 1) $display("#3220 out ng");
			
		#3240
		in <= 0; load <= 0;
		if (out != 1) $display("#3240 out ng");
			
		#3260
		in <= 0; load <= 0;
		if (out != 1) $display("#3260 out ng");
			
		#3280
		in <= 0; load <= 1;
		if (out != 1) $display("#3280 out ng");
			
		#3300
		in <= 0; load <= 1;
		if (out != 0) $display("#3300 out ng");
			
		#3320
		in <= 1; load <= 0;
		if (out != 0) $display("#3320 out ng");
			
		#3340
		in <= 1; load <= 0;
		if (out != 0) $display("#3340 out ng");
			
		#3360
		in <= 1; load <= 0;
		if (out != 0) $display("#3360 out ng");
			
		#3380
		in <= 1; load <= 0;
		if (out != 0) $display("#3380 out ng");
			
		#3400
		in <= 1; load <= 0;
		if (out != 0) $display("#3400 out ng");
			
		#3420
		in <= 1; load <= 0;
		if (out != 0) $display("#3420 out ng");
			
		#3440
		in <= 1; load <= 0;
		if (out != 0) $display("#3440 out ng");
			
		#3460
		in <= 1; load <= 0;
		if (out != 0) $display("#3460 out ng");
			
		#3480
		in <= 1; load <= 0;
		if (out != 0) $display("#3480 out ng");
			
		#3500
		in <= 1; load <= 0;
		if (out != 0) $display("#3500 out ng");
			
		#3520
		in <= 1; load <= 0;
		if (out != 0) $display("#3520 out ng");
			
		#3540
		in <= 1; load <= 0;
		if (out != 0) $display("#3540 out ng");
			
		#3560
		in <= 1; load <= 0;
		if (out != 0) $display("#3560 out ng");
			
		#3580
		in <= 1; load <= 0;
		if (out != 0) $display("#3580 out ng");
			
		#3600
		in <= 1; load <= 0;
		if (out != 0) $display("#3600 out ng");
			
		#3620
		in <= 1; load <= 0;
		if (out != 0) $display("#3620 out ng");
			
		#3640
		in <= 1; load <= 0;
		if (out != 0) $display("#3640 out ng");
			
		#3660
		in <= 1; load <= 0;
		if (out != 0) $display("#3660 out ng");
			
		#3680
		in <= 1; load <= 0;
		if (out != 0) $display("#3680 out ng");
			
		#3700
		in <= 1; load <= 0;
		if (out != 0) $display("#3700 out ng");
			
		#3720
		in <= 1; load <= 0;
		if (out != 0) $display("#3720 out ng");
			
		#3740
		in <= 1; load <= 0;
		if (out != 0) $display("#3740 out ng");
			
		#3760
		in <= 1; load <= 0;
		if (out != 0) $display("#3760 out ng");
			
		#3780
		in <= 1; load <= 0;
		if (out != 0) $display("#3780 out ng");
			
		#3800
		in <= 1; load <= 0;
		if (out != 0) $display("#3800 out ng");
			
		#3820
		in <= 1; load <= 0;
		if (out != 0) $display("#3820 out ng");
			
		#3840
		in <= 1; load <= 0;
		if (out != 0) $display("#3840 out ng");
			
		#3860
		in <= 1; load <= 0;
		if (out != 0) $display("#3860 out ng");
			
		#3880
		in <= 1; load <= 0;
		if (out != 0) $display("#3880 out ng");
			
		#3900
		in <= 1; load <= 0;
		if (out != 0) $display("#3900 out ng");
			
		#3920
		in <= 1; load <= 0;
		if (out != 0) $display("#3920 out ng");
			
		#3940
		in <= 1; load <= 0;
		if (out != 0) $display("#3940 out ng");
			
		#3960
		in <= 1; load <= 0;
		if (out != 0) $display("#3960 out ng");
			
		#3980
		in <= 1; load <= 0;
		if (out != 0) $display("#3980 out ng");
			
		#4000
		in <= 1; load <= 0;
		if (out != 0) $display("#4000 out ng");
			
		#4020
		in <= 1; load <= 0;
		if (out != 0) $display("#4020 out ng");
			
		#4040
		in <= 1; load <= 0;
		if (out != 0) $display("#4040 out ng");
			
		#4060
		in <= 1; load <= 0;
		if (out != 0) $display("#4060 out ng");
			
		#4080
		in <= 1; load <= 0;
		if (out != 0) $display("#4080 out ng");
			
		#4100
		in <= 1; load <= 0;
		if (out != 0) $display("#4100 out ng");
			
		#4120
		in <= 1; load <= 0;
		if (out != 0) $display("#4120 out ng");
			
		#4140
		in <= 1; load <= 0;
		if (out != 0) $display("#4140 out ng");
			
		#4160
		in <= 1; load <= 0;
		if (out != 0) $display("#4160 out ng");
			
		#4180
		in <= 1; load <= 0;
		if (out != 0) $display("#4180 out ng");
			
		#4200
		in <= 1; load <= 0;
		if (out != 0) $display("#4200 out ng");
			
		#4220
		in <= 1; load <= 0;
		if (out != 0) $display("#4220 out ng");
			
		#4240
		in <= 1; load <= 0;
		if (out != 0) $display("#4240 out ng");
			
		#4260
		in <= 1; load <= 0;
		if (out != 0) $display("#4260 out ng");
			
		#4280
		in <= 1; load <= 0;
		if (out != 0) $display("#4280 out ng");
			
		#4300
		in <= 1; load <= 0;
		if (out != 0) $display("#4300 out ng");
			
		#4320
		in <= 1; load <= 0;
		if (out != 0) $display("#4320 out ng");
			
		#4340
		in <= 1; load <= 0;
		if (out != 0) $display("#4340 out ng");
			
		#4360
		in <= 1; load <= 0;
		if (out != 0) $display("#4360 out ng");
			
		#4380
		in <= 1; load <= 0;
		if (out != 0) $display("#4380 out ng");
			
		#4400
		in <= 1; load <= 0;
		if (out != 0) $display("#4400 out ng");
			
		#4420
		in <= 1; load <= 0;
		if (out != 0) $display("#4420 out ng");
			
		#4440
		in <= 1; load <= 0;
		if (out != 0) $display("#4440 out ng");
			
		#4460
		in <= 1; load <= 0;
		if (out != 0) $display("#4460 out ng");
			
		#4480
		in <= 1; load <= 0;
		if (out != 0) $display("#4480 out ng");
			
		#4500
		in <= 1; load <= 0;
		if (out != 0) $display("#4500 out ng");
			
		#4520
		in <= 1; load <= 0;
		if (out != 0) $display("#4520 out ng");
			
		#4540
		in <= 1; load <= 0;
		if (out != 0) $display("#4540 out ng");
			
		#4560
		in <= 1; load <= 0;
		if (out != 0) $display("#4560 out ng");
			
		#4580
		in <= 1; load <= 0;
		if (out != 0) $display("#4580 out ng");
			
		#4600
		in <= 1; load <= 0;
		if (out != 0) $display("#4600 out ng");
			
		#4620
		in <= 1; load <= 0;
		if (out != 0) $display("#4620 out ng");
			
		#4640
		in <= 1; load <= 0;
		if (out != 0) $display("#4640 out ng");
			
		#4660
		in <= 1; load <= 0;
		if (out != 0) $display("#4660 out ng");
			
		#4680
		in <= 1; load <= 0;
		if (out != 0) $display("#4680 out ng");
			
		#4700
		in <= 1; load <= 0;
		if (out != 0) $display("#4700 out ng");
			
		#4720
		in <= 1; load <= 0;
		if (out != 0) $display("#4720 out ng");
			
		#4740
		in <= 1; load <= 0;
		if (out != 0) $display("#4740 out ng");
			
		#4760
		in <= 1; load <= 0;
		if (out != 0) $display("#4760 out ng");
			
		#4780
		in <= 1; load <= 0;
		if (out != 0) $display("#4780 out ng");
			
		#4800
		in <= 1; load <= 0;
		if (out != 0) $display("#4800 out ng");
			
		#4820
		in <= 1; load <= 0;
		if (out != 0) $display("#4820 out ng");
			
		#4840
		in <= 1; load <= 0;
		if (out != 0) $display("#4840 out ng");
			
		#4860
		in <= 1; load <= 0;
		if (out != 0) $display("#4860 out ng");
			
		#4880
		in <= 1; load <= 0;
		if (out != 0) $display("#4880 out ng");
			
		#4900
		in <= 1; load <= 0;
		if (out != 0) $display("#4900 out ng");
			
		#4920
		in <= 1; load <= 0;
		if (out != 0) $display("#4920 out ng");
			
		#4940
		in <= 1; load <= 0;
		if (out != 0) $display("#4940 out ng");
			
		#4960
		in <= 1; load <= 0;
		if (out != 0) $display("#4960 out ng");
			
		#4980
		in <= 1; load <= 0;
		if (out != 0) $display("#4980 out ng");
			
		#5000
		in <= 1; load <= 0;
		if (out != 0) $display("#5000 out ng");
			
		#5020
		in <= 1; load <= 0;
		if (out != 0) $display("#5020 out ng");
			
		#5040
		in <= 1; load <= 0;
		if (out != 0) $display("#5040 out ng");
			
		#5060
		in <= 1; load <= 0;
		if (out != 0) $display("#5060 out ng");
			
		#5080
		in <= 1; load <= 0;
		if (out != 0) $display("#5080 out ng");
			
		#5100
		in <= 1; load <= 0;
		if (out != 0) $display("#5100 out ng");
			
		#5120
		in <= 1; load <= 0;
		if (out != 0) $display("#5120 out ng");
			
		#5140
		in <= 1; load <= 0;
		if (out != 0) $display("#5140 out ng");
			
		#5160
		in <= 1; load <= 0;
		if (out != 0) $display("#5160 out ng");
			
		#5180
		in <= 1; load <= 0;
		if (out != 0) $display("#5180 out ng");
			
		#5200
		in <= 1; load <= 0;
		if (out != 0) $display("#5200 out ng");
			
		#5220
		in <= 1; load <= 0;
		if (out != 0) $display("#5220 out ng");
			
		#5240
		in <= 1; load <= 0;
		if (out != 0) $display("#5240 out ng");
			
		#5260
		in <= 1; load <= 0;
		if (out != 0) $display("#5260 out ng");

		#99999
		$display("success!");
		$stop;
	end

endmodule
