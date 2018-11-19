// テストベンチ
// RAM4K
module RAM4K_tb();
	reg clk;
	reg[15:0] in;
	reg[15:0] address;
	reg load;
	reg[15:0] out;

	parameter RATE = 10;

	always #(RATE/2) clk = ~clk;	// Clock Generation

	RAM4K ram4k(
		.clk(clk),
		.in(in),
		.address(address),
		.load(load),
		.out(out)
	);

	initial begin
		$display("start test");

			in <=       16'd0; load <= 0; address <=    16'd0;

		#(RATE)
			if (out !=      16'd0) $display("#1000 out ng");
			in <=       16'd0; load <= 0; address <=    16'd0;

		#(RATE)
			if (out !=      16'd0) $display("#1002 out ng");
			in <=       16'd0; load <= 1; address <=    16'd0;

		#(RATE)
			if (out !=      16'd0) $display("#1004 out ng");
			in <=    16'd1111; load <= 0; address <=    16'd0;

		#(RATE)
			if (out !=      16'd0) $display("#1006 out ng");
			in <=    16'd1111; load <= 1; address <= 16'd1111;

		#(RATE)
			if (out !=      16'd0) $display("#1008 out ng");
			in <=    16'd1111; load <= 0; address <=    16'd0;

		#(RATE)
			if (out !=      16'd0) $display("#1010 out ng");
			in <=    16'd3513; load <= 0; address <= 16'd3513;

		#(RATE)
			if (out !=      16'd0) $display("#1012 out ng");
			in <=    16'd3513; load <= 1; address <= 16'd3513;

		#(RATE)
			if (out !=   16'd3513) $display("#1014 out ng");
			in <=    16'd3513; load <= 0; address <= 16'd3513;

//		#(RATE)
			in =    16'd4095; load = 0; address = 16'd1111;
			if (out !=   16'd1111) $display("#1016 out ng");

		#(RATE)
			if (out !=   16'd1111) $display("#1018 out ng");
			in <=    16'd4095; load <= 1; address <= 16'd4095;

		#(RATE)
			if (out !=   16'd4095) $display("#1020 out ng");
			in <=    16'd4095; load <= 0; address <= 16'd4095;

		#(RATE)
			if (out !=   16'd4095) $display("#1022 out ng");
			in <=    16'd4095; load <= 0; address <= 16'd3513;

		#(RATE)
			if (out !=   16'd4095) $display("#1024 out ng");
			in <=    16'd4095; load <= 0; address <= 16'd2728;

		#(RATE)
			if (out !=      16'd0) $display("#1026 out ng");
			in <=    16'd4095; load <= 0; address <= 16'd2729;

		#(RATE)
			if (out !=      16'd0) $display("#1028 out ng");
			in <=    16'd4095; load <= 0; address <= 16'd2731;

		#(RATE)
			if (out !=      16'd0) $display("#1030 out ng");
			in <=    16'd4095; load <= 0; address <= 16'd2733;

		#(RATE)
			if (out !=      16'd0) $display("#1032 out ng");
			in <=    16'd4095; load <= 0; address <= 16'd2735;

		#(RATE)
			if (out !=      16'd0) $display("#1034 out ng");
			in <=   16'd21845; load <= 1; address <= 16'd2728;

		#(RATE)
			if (out !=      16'd0) $display("#1036 out ng");
			in <=   16'd21845; load <= 1; address <= 16'd2729;

		#(RATE)
			if (out !=      16'd0) $display("#1038 out ng");
			in <=   16'd21845; load <= 1; address <= 16'd2730;

		#(RATE)
			if (out !=      16'd0) $display("#1040 out ng");
			in <=   16'd21845; load <= 1; address <= 16'd2731;

		#(RATE)
			if (out !=      16'd0) $display("#1042 out ng");
			in <=   16'd21845; load <= 1; address <= 16'd2732;

		#(RATE)
			if (out !=      16'd0) $display("#1044 out ng");
			in <=   16'd21845; load <= 1; address <= 16'd2733;

		#(RATE)
			if (out !=      16'd0) $display("#1046 out ng");
			in <=   16'd21845; load <= 1; address <= 16'd2734;

		#(RATE)
			if (out !=      16'd0) $display("#1048 out ng");
			in <=   16'd21845; load <= 1; address <= 16'd2735;

		#(RATE)
			if (out !=  16'd21845) $display("#1050 out ng");
			in <=   16'd21845; load <= 0; address <= 16'd2728;

		#(RATE)
			if (out !=  16'd21845) $display("#1052 out ng");
			in <=   16'd21845; load <= 0; address <= 16'd2730;

		#(RATE)
			if (out !=  16'd21845) $display("#1054 out ng");
			in <=   16'd21845; load <= 0; address <= 16'd2732;

		#(RATE)
			if (out !=  16'd21845) $display("#1056 out ng");
			in <=   16'd21845; load <= 0; address <= 16'd2734;

		#(RATE)
			if (out !=  16'd21845) $display("#1058 out ng");
			in <=  -16'd21846; load <= 1; address <= 16'd2728;

		#(RATE)
			if (out != -16'd21846) $display("#1060 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2728;

		#(RATE)
			if (out != -16'd21846) $display("#1062 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2729;

		#(RATE)
			if (out !=  16'd21845) $display("#1064 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2731;

		#(RATE)
			if (out !=  16'd21845) $display("#1066 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2733;

		#(RATE)
			if (out !=  16'd21845) $display("#1068 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2735;

		#(RATE)
			if (out != -16'd21846) $display("#1070 out ng");
			in <=   16'd21845; load <= 1; address <= 16'd2728;

		#(RATE)
			if (out !=  16'd21845) $display("#1072 out ng");
			in <=  -16'd21846; load <= 1; address <= 16'd2729;

		#(RATE)
			if (out !=  16'd21845) $display("#1074 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2728;

		#(RATE)
			if (out != -16'd21846) $display("#1076 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2730;

		#(RATE)
			if (out !=  16'd21845) $display("#1078 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2732;

		#(RATE)
			if (out !=  16'd21845) $display("#1080 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2734;

		#(RATE)
			if (out !=  16'd21845) $display("#1082 out ng");
			in <=   16'd21845; load <= 1; address <= 16'd2729;

		#(RATE)
			if (out !=  16'd21845) $display("#1084 out ng");
			in <=  -16'd21846; load <= 1; address <= 16'd2730;

		#(RATE)
			if (out != -16'd21846) $display("#1086 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2728;

		#(RATE)
			if (out !=  16'd21845) $display("#1088 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2729;

		#(RATE)
			if (out != -16'd21846) $display("#1090 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2731;

		#(RATE)
			if (out !=  16'd21845) $display("#1092 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2733;

		#(RATE)
			if (out !=  16'd21845) $display("#1094 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2735;

		#(RATE)
			if (out != -16'd21846) $display("#1096 out ng");
			in <=   16'd21845; load <= 1; address <= 16'd2730;

		#(RATE)
			if (out !=  16'd21845) $display("#1098 out ng");
			in <=  -16'd21846; load <= 1; address <= 16'd2731;

		#(RATE)
			if (out !=  16'd21845) $display("#1100 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2728;

		#(RATE)
			if (out !=  16'd21845) $display("#1102 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2730;

		#(RATE)
			if (out != -16'd21846) $display("#1104 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2732;

		#(RATE)
			if (out !=  16'd21845) $display("#1106 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2734;

		#(RATE)
			if (out !=  16'd21845) $display("#1108 out ng");
			in <=   16'd21845; load <= 1; address <= 16'd2731;

		#(RATE)
			if (out !=  16'd21845) $display("#1110 out ng");
			in <=  -16'd21846; load <= 1; address <= 16'd2732;

		#(RATE)
			if (out != -16'd21846) $display("#1112 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2728;

		#(RATE)
			if (out !=  16'd21845) $display("#1114 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2729;

		#(RATE)
			if (out !=  16'd21845) $display("#1116 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2731;

		#(RATE)
			if (out != -16'd21846) $display("#1118 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2733;

		#(RATE)
			if (out !=  16'd21845) $display("#1120 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2735;

		#(RATE)
			if (out != -16'd21846) $display("#1122 out ng");
			in <=   16'd21845; load <= 1; address <= 16'd2732;

		#(RATE)
			if (out !=  16'd21845) $display("#1124 out ng");
			in <=  -16'd21846; load <= 1; address <= 16'd2733;

		#(RATE)
			if (out !=  16'd21845) $display("#1126 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2728;

		#(RATE)
			if (out !=  16'd21845) $display("#1128 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2730;

		#(RATE)
			if (out !=  16'd21845) $display("#1130 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2732;

		#(RATE)
			if (out != -16'd21846) $display("#1132 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2734;

		#(RATE)
			if (out !=  16'd21845) $display("#1134 out ng");
			in <=   16'd21845; load <= 1; address <= 16'd2733;

		#(RATE)
			if (out !=  16'd21845) $display("#1136 out ng");
			in <=  -16'd21846; load <= 1; address <= 16'd2734;

		#(RATE)
			if (out != -16'd21846) $display("#1138 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2728;

		#(RATE)
			if (out !=  16'd21845) $display("#1140 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2729;

		#(RATE)
			if (out !=  16'd21845) $display("#1142 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2731;

		#(RATE)
			if (out !=  16'd21845) $display("#1144 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2733;

		#(RATE)
			if (out != -16'd21846) $display("#1146 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2735;

		#(RATE)
			if (out != -16'd21846) $display("#1148 out ng");
			in <=   16'd21845; load <= 1; address <= 16'd2734;

		#(RATE)
			if (out !=  16'd21845) $display("#1150 out ng");
			in <=  -16'd21846; load <= 1; address <= 16'd2735;

		#(RATE)
			if (out !=  16'd21845) $display("#1152 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2728;

		#(RATE)
			if (out !=  16'd21845) $display("#1154 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2730;

		#(RATE)
			if (out !=  16'd21845) $display("#1156 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2732;

		#(RATE)
			if (out !=  16'd21845) $display("#1158 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2734;

		#(RATE)
			if (out != -16'd21846) $display("#1160 out ng");
			in <=   16'd21845; load <= 1; address <= 16'd2735;

		#(RATE)
			if (out !=  16'd21845) $display("#1162 out ng");
			in <=   16'd21845; load <= 0; address <= 16'd2728;

		#(RATE)
			if (out !=  16'd21845) $display("#1164 out ng");
			in <=   16'd21845; load <= 0; address <= 16'd2729;

		#(RATE)
			if (out !=  16'd21845) $display("#1166 out ng");
			in <=   16'd21845; load <= 0; address <= 16'd2731;

		#(RATE)
			if (out !=  16'd21845) $display("#1168 out ng");
			in <=   16'd21845; load <= 0; address <= 16'd2733;

		#(RATE)
			if (out !=  16'd21845) $display("#1170 out ng");
			in <=   16'd21845; load <= 0; address <= 16'd2735;

		#(RATE)
			if (out !=      16'd0) $display("#1172 out ng");
			in <=   16'd21845; load <= 0; address <=  16'd341;

		#(RATE)
			if (out !=      16'd0) $display("#1174 out ng");
			in <=   16'd21845; load <= 0; address <= 16'd1365;

		#(RATE)
			if (out !=      16'd0) $display("#1176 out ng");
			in <=   16'd21845; load <= 0; address <= 16'd2389;

		#(RATE)
			if (out !=      16'd0) $display("#1178 out ng");
			in <=   16'd21845; load <= 0; address <= 16'd3413;

		#(RATE)
			if (out !=      16'd0) $display("#1180 out ng");
			in <=   16'd21845; load <= 1; address <=  16'd341;

		#(RATE)
			if (out !=  16'd21845) $display("#1182 out ng");
			in <=   16'd21845; load <= 1; address <=  16'd853;

		#(RATE)
			if (out !=  16'd21845) $display("#1184 out ng");
			in <=   16'd21845; load <= 1; address <= 16'd1365;

		#(RATE)
			if (out !=  16'd21845) $display("#1186 out ng");
			in <=   16'd21845; load <= 1; address <= 16'd1877;

		#(RATE)
			if (out !=  16'd21845) $display("#1188 out ng");
			in <=   16'd21845; load <= 1; address <= 16'd2389;

		#(RATE)
			if (out !=  16'd21845) $display("#1190 out ng");
			in <=   16'd21845; load <= 1; address <= 16'd2901;

		#(RATE)
			if (out !=  16'd21845) $display("#1192 out ng");
			in <=   16'd21845; load <= 1; address <= 16'd3413;

		#(RATE)
			if (out !=  16'd21845) $display("#1194 out ng");
			in <=   16'd21845; load <= 1; address <= 16'd3925;

		#(RATE)
			if (out !=  16'd21845) $display("#1196 out ng");
			in <=   16'd21845; load <= 0; address <=  16'd341;

		#(RATE)
			if (out !=  16'd21845) $display("#1198 out ng");
			in <=   16'd21845; load <= 0; address <=  16'd853;

		#(RATE)
			if (out !=  16'd21845) $display("#1200 out ng");
			in <=   16'd21845; load <= 0; address <= 16'd1877;

		#(RATE)
			if (out !=  16'd21845) $display("#1202 out ng");
			in <=   16'd21845; load <= 0; address <= 16'd2901;

		#(RATE)
			if (out !=  16'd21845) $display("#1204 out ng");
			in <=   16'd21845; load <= 0; address <= 16'd3925;

		#(RATE)
			if (out !=  16'd21845) $display("#1206 out ng");
			in <=  -16'd21846; load <= 1; address <=  16'd341;

		#(RATE)
			if (out != -16'd21846) $display("#1208 out ng");
			in <=  -16'd21846; load <= 0; address <=  16'd341;

		#(RATE)
			if (out !=  16'd21845) $display("#1210 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd1365;

		#(RATE)
			if (out !=  16'd21845) $display("#1212 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2389;

		#(RATE)
			if (out !=  16'd21845) $display("#1214 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd3413;

		#(RATE)
			if (out !=  16'd21845) $display("#1216 out ng");
			in <=   16'd21845; load <= 1; address <=  16'd341;

		#(RATE)
			if (out !=  16'd21845) $display("#1218 out ng");
			in <=  -16'd21846; load <= 1; address <=  16'd853;

		#(RATE)
			if (out != -16'd21846) $display("#1220 out ng");
			in <=  -16'd21846; load <= 0; address <=  16'd341;

		#(RATE)
			if (out !=  16'd21845) $display("#1222 out ng");
			in <=  -16'd21846; load <= 0; address <=  16'd853;

		#(RATE)
			if (out !=  16'd21845) $display("#1224 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd1877;

		#(RATE)
			if (out !=  16'd21845) $display("#1226 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2901;

		#(RATE)
			if (out !=  16'd21845) $display("#1228 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd3925;

		#(RATE)
			if (out != -16'd21846) $display("#1230 out ng");
			in <=   16'd21845; load <= 1; address <=  16'd853;

		#(RATE)
			if (out !=  16'd21845) $display("#1232 out ng");
			in <=  -16'd21846; load <= 1; address <= 16'd1365;

		#(RATE)
			if (out !=  16'd21845) $display("#1234 out ng");
			in <=  -16'd21846; load <= 0; address <=  16'd341;

		#(RATE)
			if (out !=  16'd21845) $display("#1236 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd1365;

		#(RATE)
			if (out !=  16'd21845) $display("#1238 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2389;

		#(RATE)
			if (out !=  16'd21845) $display("#1240 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd3413;

		#(RATE)
			if (out !=  16'd21845) $display("#1242 out ng");
			in <=   16'd21845; load <= 1; address <= 16'd1365;

		#(RATE)
			if (out !=  16'd21845) $display("#1244 out ng");
			in <=  -16'd21846; load <= 1; address <= 16'd1877;

		#(RATE)
			if (out != -16'd21846) $display("#1246 out ng");
			in <=  -16'd21846; load <= 0; address <=  16'd341;

		#(RATE)
			if (out !=  16'd21845) $display("#1248 out ng");
			in <=  -16'd21846; load <= 0; address <=  16'd853;

		#(RATE)
			if (out !=  16'd21845) $display("#1250 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd1877;

		#(RATE)
			if (out !=  16'd21845) $display("#1252 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2901;

		#(RATE)
			if (out !=  16'd21845) $display("#1254 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd3925;

		#(RATE)
			if (out != -16'd21846) $display("#1256 out ng");
			in <=   16'd21845; load <= 1; address <= 16'd1877;

		#(RATE)
			if (out !=  16'd21845) $display("#1258 out ng");
			in <=  -16'd21846; load <= 1; address <= 16'd2389;

		#(RATE)
			if (out !=  16'd21845) $display("#1260 out ng");
			in <=  -16'd21846; load <= 0; address <=  16'd341;

		#(RATE)
			if (out !=  16'd21845) $display("#1262 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd1365;

		#(RATE)
			if (out !=  16'd21845) $display("#1264 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2389;

		#(RATE)
			if (out !=  16'd21845) $display("#1266 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd3413;

		#(RATE)
			if (out !=  16'd21845) $display("#1268 out ng");
			in <=   16'd21845; load <= 1; address <= 16'd2389;

		#(RATE)
			if (out !=  16'd21845) $display("#1270 out ng");
			in <=  -16'd21846; load <= 1; address <= 16'd2901;

		#(RATE)
			if (out != -16'd21846) $display("#1272 out ng");
			in <=  -16'd21846; load <= 0; address <=  16'd341;

		#(RATE)
			if (out !=  16'd21845) $display("#1274 out ng");
			in <=  -16'd21846; load <= 0; address <=  16'd853;

		#(RATE)
			if (out !=  16'd21845) $display("#1276 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd1877;

		#(RATE)
			if (out !=  16'd21845) $display("#1278 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2901;

		#(RATE)
			if (out !=  16'd21845) $display("#1280 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd3925;

		#(RATE)
			if (out != -16'd21846) $display("#1282 out ng");
			in <=   16'd21845; load <= 1; address <= 16'd2901;

		#(RATE)
			if (out !=  16'd21845) $display("#1284 out ng");
			in <=  -16'd21846; load <= 1; address <= 16'd3413;

		#(RATE)
			if (out !=  16'd21845) $display("#1286 out ng");
			in <=  -16'd21846; load <= 0; address <=  16'd341;

		#(RATE)
			if (out !=  16'd21845) $display("#1288 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd1365;

		#(RATE)
			if (out !=  16'd21845) $display("#1290 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2389;

		#(RATE)
			if (out !=  16'd21845) $display("#1292 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd3413;

		#(RATE)
			if (out !=  16'd21845) $display("#1294 out ng");
			in <=   16'd21845; load <= 1; address <= 16'd3413;

		#(RATE)
			if (out !=  16'd21845) $display("#1296 out ng");
			in <=  -16'd21846; load <= 1; address <= 16'd3925;

		#(RATE)
			if (out != -16'd21846) $display("#1298 out ng");
			in <=  -16'd21846; load <= 0; address <=  16'd341;

		#(RATE)
			if (out !=  16'd21845) $display("#1300 out ng");
			in <=  -16'd21846; load <= 0; address <=  16'd853;

		#(RATE)
			if (out !=  16'd21845) $display("#1302 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd1877;

		#(RATE)
			if (out !=  16'd21845) $display("#1304 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd2901;

		#(RATE)
			if (out !=  16'd21845) $display("#1306 out ng");
			in <=  -16'd21846; load <= 0; address <= 16'd3925;

		#(RATE)
			if (out != -16'd21846) $display("#1308 out ng");
			in <=   16'd21845; load <= 1; address <= 16'd3925;

		#(RATE)
			if (out !=  16'd21845) $display("#1310 out ng");
			in <=   16'd21845; load <= 0; address <=  16'd341;

		#(RATE)
			if (out !=  16'd21845) $display("#1312 out ng");
			in <=   16'd21845; load <= 0; address <= 16'd1365;

		#(RATE)
			if (out !=  16'd21845) $display("#1314 out ng");
			in <=   16'd21845; load <= 0; address <= 16'd2389;

		#(RATE)
			if (out !=  16'd21845) $display("#1316 out ng");
			in <=   16'd21845; load <= 0; address <= 16'd3413;

		#(RATE)
			if (out !=  16'd21845) $display("#1318 out ng");

		#99999
		$display("success!");
		$stop;
	end

endmodule
