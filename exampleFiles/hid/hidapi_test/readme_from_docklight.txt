Author: Oliver Heggelbacher / www.docklight.de /  www.kickdrive.de / www.fuh-edv.de
Date: 2025-01-19

This package contains code-signed Windows binaries for HIDAPI and HIDAPI testing tools: 

testgui.exe
compiled from source: 
https://github.com/signal11/hidapi 
(old v0.8 repository, master branch from 2016-03-03 / Commit b5b2e17)

hidapi.dll
hidtest.exe
compiled from source:
https://github.com/libusb/hidapi 
(maintained, master branch from 2024-10-30 / Commit ff67c77)

Please refer to the original HIDAPI README.MD and LICENSE...txt files for details.

We compiled and tested the binaries, and code-signed the .dll and .exe files with our code signing certificate, 
but please note that all copyrights of the library are with the original creator and as described in 
LICENSE.txt. 

As a third helpful GUI tool we can recommend Uwe Sieber's "USB Device Tree Viewer" based on Microsoft's USBView sample:
See the website for more information and download: 
https://www.uwe-sieber.de/usbtreeview_e.html
 
Here is how the two tools included in this package are helpful for applications with HID and Docklight Scripting: 

testgui.exe
===========
"HIDAPI Test Tool". Outdated and not maintained, but still useful small GUI app that allows a quick overview
on all devices available. 

Example use: 
If testgui.exe displays a CO2 sensor as
04D9:A052 - Holtek USB-zyTemp (usage ff00:0001) 
You can use the following Docklight Channel setings:
USBHID:4D9:A052:I

Using Docklight Sripting v2.4.20 ot higher, you can also use the following extended syntax 
to select a device path with a specific usage page / usage id, 
e.g. for the above sensor example: 
USBHID:4D9:A052:FF00:1:I

hidtest.exe
===========
A command line utility that enumerates all HID devices and prints out all relevant
device information, including the device 'path' and the additional usage ID and usage page information. 

NOTE: The format of the usage page/id values is different from testgui.exe.
testgui.exe:
(usage ff00:0001) 
hidtext.exe:
Usage (page): 0x1 (0xff00)


create_device_list.bat
======================
This file consists of the line "hidtest.exe > output.txt". By double-clicking it, you can produce a 
text file called "output.txt" with the full list of HID devices currently available on your PC:
 
Here are two example entries from the output.txt created on my development notebook: 

Example 1: 

  Report Descriptor: (73 bytes)
0x05, ...
0xc0, 
Device Found
  type: 04d8 f708
  path: \\?\HID#VID_04D8&PID_F708&MI_01#a&157b00ca&0&0000#{4d1e55b2-f16f-11cf-88cb-001111000030}
  serial_number: 0000000000
  Manufacturer: fullmo GmbH              
  Product:      fullmo USB2Drive                
  Release:      1
  Interface:    1
  Usage (page): 0x1 (0xff00)
  Bus type: 1 (USB)

--> The fullmo USB2Drive CAN using slcan protocol via HID.
Docklight Scripting Channel setting: 
USBHID:4D8:F708:P
See also the Docklight example project usb_hid_demo_protocol_based.ptp. 
Alternative setting, using the full device path string:
USBHID:\\?\HID#VID_04D8&PID_F708&MI_01#a&157b00ca&0&0000#{4d1e55b2-f16f-11cf-88cb-001111000030}:P

Example 2:

  Report Descriptor: (37 bytes)
0x05, ...
 0xc0, 
Device Found
  type: 04d9 a052
  path: \\?\HID#VID_04D9&PID_A052#8&393b50b7&0&0000#{4d1e55b2-f16f-11cf-88cb-001111000030}
  serial_number: 2.00
  Manufacturer: Holtek
  Product:      USB-zyTemp
  Release:      200
  Interface:    0
  Usage (page): 0x1 (0xff00)
  Bus type: 1 (USB)
  
--> An affordable CO2 monitor device which also appeared in several tinkering projects: 
https://hackaday.io/project/5301-reverse-engineering-a-low-cost-usb-co-monitor/
https://github.com/irimitenkan/CO2MqttSensor

requires Docklight Sripting v2.4.20 and higher 

Docklight Scripting Channel setting: 
USBHID:4D9:A052:I

The new "I" extension is used to send an initial empty feature report that starts the data reporting. 
See also the Docklight example project usb_hid_demo_co2monitor.ptp.



  