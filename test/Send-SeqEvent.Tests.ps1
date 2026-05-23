<#
.SYNOPSIS
Tests Send an event to a Seq server.
#>

if((Test-Path .changes -Type Leaf) -and
	!@(Get-Content .changes |Get-Item |Select-Object -ExpandProperty Name |
		Where-Object {$_.StartsWith("$(($MyInvocation.MyCommand.Name -split '\.',2)[0]).")})) {return}
BeforeAll {
	Set-StrictMode -Version Latest
	$module = Join-Path ($PSScriptRoot |Split-Path) src .publish *.psd1 |Get-Item
	Import-Module $module -Force
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
		It "should send a structure error message" {
			Send-SeqEvent -Properties @{ Message = $Error[0].Exception.Message } -Level Error `
				-Server http://audit.example.net
			Should -Invoke -ModuleName SeqLogger -CommandName Invoke-RestMethod
		}
	}
}
AfterAll {
	Remove-Module $module.BaseName -Force
}
