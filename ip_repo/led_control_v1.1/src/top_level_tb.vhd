-------------------------------------------------------------------------------
-- Title      : Testbench for design "top_level"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : top_level_tb.vhd
-- Author     : Stephen Goadhouse  <stephen@d-128-100-215.bootp.virginia.edu>
-- Company    : 
-- Created    : 2014-04-21
-- Last update: 2014-04-21
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-04-21  1.0      stephen Created
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

------------------------------------------------------------------------------------------------------------------------

ENTITY top_level_tb IS

END ENTITY top_level_tb;

------------------------------------------------------------------------------------------------------------------------

ARCHITECTURE TB OF top_level_tb IS

  -- component ports
  SIGNAL rst        : STD_LOGIC;
  SIGNAL div        : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL origin     : STD_LOGIC;
  SIGNAL data_valid : STD_LOGIC;
  SIGNAL data_in32  : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL frame      : STD_LOGIC;
  SIGNAL clk_out    : STD_LOGIC;
  SIGNAL r1         : STD_LOGIC;
  SIGNAL r2         : STD_LOGIC;
  SIGNAL b1         : STD_LOGIC;
  SIGNAL b2         : STD_LOGIC;
  SIGNAL g1         : STD_LOGIC;
  SIGNAL g2         : STD_LOGIC;
  SIGNAL a          : STD_LOGIC;
  SIGNAL b          : STD_LOGIC;
  SIGNAL c          : STD_LOGIC;
  SIGNAL lat        : STD_LOGIC;
  SIGNAL oe_n       : STD_LOGIC;

  -- clock
  SIGNAL Clk : STD_LOGIC := '1';

BEGIN  -- ARCHITECTURE TB

  -- component instantiation
  DUT : ENTITY work.top_level
    PORT MAP (
      rst        => rst,
      clk_in     => Clk,
      div        => div,
      origin     => origin,
      data_valid => data_valid,
      data_in32  => data_in32,
      frame      => frame,
      clk_out    => clk_out,
      r1         => r1,
      r2         => r2,
      b1         => b1,
      b2         => b2,
      g1         => g1,
      g2         => g2,
      a          => a,
      b          => b,
      c          => c,
      lat        => lat,
      oe_n       => oe_n);

  -- clock generation - 40 MHz
  Clk <= NOT Clk AFTER 12.5 ns;

  -- waveform generation
  WaveGen_Proc : PROCESS
  BEGIN
    -- insert signal assignments here
    rst        <= '1';                  -- reset DUT
    origin     <= '0';                  -- reset will also reset write pointer to the origin
    data_valid <= '0';
    div        <= "00000011";           -- pick 10 MHz clk_en / 5 MHz clk_out rate  [40MHz / (div+1)]
    WAIT UNTIL Clk = '1';
    WAIT UNTIL Clk = '1';
    WAIT UNTIL Clk = '1';
    WAIT UNTIL Clk = '1';
    WAIT UNTIL Clk = '1';

    rst <= '0';

    -- Set the first pixel
    data_in32  <= x"00010101";
    data_valid <= '1';
    WAIT UNTIL Clk = '1';

    -- Set the second pixel
    data_in32  <= x"007F0000";
    data_valid <= '1';
    WAIT UNTIL Clk = '1';

    -- Set the next pixel
    data_in32  <= x"00007F00";
    data_valid <= '1';
    WAIT UNTIL Clk = '1';

    -- Set the next pixel
    data_in32  <= x"0000007F";
    data_valid <= '1';
    WAIT UNTIL Clk = '1';

    -- Set the last pixel
    data_in32  <= x"00000000";
    data_valid <= '1';
    WAIT UNTIL Clk = '1';

    -- prevent other data from being written to framebuffer
    data_valid <= '0';
    
    WAIT;

  END PROCESS WaveGen_Proc;



END ARCHITECTURE TB;

------------------------------------------------------------------------------------------------------------------------

CONFIGURATION top_level_tb_TB_cfg OF top_level_tb IS
  FOR TB
  END FOR;
END top_level_tb_TB_cfg;

------------------------------------------------------------------------------------------------------------------------
