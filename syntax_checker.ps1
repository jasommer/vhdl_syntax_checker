########### CONFIGURATION START ##################

# Key code for the key that activates the syntax check.
# key codes can be looked up here: https://docs.microsoft.com/de-de/dotnet/api/system.windows.forms.keys?view=netframework-4.8
$key = 120 

# FULL path to the link of the Xilinx ISE command prompt.
# (e.g.: "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Xilinx Design Tools\ISE Design Suite 14.7\Accessories\ISE Design Suite 32 Bit Command Prompt.lnk")
$iseCmdPath = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Xilinx Design Tools\ISE Design Suite 14.7\Accessories\ISE Design Suite 32 Bit Command Prompt.lnk"

# TCL command for running the syntax check. 
# This can be copied from the Console in the Xilinx ISE Project Navigator when clicking on "Behavioral Check Syntax"
# (e.g.: "vhpcomp -work isim_temp -intstyle ise -prj C:/<PathToProjectFolder>/top_level_tb_stx_beh.prj")
$tclCmd = "vhpcomp -work isim_temp -intstyle ise -prj C:/<EnterPathHere>/top_level_tb_stx_beh.prj"

# Compilation delay time.
# Compilation can take a some of time depending on your system and your project size. 
# this script will wait this amount of time before sending "exit" to the console
$waitTime = 1 #[Seconds]

########### CONFIGURATION END ##################

function Test-Key
{    
  # definition of Windows API method
  $Signature = @'
    [DllImport("user32.dll", CharSet=CharSet.Auto, ExactSpelling=true)] 
    public static extern short GetAsyncKeyState(int virtualKeyCode); 
'@

  Add-Type -MemberDefinition $Signature -Name Keyboard -Namespace PsOneApi
  [bool]([PsOneApi.Keyboard]::GetAsyncKeyState($key) -eq -32767)
}

function Launch-Syntax-Checker
{
    Add-Type -AssemblyName System.Windows.Forms

    Start-Process -FilePath $iseCmdPath -WindowStyle Maximized
    Start-Sleep -Seconds 1

    [System.Windows.Forms.SendKeys]::SendWait($tclCmd)
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")

    Start-Sleep -Seconds $waitTime
    [System.Windows.Forms.SendKeys]::SendWait("exit")
}

# Main Program
while($true)
{
  Sleep -Milliseconds 10
  $pressed = Test-Key

  if($pressed)
  {
    Write-Host "### STARTING NEW SYNTAX CHECK ###"
    Launch-Syntax-Checker
  }

} 