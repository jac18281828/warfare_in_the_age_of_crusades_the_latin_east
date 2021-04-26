#!/usr/bin/env /bin/bash

WEST=23
EAST=83

NORTH=47
SOUTH=17

WIDTH=7

CLNG=$(expr $EAST + $WEST)
CLAT=$(expr $NORTH + $SOUTH)
CLAT=$(expr $CLAT / 2)
CLNG=$(expr $CLNG / 2)

# compute 2 standard parallels
SPNLAT=$(expr $CLAT + $NORTH)
SPNLAT=$(expr $SPNLAT / 2)

SPSLAT=$(expr $CLAT + $SOUTH)
SPSLAT=$(expr $SPSLAT / 2)

SCALE="$WIDTH"i   # one degree is this many units

PROJECTION="-JB$CLNG/$CLAT/$SPSLAT/$SPNLAT/$SCALE"

OPT="-V --FONT_ANNOT_PRIMARY=10p"

PEN=0.25p,200/200/200
LINE=-W${PEN}
LAND=255
LAKE=170
TRANS=15
MINAREA=-A100
SCALEBAR="f32/42.5/40/250M"

if [ ! -x $(which gmt) ]
then
    echo GMT required
    exit 1
fi

VERSION=$(gmt --version)

if [ "${VERSION}" = [0-5]* ]
then
    gmt --version
    echo gmt 6 reqired
    exit 1
fi

gmt gtd2cpt --show-sharedir

# ETOPO1_Bed_g_gmt4.grd is the NETCDF encoded ETOPO1 dataset downloaded for GMT4 Bedrock

BEDROCK=ETOPO1_arabia.grd

if [ -f /bedrock/${BEDROCK} ]
then
    ETOPO1=/bedrock/${BEDROCK}
else
    ETOPO1=../ETOPO1_Bed_g_gmt4.grd
fi

ls -lh ${ETOPO1}

if [ ! -f ${ETOPO1} ]
then
    echo "ETOPO1 GRID file ${ETOPO1} is required"
    exit 1
fi

gmt set PS_LINE_CAP=ROUND PS_LINE_JOIN=ROUND PS_SCALE_X=1 PS_SCALE_Y=1 MAP_ORIGIN_X=1c MAP_ORIGIN_Y=1c

BASEMAP='-B10dg10d -B+gwhite'
                                                                           
gmt begin southwest_asia
    gmt basemap -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} ${BASEMAP} 
    gmt makecpt -Cgrey -T-50/1500
    gmt grdimage ${ETOPO1} -n+c ${PROJECTION} -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${OPT}

    if [ -f city.dat ]
    then
        cat city.dat | gmt text -Dj6p -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} -F+f10p,Palatino-Roman+jCB    
        cat city.dat | gmt plot -Sc2p -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT}
    fi

    
gmt end

if [ "--sleep" = "$1" ]
then
    sleep 20
fi
