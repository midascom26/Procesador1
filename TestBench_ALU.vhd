--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:15:45 10/11/2016
-- Design Name:   
-- Module Name:   C:/Users/dmartinez/Desktop/procesadormonociclo/ProcesadorMonociclo/TestBench_ALU.vhd
-- Project Name:  ProcesadorMonociclo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY TestBench_ALU IS
END TestBench_ALU;
 
ARCHITECTURE behavior OF TestBench_ALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         inCRS1 : IN  std_logic_vector(31 downto 0);
         inCRS2 : IN  std_logic_vector(31 downto 0);
         inUC : IN  std_logic_vector(5 downto 0);
         salida : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal inCRS1 : std_logic_vector(31 downto 0) := (others => '0');
   signal inCRS2 : std_logic_vector(31 downto 0) := (others => '0');
   signal inUC : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal salida : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          inCRS1 => inCRS1,
          inCRS2 => inCRS2,
          inUC => inUC,
          salida => salida
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      inCRS1 <= x"00000002";
		inCRS2 <= x"00000004";
		inUC <= "000001";
		wait for 100 ns;
		inUC <= "000010";
      -- insert stimulus here 
      wait;
   end process;

END;
