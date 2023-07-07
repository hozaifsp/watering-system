----------------------------------------------------------------------------------------------
--library imports
LIBRARY ieee;
USE ieee.std_logic_1164.all;
----------------------------------------------------------------------------------------------
--auxilary Seven Segment LED
ENTITY ssd IS
	PORT (
	display : IN std_logic;
	ssd: OUT std_logic_vector ( 6 DOWNTO 0)
	);
END ssd;
----------------------------------------------------------------------------------------------
--auxilary Seven Segment LED architecture
ARCHITECTURE ssd_behaviour OF ssd IS
	BEGIN
		ssd <= "1001000" WHEN display = '1' ELSE
			"1111110";
END ssd_behaviour;
------------------------------------------------------------------------------------------------