DocklightProjectGen v0.2
Copyright 2005 Flachmann und Heggelbacher (www.fuh-edv.de)
Date: 2005-10-09

Generate a Docklight V1.6 project file from a Docklight HEX ASCII log file.

Usage: 
DocklightProjectGen.exe [ <inputFile.txt> ] [ <outputProject.ptp> ]

<inputFile.txt> 
A Docklight log file in plain text format and HEX data representation. 
Default input file is "log_hex.txt".

<outputFile.ptp>
Project generator output file. Default is the same file name as the
input file, but with a file extension ".ptp".

Example: 
DocklightProjectGen.exe modemlog_hex.txt modemsimulator.ptp

(Reads the log file "modemlog_hex.txt" which was created using the 
Docklight Scripting Sample "Automated Modem Testing". The resulting project file 
"modemsimulator.ptp" can be used to simulate the modem's AT command behavior.
See also the Docklight Manual at 
http://docklight.de/manual/checkingatmodemcommandset.htm ) 

Additional information:
The communication session logged must follow a simple master/slave model:
The master (Device 1, or the Docklight TX channel) sends out a request,
the slave (Device 2) answers to each message with a specific response. 
The log file must start with the first message of the master.

For creating the input log file <inputFile.txt>, use the following Docklight 
settings: 
Use default display settings and make sure that each new message begins with a 
date/time stamp and the communication direction indicator (e.g. [TX] or [COM8]). 
Do not use the "comments" function of the Receive Sequence(s) to add additional 
information in the communication window. Do not use the "Contents Filter" option. 
Create a "Plain text" log file (not a HTML file) for the HEX representation.

The resulting project file can be used as a simple simulator for the slave device.