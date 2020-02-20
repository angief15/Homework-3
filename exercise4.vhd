library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity entidad is
    port(

        X , Y : in std_logic_vector(7 downto 0);     
	RD, LDA,LDB,S1,S0,CLK: in std_logic;
	RA, RB: out std_logic_vector(7 downto 0)     
       

    );
end entidad;

architecture behavior of entidad is

    signal outmux1, outmux2, outrb : std_logic_vector(7 downto 0);
    signal loada,loadb : std_logic;

begin
	registera: process(CLK)
	begin
		if (falling_edge(CLK)) then
		    if (loada='1') then 
			RA <= outmux2;
		    end if;
		end if;
	end process;

	registerb: process(CLK)
	begin
		if (falling_edge(CLK)) then
		    if (loadb='1') then 
			outrb <= outmux1;
			RB <= outmux1;
		    end if;
		end if;
	end process;
	
loadb <= LDB AND NOT(RD);
loada <= LDA AND RD; 

with S0 select
outmux2 <= outrb when '1',
	   Y when '0',
	  "00000000" when others;		


with S1 select
outmux1 <= X when '1',
	   Y when '0',
	  "00000000" when others;	
    
end behavior;