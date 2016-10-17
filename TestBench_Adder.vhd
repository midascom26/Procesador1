--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:15:34 10/10/2016
-- Design Name:   
-- Module Name:   C:/Users/dmartinez/Desktop/procesadormonociclo/ProcesadorMonociclo/TestBench_Adder.vhd
-- Project Name:  ProcesadorMonociclo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Adder
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
 
ENTITY TestBench_Adder IS
END TestBench_Adder;
 
ARCHITECTURE behavior OF TestBench_Adder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Adder
    PORT(
         In1 : IN  std_logic_vector(31 downto 0);
         In2 : IN  std_logic_vector(31 downto 0);
         salidasumador : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal In1 : std_logic_vector(31 downto 0) := (others => '0');
   signal In2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal salidasumador : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Adder PORT MAP (
          In1 => In1,
          In2 => In2,
          salidasumador => salidasumador
        );
 
   -- Stimulus process
   stim_proc: process
   begin		
      In1 <= x"00000004";
		In2 <= x"00000006";
      wait for 30 ns;
		In1 <= x"00000008";
		In2 <= x"00000004";
		wait for 30 ns;
		In1 <= x"00000006";
		In2 <= x"00000006";
		wait for 30 ns;
		In1 <= x"00000002";
		In2 <= x"00000002";
      wait;
   end process;
END;
