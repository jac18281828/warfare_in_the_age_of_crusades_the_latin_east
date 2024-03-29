#!/usr/bin/env /bin/sh

WEST=25
EAST=40

NORTH=43
SOUTH=35


WIDTH=15c

PROJECTION=-JM22.5/${WIDTH}

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

BEDROCK=ETOPO1_asiaminor.grd

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
                                                                           
gmt begin anatolia
    gmt basemap -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} ${BASEMAP} 
    gmt makecpt -Cgrey -T-50/1500
    gmt grdimage ${ETOPO1} -n+c -I+a45+nt1 ${PROJECTION} -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${OPT}

    gmt coast -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} -G${LAND}/${LAND}/${LAND}@${TRANS} ${MINAREA}
    gmt coast -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} -S${LAKE}/${LAKE}/${LAKE} ${MINAREA}
    gmt coast -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} ${LINE} ${MINAREA}
    gmt coast -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} -Ia/0.5p,${LAKE}/${LAKE}/${LAKE} ${MINAREA}
    # water bounds
    gmt coast -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT}  -L${SCALEBAR} -N3/0.25p,${LAKE}/${LAKE}/${LAKE} ${MINAREA}

    #-F+f11p,Helvetica-Bold+jCB
    #-F+f10p,Palatino-Roman+jCB    
    # cat caps.dat | gmt text -F+f10p -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT}
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

