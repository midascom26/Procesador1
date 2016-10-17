
-- VHDL Instantiation Created from source file Adder.vhd -- 22:34:59 10/11/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Adder
	PORT(
		In1 : IN std_logic_vector(31 downto 0);
		In2 : IN std_logic_vector(31 downto 0);          
		salidasumador : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_Adder: Adder PORT MAP(
		In1 => ,
		In2 => ,
		salidasumador => 
	);


