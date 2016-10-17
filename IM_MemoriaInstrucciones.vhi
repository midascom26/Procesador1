
-- VHDL Instantiation Created from source file IM_MemoriaInstrucciones.vhd -- 21:31:20 10/12/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT IM_MemoriaInstrucciones
	PORT(
		Entrada : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_IM_MemoriaInstrucciones: IM_MemoriaInstrucciones PORT MAP(
		Entrada => ,
		reset => ,
		salida => 
	);


