----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:42:54 10/10/2016 
-- Design Name: 
-- Module Name:    IM_MemoriaInstrucciones - Proces_Monociclo 
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
use std.textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IM_MemoriaInstrucciones is
    Port ( Entrada : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           salida : out  STD_LOGIC_VECTOR (31 downto 0));
end IM_MemoriaInstrucciones;

architecture Proces_Monociclo of IM_MemoriaInstrucciones is
	type rom_type is array (0 to 31) of std_logic_vector (31 downto 0);
	
	impure function InitRomFromFile (RomFileName : in string) return rom_type is
	
		file RomFile : text open read_mode is RomFileName;
		variable RomFileLine : line;
		variable temp_bv : bit_vector(31 downto 0);
		variable temp_mem : rom_type;
		begin
			for i in rom_type'range loop
				readline (RomFile, RomFileLine);
				read(RomFileLine, temp_bv);
				temp_mem(i) := to_stdlogicvector(temp_bv);
			end loop;
	return temp_mem;
	end function;
	signal instructions : rom_type := InitRomFromFile("programa.data");

begin
	process(Entrada,reset,instructions)
		begin
			if(reset = '1')then
				salida <= (others=>'0');
			else
				salida <= instructions(conv_integer(Entrada(4 downto 0)));
			end if;
	end process; 
end Proces_Monociclo;

