function Send-SeqEvent([string] $Message, $Properties,
[ValidateSet('Verbose','Debug','Information','Warning','Error','Fatal')][string] $Level,
[uri] $Server, [string] $ApiKey, [switch] $LiteralMessage) { Start-Sleep -Seconds 2 }
function Send-SeqScriptEvent([string]$Action,
[Management.Automation.ErrorRecord]$ErrorRecord,
[ValidateSet('Verbose','Debug','Information','Warning','Error','Fatal')][string] $Level = 'Error',
[Alias('Scope')][string] $InvocationScope, [uri] $Server, [string] $ApiKey) { Start-Sleep -Seconds 2 }
function Use-SeqServer([Parameter(Mandatory=$true)][uri] $Server, [string] $ApiKey) {}
$result = 'Done'
$key = "$(New-Guid)"
