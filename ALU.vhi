
-- VHDL Instantiation Created from source file ALU.vhd -- 23:45:21 10/11/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT ALU
	PORT(
		inCRS1 : IN std_logic_vector(31 downto 0);
		inCRS2 : IN std_logic_vector(31 downto 0);
		inUC : IN std_logic_vector(5 downto 0);          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_ALU: ALU PORT MAP(
		inCRS1 => ,
		inCRS2 => ,
		inUC => ,
		salida => 
	);


