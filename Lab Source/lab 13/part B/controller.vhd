library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity controller is
  port (
    clk     : in    std_logic;
    rst_in  : in    std_logic;
    m       : in    std_logic;
    done    : out   std_logic;
    rst_df : out   std_logic;
    load    : out   std_logic;
    sh      : out   std_logic;
    add_sh  : out   std_logic;
    cm      : out   std_logic
  );
end controller;

architecture behavioral of controller is

  type state_type is (
    S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15, S16,
    S17, S18, CM0, CM1, CM2, CM3, CM4, CM5, CM6, CM7
  );

  signal current_state : state_type;
  signal next_state    : state_type;

begin

  process (clk, rst_in)
  begin
    if (rst_in='1') then
      current_state <= S0;
    elsif (clk'event and clk='1') then
      current_state <= next_state;
    end if;
  end process;

  process (current_state, m, rst_in)
  begin
    case current_state is
      when S0 =>
        done    <= '0';
        rst_df <= '1';
        load    <= '0';
        sh      <= '0';
        add_sh  <= '0';
        cm      <= '0';
        if (rst_in = '1') then
          next_state <= S0;
        else
          next_state <= S1;
        end if;
      when S1 =>
        done       <= '0';
        rst_df    <= '0';
        load       <= '1';
        sh         <= '0';
        add_sh     <= '0';
        cm         <= '0';
        next_state <= CM0;
      when CM0 =>
        done    <= '0';
        rst_df <= '0';
        load    <= '0';
        sh      <= '0';
        add_sh  <= '0';
        cm      <= '0';
        if (m = '1') then
          next_state <= S2;
        else
          next_state <= S3;
        end if;
      when S2 =>
        done       <= '0';
        rst_df    <= '0';
        load       <= '0';
        sh         <= '0';
        add_sh     <= '1';
        cm         <= '0';
        next_state <= CM1;
      when S3 =>
        done       <= '0';
        rst_df    <= '0';
        load       <= '0';
        sh         <= '1';
        add_sh     <= '0';
        cm         <= '0';
        next_state <= CM1;
      when CM1 =>
        done    <= '0';
        rst_df <= '0';
        load    <= '0';
        sh      <= '0';
        add_sh  <= '0';
        cm      <= '0';
        if (m = '1') then
          next_state <= S4;
        else
          next_state <= S5;
        end if;
      when S4 =>
        done       <= '0';
        rst_df    <= '0';
        load       <= '0';
        sh         <= '0';
        add_sh     <= '1';
        cm         <= '0';
        next_state <= CM2;
      when S5 =>
        done       <= '0';
        rst_df    <= '0';
        load       <= '0';
        sh         <= '1';
        add_sh     <= '0';
        cm         <= '0';
        next_state <= CM2;
      when CM2 =>
        done    <= '0';
        rst_df <= '0';
        load    <= '0';
        sh      <= '0';
        add_sh  <= '0';
        cm      <= '0';
        if (m = '1') then
          next_state <= S6;
        else
          next_state <= S7;
        end if;
      when S6 =>
        done       <= '0';
        rst_df    <= '0';
        load       <= '0';
        sh         <= '0';
        add_sh     <= '1';
        cm         <= '0';
        next_state <= CM3;
      when S7 =>
        done       <= '0';
        rst_df    <= '0';
        load       <= '0';
        sh         <= '1';
        add_sh     <= '0';
        cm         <= '0';
        next_state <= CM3;
      when CM3 =>
        done    <= '0';
        rst_df <= '0';
        load    <= '0';
        sh      <= '0';
        add_sh  <= '0';
        cm      <= '0';
        if (m = '1') then
          next_state <= S8;
        else
          next_state <= S9;
        end if;
      when S8 =>
        done       <= '0';
        rst_df    <= '0';
        load       <= '0';
        sh         <= '0';
        add_sh     <= '1';
        cm         <= '0';
        next_state <= CM4;
      when S9 =>
        done       <= '0';
        rst_df    <= '0';
        load       <= '0';
        sh         <= '1';
        add_sh     <= '0';
        cm         <= '0';
        next_state <= CM4;
      when CM4 =>
        done    <= '0';
        rst_df <= '0';
        load    <= '0';
        sh      <= '0';
        add_sh  <= '0';
        cm      <= '0';
        if (m = '1') then
          next_state <= S10;
        else
          next_state <= S11;
        end if;
      when S10 =>
        done       <= '0';
        rst_df    <= '0';
        load       <= '0';
        sh         <= '0';
        add_sh     <= '1';
        cm         <= '0';
        next_state <= CM5;
      when S11 =>
        done       <= '0';
        rst_df    <= '0';
        load       <= '0';
        sh         <= '1';
        add_sh     <= '0';
        cm         <= '0';
        next_state <= CM5;
      when CM5 =>
        done    <= '0';
        rst_df <= '0';
        load    <= '0';
        sh      <= '0';
        add_sh  <= '0';
        cm      <= '0';
        if (m = '1') then
          next_state <= S12;
        else
          next_state <= S13;
        end if;
      when S12 =>
        done       <= '0';
        rst_df    <= '0';
        load       <= '0';
        sh         <= '0';
        add_sh     <= '1';
        cm         <= '0';
        next_state <= CM6;
      when S13 =>
        done       <= '0';
        rst_df    <= '0';
        load       <= '0';
        sh         <= '1';
        add_sh     <= '0';
        cm         <= '0';
        next_state <= CM6;
      when CM6 =>
        done    <= '0';
        rst_df <= '0';
        load    <= '0';
        sh      <= '0';
        add_sh  <= '0';
        cm      <= '0';
        if (m = '1') then
          next_state <= S14;
        else
          next_state <= S15;
        end if;
      when S14 =>
        done       <= '0';
        rst_df    <= '0';
        load       <= '0';
        sh         <= '0';
        add_sh     <= '1';
        cm         <= '0';
        next_state <= CM7;
      when S15 =>
        done       <= '0';
        rst_df    <= '0';
        load       <= '0';
        sh         <= '1';
        add_sh     <= '0';
        cm         <= '0';
        next_state <= CM7;
      when CM7 =>
        done    <= '0';
        rst_df <= '0';
        load    <= '0';
        sh      <= '0';
        add_sh  <= '0';
        cm      <= '0';
        if (m = '1') then
          next_state <= S16;
        else
          next_state <= S17;
        end if;
      when S16 =>
        done       <= '0';
        rst_df    <= '0';
        load       <= '0';
        sh         <= '0';
        add_sh     <= '1';
        cm         <= '1';
        next_state <= S18;
      when S17 =>
        done       <= '0';
        rst_df    <= '0';
        load       <= '0';
        sh         <= '1';
        add_sh     <= '0';
        cm         <= '0';
        next_state <= S18;
      when S18 =>
        done       <= '1';
        rst_df    <= '0';
        load       <= '0';
        sh         <= '0';
        add_sh     <= '0';
        cm         <= '0';
        next_state <= S18;
    end case;
  end process;
end architecture behavioral;
