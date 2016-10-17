
-- VHDL Instantiation Created from source file RF_RegisterFile.vhd -- 23:31:37 10/11/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT RF_RegisterFile
	PORT(
		RS1 : IN std_logic_vector(4 downto 0);
		RS2 : IN std_logic_vector(4 downto 0);
		RD : IN std_logic_vector(4 downto 0);
		DataWrite : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		CRS1 : OUT std_logic_vector(31 downto 0);
		CRS2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_RF_RegisterFile: RF_RegisterFile PORT MAP(
		RS1 => ,
		RS2 => ,
		RD => ,
		DataWrite => ,
		reset => ,
		CRS1 => ,
		CRS2 => 
	);


