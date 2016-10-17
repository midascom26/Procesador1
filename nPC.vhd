----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:39:27 10/10/2016 
-- Design Name: 
-- Module Name:    nPC - Proces_Monociclo 
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

entity nPC is
    Port ( insalidasumador : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           salida : out  STD_LOGIC_VECTOR (31 downto 0));
end nPC;

architecture Proces_Monociclo of nPC is

begin
	--insalidasumador equivale a una direccion
	process(insalidasumador,reset,clk)
		begin
			if(rising_edge(clk)) then
				if(reset = '1') then
					salida <= (others =>'0');
				else
					salida <= insalidasumador;
				end if;
			end if;
	end process;
end Proces_Monociclo;

