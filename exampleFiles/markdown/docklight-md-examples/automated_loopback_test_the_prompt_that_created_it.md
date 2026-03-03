6th example for the new .docklight.md file format: 
```
### 6. automated_loopback_test.md 
**Purpose:** command-line driven testing 
**Features:** command line call `Docklight_Scripting.exe -r automated_loopback_test.docklight.md`. UDP loopback channel (`UDP:LOCALHOST:10001`) that works without external hardware. DL.StartLogging to write a text log file that can be evaluated after the Docklight command line call returned. DL.SendSequence and DL.WaitForSequence for sending a command and waiting for the answer. Receive Sequence COMMENT string that will add a "PASS - device command reaction OK" message to the log output. 
**Use case:** Automated workflow / agentic workflow / verification tests / automated protocol verification and CI-style regression testing. 
```

Your task: write and test an actual example based on these specs. 

1) create a automated_loopback_test.docklight.md with a project and a script that will run a small loopback test 
2) write an example powershell script that calls Docklight Scripting by command line (e.g. `Docklight_Scripting.exe -r automated_loopback_test.docklight.md`) and evaluates the text file created using `automated_loopback_test.docklight.md `. E.g. searching for the "PASS" comment string to decide if the test has passed or failed. 
3) update the `docklight-md-examples-README.md`file with the description of the example. You may modify/improve my original description draft above.

