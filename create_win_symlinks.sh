#!/bin/bash

ps_command='New-Item -ItemType SymbolicLink -Path $env:APPDATA\kanata\kanata.kbd -Target \\wsl$\Ubuntu\root\dotfiles\kanata.kbd'
powershell.exe -Command "Start-Process PowerShell -Verb RunAs -ArgumentList '$ps_command'"
