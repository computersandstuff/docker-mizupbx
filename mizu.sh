#!/bin/bash

MIZU_EXE="/root/prefix32/drive_c/Program Files/MizuPBX/MizuManage.exe"
PREFIX_DIR="/root/prefix32"
INSTALL_EXE="/root/MizuWinPBX_Setup.exe"

if [ ! -d "$PREFIX_DIR/drive_c" ]; then
    mv /root/prefix32_original/* /root/prefix32
fi

chown -R root:root /root/prefix32

if [ ! -e "$MIZU_EXE" ] ; then
    if [ ! -e "$INSTALL_EXE" ] ; then
        wget https://www.mizu-voip.com/G/download/MizuWinPBX_Setup.exe
    fi
    wine MizuWinPBX_Setup.exe
    rm MizuWinPBX_Setup.exe
fi

wine "$MIZU_EXE"
