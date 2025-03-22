#!/bin/bash

create_kanata_symlink='New-Item -ItemType SymbolicLink -Path $env:APPDATA\kanata\kanata.kbd -Target \\wsl$\Ubuntu\root\dotfiles\kanata.kbd'
powershell.exe -Command "Start-Process PowerShell -Verb RunAs -ArgumentList '$create_kanata_symlink'"

create_wezterm_symlink='New-Item -ItemType SymbolicLink -Path $env:USERPROFILE\.wezterm.lua -Target \\wsl$\Ubuntu\root\dotfiles\.wezterm.lua'
powershell.exe -Command "Start-Process PowerShell -Verb RunAs -ArgumentList '$create_wezterm_symlink'"
