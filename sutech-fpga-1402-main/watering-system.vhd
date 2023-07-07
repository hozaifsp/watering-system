----------------------------------------------------------------------------------------------
--library imports
LIBRARY ieee;
USE ieee.std_logic_1164.all;
----------------------------------------------------------------------------------------------
--main entity
ENTITY watering_system IS
	PORT (
	clock, reset, t_i, l_i : IN std_logic;
	m_i : IN std_logic_vector (2 DOWNTO 0);
	ssd_O : OUT std_logic_vector (6 DOWNTO 0);
	t_o, l_o : OUT std_logic;
	m_o : OUT std_logic_vector (2 DOWNTO 0);
	water : OUT std_logic
	);
END watering_system;
------------------------------------------------------------------------------------------
--main entity architecture
ARCHITECTURE watering_system_behaviour OF watering_system IS
	COMPONENT ssd
		PORT (
			display : IN std_logic;
			ssd: OUT std_logic_vector ( 6 DOWNTO 0)
		);
	END COMPONENT;

	Type state_string is (ST0, ST1);
	ATTRIBUTE enum_encoding : string;
	ATTRIBUTE enum_encoding OF state_string : type is "00 01";
	Signal present_state, next_state : state_string;
	Signal ssd_input : std_logic := '0';
	
	BEGIN
	ssd_device : ssd PORT MAP (display => ssd_input, ssd => ssd_O);
	
	sequential_process : PROCESS (clock, reset, next_state)

		BEGIN
			IF (reset = '1') THEN
				 present_state <= ST0;
			ELSIF (clock'EVENT and clock = '1') THEN
				present_state <= next_state; 
				IF present_state = ST1 then
					water <= '1';	  
					ssd_input <= '1';
				ELSE
					water <= '0';	 
					ssd_input <= '0';
				END IF;
			END IF;
	END PROCESS sequential_process;


	combinational_process : PROCESS (m_i, l_i, t_i , present_state)
		BEGIN
			CASE present_state IS
				WHEN ST0 =>
					IF (t_i = '1' or l_i = '1') and (m_i <= "001") THEN
						 next_state <= ST1; 
					ELSIF (t_i = '0' and l_i = '0') and (m_i <= "011") THEN
						 next_state <= ST1; 
					ELSE 
						next_state <= ST0;
					END IF;

				WHEN ST1 =>
					IF (m_i >= "111") THEN
						 next_state <= ST0; 
					ELSIF (t_i = '1' or l_i = '1') and (m_i >= "011") THEN
						 next_state <= ST0;
					ELSE 
						next_state <= ST1;
					END IF;
				WHEN OTHERS =>
					next_state <= ST1;
			END CASE;
	END PROCESS combinational_process;
	

	m_o <= m_i;
	t_o <= t_i;
	l_o <= l_i;

END watering_system_behaviour;