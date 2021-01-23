#!/usr/bin/env bash

# Regional Map: Route of Peter the Hermit’s Peasants’ Crusade, 1096 (see Map from Konstam, pages 48-49/ generate Europe, Upper Mediterranean and Western Anatolia Map Shell, perhaps 55 degrees North latitude to 30 degrees south, henceforth called “Europe-Mediterranean Map Shell”)

WEST=-5
EAST=30
SOUTH=30
NORTH=55

WIDTH=15c

PROJECTION=-JM17.5/${WIDTH}

OPT="-V --FONT_ANNOT_PRIMARY=10p"

PEN=0.25p,200/200/200
LINE=-W${PEN}
LAND=255
LAKE=170
RIVER=220
TRANS=15
MINAREA=-A100
SCALEBAR="f25/50/40/500M"

VERSION=$(gmt --version)

if [[ ${VERSION} != 6* ]]
then
    gmt --version
    echo gmt 6 reqired
    exit 1
fi

gmt gtd2cpt --show-sharedir

# ETOPO1_Bed_g_gmt4.grd is the NETCDF encoded ETOPO1 dataset downloaded for GMT4 Bedrock
if [ -f /bedrock/ETOPO1_Bed_g_gmt4.grd ]
then
    ETOPO1=/bedrock/ETOPO1_Bed_g_gmt4.grd
else
    ETOPO1=../ETOPO1_Bed_g_gmt4.grd
fi

if [ ! -f ${ETOPO1} ]
then
    echo "ETOPO1 GRID file is required"
    exit 1
fi

gmt set PS_LINE_CAP=ROUND PS_LINE_JOIN=ROUND PS_SCALE_X=1 PS_SCALE_Y=1 MAP_ORIGIN_X=1c MAP_ORIGIN_Y=1c

BASEMAP='-B10dg10d -B+gwhite'

#gmt begin national
#    gmt basemap -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} ${BASEMAP} 
#    # national bounds
#    gmt coast -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} -Na/1.25p,225/225/225
#gmt end
                                                                           
gmt begin europe_mediterranean
    gmt basemap -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} ${BASEMAP} 
    gmt makecpt -Cgrey -T-50/1500
    gmt grdimage ${ETOPO1} -n+c -I+a45+nt1 ${PROJECTION} -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${OPT}

    gmt coast -R${WEST}/${EAST}/${SOUTH}/${NORTH}  ${PROJECTION} ${OPT} -G${LAND}/${LAND}/${LAND}@${TRANS} ${MINAREA}
    gmt coast -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} -S${LAKE}/${LAKE}/${LAKE} ${MINAREA}
    gmt coast -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} ${LINE} ${MINAREA}
    gmt coast -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} -I0/0.5p,${RIVER}/${RIVER}/${RIVER} -I1/0.5p,${RIVER}/${RIVER}/${RIVER} -I2/0.5p,${RIVER}/${RIVER}/${RIVER} ${MINAREA}
    # water bounds
    gmt coast -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} -L${SCALEBAR} -N3/0.25p,${LAKE}/${LAKE}/${LAKE} ${MINAREA}

    #-F+f11p,Helvetica-Bold+jCB
    if [ -f city.dat ]
    then
        cat city.dat | gmt text -Dj6p -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} -F+f6p,Palatino-Roman+jCB    
        cat city.dat | gmt plot -Sc2p -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT}
    fi

    if [ -f battle.dat ]
    then

        cat battle.dat | gmt text -Dj6p -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} -F+f6p,Palatino-Roman+jCB    
        cat battle.dat | gmt plot -S+4p -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT}
    fi

    if [ -f place.dat ]
    then
        cat place.dat | gmt text -Dj6p -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} -F+f6p,Palatino-Roman+jCB
    fi

gmt end

gmt begin border

    gmt coast -R${WEST}/${EAST}/${SOUTH}/${NORTH}  ${PROJECTION} ${OPT} -G${LAND}/${LAND}/${LAND}@${TRANS} ${MINAREA}
    gmt coast -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} ${LINE} ${MINAREA}
    gmt coast -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} -N1/0.25p,${LAKE}/${LAKE}/${LAKE} ${MINAREA}

gmt end

if [ "--sleep" == $1 ]
then
    sleep 20
fi
