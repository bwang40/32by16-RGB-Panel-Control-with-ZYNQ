********************************************************
32by16-RGB-Panel-Control-with-ZYNQ
********************************************************
.. contents:: Table of Contents
   :depth: 2

Introduction 
=======================
RGB LED matrix panels are mostly used to make video walls. However, due to its design, one will need PWM wave for displaying full color on it. With the FGPA on the ZYNQ, logic can read 24 bit RGB data from BRAM and drive the LED panel with PWM wave. ARM processor on the ZYNQ can control the image displayed by changing the BRAM content using a BRAM controller. This is a hobby project and ledctrl.vhd code is referenced from ADAFRUIT.
