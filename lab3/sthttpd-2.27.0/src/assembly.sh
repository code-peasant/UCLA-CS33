#!/bin/sh

gcc -S -O2 -fno-inline -static-libasan -fsanitize=address -I .. -I . thttpd.c -o thttpd-as.s

gcc -S -O2 -fno-inline -fno-stack-protector -zexecstack -I .. -I . thttpd.c -o thttpd-no.s
