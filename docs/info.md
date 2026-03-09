<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

Use the convert_rom.py in the image_convert folder to automatically convert your 20x20 custom logo in jpeg/png file format to bit map as rom. Use wire _unused_ok to define signal you don't use, and /* verilator lint_off WIDTH */ to disable MISMATCH warning when you connect the signal.

## How to test

Copy the project.v and bitmap_rom.v on the vgaplayground website to test if it works as expected. You can go to my youtube channel: huyatieo, for better understanding.

## External hardware

None
