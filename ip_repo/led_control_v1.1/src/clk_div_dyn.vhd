-- Simple parameterized clock divider that uses a counter
-- 
-- Copyright (c) 2012 Brian Nezvadovitz <http://nezzen.net>
-- This software is distributed under the terms of the MIT License shown below.
-- 
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to
-- deal in the Software without restriction, including without limitation the
-- rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
-- sell copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
-- 
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-- FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
-- IN THE SOFTWARE.
--
--
-- S. Goadhouse  2014/04/16
--
-- Modified to output a single period pulse to be used as a clock enable. This
-- way, FPGA has a single clock domain of clk_in but the circuit can still
-- operate slower using the clock enable.
--
-- This version of the clock divider dynamically changes the output rate based
-- on the passed in divider value.
-- 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY clk_div_dyn IS
  PORT (
    clk_in : IN  STD_LOGIC;
    rst    : IN  STD_LOGIC;
    div    : IN  UNSIGNED(7 DOWNTO 0);  -- div+1 is the clock divider
    clk_en : OUT STD_LOGIC
    );
END clk_div_dyn;

ARCHITECTURE bhv OF clk_div_dyn IS

  signal count : UNSIGNED(div'range);

BEGIN
  
  PROCESS(clk_in, rst)
  BEGIN
    IF(rst = '1') THEN
      count  <= (OTHERS => '0'); --@@@ UNSIGNED(to_unsigned(0,count'length));
      clk_en <= '0';
    ELSIF(rising_edge(clk_in)) THEN
      IF(count = div) THEN
        count  <= (OTHERS => '0'); --@@@ UNSIGNED(to_unsigned(0,count'length));
        clk_en <= '1';
      ELSE
        count  <= count + 1;
        clk_en <= '0';
      END IF;
    END IF;
  END PROCESS;

END bhv;
