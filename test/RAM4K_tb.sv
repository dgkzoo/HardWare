// テストベンチ
// RAM4K
module RAM4K_tb();
	reg clk;
	reg[15:0] in;
	reg[15:0] address;
	reg load;
	wire[15:0] out;

	always #1 clk = !clk;

	RAM4K ram4k(
		.clk(clk),
		.in(in),
		.address(address),
		.load(load),
		.out(out)
	);

	initial begin
		$display("start test");
		clk <= 1;
		in <= 16'd0;
		load <= 0;
		address <= 16'd0;

		#1000
			in <=       16'd0; load <= 0; address <=    16'd0;
			if (out !=      16'd0) $display("#1000 out ng");
		#1001
			in <=       16'd0; load <= 0; address <=    16'd0;
			if (out !=      16'd0) $display("#1001 out ng");
		#1002
			in <=       16'd0; load <= 1; address <=    16'd0;
			if (out !=      16'd0) $display("#1002 out ng");
		#1003
			in <=       16'd0; load <= 1; address <=    16'd0;
			if (out !=      16'd0) $display("#1003 out ng");
		#1004
			in <=    16'd1111; load <= 0; address <=    16'd0;
			if (out !=      16'd0) $display("#1004 out ng");
		#1005
			in <=    16'd1111; load <= 0; address <=    16'd0;
			if (out !=      16'd0) $display("#1005 out ng");
		#1006
			in <=    16'd1111; load <= 1; address <= 16'd1111;
			if (out !=      16'd0) $display("#1006 out ng");
		#1007
			in <=    16'd1111; load <= 1; address <= 16'd1111;
			if (out !=   16'd1111) $display("#1007 out ng");
		#1008
			in <=    16'd1111; load <= 0; address <=    16'd0;
			if (out !=      16'd0) $display("#1008 out ng");
		#1009
			in <=    16'd1111; load <= 0; address <=    16'd0;
			if (out !=      16'd0) $display("#1009 out ng");
		#1010
			in <=    16'd3513; load <= 0; address <= 16'd3513;
			if (out !=      16'd0) $display("#1010 out ng");
		#1011
			in <=    16'd3513; load <= 0; address <= 16'd3513;
			if (out !=      16'd0) $display("#1011 out ng");
		#1012
			in <=    16'd3513; load <= 1; address <= 16'd3513;
			if (out !=      16'd0) $display("#1012 out ng");
		#1013
			in <=    16'd3513; load <= 1; address <= 16'd3513;
			if (out !=   16'd3513) $display("#1013 out ng");
		#1014
			in <=    16'd3513; load <= 0; address <= 16'd3513;
			if (out !=   16'd3513) $display("#1014 out ng");
		#1015
			in <=    16'd3513; load <= 0; address <= 16'd3513;
			if (out !=   16'd3513) $display("#1015 out ng");
		#1016
			in <=    16'd3513; load <= 0; address <= 16'd1111;
			if (out !=   16'd1111) $display("#1016 out ng");
		#1017
			in <=    16'd4095; load <= 0; address <= 16'd1111;
			if (out !=   16'd1111) $display("#1017 out ng");
		#1018
			in <=    16'd4095; load <= 0; address <= 16'd1111;
			if (out !=   16'd1111) $display("#1018 out ng");
		#1019
			in <=    16'd4095; load <= 1; address <= 16'd4095;
			if (out !=      16'd0) $display("#1019 out ng");
		#1020
			in <=    16'd4095; load <= 1; address <= 16'd4095;
			if (out !=   16'd4095) $display("#1020 out ng");
		#1021
			in <=    16'd4095; load <= 0; address <= 16'd4095;
			if (out !=   16'd4095) $display("#1021 out ng");
		#1022
			in <=    16'd4095; load <= 0; address <= 16'd4095;
			if (out !=   16'd4095) $display("#1022 out ng");
		#1023
			in <=    16'd4095; load <= 0; address <= 16'd3513;
			if (out !=   16'd3513) $display("#1023 out ng");
		#1024
			in <=    16'd4095; load <= 0; address <= 16'd4095;
			if (out !=   16'd4095) $display("#1024 out ng");
		#1025
			in <=    16'd4095; load <= 0; address <= 16'd2728;
			if (out !=      16'd0) $display("#1025 out ng");
		#1026
			in <=    16'd4095; load <= 0; address <= 16'd2728;
			if (out !=      16'd0) $display("#1026 out ng");
		#1027
			in <=    16'd4095; load <= 0; address <= 16'd2729;
			if (out !=      16'd0) $display("#1027 out ng");
		#1028
			in <=    16'd4095; load <= 0; address <= 16'd2730;
			if (out !=      16'd0) $display("#1028 out ng");
		#1029
			in <=    16'd4095; load <= 0; address <= 16'd2731;
			if (out !=      16'd0) $display("#1029 out ng");
		#1030
			in <=    16'd4095; load <= 0; address <= 16'd2732;
			if (out !=      16'd0) $display("#1030 out ng");
		#1031
			in <=    16'd4095; load <= 0; address <= 16'd2733;
			if (out !=      16'd0) $display("#1031 out ng");
		#1032
			in <=    16'd4095; load <= 0; address <= 16'd2734;
			if (out !=      16'd0) $display("#1032 out ng");
		#1033
			in <=    16'd4095; load <= 0; address <= 16'd2735;
			if (out !=      16'd0) $display("#1033 out ng");
		#1034
			in <=   16'd21845; load <= 1; address <= 16'd2728;
			if (out !=      16'd0) $display("#1034 out ng");
		#1035
			in <=   16'd21845; load <= 1; address <= 16'd2728;
			if (out !=  16'd21845) $display("#1035 out ng");
		#1036
			in <=   16'd21845; load <= 1; address <= 16'd2729;
			if (out !=      16'd0) $display("#1036 out ng");
		#1037
			in <=   16'd21845; load <= 1; address <= 16'd2729;
			if (out !=  16'd21845) $display("#1037 out ng");
		#1038
			in <=   16'd21845; load <= 1; address <= 16'd2730;
			if (out !=      16'd0) $display("#1038 out ng");
		#1039
			in <=   16'd21845; load <= 1; address <= 16'd2730;
			if (out !=  16'd21845) $display("#1039 out ng");
		#1040
			in <=   16'd21845; load <= 1; address <= 16'd2731;
			if (out !=      16'd0) $display("#1040 out ng");
		#1041
			in <=   16'd21845; load <= 1; address <= 16'd2731;
			if (out !=  16'd21845) $display("#1041 out ng");
		#1042
			in <=   16'd21845; load <= 1; address <= 16'd2732;
			if (out !=      16'd0) $display("#1042 out ng");
		#1043
			in <=   16'd21845; load <= 1; address <= 16'd2732;
			if (out !=  16'd21845) $display("#1043 out ng");
		#1044
			in <=   16'd21845; load <= 1; address <= 16'd2733;
			if (out !=      16'd0) $display("#1044 out ng");
		#1045
			in <=   16'd21845; load <= 1; address <= 16'd2733;
			if (out !=  16'd21845) $display("#1045 out ng");
		#1046
			in <=   16'd21845; load <= 1; address <= 16'd2734;
			if (out !=      16'd0) $display("#1046 out ng");
		#1047
			in <=   16'd21845; load <= 1; address <= 16'd2734;
			if (out !=  16'd21845) $display("#1047 out ng");
		#1048
			in <=   16'd21845; load <= 1; address <= 16'd2735;
			if (out !=      16'd0) $display("#1048 out ng");
		#1049
			in <=   16'd21845; load <= 1; address <= 16'd2735;
			if (out !=  16'd21845) $display("#1049 out ng");
		#1050
			in <=   16'd21845; load <= 0; address <= 16'd2728;
			if (out !=  16'd21845) $display("#1050 out ng");
		#1051
			in <=   16'd21845; load <= 0; address <= 16'd2728;
			if (out !=  16'd21845) $display("#1051 out ng");
		#1052
			in <=   16'd21845; load <= 0; address <= 16'd2729;
			if (out !=  16'd21845) $display("#1052 out ng");
		#1053
			in <=   16'd21845; load <= 0; address <= 16'd2730;
			if (out !=  16'd21845) $display("#1053 out ng");
		#1054
			in <=   16'd21845; load <= 0; address <= 16'd2731;
			if (out !=  16'd21845) $display("#1054 out ng");
		#1055
			in <=   16'd21845; load <= 0; address <= 16'd2732;
			if (out !=  16'd21845) $display("#1055 out ng");
		#1056
			in <=   16'd21845; load <= 0; address <= 16'd2733;
			if (out !=  16'd21845) $display("#1056 out ng");
		#1057
			in <=   16'd21845; load <= 0; address <= 16'd2734;
			if (out !=  16'd21845) $display("#1057 out ng");
		#1058
			in <=   16'd21845; load <= 0; address <= 16'd2735;
			if (out !=  16'd21845) $display("#1058 out ng");
		#1059
			in <=  -16'd21846; load <= 1; address <= 16'd2728;
			if (out !=  16'd21845) $display("#1059 out ng");
		#1060
			in <=  -16'd21846; load <= 1; address <= 16'd2728;
			if (out != -16'd21846) $display("#1060 out ng");
		#1061
			in <=  -16'd21846; load <= 0; address <= 16'd2728;
			if (out != -16'd21846) $display("#1061 out ng");
		#1062
			in <=  -16'd21846; load <= 0; address <= 16'd2728;
			if (out != -16'd21846) $display("#1062 out ng");
		#1063
			in <=  -16'd21846; load <= 0; address <= 16'd2729;
			if (out !=  16'd21845) $display("#1063 out ng");
		#1064
			in <=  -16'd21846; load <= 0; address <= 16'd2730;
			if (out !=  16'd21845) $display("#1064 out ng");
		#1065
			in <=  -16'd21846; load <= 0; address <= 16'd2731;
			if (out !=  16'd21845) $display("#1065 out ng");
		#1066
			in <=  -16'd21846; load <= 0; address <= 16'd2732;
			if (out !=  16'd21845) $display("#1066 out ng");
		#1067
			in <=  -16'd21846; load <= 0; address <= 16'd2733;
			if (out !=  16'd21845) $display("#1067 out ng");
		#1068
			in <=  -16'd21846; load <= 0; address <= 16'd2734;
			if (out !=  16'd21845) $display("#1068 out ng");
		#1069
			in <=  -16'd21846; load <= 0; address <= 16'd2735;
			if (out !=  16'd21845) $display("#1069 out ng");
		#1070
			in <=   16'd21845; load <= 1; address <= 16'd2728;
			if (out != -16'd21846) $display("#1070 out ng");
		#1071
			in <=   16'd21845; load <= 1; address <= 16'd2728;
			if (out !=  16'd21845) $display("#1071 out ng");
		#1072
			in <=  -16'd21846; load <= 1; address <= 16'd2729;
			if (out !=  16'd21845) $display("#1072 out ng");
		#1073
			in <=  -16'd21846; load <= 1; address <= 16'd2729;
			if (out != -16'd21846) $display("#1073 out ng");
		#1074
			in <=  -16'd21846; load <= 0; address <= 16'd2728;
			if (out !=  16'd21845) $display("#1074 out ng");
		#1075
			in <=  -16'd21846; load <= 0; address <= 16'd2728;
			if (out !=  16'd21845) $display("#1075 out ng");
		#1076
			in <=  -16'd21846; load <= 0; address <= 16'd2729;
			if (out != -16'd21846) $display("#1076 out ng");
		#1077
			in <=  -16'd21846; load <= 0; address <= 16'd2730;
			if (out !=  16'd21845) $display("#1077 out ng");
		#1078
			in <=  -16'd21846; load <= 0; address <= 16'd2731;
			if (out !=  16'd21845) $display("#1078 out ng");
		#1079
			in <=  -16'd21846; load <= 0; address <= 16'd2732;
			if (out !=  16'd21845) $display("#1079 out ng");
		#1080
			in <=  -16'd21846; load <= 0; address <= 16'd2733;
			if (out !=  16'd21845) $display("#1080 out ng");
		#1081
			in <=  -16'd21846; load <= 0; address <= 16'd2734;
			if (out !=  16'd21845) $display("#1081 out ng");
		#1082
			in <=  -16'd21846; load <= 0; address <= 16'd2735;
			if (out !=  16'd21845) $display("#1082 out ng");
		#1083
			in <=   16'd21845; load <= 1; address <= 16'd2729;
			if (out != -16'd21846) $display("#1083 out ng");
		#1084
			in <=   16'd21845; load <= 1; address <= 16'd2729;
			if (out !=  16'd21845) $display("#1084 out ng");
		#1085
			in <=  -16'd21846; load <= 1; address <= 16'd2730;
			if (out !=  16'd21845) $display("#1085 out ng");
		#1086
			in <=  -16'd21846; load <= 1; address <= 16'd2730;
			if (out != -16'd21846) $display("#1086 out ng");
		#1087
			in <=  -16'd21846; load <= 0; address <= 16'd2728;
			if (out !=  16'd21845) $display("#1087 out ng");
		#1088
			in <=  -16'd21846; load <= 0; address <= 16'd2728;
			if (out !=  16'd21845) $display("#1088 out ng");
		#1089
			in <=  -16'd21846; load <= 0; address <= 16'd2729;
			if (out !=  16'd21845) $display("#1089 out ng");
		#1090
			in <=  -16'd21846; load <= 0; address <= 16'd2730;
			if (out != -16'd21846) $display("#1090 out ng");
		#1091
			in <=  -16'd21846; load <= 0; address <= 16'd2731;
			if (out !=  16'd21845) $display("#1091 out ng");
		#1092
			in <=  -16'd21846; load <= 0; address <= 16'd2732;
			if (out !=  16'd21845) $display("#1092 out ng");
		#1093
			in <=  -16'd21846; load <= 0; address <= 16'd2733;
			if (out !=  16'd21845) $display("#1093 out ng");
		#1094
			in <=  -16'd21846; load <= 0; address <= 16'd2734;
			if (out !=  16'd21845) $display("#1094 out ng");
		#1095
			in <=  -16'd21846; load <= 0; address <= 16'd2735;
			if (out !=  16'd21845) $display("#1095 out ng");
		#1096
			in <=   16'd21845; load <= 1; address <= 16'd2730;
			if (out != -16'd21846) $display("#1096 out ng");
		#1097
			in <=   16'd21845; load <= 1; address <= 16'd2730;
			if (out !=  16'd21845) $display("#1097 out ng");
		#1098
			in <=  -16'd21846; load <= 1; address <= 16'd2731;
			if (out !=  16'd21845) $display("#1098 out ng");
		#1099
			in <=  -16'd21846; load <= 1; address <= 16'd2731;
			if (out != -16'd21846) $display("#1099 out ng");
		#1100
			in <=  -16'd21846; load <= 0; address <= 16'd2728;
			if (out !=  16'd21845) $display("#1100 out ng");
		#1101
			in <=  -16'd21846; load <= 0; address <= 16'd2728;
			if (out !=  16'd21845) $display("#1101 out ng");
		#1102
			in <=  -16'd21846; load <= 0; address <= 16'd2729;
			if (out !=  16'd21845) $display("#1102 out ng");
		#1103
			in <=  -16'd21846; load <= 0; address <= 16'd2730;
			if (out !=  16'd21845) $display("#1103 out ng");
		#1104
			in <=  -16'd21846; load <= 0; address <= 16'd2731;
			if (out != -16'd21846) $display("#1104 out ng");
		#1105
			in <=  -16'd21846; load <= 0; address <= 16'd2732;
			if (out !=  16'd21845) $display("#1105 out ng");
		#1106
			in <=  -16'd21846; load <= 0; address <= 16'd2733;
			if (out !=  16'd21845) $display("#1106 out ng");
		#1107
			in <=  -16'd21846; load <= 0; address <= 16'd2734;
			if (out !=  16'd21845) $display("#1107 out ng");
		#1108
			in <=  -16'd21846; load <= 0; address <= 16'd2735;
			if (out !=  16'd21845) $display("#1108 out ng");
		#1109
			in <=   16'd21845; load <= 1; address <= 16'd2731;
			if (out != -16'd21846) $display("#1109 out ng");
		#1110
			in <=   16'd21845; load <= 1; address <= 16'd2731;
			if (out !=  16'd21845) $display("#1110 out ng");
		#1111
			in <=  -16'd21846; load <= 1; address <= 16'd2732;
			if (out !=  16'd21845) $display("#1111 out ng");
		#1112
			in <=  -16'd21846; load <= 1; address <= 16'd2732;
			if (out != -16'd21846) $display("#1112 out ng");
		#1113
			in <=  -16'd21846; load <= 0; address <= 16'd2728;
			if (out !=  16'd21845) $display("#1113 out ng");
		#1114
			in <=  -16'd21846; load <= 0; address <= 16'd2728;
			if (out !=  16'd21845) $display("#1114 out ng");
		#1115
			in <=  -16'd21846; load <= 0; address <= 16'd2729;
			if (out !=  16'd21845) $display("#1115 out ng");
		#1116
			in <=  -16'd21846; load <= 0; address <= 16'd2730;
			if (out !=  16'd21845) $display("#1116 out ng");
		#1117
			in <=  -16'd21846; load <= 0; address <= 16'd2731;
			if (out !=  16'd21845) $display("#1117 out ng");
		#1118
			in <=  -16'd21846; load <= 0; address <= 16'd2732;
			if (out != -16'd21846) $display("#1118 out ng");
		#1119
			in <=  -16'd21846; load <= 0; address <= 16'd2733;
			if (out !=  16'd21845) $display("#1119 out ng");
		#1120
			in <=  -16'd21846; load <= 0; address <= 16'd2734;
			if (out !=  16'd21845) $display("#1120 out ng");
		#1121
			in <=  -16'd21846; load <= 0; address <= 16'd2735;
			if (out !=  16'd21845) $display("#1121 out ng");
		#1122
			in <=   16'd21845; load <= 1; address <= 16'd2732;
			if (out != -16'd21846) $display("#1122 out ng");
		#1123
			in <=   16'd21845; load <= 1; address <= 16'd2732;
			if (out !=  16'd21845) $display("#1123 out ng");
		#1124
			in <=  -16'd21846; load <= 1; address <= 16'd2733;
			if (out !=  16'd21845) $display("#1124 out ng");
		#1125
			in <=  -16'd21846; load <= 1; address <= 16'd2733;
			if (out != -16'd21846) $display("#1125 out ng");
		#1126
			in <=  -16'd21846; load <= 0; address <= 16'd2728;
			if (out !=  16'd21845) $display("#1126 out ng");
		#1127
			in <=  -16'd21846; load <= 0; address <= 16'd2728;
			if (out !=  16'd21845) $display("#1127 out ng");
		#1128
			in <=  -16'd21846; load <= 0; address <= 16'd2729;
			if (out !=  16'd21845) $display("#1128 out ng");
		#1129
			in <=  -16'd21846; load <= 0; address <= 16'd2730;
			if (out !=  16'd21845) $display("#1129 out ng");
		#1130
			in <=  -16'd21846; load <= 0; address <= 16'd2731;
			if (out !=  16'd21845) $display("#1130 out ng");
		#1131
			in <=  -16'd21846; load <= 0; address <= 16'd2732;
			if (out !=  16'd21845) $display("#1131 out ng");
		#1132
			in <=  -16'd21846; load <= 0; address <= 16'd2733;
			if (out != -16'd21846) $display("#1132 out ng");
		#1133
			in <=  -16'd21846; load <= 0; address <= 16'd2734;
			if (out !=  16'd21845) $display("#1133 out ng");
		#1134
			in <=  -16'd21846; load <= 0; address <= 16'd2735;
			if (out !=  16'd21845) $display("#1134 out ng");
		#1135
			in <=   16'd21845; load <= 1; address <= 16'd2733;
			if (out != -16'd21846) $display("#1135 out ng");
		#1136
			in <=   16'd21845; load <= 1; address <= 16'd2733;
			if (out !=  16'd21845) $display("#1136 out ng");
		#1137
			in <=  -16'd21846; load <= 1; address <= 16'd2734;
			if (out !=  16'd21845) $display("#1137 out ng");
		#1138
			in <=  -16'd21846; load <= 1; address <= 16'd2734;
			if (out != -16'd21846) $display("#1138 out ng");
		#1139
			in <=  -16'd21846; load <= 0; address <= 16'd2728;
			if (out !=  16'd21845) $display("#1139 out ng");
		#1140
			in <=  -16'd21846; load <= 0; address <= 16'd2728;
			if (out !=  16'd21845) $display("#1140 out ng");
		#1141
			in <=  -16'd21846; load <= 0; address <= 16'd2729;
			if (out !=  16'd21845) $display("#1141 out ng");
		#1142
			in <=  -16'd21846; load <= 0; address <= 16'd2730;
			if (out !=  16'd21845) $display("#1142 out ng");
		#1143
			in <=  -16'd21846; load <= 0; address <= 16'd2731;
			if (out !=  16'd21845) $display("#1143 out ng");
		#1144
			in <=  -16'd21846; load <= 0; address <= 16'd2732;
			if (out !=  16'd21845) $display("#1144 out ng");
		#1145
			in <=  -16'd21846; load <= 0; address <= 16'd2733;
			if (out !=  16'd21845) $display("#1145 out ng");
		#1146
			in <=  -16'd21846; load <= 0; address <= 16'd2734;
			if (out != -16'd21846) $display("#1146 out ng");
		#1147
			in <=  -16'd21846; load <= 0; address <= 16'd2735;
			if (out !=  16'd21845) $display("#1147 out ng");
		#1148
			in <=   16'd21845; load <= 1; address <= 16'd2734;
			if (out != -16'd21846) $display("#1148 out ng");
		#1149
			in <=   16'd21845; load <= 1; address <= 16'd2734;
			if (out !=  16'd21845) $display("#1149 out ng");
		#1150
			in <=  -16'd21846; load <= 1; address <= 16'd2735;
			if (out !=  16'd21845) $display("#1150 out ng");
		#1151
			in <=  -16'd21846; load <= 1; address <= 16'd2735;
			if (out != -16'd21846) $display("#1151 out ng");
		#1152
			in <=  -16'd21846; load <= 0; address <= 16'd2728;
			if (out !=  16'd21845) $display("#1152 out ng");
		#1153
			in <=  -16'd21846; load <= 0; address <= 16'd2728;
			if (out !=  16'd21845) $display("#1153 out ng");
		#1154
			in <=  -16'd21846; load <= 0; address <= 16'd2729;
			if (out !=  16'd21845) $display("#1154 out ng");
		#1155
			in <=  -16'd21846; load <= 0; address <= 16'd2730;
			if (out !=  16'd21845) $display("#1155 out ng");
		#1156
			in <=  -16'd21846; load <= 0; address <= 16'd2731;
			if (out !=  16'd21845) $display("#1156 out ng");
		#1157
			in <=  -16'd21846; load <= 0; address <= 16'd2732;
			if (out !=  16'd21845) $display("#1157 out ng");
		#1158
			in <=  -16'd21846; load <= 0; address <= 16'd2733;
			if (out !=  16'd21845) $display("#1158 out ng");
		#1159
			in <=  -16'd21846; load <= 0; address <= 16'd2734;
			if (out !=  16'd21845) $display("#1159 out ng");
		#1160
			in <=  -16'd21846; load <= 0; address <= 16'd2735;
			if (out != -16'd21846) $display("#1160 out ng");
		#1161
			in <=   16'd21845; load <= 1; address <= 16'd2735;
			if (out != -16'd21846) $display("#1161 out ng");
		#1162
			in <=   16'd21845; load <= 1; address <= 16'd2735;
			if (out !=  16'd21845) $display("#1162 out ng");
		#1163
			in <=   16'd21845; load <= 0; address <= 16'd2728;
			if (out !=  16'd21845) $display("#1163 out ng");
		#1164
			in <=   16'd21845; load <= 0; address <= 16'd2728;
			if (out !=  16'd21845) $display("#1164 out ng");
		#1165
			in <=   16'd21845; load <= 0; address <= 16'd2729;
			if (out !=  16'd21845) $display("#1165 out ng");
		#1166
			in <=   16'd21845; load <= 0; address <= 16'd2730;
			if (out !=  16'd21845) $display("#1166 out ng");
		#1167
			in <=   16'd21845; load <= 0; address <= 16'd2731;
			if (out !=  16'd21845) $display("#1167 out ng");
		#1168
			in <=   16'd21845; load <= 0; address <= 16'd2732;
			if (out !=  16'd21845) $display("#1168 out ng");
		#1169
			in <=   16'd21845; load <= 0; address <= 16'd2733;
			if (out !=  16'd21845) $display("#1169 out ng");
		#1170
			in <=   16'd21845; load <= 0; address <= 16'd2734;
			if (out !=  16'd21845) $display("#1170 out ng");
		#1171
			in <=   16'd21845; load <= 0; address <= 16'd2735;
			if (out !=  16'd21845) $display("#1171 out ng");
		#1172
			in <=   16'd21845; load <= 0; address <=  16'd341;
			if (out !=      16'd0) $display("#1172 out ng");
		#1173
			in <=   16'd21845; load <= 0; address <=  16'd341;
			if (out !=      16'd0) $display("#1173 out ng");
		#1174
			in <=   16'd21845; load <= 0; address <=  16'd853;
			if (out !=      16'd0) $display("#1174 out ng");
		#1175
			in <=   16'd21845; load <= 0; address <= 16'd1365;
			if (out !=      16'd0) $display("#1175 out ng");
		#1176
			in <=   16'd21845; load <= 0; address <= 16'd1877;
			if (out !=      16'd0) $display("#1176 out ng");
		#1177
			in <=   16'd21845; load <= 0; address <= 16'd2389;
			if (out !=      16'd0) $display("#1177 out ng");
		#1178
			in <=   16'd21845; load <= 0; address <= 16'd2901;
			if (out !=      16'd0) $display("#1178 out ng");
		#1179
			in <=   16'd21845; load <= 0; address <= 16'd3413;
			if (out !=      16'd0) $display("#1179 out ng");
		#1180
			in <=   16'd21845; load <= 0; address <= 16'd3925;
			if (out !=      16'd0) $display("#1180 out ng");
		#1181
			in <=   16'd21845; load <= 1; address <=  16'd341;
			if (out !=      16'd0) $display("#1181 out ng");
		#1182
			in <=   16'd21845; load <= 1; address <=  16'd341;
			if (out !=  16'd21845) $display("#1182 out ng");
		#1183
			in <=   16'd21845; load <= 1; address <=  16'd853;
			if (out !=      16'd0) $display("#1183 out ng");
		#1184
			in <=   16'd21845; load <= 1; address <=  16'd853;
			if (out !=  16'd21845) $display("#1184 out ng");
		#1185
			in <=   16'd21845; load <= 1; address <= 16'd1365;
			if (out !=      16'd0) $display("#1185 out ng");
		#1186
			in <=   16'd21845; load <= 1; address <= 16'd1365;
			if (out !=  16'd21845) $display("#1186 out ng");
		#1187
			in <=   16'd21845; load <= 1; address <= 16'd1877;
			if (out !=      16'd0) $display("#1187 out ng");
		#1188
			in <=   16'd21845; load <= 1; address <= 16'd1877;
			if (out !=  16'd21845) $display("#1188 out ng");
		#1189
			in <=   16'd21845; load <= 1; address <= 16'd2389;
			if (out !=      16'd0) $display("#1189 out ng");
		#1190
			in <=   16'd21845; load <= 1; address <= 16'd2389;
			if (out !=  16'd21845) $display("#1190 out ng");
		#1191
			in <=   16'd21845; load <= 1; address <= 16'd2901;
			if (out !=      16'd0) $display("#1191 out ng");
		#1192
			in <=   16'd21845; load <= 1; address <= 16'd2901;
			if (out !=  16'd21845) $display("#1192 out ng");
		#1193
			in <=   16'd21845; load <= 1; address <= 16'd3413;
			if (out !=      16'd0) $display("#1193 out ng");
		#1194
			in <=   16'd21845; load <= 1; address <= 16'd3413;
			if (out !=  16'd21845) $display("#1194 out ng");
		#1195
			in <=   16'd21845; load <= 1; address <= 16'd3925;
			if (out !=      16'd0) $display("#1195 out ng");
		#1196
			in <=   16'd21845; load <= 1; address <= 16'd3925;
			if (out !=  16'd21845) $display("#1196 out ng");
		#1197
			in <=   16'd21845; load <= 0; address <=  16'd341;
			if (out !=  16'd21845) $display("#1197 out ng");
		#1198
			in <=   16'd21845; load <= 0; address <=  16'd341;
			if (out !=  16'd21845) $display("#1198 out ng");
		#1199
			in <=   16'd21845; load <= 0; address <=  16'd853;
			if (out !=  16'd21845) $display("#1199 out ng");
		#1200
			in <=   16'd21845; load <= 0; address <= 16'd1365;
			if (out !=  16'd21845) $display("#1200 out ng");
		#1201
			in <=   16'd21845; load <= 0; address <= 16'd1877;
			if (out !=  16'd21845) $display("#1201 out ng");
		#1202
			in <=   16'd21845; load <= 0; address <= 16'd2389;
			if (out !=  16'd21845) $display("#1202 out ng");
		#1203
			in <=   16'd21845; load <= 0; address <= 16'd2901;
			if (out !=  16'd21845) $display("#1203 out ng");
		#1204
			in <=   16'd21845; load <= 0; address <= 16'd3413;
			if (out !=  16'd21845) $display("#1204 out ng");
		#1205
			in <=   16'd21845; load <= 0; address <= 16'd3925;
			if (out !=  16'd21845) $display("#1205 out ng");
		#1206
			in <=  -16'd21846; load <= 1; address <=  16'd341;
			if (out !=  16'd21845) $display("#1206 out ng");
		#1207
			in <=  -16'd21846; load <= 1; address <=  16'd341;
			if (out != -16'd21846) $display("#1207 out ng");
		#1208
			in <=  -16'd21846; load <= 0; address <=  16'd341;
			if (out != -16'd21846) $display("#1208 out ng");
		#1209
			in <=  -16'd21846; load <= 0; address <=  16'd341;
			if (out != -16'd21846) $display("#1209 out ng");
		#1210
			in <=  -16'd21846; load <= 0; address <=  16'd853;
			if (out !=  16'd21845) $display("#1210 out ng");
		#1211
			in <=  -16'd21846; load <= 0; address <= 16'd1365;
			if (out !=  16'd21845) $display("#1211 out ng");
		#1212
			in <=  -16'd21846; load <= 0; address <= 16'd1877;
			if (out !=  16'd21845) $display("#1212 out ng");
		#1213
			in <=  -16'd21846; load <= 0; address <= 16'd2389;
			if (out !=  16'd21845) $display("#1213 out ng");
		#1214
			in <=  -16'd21846; load <= 0; address <= 16'd2901;
			if (out !=  16'd21845) $display("#1214 out ng");
		#1215
			in <=  -16'd21846; load <= 0; address <= 16'd3413;
			if (out !=  16'd21845) $display("#1215 out ng");
		#1216
			in <=  -16'd21846; load <= 0; address <= 16'd3925;
			if (out !=  16'd21845) $display("#1216 out ng");
		#1217
			in <=   16'd21845; load <= 1; address <=  16'd341;
			if (out != -16'd21846) $display("#1217 out ng");
		#1218
			in <=   16'd21845; load <= 1; address <=  16'd341;
			if (out !=  16'd21845) $display("#1218 out ng");
		#1219
			in <=  -16'd21846; load <= 1; address <=  16'd853;
			if (out !=  16'd21845) $display("#1219 out ng");
		#1220
			in <=  -16'd21846; load <= 1; address <=  16'd853;
			if (out != -16'd21846) $display("#1220 out ng");
		#1221
			in <=  -16'd21846; load <= 0; address <=  16'd341;
			if (out !=  16'd21845) $display("#1221 out ng");
		#1222
			in <=  -16'd21846; load <= 0; address <=  16'd341;
			if (out !=  16'd21845) $display("#1222 out ng");
		#1223
			in <=  -16'd21846; load <= 0; address <=  16'd853;
			if (out != -16'd21846) $display("#1223 out ng");
		#1224
			in <=  -16'd21846; load <= 0; address <= 16'd1365;
			if (out !=  16'd21845) $display("#1224 out ng");
		#1225
			in <=  -16'd21846; load <= 0; address <= 16'd1877;
			if (out !=  16'd21845) $display("#1225 out ng");
		#1226
			in <=  -16'd21846; load <= 0; address <= 16'd2389;
			if (out !=  16'd21845) $display("#1226 out ng");
		#1227
			in <=  -16'd21846; load <= 0; address <= 16'd2901;
			if (out !=  16'd21845) $display("#1227 out ng");
		#1228
			in <=  -16'd21846; load <= 0; address <= 16'd3413;
			if (out !=  16'd21845) $display("#1228 out ng");
		#1229
			in <=  -16'd21846; load <= 0; address <= 16'd3925;
			if (out !=  16'd21845) $display("#1229 out ng");
		#1230
			in <=   16'd21845; load <= 1; address <=  16'd853;
			if (out != -16'd21846) $display("#1230 out ng");
		#1231
			in <=   16'd21845; load <= 1; address <=  16'd853;
			if (out !=  16'd21845) $display("#1231 out ng");
		#1232
			in <=  -16'd21846; load <= 1; address <= 16'd1365;
			if (out !=  16'd21845) $display("#1232 out ng");
		#1233
			in <=  -16'd21846; load <= 1; address <= 16'd1365;
			if (out != -16'd21846) $display("#1233 out ng");
		#1234
			in <=  -16'd21846; load <= 0; address <=  16'd341;
			if (out !=  16'd21845) $display("#1234 out ng");
		#1235
			in <=  -16'd21846; load <= 0; address <=  16'd341;
			if (out !=  16'd21845) $display("#1235 out ng");
		#1236
			in <=  -16'd21846; load <= 0; address <=  16'd853;
			if (out !=  16'd21845) $display("#1236 out ng");
		#1237
			in <=  -16'd21846; load <= 0; address <= 16'd1365;
			if (out != -16'd21846) $display("#1237 out ng");
		#1238
			in <=  -16'd21846; load <= 0; address <= 16'd1877;
			if (out !=  16'd21845) $display("#1238 out ng");
		#1239
			in <=  -16'd21846; load <= 0; address <= 16'd2389;
			if (out !=  16'd21845) $display("#1239 out ng");
		#1240
			in <=  -16'd21846; load <= 0; address <= 16'd2901;
			if (out !=  16'd21845) $display("#1240 out ng");
		#1241
			in <=  -16'd21846; load <= 0; address <= 16'd3413;
			if (out !=  16'd21845) $display("#1241 out ng");
		#1242
			in <=  -16'd21846; load <= 0; address <= 16'd3925;
			if (out !=  16'd21845) $display("#1242 out ng");
		#1243
			in <=   16'd21845; load <= 1; address <= 16'd1365;
			if (out != -16'd21846) $display("#1243 out ng");
		#1244
			in <=   16'd21845; load <= 1; address <= 16'd1365;
			if (out !=  16'd21845) $display("#1244 out ng");
		#1245
			in <=  -16'd21846; load <= 1; address <= 16'd1877;
			if (out !=  16'd21845) $display("#1245 out ng");
		#1246
			in <=  -16'd21846; load <= 1; address <= 16'd1877;
			if (out != -16'd21846) $display("#1246 out ng");
		#1247
			in <=  -16'd21846; load <= 0; address <=  16'd341;
			if (out !=  16'd21845) $display("#1247 out ng");
		#1248
			in <=  -16'd21846; load <= 0; address <=  16'd341;
			if (out !=  16'd21845) $display("#1248 out ng");
		#1249
			in <=  -16'd21846; load <= 0; address <=  16'd853;
			if (out !=  16'd21845) $display("#1249 out ng");
		#1250
			in <=  -16'd21846; load <= 0; address <= 16'd1365;
			if (out !=  16'd21845) $display("#1250 out ng");
		#1251
			in <=  -16'd21846; load <= 0; address <= 16'd1877;
			if (out != -16'd21846) $display("#1251 out ng");
		#1252
			in <=  -16'd21846; load <= 0; address <= 16'd2389;
			if (out !=  16'd21845) $display("#1252 out ng");
		#1253
			in <=  -16'd21846; load <= 0; address <= 16'd2901;
			if (out !=  16'd21845) $display("#1253 out ng");
		#1254
			in <=  -16'd21846; load <= 0; address <= 16'd3413;
			if (out !=  16'd21845) $display("#1254 out ng");
		#1255
			in <=  -16'd21846; load <= 0; address <= 16'd3925;
			if (out !=  16'd21845) $display("#1255 out ng");
		#1256
			in <=   16'd21845; load <= 1; address <= 16'd1877;
			if (out != -16'd21846) $display("#1256 out ng");
		#1257
			in <=   16'd21845; load <= 1; address <= 16'd1877;
			if (out !=  16'd21845) $display("#1257 out ng");
		#1258
			in <=  -16'd21846; load <= 1; address <= 16'd2389;
			if (out !=  16'd21845) $display("#1258 out ng");
		#1259
			in <=  -16'd21846; load <= 1; address <= 16'd2389;
			if (out != -16'd21846) $display("#1259 out ng");
		#1260
			in <=  -16'd21846; load <= 0; address <=  16'd341;
			if (out !=  16'd21845) $display("#1260 out ng");
		#1261
			in <=  -16'd21846; load <= 0; address <=  16'd341;
			if (out !=  16'd21845) $display("#1261 out ng");
		#1262
			in <=  -16'd21846; load <= 0; address <=  16'd853;
			if (out !=  16'd21845) $display("#1262 out ng");
		#1263
			in <=  -16'd21846; load <= 0; address <= 16'd1365;
			if (out !=  16'd21845) $display("#1263 out ng");
		#1264
			in <=  -16'd21846; load <= 0; address <= 16'd1877;
			if (out !=  16'd21845) $display("#1264 out ng");
		#1265
			in <=  -16'd21846; load <= 0; address <= 16'd2389;
			if (out != -16'd21846) $display("#1265 out ng");
		#1266
			in <=  -16'd21846; load <= 0; address <= 16'd2901;
			if (out !=  16'd21845) $display("#1266 out ng");
		#1267
			in <=  -16'd21846; load <= 0; address <= 16'd3413;
			if (out !=  16'd21845) $display("#1267 out ng");
		#1268
			in <=  -16'd21846; load <= 0; address <= 16'd3925;
			if (out !=  16'd21845) $display("#1268 out ng");
		#1269
			in <=   16'd21845; load <= 1; address <= 16'd2389;
			if (out != -16'd21846) $display("#1269 out ng");
		#1270
			in <=   16'd21845; load <= 1; address <= 16'd2389;
			if (out !=  16'd21845) $display("#1270 out ng");
		#1271
			in <=  -16'd21846; load <= 1; address <= 16'd2901;
			if (out !=  16'd21845) $display("#1271 out ng");
		#1272
			in <=  -16'd21846; load <= 1; address <= 16'd2901;
			if (out != -16'd21846) $display("#1272 out ng");
		#1273
			in <=  -16'd21846; load <= 0; address <=  16'd341;
			if (out !=  16'd21845) $display("#1273 out ng");
		#1274
			in <=  -16'd21846; load <= 0; address <=  16'd341;
			if (out !=  16'd21845) $display("#1274 out ng");
		#1275
			in <=  -16'd21846; load <= 0; address <=  16'd853;
			if (out !=  16'd21845) $display("#1275 out ng");
		#1276
			in <=  -16'd21846; load <= 0; address <= 16'd1365;
			if (out !=  16'd21845) $display("#1276 out ng");
		#1277
			in <=  -16'd21846; load <= 0; address <= 16'd1877;
			if (out !=  16'd21845) $display("#1277 out ng");
		#1278
			in <=  -16'd21846; load <= 0; address <= 16'd2389;
			if (out !=  16'd21845) $display("#1278 out ng");
		#1279
			in <=  -16'd21846; load <= 0; address <= 16'd2901;
			if (out != -16'd21846) $display("#1279 out ng");
		#1280
			in <=  -16'd21846; load <= 0; address <= 16'd3413;
			if (out !=  16'd21845) $display("#1280 out ng");
		#1281
			in <=  -16'd21846; load <= 0; address <= 16'd3925;
			if (out !=  16'd21845) $display("#1281 out ng");
		#1282
			in <=   16'd21845; load <= 1; address <= 16'd2901;
			if (out != -16'd21846) $display("#1282 out ng");
		#1283
			in <=   16'd21845; load <= 1; address <= 16'd2901;
			if (out !=  16'd21845) $display("#1283 out ng");
		#1284
			in <=  -16'd21846; load <= 1; address <= 16'd3413;
			if (out !=  16'd21845) $display("#1284 out ng");
		#1285
			in <=  -16'd21846; load <= 1; address <= 16'd3413;
			if (out != -16'd21846) $display("#1285 out ng");
		#1286
			in <=  -16'd21846; load <= 0; address <=  16'd341;
			if (out !=  16'd21845) $display("#1286 out ng");
		#1287
			in <=  -16'd21846; load <= 0; address <=  16'd341;
			if (out !=  16'd21845) $display("#1287 out ng");
		#1288
			in <=  -16'd21846; load <= 0; address <=  16'd853;
			if (out !=  16'd21845) $display("#1288 out ng");
		#1289
			in <=  -16'd21846; load <= 0; address <= 16'd1365;
			if (out !=  16'd21845) $display("#1289 out ng");
		#1290
			in <=  -16'd21846; load <= 0; address <= 16'd1877;
			if (out !=  16'd21845) $display("#1290 out ng");
		#1291
			in <=  -16'd21846; load <= 0; address <= 16'd2389;
			if (out !=  16'd21845) $display("#1291 out ng");
		#1292
			in <=  -16'd21846; load <= 0; address <= 16'd2901;
			if (out !=  16'd21845) $display("#1292 out ng");
		#1293
			in <=  -16'd21846; load <= 0; address <= 16'd3413;
			if (out != -16'd21846) $display("#1293 out ng");
		#1294
			in <=  -16'd21846; load <= 0; address <= 16'd3925;
			if (out !=  16'd21845) $display("#1294 out ng");
		#1295
			in <=   16'd21845; load <= 1; address <= 16'd3413;
			if (out != -16'd21846) $display("#1295 out ng");
		#1296
			in <=   16'd21845; load <= 1; address <= 16'd3413;
			if (out !=  16'd21845) $display("#1296 out ng");
		#1297
			in <=  -16'd21846; load <= 1; address <= 16'd3925;
			if (out !=  16'd21845) $display("#1297 out ng");
		#1298
			in <=  -16'd21846; load <= 1; address <= 16'd3925;
			if (out != -16'd21846) $display("#1298 out ng");
		#1299
			in <=  -16'd21846; load <= 0; address <=  16'd341;
			if (out !=  16'd21845) $display("#1299 out ng");
		#1300
			in <=  -16'd21846; load <= 0; address <=  16'd341;
			if (out !=  16'd21845) $display("#1300 out ng");
		#1301
			in <=  -16'd21846; load <= 0; address <=  16'd853;
			if (out !=  16'd21845) $display("#1301 out ng");
		#1302
			in <=  -16'd21846; load <= 0; address <= 16'd1365;
			if (out !=  16'd21845) $display("#1302 out ng");
		#1303
			in <=  -16'd21846; load <= 0; address <= 16'd1877;
			if (out !=  16'd21845) $display("#1303 out ng");
		#1304
			in <=  -16'd21846; load <= 0; address <= 16'd2389;
			if (out !=  16'd21845) $display("#1304 out ng");
		#1305
			in <=  -16'd21846; load <= 0; address <= 16'd2901;
			if (out !=  16'd21845) $display("#1305 out ng");
		#1306
			in <=  -16'd21846; load <= 0; address <= 16'd3413;
			if (out !=  16'd21845) $display("#1306 out ng");
		#1307
			in <=  -16'd21846; load <= 0; address <= 16'd3925;
			if (out != -16'd21846) $display("#1307 out ng");
		#1308
			in <=   16'd21845; load <= 1; address <= 16'd3925;
			if (out != -16'd21846) $display("#1308 out ng");
		#1309
			in <=   16'd21845; load <= 1; address <= 16'd3925;
			if (out !=  16'd21845) $display("#1309 out ng");
		#1310
			in <=   16'd21845; load <= 0; address <=  16'd341;
			if (out !=  16'd21845) $display("#1310 out ng");
		#1311
			in <=   16'd21845; load <= 0; address <=  16'd341;
			if (out !=  16'd21845) $display("#1311 out ng");
		#1312
			in <=   16'd21845; load <= 0; address <=  16'd853;
			if (out !=  16'd21845) $display("#1312 out ng");
		#1313
			in <=   16'd21845; load <= 0; address <= 16'd1365;
			if (out !=  16'd21845) $display("#1313 out ng");
		#1314
			in <=   16'd21845; load <= 0; address <= 16'd1877;
			if (out !=  16'd21845) $display("#1314 out ng");
		#1315
			in <=   16'd21845; load <= 0; address <= 16'd2389;
			if (out !=  16'd21845) $display("#1315 out ng");
		#1316
			in <=   16'd21845; load <= 0; address <= 16'd2901;
			if (out !=  16'd21845) $display("#1316 out ng");
		#1317
			in <=   16'd21845; load <= 0; address <= 16'd3413;
			if (out !=  16'd21845) $display("#1317 out ng");
		#1318
			in <=   16'd21845; load <= 0; address <= 16'd3925;
			if (out !=  16'd21845) $display("#1318 out ng");

		#99999
		$display("success!");
		$stop;
	end

endmodule
