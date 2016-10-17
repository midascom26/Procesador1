----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:32:40 10/11/2016 
-- Design Name: 
-- Module Name:    RF_RegisterFile - Proces_Monociclo 
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

entity RF_RegisterFile is
    Port ( RS1 : in  STD_LOGIC_VECTOR (4 downto 0);
           RS2 : in  STD_LOGIC_VECTOR (4 downto 0);
           RD : in  STD_LOGIC_VECTOR (4 downto 0);
           DataWrite : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           CRS1 : out  STD_LOGIC_VECTOR (31 downto 0);
           CRS2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RF_RegisterFile;

architecture Proces_Monociclo of RF_RegisterFile is

		type ram_type is array (0 to 39) of std_logic_vector (31 downto 0);
		signal registros : ram_type :=(others => x"00000000");
begin
	process(RS1,RS2,RD,DataWrite,reset)
		begin
			if(reset = '1') then
				CRS1 <= (others=>'0');
				CRS2 <= (others=>'0');
				registros <= (others => x"00000000");
			else
				CRS1 <= registros(conv_integer(RS1));
				CRS2 <= registros(conv_integer(RS2));
				if(RD  /= "00000")then
					registros(conv_integer(RD)) <= DataWrite;
				end if;
			end if;
	end process;

end Proces_Monociclo;

