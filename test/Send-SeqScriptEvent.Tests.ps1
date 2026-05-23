<#
.SYNOPSIS
Tests sending an event (often an error) from a script to a Seq server, including script info.
#>

if((Test-Path .changes -Type Leaf) -and
	!@(Get-Content .changes |Get-Item |Select-Object -ExpandProperty Name |
		Where-Object {$_.StartsWith("$(($MyInvocation.MyCommand.Name -split '\.',2)[0]).")})) {return}
BeforeAll {
	Set-StrictMode -Version Latest
	$module = Join-Path ($PSScriptRoot |Split-Path) src .publish *.psd1 |Get-Item
	Import-Module $module -Force
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
	Remove-Module $module.BaseName -Force
}
