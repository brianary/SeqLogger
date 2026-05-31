<#
.SYNOPSIS
Tests sending an event (often an error) from a script to a Seq server, including script info.
#>

if(!(&"$PSScriptRoot/../scripts/Test-RelevantTest.ps1")) {return}
BeforeAll {
	Set-StrictMode -Version Latest
	&"$PSScriptRoot/../scripts/Import-ThisModule.ps1"
}
Describe 'Send-SeqScriptEvent' -Tag Send-SeqScriptEvent,Send,SeqScriptEvent {
	BeforeEach {
		# see https://pester.dev/docs/usage/modules#-modulename
		Mock Invoke-RestMethod -ModuleName SeqLogger
	}
	Context 'Sends an event (often an error) from a script to a Seq server, including script info.' {
		It "should log the error record" {
			try {1/0} catch { Send-SeqScriptEvent 'Trying to connect' $_ -Level Error -Server http://logs.example.org }
			Should -Invoke -ModuleName SeqLogger -CommandName Invoke-RestMethod
		}
	}
}
AfterAll {
	&"$PSScriptRoot/../scripts/Remove-ThisModule.ps1"
}
