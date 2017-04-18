library verilog;
use verilog.vl_types.all;
entity sc_computer is
    port(
        resetn          : in     vl_logic;
        cpu_clock       : in     vl_logic;
        pc              : out    vl_logic_vector(31 downto 0);
        inst            : out    vl_logic_vector(31 downto 0);
        aluout          : out    vl_logic_vector(31 downto 0);
        memout          : out    vl_logic_vector(31 downto 0);
        imem_clk        : out    vl_logic;
        dmem_clk        : out    vl_logic;
        lcd             : out    vl_logic_vector(9 downto 0);
        plus1           : in     vl_logic_vector(4 downto 0);
        plus2           : in     vl_logic_vector(4 downto 0);
        plus1_high      : out    vl_logic_vector(6 downto 0);
        plus2_high      : out    vl_logic_vector(6 downto 0);
        total_high      : out    vl_logic_vector(6 downto 0);
        plus1_low       : out    vl_logic_vector(6 downto 0);
        plus2_low       : out    vl_logic_vector(6 downto 0);
        total_low       : out    vl_logic_vector(6 downto 0)
    );
end sc_computer;
