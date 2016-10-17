--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:04:25 10/11/2016
-- Design Name:   
-- Module Name:   C:/Users/dmartinez/Desktop/procesadormonociclo/ProcesadorMonociclo/TestBench_RF_RegisterFile.vhd
-- Project Name:  ProcesadorMonociclo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RF_RegisterFile
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
 
ENTITY TestBench_RF_RegisterFile IS
END TestBench_RF_RegisterFile;
 
ARCHITECTURE behavior OF TestBench_RF_RegisterFile IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RF_RegisterFile
    PORT(
         RS1 : IN  std_logic_vector(4 downto 0);
         RS2 : IN  std_logic_vector(4 downto 0);
         RD : IN  std_logic_vector(4 downto 0);
         DataWrite : IN  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         CRS1 : OUT  std_logic_vector(31 downto 0);
         CRS2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RS1 : std_logic_vector(4 downto 0) := (others => '0');
   signal RS2 : std_logic_vector(4 downto 0) := (others => '0');
   signal RD : std_logic_vector(4 downto 0) := (others => '0');
   signal DataWrite : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';

 	--Outputs
   signal CRS1 : std_logic_vector(31 downto 0);
   signal CRS2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RF_RegisterFile PORT MAP (
          RS1 => RS1,
          RS2 => RS2,
          RD => RD,
          DataWrite => DataWrite,
          reset => reset,
          CRS1 => CRS1,
          CRS2 => CRS2
        );

   -- Stimulus process
   stim_proc: process
   begin
		reset <= '1';
		wait for 100 ns;
		reset <= '0';
		RS1 <= "10000";
		RS2 <= "10001";
		RD <= "10010";
		DataWrite <= "00000000000000000000000000010011";
     
      wait;
   end process;

END;
