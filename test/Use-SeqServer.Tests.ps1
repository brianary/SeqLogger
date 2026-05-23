<#
.SYNOPSIS
Tests Set the default Server and ApiKey for Send-SeqEvent.ps1
#>

if((Test-Path .changes -Type Leaf) -and
	!@(Get-Content .changes |Get-Item |Select-Object -ExpandProperty Name |
		Where-Object {$_.StartsWith("$(($MyInvocation.MyCommand.Name -split '\.',2)[0]).")})) {return}
BeforeAll {
	Set-StrictMode -Version Latest
	$module = Join-Path ($PSScriptRoot |Split-Path) src .publish *.psd1 |Get-Item
	Import-Module $module -Force
}
Describe 'Use-SeqServer' -Tag Use-SeqServer,Use,SeqServer {
	Context 'Set the default Server and ApiKey for Send-SeqEvent.ps1' {
		It "should set the default params, server '<Server>' and ApiKey '<ApiKey>'" -Skip -TestCases @(
			@{ Server = 'http://logs.example.org'; ApiKey = "$(New-Guid)" }
		) {
			Param([uri]$Server,[string]$ApiKey)
			Use-SeqServer -Server $Server -ApiKey $ApiKey
			$PSDefaultParameterValues |Out-String |Write-Warning
			$PSDefaultParameterValues.ContainsKey('Send-SeqEvent:Server') |
				Should -BeTrue -Because 'default Seq server should be set'
			$PSDefaultParameterValues['Send-SeqEvent:Server'] |
				Should -BeExactly $Server -Because 'default Seq server value should be correct'
			$PSDefaultParameterValues.ContainsKey('Send-SeqEvent:ApiKey') |
				Should -BeTrue -Because 'default API key should be set'
			$PSDefaultParameterValues['Send-SeqEvent:ApiKey'] |
				Should -BeExactly $apikey -Because 'default API key value should be correct'
		}
	}
}
AfterAll {
	Remove-Module $module.BaseName -Force
}
