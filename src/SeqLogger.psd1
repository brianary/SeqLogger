# see https://docs.microsoft.com/powershell/scripting/developer/module/how-to-write-a-powershell-module-manifest
# and https://docs.microsoft.com/powershell/module/microsoft.powershell.core/new-modulemanifest
@{
RootModule = 'SeqLogger.psm1'
ModuleVersion = '0.0.0.0' # placeholder to be overridden
CompatiblePSEditions = @('Core')
GUID = 'e31e552e-cfea-4b19-ad91-aef8cc40e29b'
Author = 'Brian Lalonde'
CompanyName = 'Unknown'
Copyright = 'Copyright © 2026 Brian Lalonde'
Description = ' Commands to send structured log events to a Seq server.'
PowerShellVersion = '7.0'
# RequiredModules = ,'Microsoft.PowerShell.Utility'
FunctionsToExport = @('*') # '*'
CmdletsToExport = @() # '*'
VariablesToExport = @() # '*'
# AliasesToExport = @()
FileList = @('SeqLogger.psd1','SeqLogger.psm1')
PrivateData = @{
	PSData = @{
		Tags = @('Seq', 'Log', 'Logging', 'Logger')
		LicenseUri = 'https://github.com/brianary/SeqLogger/blob/master/LICENSE'
		ProjectUri = 'https://github.com/brianary/SeqLogger/'
		IconUri = 'http://webcoder.info/images/SeqLogger.svg'
		# ReleaseNotes = ''
		# PS7: A list of external modules that this module is dependent upon.
		# ExternalModuleDependencies = ,'Microsoft.PowerShell.Utility'
	}
}
}
