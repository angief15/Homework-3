library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity entidad is
    port(

        X,Y,Z  : in std_logic_vector(7 downto 0);     
	MS: in std_logic_vector(1 downto 0);
        CLK, DS  : in std_logic;   
	RA, RB: out std_logic_vector(7 downto 0)     
       

    );
end entidad;

architecture behavior of entidad is

    signal outmux, outra, outrb : std_logic_vector(7 downto 0);
    signal LD: std_logic_vector(1 downto 0);

begin
	registera: process(CLK)
	begin
		if (falling_edge(CLK)) then
		    if (LD="01") then 
			outra <= outmux;
			RA <= outmux;
		    end if;
		end if;
	end process;

	registerb: process(CLK)
	begin
		if (falling_edge(CLK)) then
		    if (LD="10") then 
			outrb <= outra;
			RB <= outra;
		    end if;
		end if;
	end process;

dec:process(DS)
begin 
	case DS is 
	  when '0' => LD <= "01";
	  when '1' => LD <= "10";
	  when others => LD <= "00";
	end case;
end process;

with MS select
outmux <= X when "11",
	  Y when "10",
	  Z when "01",
	  outrb when "00",
	  "00000000" when others;	  
end behavior;