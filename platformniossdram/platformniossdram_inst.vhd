	component platformniossdram is
		port (
			adc_wire_sclk        : out   std_logic;                                        -- sclk
			adc_wire_cs_n        : out   std_logic;                                        -- cs_n
			adc_wire_dout        : in    std_logic                     := 'X';             -- dout
			adc_wire_din         : out   std_logic;                                        -- din
			clk_clk              : in    std_logic                     := 'X';             -- clk
			control_wire_export  : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- export
			hex_wire_export      : out   std_logic_vector(31 downto 0);                    -- export
			key_wire_export      : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			ledr_wire_export     : out   std_logic_vector(15 downto 0);                    -- export
			pll_0_locked_export  : out   std_logic;                                        -- export
			reset_reset_n        : in    std_logic                     := 'X';             -- reset_n
			sdram_clk_clk        : out   std_logic;                                        -- clk
			sdram_wire_addr      : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_wire_ba        : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_wire_cas_n     : out   std_logic;                                        -- cas_n
			sdram_wire_cke       : out   std_logic;                                        -- cke
			sdram_wire_cs_n      : out   std_logic;                                        -- cs_n
			sdram_wire_dq        : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
			sdram_wire_dqm       : out   std_logic_vector(1 downto 0);                     -- dqm
			sdram_wire_ras_n     : out   std_logic;                                        -- ras_n
			sdram_wire_we_n      : out   std_logic;                                        -- we_n
			switches_wire_export : in    std_logic_vector(7 downto 0)  := (others => 'X')  -- export
		);
	end component platformniossdram;

	u0 : component platformniossdram
		port map (
			adc_wire_sclk        => CONNECTED_TO_adc_wire_sclk,        --      adc_wire.sclk
			adc_wire_cs_n        => CONNECTED_TO_adc_wire_cs_n,        --              .cs_n
			adc_wire_dout        => CONNECTED_TO_adc_wire_dout,        --              .dout
			adc_wire_din         => CONNECTED_TO_adc_wire_din,         --              .din
			clk_clk              => CONNECTED_TO_clk_clk,              --           clk.clk
			control_wire_export  => CONNECTED_TO_control_wire_export,  --  control_wire.export
			hex_wire_export      => CONNECTED_TO_hex_wire_export,      --      hex_wire.export
			key_wire_export      => CONNECTED_TO_key_wire_export,      --      key_wire.export
			ledr_wire_export     => CONNECTED_TO_ledr_wire_export,     --     ledr_wire.export
			pll_0_locked_export  => CONNECTED_TO_pll_0_locked_export,  --  pll_0_locked.export
			reset_reset_n        => CONNECTED_TO_reset_reset_n,        --         reset.reset_n
			sdram_clk_clk        => CONNECTED_TO_sdram_clk_clk,        --     sdram_clk.clk
			sdram_wire_addr      => CONNECTED_TO_sdram_wire_addr,      --    sdram_wire.addr
			sdram_wire_ba        => CONNECTED_TO_sdram_wire_ba,        --              .ba
			sdram_wire_cas_n     => CONNECTED_TO_sdram_wire_cas_n,     --              .cas_n
			sdram_wire_cke       => CONNECTED_TO_sdram_wire_cke,       --              .cke
			sdram_wire_cs_n      => CONNECTED_TO_sdram_wire_cs_n,      --              .cs_n
			sdram_wire_dq        => CONNECTED_TO_sdram_wire_dq,        --              .dq
			sdram_wire_dqm       => CONNECTED_TO_sdram_wire_dqm,       --              .dqm
			sdram_wire_ras_n     => CONNECTED_TO_sdram_wire_ras_n,     --              .ras_n
			sdram_wire_we_n      => CONNECTED_TO_sdram_wire_we_n,      --              .we_n
			switches_wire_export => CONNECTED_TO_switches_wire_export  -- switches_wire.export
		);

