----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:41:54 10/11/2016 
-- Design Name: 
-- Module Name:    Procesador1 - Proces_Monociclo 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Procesador1 is
    Port ( Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           SalidaProcesador : out  STD_LOGIC_VECTOR (31 downto 0));
end Procesador1;

architecture Proces_Monociclo of Procesador1 is

COMPONENT Adder
	PORT(
		In1 : IN std_logic_vector(31 downto 0);
		In2 : IN std_logic_vector(31 downto 0);          
		salidasumador : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

COMPONENT nPC
	PORT(
		insalidasumador : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;
		clk : IN std_logic;          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT IM_MemoriaInstrucciones
	PORT(
		Entrada : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT UC_UnidadControl
	PORT(
		OP : IN std_logic_vector(1 downto 0);
		OP3 : IN std_logic_vector(5 downto 0);          
		salida : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

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

COMPONENT ALU
	PORT(
		inCRS1 : IN std_logic_vector(31 downto 0);
		inCRS2 : IN std_logic_vector(31 downto 0);
		inUC : IN std_logic_vector(5 downto 0);          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

signal AdderTonPC, nPCToPC, PCToIM, IMToUR, ALUresultado, RF1ToALU, RF2ToALU:STD_LOGIC_VECTOR (31 downto 0);
signal UCToALU:STD_LOGIC_VECTOR (5 downto 0);

begin

Inst_Adder: Adder PORT MAP(
		In1 => x"00000001",
		In2 => nPCToPC,
		salidasumador => AdderTonPC
	);

Inst_nPC: nPC PORT MAP(
		insalidasumador => AdderTonPC,
		reset => Reset,
		clk => Clk,
		salida => nPCToPC
	);
	
Inst_PC: nPC PORT MAP(
		insalidasumador => nPCToPC,
		reset => Reset ,
		clk => Clk ,
		salida => PCToIM
	);
	
Inst_IM_MemoriaInstrucciones: IM_MemoriaInstrucciones PORT MAP(
		Entrada => PCToIM,
		reset => Reset,
		salida => IMToUR
	);
	
Inst_UC_UnidadControl: UC_UnidadControl PORT MAP(
		OP => IMToUR(31 downto 30),
		OP3 => IMToUR(24 downto 19),
		salida => UCToALU
	);
	
	Inst_RF_RegisterFile: RF_RegisterFile PORT MAP(
		RS1 => IMToUR(18 downto 14) ,
		RS2 => IMToUR(4 downto 0),
		RD => IMToUR(29 downto 25),
		DataWrite => ALUresultado,
		reset => Reset,
		CRS1 => RF1ToALU,
		CRS2 => RF2ToALU
	);	
	
Inst_ALU: ALU PORT MAP(
		inCRS1 => RF1ToALU,
		inCRS2 => RF2ToALU,
		inUC => UCToALU,
		salida => ALUresultado
	);
	
	SalidaProcesador <= ALUresultado;


end Proces_Monociclo;

