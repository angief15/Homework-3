library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity entidad is
    port(

        X , Y : in std_logic_vector(7 downto 0);     
	LDA,LDB,S1,S0,CLK: in std_logic;
	RB: out std_logic_vector(7 downto 0)     
       

    );
end entidad;

architecture behavior of entidad is

    signal outmux1, outmux2, outra, outrb : std_logic_vector(7 downto 0);

begin
	registera: process(CLK)
	begin
		if (rising_edge(CLK)) then
		    if (LDA='1') then 
			outra <= outmux1;
		    end if;
		end if;
	end process;

	registerb: process(CLK)
	begin
		if (rising_edge(CLK)) then
		    if (LDB='1') then 
			outrb <= outmux2;
			RB <= outmux2;
		    end if;
		end if;
	end process;
	
with S1 select
outmux1 <= X when '1',
	  outrb when '0',
	  "00000000" when others;		


with S0 select
outmux2 <= outra when '1',
	   Y when '0',
	  "00000000" when others;	
    
end behavior;