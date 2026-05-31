<#
.SYNOPSIS
Tests Set the default Server and ApiKey for Send-SeqEvent.ps1
#>

if(!(&"$PSScriptRoot/../scripts/Test-RelevantTest.ps1")) {return}
BeforeAll {
	Set-StrictMode -Version Latest
	&"$PSScriptRoot/../scripts/Import-ThisModule.ps1"
}
Describe 'Use-SeqServer' -Tag Use-SeqServer,Use,SeqServer {
	Context 'Set the default Server and ApiKey for Send-SeqEvent.ps1' {
		It "should set the default params, server '<Server>' and ApiKey '<ApiKey>'" -TestCases @(
			@{ Server = 'http://logs.example.org'; ApiKey = "$(New-Guid)" }
		) {
			Param([uri]$Server,[string]$ApiKey)
			Use-SeqServer -Server $Server -ApiKey $ApiKey
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
	&"$PSScriptRoot/../scripts/Remove-ThisModule.ps1"
}
