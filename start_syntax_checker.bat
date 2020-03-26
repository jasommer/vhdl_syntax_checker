@echo off
setlocal EnableExtensions EnableDelayedExpansion

if exist syntax_checker.ps1 (
	echo Starting skript. Press F9 to start the Syntax evaluation.
	PowerShell.exe -ExecutionPolicy Bypass -File syntax_checker.ps1
) else (
	echo Error. Could not find syntax_checker.ps1
	echo syntax_checker.ps1 should be in the same directory as this file.
) 

Timeout 60