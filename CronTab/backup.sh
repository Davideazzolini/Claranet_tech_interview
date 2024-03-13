#!/usr/bin/sh
zip backup.zip  /home/user/*
scp backup.zip user@192.168.1.100:/home
