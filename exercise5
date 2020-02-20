library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity entidad is
    port(

        A, B,C: in std_logic_vector(7 downto 0);     
	SL1, SL2, CLK: in std_logic;
	   RAX,RBX: out std_logic_vector(7 downto 0)
       
    );
end entidad;

architecture behavior of entidad is

    signal outmux:std_logic_vector(7 downto 0);
    signal load:std_logic_vector(1 downto 0);

begin
	registera: process(CLK)
	begin
		if (rising_edge(CLK)) then
		    if (load="10") then 
			RAX <= A;
		    end if;
		end if;
	end process;

	registerb: process(CLK)
	begin
		if (rising_edge(CLK)) then
		    if (load="01") then 
			RBX <= outmux;
		    end if;
		end if;
	end process;
	
dec:process(SL1)
begin 
	case SL1 is 
	  when '0' => load <= "01";
	  when '1' => load <= "10";
	  when others => load <= "00";
	end case;
end process;

with SL2 select
outmux <= B when '1',
	  C when '0',
	  "00000000" when others;	
    
end behavior;
