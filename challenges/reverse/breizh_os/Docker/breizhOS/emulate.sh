#!/bin/sh

#
# $1 -> Image name
#

# Kill all subprocesses
trap "/usr/bin/pkill -P $$" EXIT INT

# Run kernel + user
/usr/bin/qemu-system-x86_64 -drive format=raw,file=$1 -boot a -no-reboot -nographic -serial file:result.log 2> /dev/null &

# Timeout
/bin/sleep 15