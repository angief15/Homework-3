library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity entidad is
    port(

        A,B  : in std_logic_vector(7 downto 0);     
        SEL, CLK, LDA  : in std_logic;   
	F: out std_logic_vector(7 downto 0)     
       

    );
end entidad;

architecture behavior of entidad is

    signal intermediate : std_logic_vector(7 downto 0);

begin
	r:process(CLK)
	begin
		if (rising_edge(CLK)) then
		    if (LDA = '1') then 
			F <= intermediate;
		    end if;
		end if;
	end process;
with SEL select
intermediate<=A when '1',
	      B when '0',
	      (others => '0') when others;	
    
end behavior;