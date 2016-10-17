--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:57:08 10/10/2016
-- Design Name:   
-- Module Name:   C:/Users/dmartinez/Desktop/procesadormonociclo/ProcesadorMonociclo/TestBench_IM_MemoriaInstrucciones.vhd
-- Project Name:  ProcesadorMonociclo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: IM_MemoriaInstrucciones
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TestBench_IM_MemoriaInstrucciones IS
END TestBench_IM_MemoriaInstrucciones;
 
ARCHITECTURE behavior OF TestBench_IM_MemoriaInstrucciones IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT IM_MemoriaInstrucciones
    PORT(
         Entrada : IN  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         salida : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Entrada : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';

 	--Outputs
   signal salida : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: IM_MemoriaInstrucciones PORT MAP (
          Entrada => Entrada,
          reset => reset,
          salida => salida
        );
 
   -- Stimulus process
   stim_proc: process
   begin		
      reset <= '1';
		wait for 30 ns;
		reset <= '0';
		Entrada <= x"00000000";
      wait;
   end process;

END;
