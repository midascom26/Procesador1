----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:28:55 10/11/2016 
-- Design Name: 
-- Module Name:    UC_UnidadControl - Proces_Monociclo 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UC_UnidadControl is
    Port ( OP : in  STD_LOGIC_VECTOR (1 downto 0);
           OP3 : in  STD_LOGIC_VECTOR (5 downto 0);
           salida : out  STD_LOGIC_VECTOR (5 downto 0));
end UC_UnidadControl;

architecture Proces_Monociclo of UC_UnidadControl is

begin
	process(OP,OP3)
		begin
			if(OP = "10") then
				case OP3 is 
					when "000000" => -- ADD
						salida  <= "000001";

					when "000100" => -- SUB
						salida <= "000010";
								 
					when "000001" => -- AND
						salida <= "000011";
								 
					when "000101" => -- ANDN
						salida <= "000100";
								 
					when "000010" => -- OR
						salida <= "000101";
								
					when "000110" => -- ORN
						salida <= "000110";
								 
					when "000011" => -- XOR
						salida  <= "000111"; 
								
					when "000111" => -- XORN
						salida <= "001000";
					when others => -- Implementar demas instrucciones
						salida <= "111111"; 

				end case;			 
			end if;
		end process;
			
end Proces_Monociclo;

