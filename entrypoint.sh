#!/bin/sh

envsubst < src/config.local.skel > src/config.local.yaml

if [ "$LABELLO_DOWNLOAD_FONT" = "yes" ] || [ "$1" = "download_font" ]; then
    mkdir -p /opt/labello/download_font
    wget https://github.com/googlefonts/spacemono/raw/master/fonts/SpaceMono-Regular.ttf -O /opt/labello/download_font/Space-Mono.ttf
    echo -e "  - /opt/labello/download_font\n" >> src/config.local.yaml
fi


/usr/bin/python3 /opt/labello/src/labello.py
