create_project Led_Panel_CTRL_32by16 C:/Users/wangb/Desktop/RGB_Led_pannel_axi_lite/vivado/Led_Panel_CTRL_32by16 -part xc7z020clg484-1
set_property board_part em.avnet.com:zed:part0:1.3 [current_project]
create_bd_design "design_1"
update_compile_order -fileset sources_1

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0
endgroup

apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable" }  [get_bd_cells processing_system7_0]

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.0 axi_bram_ctrl_0
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.0 axi_bram_ctrl_1
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 blk_mem_gen_0
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 blk_mem_gen_1
endgroup

set_property  ip_repo_paths  C:/Users/wangb/Desktop/RGB_Led_pannel_axi_lite/iprepo/led_control_v1.1 [current_project]
update_ip_catalog

startgroup
create_bd_cell -type ip -vlnv xilinx.com:user:ledctrl:1.0 ledctrl_0
endgroup

startgroup
set_property -dict [list CONFIG.IN0_WIDTH.VALUE_SRC USER CONFIG.IN1_WIDTH.VALUE_SRC USER] [get_bd_cells xlconcat_0]
set_property -dict [list CONFIG.IN0_WIDTH {24} CONFIG.IN1_WIDTH {24}] [get_bd_cells xlconcat_0]
endgroup

startgroup
set_property -dict [list CONFIG.C_GPIO_WIDTH {1} CONFIG.C_ALL_OUTPUTS {1}] [get_bd_cells axi_gpio_0]
endgroup

startgroup
set_property -dict [list CONFIG.PROTOCOL {AXI4LITE} CONFIG.SINGLE_PORT_BRAM {1} CONFIG.ECC_TYPE {0}] [get_bd_cells axi_bram_ctrl_0]
endgroup

startgroup
set_property -dict [list CONFIG.PROTOCOL {AXI4LITE} CONFIG.ECC_TYPE {0}] [get_bd_cells axi_bram_ctrl_1]
endgroup

startgroup
set_property -dict [list CONFIG.Memory_Type {True_Dual_Port_RAM} CONFIG.Enable_32bit_Address {true} CONFIG.Write_Depth_A {256} CONFIG.Enable_B {Always_Enabled} CONFIG.Fill_Remaining_Memory_Locations {true} CONFIG.Remaining_Memory_Locations {000000ff} CONFIG.use_bram_block {Stand_Alone} CONFIG.Use_Byte_Write_Enable {true} CONFIG.Byte_Size {8} CONFIG.Register_PortA_Output_of_Memory_Primitives {true} CONFIG.Register_PortB_Output_of_Memory_Primitives {true} CONFIG.Use_RSTA_Pin {true} CONFIG.Use_RSTB_Pin {true} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Write_Rate {50} CONFIG.Port_B_Enable_Rate {100}] [get_bd_cells blk_mem_gen_0]
endgroup

startgroup
set_property -dict [list CONFIG.Memory_Type {True_Dual_Port_RAM} CONFIG.Enable_32bit_Address {true} CONFIG.Write_Depth_A {256} CONFIG.Operating_Mode_B {READ_FIRST} CONFIG.Enable_B {Always_Enabled} CONFIG.Fill_Remaining_Memory_Locations {true} CONFIG.Remaining_Memory_Locations {00ff0000} CONFIG.Use_RSTB_Pin {false} CONFIG.use_bram_block {Stand_Alone} CONFIG.Use_Byte_Write_Enable {true} CONFIG.Byte_Size {8} CONFIG.Register_PortA_Output_of_Memory_Primitives {true} CONFIG.Register_PortB_Output_of_Memory_Primitives {true} CONFIG.Use_RSTA_Pin {true} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Write_Rate {50} CONFIG.Port_B_Enable_Rate {100}] [get_bd_cells blk_mem_gen_1]
endgroup

startgroup
set_property -dict [list CONFIG.Register_PortB_Output_of_Memory_Primitives {true} CONFIG.Use_RSTB_Pin {false}] [get_bd_cells blk_mem_gen_0]
endgroup

startgroup
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {Master "/processing_system7_0/M_AXI_GP0" intc_ip "New AXI Interconnect" Clk_xbar "Auto" Clk_master "Auto" Clk_slave "Auto" }  [get_bd_intf_pins axi_gpio_0/S_AXI]
apply_bd_automation -rule xilinx.com:bd_rule:board -config {Board_Interface "btns_5bits ( Push buttons ) " }  [get_bd_intf_pins axi_gpio_0/GPIO]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {Master "/processing_system7_0/M_AXI_GP0" intc_ip "New AXI Interconnect" Clk_xbar "Auto" Clk_master "Auto" Clk_slave "Auto" }  [get_bd_intf_pins axi_bram_ctrl_0/S_AXI]
apply_bd_automation -rule xilinx.com:bd_rule:bram_cntlr -config {BRAM "/blk_mem_gen_0" }  [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTA]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {Master "/processing_system7_0/M_AXI_GP0" intc_ip "New AXI Interconnect" Clk_xbar "Auto" Clk_master "Auto" Clk_slave "Auto" }  [get_bd_intf_pins axi_bram_ctrl_1/S_AXI]
apply_bd_automation -rule xilinx.com:bd_rule:bram_cntlr -config {BRAM "/blk_mem_gen_1" }  [get_bd_intf_pins axi_bram_ctrl_1/BRAM_PORTA]
endgroup

regenerate_bd_layout

startgroup
make_bd_pins_external  [get_bd_pins ledctrl_0/clk_out]
endgroup
startgroup
make_bd_pins_external  [get_bd_pins ledctrl_0/rgb1]
endgroup
startgroup
make_bd_pins_external  [get_bd_pins ledctrl_0/rgb2]
endgroup
startgroup
make_bd_pins_external  [get_bd_pins ledctrl_0/row_addr]
endgroup
startgroup
make_bd_pins_external  [get_bd_pins ledctrl_0/lat]
endgroup
startgroup
make_bd_pins_external  [get_bd_pins ledctrl_0/oe_n]
endgroup

startgroup
make_bd_pins_external  [get_bd_pins ledctrl_0/div]
endgroup

startgroup
set_property -dict [list CONFIG.PCW_EN_CLK1_PORT {1}] [get_bd_cells processing_system7_0]
endgroup

connect_bd_net [get_bd_pins processing_system7_0/FCLK_CLK1] [get_bd_pins blk_mem_gen_0/clkb]
connect_bd_net [get_bd_pins processing_system7_0/FCLK_CLK1] [get_bd_pins blk_mem_gen_1/clkb]
connect_bd_net [get_bd_pins processing_system7_0/FCLK_CLK1] [get_bd_pins ledctrl_0/clk_in]
connect_bd_net [get_bd_pins ledctrl_0/addr_high] [get_bd_pins blk_mem_gen_0/addrb]
connect_bd_net [get_bd_pins ledctrl_0/addr_low] [get_bd_pins blk_mem_gen_1/addrb]

startgroup
set_property -dict [list CONFIG.use_bram_block {Stand_Alone} CONFIG.Enable_32bit_Address {false} CONFIG.Use_Byte_Write_Enable {false} CONFIG.Byte_Size {9} CONFIG.Register_PortA_Output_of_Memory_Primitives {true} CONFIG.Register_PortB_Output_of_Memory_Primitives {true} CONFIG.Use_RSTA_Pin {false} CONFIG.Use_RSTB_Pin {false}] [get_bd_cells blk_mem_gen_0]
endgroup

startgroup
set_property -dict [list CONFIG.use_bram_block {Stand_Alone} CONFIG.Enable_32bit_Address {false} CONFIG.Use_Byte_Write_Enable {false} CONFIG.Byte_Size {9} CONFIG.Register_PortA_Output_of_Memory_Primitives {true} CONFIG.Register_PortB_Output_of_Memory_Primitives {true} CONFIG.Use_RSTA_Pin {false} CONFIG.Use_RSTB_Pin {false}] [get_bd_cells blk_mem_gen_1]
endgroup

startgroup
set_property -dict [list CONFIG.Operating_Mode_B {READ_FIRST} CONFIG.Enable_B {Always_Enabled}] [get_bd_cells blk_mem_gen_0]
endgroup

startgroup
set_property -dict [list CONFIG.Operating_Mode_B {READ_FIRST} CONFIG.Enable_B {Always_Enabled}] [get_bd_cells blk_mem_gen_1]
endgroup

connect_bd_net [get_bd_pins blk_mem_gen_1/doutb] [get_bd_pins xlconcat_0/In1]
connect_bd_net [get_bd_pins blk_mem_gen_0/doutb] [get_bd_pins xlconcat_0/In0]
connect_bd_net [get_bd_pins xlconcat_0/dout] [get_bd_pins ledctrl_0/data]

startgroup
set_property -dict [list CONFIG.C_GPIO_WIDTH {1} CONFIG.GPIO_BOARD_INTERFACE {Custom}] [get_bd_cells axi_gpio_0]
endgroup
delete_bd_objs [get_bd_intf_nets axi_gpio_0_GPIO] [get_bd_intf_ports btns_5bits]
connect_bd_net [get_bd_pins axi_gpio_0/gpio_io_i] [get_bd_pins ledctrl_0/rst]

startgroup
set_property -dict [list CONFIG.SINGLE_PORT_BRAM {1}] [get_bd_cells axi_bram_ctrl_1]
endgroup

regenerate_bd_layout



