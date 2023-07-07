----------------------------------------------------------------------------------------------
--library imports
LIBRARY ieee;
USE ieee.std_logic_1164.all;
----------------------------------------------------------------------------------------------
--package
PACKAGE watering_system_package IS
	Type state_string is (ST0, ST1);
	FUNCTION combinational_circuit (Signal m_i : std_logic_vector( 2 downto 0); SIGNAL l_i, t_i : std_logic; SIGNAL present_state: state_string) RETURN state_string;
	FUNCTION ssd_behavior (SIGNAL display : std_logic) RETURN std_logic_vector;
END PACKAGE;
----------------------------------------------------------------------------------------------
--package body
PACKAGE BODY watering_system_package IS
	FUNCTION combinational_circuit (Signal m_i : std_logic_vector( 2 downto 0); SIGNAL l_i, t_i : std_logic; SIGNAL present_state: state_string) RETURN state_string IS
		BEGIN
		CASE present_state IS
				WHEN ST0 =>
					IF (t_i = '1' or l_i = '1') and (m_i <= "001") THEN
						 RETURN ST1; 
					ELSIF (t_i = '0' and l_i = '0') and (m_i <= "011") THEN
						 RETURN ST1; 
					ELSE 
						RETURN ST0;
					END IF;

				WHEN ST1 =>
					IF (m_i >= "111") THEN
						 RETURN ST0; 
					ELSIF (t_i = '0' or l_i = '0') and (m_i >= "011") THEN
						 RETURN ST0;
					ELSE 
						RETURN ST1;
					END IF;
				WHEN OTHERS =>
					RETURN ST1;
			END CASE;
		END FUNCTION;

		FUNCTION ssd_behavior (SIGNAL display : std_logic) RETURN std_logic_vector IS
			BEGIN
				If display = '1' THEN 
					RETURN "1001000";
				ELSE
					RETURN "1111110"; 
				END IF;
		END FUNCTION;
	END PACKAGE BODY;