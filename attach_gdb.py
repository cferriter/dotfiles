#!/usr/bin/env python3

# This script can be used from inside GDB to search for a process by name
# process and attach to it. Use the following CMD from the '(gdb)' prompt:
# source ~/dotfiles/attach_ovs.py

import subprocess
import string

PROC_NAME='vswitchd'

def backquotes(cmdwords):
        output = subprocess.Popen(cmdwords, stdout=subprocess.PIPE).communicate()[0]
        return output.strip()

pid = backquotes(['pgrep', PROC_NAME])

gdb.execute("attach " + str(pid.decode("utf-8")))
