********************************************************
32by16-RGB-Panel-Control-with-ZYNQ
********************************************************
.. contents:: Table of Contents
   :depth: 2

Introduction 
=======================
RGB LED matrix panels are mostly used to make video walls. Due to its design which will be described later, one will need PWM wave for displaying full color on it. With the FGPA on the ZYNQ, logic can read 24 bit RGB data from BRAM and drive the LED panel with PWM wave. ARM processor on the ZYNQ can control the image displayed by changing the BRAM content using a AXI-lite BRAM controller. This is a hobby project and ledctrl.vhd code is referenced from ADAFRUIT.

LED Panel Design
=======================
This `32by16 LED Panel <https://learn.adafruit.com/32x16-32x32-rgb-led-matrix/powering/>`_ is bought from ADAFRUIT. 

Top Level FPGA Block Diagram
================================
.. image:: https://github.com/bwang40/32by16-RGB-Panel-Control-with-ZYNQ/blob/master/images/blockdiagram.PNG
   :scale: 25

Write Software in XSDK
================================

images
=======================
   
.. image:: https://github.com/bwang40/32by16-RGB-Panel-Control-with-ZYNQ/blob/master/images/Rainbow-Whale-Logo.jpg
   :scale: 25
   
.. image:: https://github.com/bwang40/32by16-RGB-Panel-Control-with-ZYNQ/blob/master/images/IMG_4739.JPG
   :scale: 25

.. image:: https://github.com/bwang40/32by16-RGB-Panel-Control-with-ZYNQ/blob/master/images/IMG_4738.JPGG
   :scale: 25

.. image:: https://github.com/bwang40/32by16-RGB-Panel-Control-with-ZYNQ/blob/master/images/IMG_4737.JPG
   :scale: 25

.. image:: https://github.com/bwang40/32by16-RGB-Panel-Control-with-ZYNQ/blob/master/images/51518311165__E548FD17-28B7-4724-BA46-617B42833E0A.JPG
   :scale: 25



References
=======================
