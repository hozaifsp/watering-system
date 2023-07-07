library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity watering_system_tb is
end watering_system_tb;

architecture TB_ARCHITECTURE of watering_system_tb is 
	constant CLK_PERIOD: time := 10 ns;
	-- Component declaration of the tested unit
	
	component watering_system
	port(
		clock : in STD_LOGIC;
		reset : in STD_LOGIC;
		t_i : in STD_LOGIC;
		l_i : in STD_LOGIC;
		m_i : in STD_LOGIC_VECTOR(2 downto 0);
		ssd_O : out STD_LOGIC_VECTOR(6 downto 0);
		t_o : out STD_LOGIC;
		l_o : out STD_LOGIC;
		m_o : out STD_LOGIC_VECTOR(2 downto 0);
		water : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clock : STD_LOGIC;
	signal reset : STD_LOGIC;
	signal t_i : STD_LOGIC;
	signal l_i : STD_LOGIC;
	signal m_i : STD_LOGIC_VECTOR(2 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal ssd_O : STD_LOGIC_VECTOR(6 downto 0);
	signal t_o : STD_LOGIC;
	signal l_o : STD_LOGIC;
	signal m_o : STD_LOGIC_VECTOR(2 downto 0);
	signal water : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : watering_system
		port map (
			clock => clock,
			reset => reset,
			t_i => t_i,
			l_i => l_i,
			m_i => m_i,
			ssd_O => ssd_O,
			t_o => t_o,
			l_o => l_o,
			m_o => m_o,
			water => water
		);

	-- Add your stimulus here ...
	
	clock_process: process
    begin
        while now < 1000 ns loop  
            clock <= '0';
            wait for CLK_PERIOD / 2;
            clock <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;
	
	stimulus_process: process
	begin	   		
		reset <= '1';
		t_i <= '0';
		l_i <= '0';
		m_i <= "000";
		wait until falling_edge(clock);
		reset <= '0';
		
		wait until falling_edge(clock);
		t_i <= '1';
		l_i <= '0';
		m_i <= "000";	

		wait until falling_edge(clock);

		t_i <= '0';
		l_i <= '1';
		m_i <= "000";	
		wait until falling_edge(clock);

		t_i <= '1';
		l_i <= '1';
		m_i <= "000";

		wait until falling_edge(clock);

		t_i <= '0';
		l_i <= '0';
		m_i <= "001";

		wait until falling_edge(clock);

		t_i <= '0';
		l_i <= '1';
		m_i <= "001";

		wait until falling_edge(clock);

		t_i <= '1';
		l_i <= '1';
		m_i <= "001";

		wait until falling_edge(clock);

		t_i <= '0';
		l_i <= '0';
		m_i <= "010";

		wait until falling_edge(clock);

		t_i <= '0';
		l_i <= '1';
		m_i <= "010";

		wait until falling_edge(clock);

		t_i <= '1';
		l_i <= '0';
		m_i <= "010";

		wait until falling_edge(clock);

		t_i <= '1';
		l_i <= '1';
		m_i <= "010";

		wait until falling_edge(clock);

		t_i <= '0';
		l_i <= '0';
		m_i <= "011";

		wait until falling_edge(clock);

		t_i <= '0';
		l_i <= '1';
		m_i <= "011";

		wait until falling_edge(clock);

		t_i <= '1';
		l_i <= '0';
		m_i <= "011";

		wait until falling_edge(clock);

		t_i <= '1';
		l_i <= '1';
		m_i <= "011";

		wait until falling_edge(clock);


		t_i <= '0';
		l_i <= '0';
		m_i <= "100";

		wait until falling_edge(clock);

		t_i <= '0';
		l_i <= '1';
		m_i <= "100";

		wait until falling_edge(clock);

		t_i <= '1';
		l_i <= '0';
		m_i <= "100";

		wait until falling_edge(clock);

		t_i <= '1';
		l_i <= '1';
		m_i <= "100";

		wait until falling_edge(clock);


		t_i <= '0';
		l_i <= '0';
		m_i <= "101";

		wait until falling_edge(clock);
		t_i <= '0';
		l_i <= '0';
		m_i <= "110";
	
		wait until falling_edge(clock);

		t_i <= '0';
		l_i <= '1';
		m_i <= "110";
	
		wait until falling_edge(clock);

		t_i <= '1';
		l_i <= '0';
		m_i <= "110";
		
		wait until falling_edge(clock);

		t_i <= '1';
		l_i <= '1';
		m_i <= "110";
		
		wait until falling_edge(clock);

		t_i <= '0';
		l_i <= '0';
		m_i <= "111";
	
		wait until falling_edge(clock);
		
		t_i <= '0';
		l_i <= '1';
		m_i <= "111";
	
		wait until falling_edge(clock);

		t_i <= '1';
		l_i <= '0';
		m_i <= "111";
		
		wait until falling_edge(clock);

		t_i <= '1';
		l_i <= '1';
		m_i <= "111";

		wait until falling_edge(clock);

		t_i <= '1';
		l_i <= '1';
		m_i <= "111";
		
		wait until falling_edge(clock);
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_watering_system of watering_system_tb is
	for TB_ARCHITECTURE
		for UUT : watering_system
			use entity work.watering_system(watering_system_behaviour);
		end for;
	end for;
end TESTBENCH_FOR_watering_system;



