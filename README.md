# vhdl_syntax_checker
Xilinx ISE's code editor is quite dated and does not hold up to todays standards. A better alternative is e.g. NotePad++, however it does not have syntax checking functionality. In order to check for syntax errors you would have to switch back and forth between NP++ and ISE, which is annoying.<br>
The scripts presented here allows syntax checking by just pressing a keyboard shortcut (e.g. F9).

<b>Installation</b>
- copy both files (start_syntax_checker.bat and syntax_checker.ps1) to a directory of your choice

<b>Usage</b>
- First you need to configure the script syntax_checker.ps1 by editing it. You need to configure the variables $iseCmdPath and $tclCmd as described in the comments of syntax_checker.ps1. Note that this script will only work if you have your Project set up with Xilinx ISE.
- Double click on start_syntax_checker.bat to start the scripts. Press the configured key (default=F9) to start the syntax checking. A command prompt will open and display the compilation results. You can simply press enter to close this window.

