
-- VHDL Instantiation Created from source file UC_UnidadControl.vhd -- 23:23:03 10/11/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT UC_UnidadControl
	PORT(
		OP : IN std_logic_vector(1 downto 0);
		OP3 : IN std_logic_vector(5 downto 0);          
		salida : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

	Inst_UC_UnidadControl: UC_UnidadControl PORT MAP(
		OP => ,
		OP3 => ,
		salida => 
	);


