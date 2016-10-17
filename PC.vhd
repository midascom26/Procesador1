----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:02:55 10/10/2016 
-- Design Name: 
-- Module Name:    PC - Proces_Monociclo 
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

entity PC is
    Port ( outnPC_inPC : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           salida : out  STD_LOGIC_VECTOR (31 downto 0));
end PC;

architecture Proces_Monociclo of PC is

begin
	process(outnPC_inPC,reset,clk)
		begin
			if(rising_edge(clk)) then
				if(reset = '1') then
					salida <= "00000000000000000000000000000000";
				else
					salida <= outnPC_inPC;
				end if;
			end if;
	end process;
end Proces_Monociclo;

