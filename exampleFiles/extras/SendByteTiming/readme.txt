Docklight Scripting Example "SendByteTiming.pts"
Delay between individual characters of a Send Sequence

Date: 2006-09-15
Author: Heggelbacher

Usage: 
- Open the Docklight script file "SendByteTiming.pts"
- Open your Docklight project file that defines your protocol messages
- Start the script (Menu Scripting->Run Script)
- Enter the delay time
- Send any of your project's Send Sequences. The script will now
  split the sequence into individual characters and apply the delay 
  specified.  

Additional Notes:
- Docklight Scripting will not provide a very accurate timing. Additional
  delay of up to 10ms is possible. Using "Plain Text Output" instead of 
  "Formatted Text Output" (menu Tools->Options...) will result in lower
  delay.
- This demo project can also be used with the evaluation version of 
  Docklight Scripting. No Docklight Scripting license key is required.
- Another way of introducing a specific timing on send is the '&' delay
  function character (see the "Edit Send Sequence" documentation)

 