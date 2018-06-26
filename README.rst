********************************************************
32by16-RGB-Panel-Control-with-ZYNQ
********************************************************
.. contents:: Table of Contents
   :depth: 2

Introduction 
=======================
RGB LED matrix panels are mostly used to make video walls. Due to its circuit design, one will need use propper controlled PWM wave for displaying full color on it. Micro Controllers like ARDUINO cannot affort the computation power to drive such type of LED panel especially when the amount of LEDs increase. With the FGPA on the ZYNQ, logic encoded on FPGA schematic can read 24 bit RGB data from BRAM and drive the LED panel with PWM wave. ARM processor on the ZYNQ can control the image displayed by changing the BRAM content using an AXI-lite BRAM controller. 

This is a one weekend hobby project I have done in Spring 2017 and `ledctrl.vhd <https://github.com/DuinoPilot/rgbmatrix-fpga/blob/master/vhdl/ledctrl.vhd/>`_ code is referenced from ADAFRUIT.

LED Panel Design & FPGA code to drive it
===============================================
This `32by16 LED Panel <https://www.adafruit.com/product/420/>`_ is bought from ADAFRUIT. 

From Adafruit, there is a `tutorial <https://learn.adafruit.com/32x16-32x32-rgb-led-matrix?view=all/>`_ explaining how it works and how to drive it with arduino or raspberry pi.

There is a very nice tutorial exlaining about how LED panel works and how LED controller on FPGA works.
https://bikerglen.com/projects/lighting/led-panel-1up/

Top Level FPGA Block Diagram
================================

The following diagram is the diagram plotted in VIVADO ip-integrator. 

.. image:: https://github.com/bwang40/32by16-RGB-Panel-Control-with-ZYNQ/blob/master/images/blockdiagram.PNG
   :scale: 25
   
To get a better understand of the system diagram. I plotted the following system diagram in Microsoft Visio.
   
.. image:: https://github.com/bwang40/32by16-RGB-Panel-Control-with-ZYNQ/blob/master/images/visioDIAGRAM.png
   :scale: 25
   
The interface of the system is done through the FPGA I/Os. The div[7:0] is connected to the switches on the ZedBoard.
   
.. image:: https://github.com/bwang40/32by16-RGB-Panel-Control-with-ZYNQ/blob/master/images/CONNECTION.png
   :scale: 25
   
Two BRAM Generators are used to generate the upper half and lower half memory of the LED panel. In the VIVADO ip-integrator, I pre-filled the upper BRAM with data 0x00ff0000, and the lower BRAM with data 0x000000ff. Once I program the FPGA on the Zynq and PS7_INIT.TCL is excecuted to start giving clk to the FPGA. The upper half of the LED panel will be filled with color blue and the lower half of the LED panel will be filled with green. I ll further talk about how to change the BRAM though ARM processors on ZYNQ.
   
.. image:: https://github.com/bwang40/32by16-RGB-Panel-Control-with-ZYNQ/blob/master/images/51518311165__E548FD17-28B7-4724-BA46-617B42833E0A.JPG
   :scale: 25


Write Software in XSDK
================================

Testing Cases
=======================
   
A MATLAB code is written to read RGB image and generate the input figure for the LED panel. In the MATLAB, I read the image file using imread function and manually decimate the figure to 32by16 pixels. The generated data is feed to the code written in XSDK. A software running on ARM processor will take the data and transmit it to BRAM thorugh BRAM controller using AXI-Lite interface.

.. image:: https://github.com/bwang40/32by16-RGB-Panel-Control-with-ZYNQ/blob/master/images/IMG_4739.JPG
   :scale: 25


.. image:: https://github.com/bwang40/32by16-RGB-Panel-Control-with-ZYNQ/blob/master/images/Rainbow-Whale-Logo.jpg
   :scale: 25

.. image:: https://github.com/bwang40/32by16-RGB-Panel-Control-with-ZYNQ/blob/master/images/IMG_4737.JPG
   :scale: 25
   

To duplicate the design
==============================
There are too many files in the VIVADO project, so I didn't updoad it in the github. Instead, I generated a tcl file: `system_diagram_gen.tcl <https://github.com/bwang40/32by16-RGB-Panel-Control-with-ZYNQ/blob/master/system_diagram_gen.tcl>`_ to help you build your own VIVADO project. Before you run this tcl file, you need to modify the path of the project you want to put your project and the path for the ipcore as well. After building the block diagram, you will have to link the constaint file manually since I didn't include that part in my tcl file. The software on the ARM processor is included in the folder `XSDK_SW <https://github.com/bwang40/32by16-RGB-Panel-Control-with-ZYNQ/blob/master/XSDK_SW/sw_ctrl.c>`_ The image here should be a whale above.

If you have any issue running the tcl file, please let me know.



References
=======================
