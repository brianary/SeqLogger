<#
.SYNOPSIS
Tests Send an event to a Seq server.
#>

if(!(&"$PSScriptRoot/../scripts/Test-RelevantTest.ps1")) {return}
BeforeAll {
	Set-StrictMode -Version Latest
	&"$PSScriptRoot/../scripts/Import-ThisModule.ps1"
}
Describe 'Send-SeqEvent' -Tag Send-SeqEvent,Send,SeqEvent {
	BeforeEach {
		# see https://pester.dev/docs/usage/modules#-modulename
		Mock Invoke-RestMethod -ModuleName SeqLogger
	}
	Context 'Send an event to a Seq server' -Tag Example {
		It "should send a literal message" {
			Send-SeqEvent 'Hello from PowerShell' -Properties @{ PWD = "$PWD" } `
				-Server http://paulbunyan.example.net -LiteralMessage
			Should -Invoke -ModuleName SeqLogger -CommandName Invoke-RestMethod
		}
		It "should send a structured message" {
			Send-SeqEvent 'Event: {User} on {Machine}' @{ User = $env:UserName; Machine = $env:ComputerName } `
				-Server http://jacklumber.example.com
			Should -Invoke -ModuleName SeqLogger -CommandName Invoke-RestMethod
		}
		It "should send a structured error message" {
			Send-SeqEvent -Properties @{ Message = 'Error while processing' } -Level Error `
				-Server http://audit.example.net
			Should -Invoke -ModuleName SeqLogger -CommandName Invoke-RestMethod
		}
	}
}
AfterAll {
	&"$PSScriptRoot/../scripts/Remove-ThisModule.ps1"
}
