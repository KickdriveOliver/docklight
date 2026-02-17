# USB HID CO2 Monitor Demo

This HID demo communicates with a TFA-Dostmann AirCO2ntrol (Holtek/ZyTemp VID:PID 4D9:A052) and visualizes live air quality values. It includes auto-run scripting, status templates, and screenshots for operational checks.

## Requirements

- Docklight Scripting (network/HID/named-pipe examples are intended for Docklight Scripting)

## Files

| File | Description |
|------|-------------|
| air_quality_template_green.rtf | Rich text template |
| air_quality_template_red.rtf | Rich text template |
| air_quality_template_yellow.rtf | Rich text template |
| usb_hid_demo_co2monitor.ptp | Docklight project file |
| usb_hid_demo_co2monitor.txt | Text export or notes |
| usb_hid_demo_co2monitor_auto.pts | Docklight Script |
| usb_hid_demo_co2monitor_auto_pts.vbs | VBScript export of script |
| usb_hid_demo_co2monitor_checksum_validator.png | Screenshot |
| usb_hid_demo_co2monitor_ptp.txt | Text export of project file |
| usb_hid_demo_co2monitor_screenshot.png | Screenshot |

## Getting Started

1. Open `usb_hid_demo_co2monitor.ptp` in Docklight Scripting.
2. Press `F5`. The matching `usb_hid_demo_co2monitor_auto.pts` script is loaded automatically and started together with communication.

---
*Part of the [Docklight Examples](../../../README.md) collection. See [docklight.de/examples/](https://docklight.de/examples/) for more.*


