
module platformniossdram (
	adc_wire_sclk,
	adc_wire_cs_n,
	adc_wire_dout,
	adc_wire_din,
	clk_clk,
	control_wire_export,
	hex_wire_export,
	key_wire_export,
	ledr_wire_export,
	pll_0_locked_export,
	reset_reset_n,
	sdram_clk_clk,
	sdram_wire_addr,
	sdram_wire_ba,
	sdram_wire_cas_n,
	sdram_wire_cke,
	sdram_wire_cs_n,
	sdram_wire_dq,
	sdram_wire_dqm,
	sdram_wire_ras_n,
	sdram_wire_we_n,
	switches_wire_export);	

	output		adc_wire_sclk;
	output		adc_wire_cs_n;
	input		adc_wire_dout;
	output		adc_wire_din;
	input		clk_clk;
	input	[1:0]	control_wire_export;
	output	[31:0]	hex_wire_export;
	input	[7:0]	key_wire_export;
	output	[15:0]	ledr_wire_export;
	output		pll_0_locked_export;
	input		reset_reset_n;
	output		sdram_clk_clk;
	output	[12:0]	sdram_wire_addr;
	output	[1:0]	sdram_wire_ba;
	output		sdram_wire_cas_n;
	output		sdram_wire_cke;
	output		sdram_wire_cs_n;
	inout	[15:0]	sdram_wire_dq;
	output	[1:0]	sdram_wire_dqm;
	output		sdram_wire_ras_n;
	output		sdram_wire_we_n;
	input	[7:0]	switches_wire_export;
endmodule
