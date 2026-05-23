SeqLogger
=========

<!-- To publish to PowerShell Gallery, commit an update to the .psd1 file -->
<img src="images/SeqLogger.svg" alt="SeqLogger icon" align="right" height="200" width="200" />

[![PowerShell Gallery Version](https://img.shields.io/powershellgallery/v/SeqLogger)](https://www.powershellgallery.com/packages/SeqLogger/)
[![PowerShell Gallery](https://img.shields.io/powershellgallery/dt/SeqLogger)](https://www.powershellgallery.com/packages/SeqLogger/)
[![Actions Status](https://github.com/brianary/SeqLogger/actions/workflows/continuous.yml/badge.svg)](https://github.com/brianary/SeqLogger/actions/workflows/continuous.yml)
[![Mastodon: @dataelemental@mastodon.social](https://badgen.net/badge/@dataelemental/@mastodon.social/blue?icon=mastodon)](https://mastodon.social/@dataelemental "DataElemental Mastodon profile")

Commands to send structured log events to a Seq server.

<img src="images/demo.gif" alt="a demonstration of the module commands" height="300" width="600" />

- [Send-SeqEvent](https://github.com/brianary/SeqLogger/wiki/Send-SeqEvent): Send an event to a Seq server.
- [Send-SeqScriptEvent](https://github.com/brianary/SeqLogger/wiki/Send-SeqScriptEvent): Sends an event (often an error) from a script to a Seq server, including script info.
- [Use-SeqServer](https://github.com/brianary/SeqLogger/wiki/Use-SeqServer): Set the default Server and ApiKey for Send-SeqEvent.ps1
