# VHS https://github.com/charmbracelet/vhs
Output demo.gif
Hide
Set Shell pwsh
Type ". ./demo.ps1"
Enter
Type "Clear-Host"
Enter
Show
Type "Send-SeqE"
Tab
Type " 'Completed process: {Result}' -Properties @{ Result = $result } -Server http://paulbunyan.example.net/"
Enter
Type "# set default params"
Enter
Type "Use-SeqServer -Server https://paulbunyan.example.net/ -ApiKey $key"
Enter
Type "Send-SeqE"
Tab
Type " 'System is not responding!' -Level E"
Tab
Type " -Lit"
Tab
Enter
Type "# within a script:"
Enter
Type "Send-SeqSc"
Tab
Enter
Type "try {1/0} catch {Write-Error $_; Send-SeqScriptEvent 'Script error' $_}"
Sleep 9s
