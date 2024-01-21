#! /bin/bash
PALSERVER_PATH=~/Steam/steamapps/common/PalServer

if [ ! -e  $PALSERVER_PATH/Pal/Saved/Config/LinuxServer/PalWorldSettings.ini ]; then
    echo "Missing server configuration."
    echo "Please copy & edit the following config into your save volume under Saved/Config/LinuxServer/PalWorldSettings.ini:"
    cat $PALSERVER_PATH/DefaultPalWorldSettings.ini
    exit -1
fi

$PALSERVER_PATH/PalServer.sh -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS
