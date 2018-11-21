// CPU
module CPU(
	input clk,				// clk
	input[15:0] inM,		// メモリ入力
	input[15:0] inst,		// instruction（実行する命令）
	input reset,			// reset
	output[15:0] outM,		// メモリ出力
	output writeM,			// M書き込みを行うか
	output[14:0] addressM,	// データメモリ中のMのアドレス
	output[14:0] pc);		// プログラムカウンタ出力

	//
	// Decode
	//
	
	// A命令か？
	wire isAinst;
	wire[15:0] aluOut;
	assign isAinst = ~inst[15];

	// A命令の場合は、そのアドレス（かデータ）、C命令の場合はALUの出力を toA に配線。
	wire[15:0] toA;
	assign toA = isAinst == 1 ? inst : aluOut;	// Mux

	// Aレジスタへの入力信号
	// A命令の場合か、C命令のdestのd1がOnの場合（Aレジスタに計算結果を格納する命令の場合）は、Aレジスタにロードさせる
	wire isAload;
	wire[15:0] aOut;
	assign isAload = isAinst || inst[5];
	Register a_reg(.clk(clk), .in(toA), .load(isAload), .out(aOut));

	// Aレジスタの出力は addressM としてCPUから出力
	assign addressM[14:0] = aOut[14:0];

	// ALUへの入力信号の準備
	// C命令でcompのaがOnの場合、メモリ入力（inM）の値、それ以外はAレジスタの値をALUへの入力とする
	wire isCompAon;
	wire[15:0] AM;
	assign isCompAon = inst[15] && inst[12];
	assign AM = isCompAon == 0 ? aOut : inM;	// Mux

	//
	// ALU
	//
	wire aluOutIsZero, aluOutIsNega;
	wire[15:0] d_out;
	ALU alu(
		.x(d_out),		// Dレジスタの値を入力する
		.y(AM),			// Aレジスタか、inMの値を入力する
		.zx(inst[11]),	// c1: 入力xをゼロにするか
		.nx(inst[10]),	// c2: 入力xを反転するか
		.zy(inst[9]),	// c3: 入力yをゼロにするか
		.ny(inst[8]),	// c4: 入力yを反転するか
		.f(inst[7]),	// c5: 関数コード（1は加算、0はAnd）
		.no(inst[6]),	// c6: 出力outを反転するか
		.out(aluOut),	// out
		.zr(aluOutIsZero),	// out==0 の時On
		.ng(aluOutIsNega));	// out<0 の時On

	// ALUの出力は CPU出力の outM としても出力する
	assign outM = aluOut;

	// Dレジスタ
	// C命令でdestのd2がOn（Dレジスタに計算結果を格納する命令）の場合は、ALUの出力をDレジスタにロードさせる
	wire isDload;
	assign isDload = inst[15] && inst[4];
	Register d_reg(.clk(clk), .in(aluOut), .load(isDload), .out(d_out));

	// C命令でdestのd3がOn（Memory[A]に計算結果を格納する命令）の場合は、CPU出力 writeM をOn（メモリ書き込みをOn）
	assign writeM = inst[15] && inst[3];

	//
	// プログラムカウンタの制御
	//

	// C命令でj3がOn（out > 0）が命令されているか？
	wire isPositive, isNotZero;
	assign isPositive = ~aluOutIsNega;
	assign isNotZero = ~aluOutIsZero;
	wire instJgt, isGt;
	assign instJgt = inst[15] && inst[0];
	assign isGt = isPositive && isNotZero;
	// PCを書き換えるか判定する為の材料（GT）
	wire isPcLoadJgt;
	assign isPcLoadJgt = instJgt && isGt;

	// C命令でj2がOn（out == 0）が命令されているか？
	wire instJeq;
	assign instJeq = inst[15] && inst[1];
	// PCを書き換えるか判定する為の材料（EQ）
	wire isPcLoadJeq;
	assign isPcLoadJeq = instJeq && aluOutIsZero;

	// C命令でj1がOn（out < 0）が命令されているか？
	wire instJlt;
	assign instJlt = inst[15] && inst[2];
	// PCを書き換えるか判定する為の材料（LT）
	wire isPcLoadJlt;
	assign isPcLoadJlt = instJlt && aluOutIsNega;

	// PCを書き換えるか判定する為の材料（GE）
	wire isPcLoadJGe;
	assign isPcLoadJGe = isPcLoadJgt || isPcLoadJeq;

	// PCを書き換えるか
	wire isPcLoad;
	assign isPcLoad = isPcLoadJlt || isPcLoadJGe;

	// プログラムカウンタ
	wire[15:0] pcOut;
	PC pc1(.clk(clk), .in(aOut), .load(isPcLoad), .inc(1'b1), .reset(reset), .out(pcOut));
	assign pc[14:0] = pcOut[14:0];

endmodule