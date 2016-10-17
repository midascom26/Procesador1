----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:05:51 10/11/2016 
-- Design Name: 
-- Module Name:    ALU - Proces_Monociclo 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( inCRS1 : in  STD_LOGIC_VECTOR (31 downto 0);
           inCRS2 : in  STD_LOGIC_VECTOR (31 downto 0);
           inUC : in  STD_LOGIC_VECTOR (5 downto 0);
           salida : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Proces_Monociclo of ALU is

begin
	process(inCRS1,inCRS2,inUC)
		begin
			case (inUC) is
				when "000001" => -- add
					salida <= inCRS1 + inCRS2;
				when "000010" => -- sub
					salida <= inCRS1 - inCRS2;
				when "000011" => --and
					salida <= inCRS1 and inCRS2;
				when "000100" => --andn
					salida <= inCRS1 nand inCRS2;
				when "000101" => -- or
					salida <= inCRS1 or inCRS2;
				when "000110" => -- orn
					salida <= inCRS1 nor inCRS2;
				when "000111" => -- xor
					salida <= inCRS1 xor inCRS2;
				when "001000" => -- xorn
					salida <= inCRS1 xnor inCRS2;
				when others => -- Cae el nop
					salida <= (others=>'0');
		end case;
	end process; 


end Proces_Monociclo;

