#!/usr/bin/env bash

# Regional Map: Route of Peter the Hermit’s Peasants’ Crusade, 1096 (see Map from Konstam, pages 48-49/ generate Europe, Upper Mediterranean and Western Anatolia Map Shell, perhaps 55 degrees North latitude to 30 degrees south, henceforth called “Europe-Mediterranean Map Shell”)

WEST=5
EAST=15
SOUTH=47
NORTH=52

WIDTH=15c

PROJECTION=-JM5/${WIDTH}

OPT="-V --FONT_ANNOT_PRIMARY=10p"

PEN=0.25p,200/200/200
LINE=-W${PEN}
LAND=255
LAKE=230
TRANS=10

gmt gtd2cpt --show-sharedir

# ETOPO1_Bed_g_gmt4.grd is the NETCDF encoded ETOPO1 dataset downloaded for GMT4 Bedrock

ETOPO1=../ETOPO1_Bed_g_gmt4.grd

if [ ! -f ${ETOPO1} ]
then
    echo "ETOPO1 GRID file is required"
    exit 1
fi

gmt set PS_LINE_CAP=ROUND PS_LINE_JOIN=ROUND PS_SCALE_X=1 PS_SCALE_Y=1 MAP_ORIGIN_X=1c MAP_ORIGIN_Y=1c

BASEMAP='-B2dg3d -B+gwhite'

gmt begin central_europe
    gmt basemap -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} ${BASEMAP} 
    gmt makecpt -Cgrey -T0/1500
    gmt grdimage ${ETOPO1} -n+c -I+a45+nt1 ${PROJECTION} -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${OPT}

    gmt coast -R${WEST}/${EAST}/${SOUTH}/${NORTH}  ${PROJECTION} ${OPT} -G${LAND}/${LAND}/${LAND}@${TRANS}
    gmt coast -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} -S${LAKE}/${LAKE}/${LAKE} 
    gmt coast -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} ${LINE} 
    gmt coast -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} -Ia/0.5p,240/240/240
    # national bounds
    gmt coast -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} -N1/1.25p,225/225/225
    # water bounds
    gmt coast -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} -N3/0.25p,220/220/220@${TRANS}

    #-F+f11p,Helvetica-Bold+jCB
    #-F+f10p,Palatino-Roman+jCB    
    # cat caps.dat | gmt text -F+f10p -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT}
    # todo - how to shift text
    cat city.dat | gmt text -Dj6p -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} -F+f10p,Palatino-Roman+jCB    
    cat city.dat | gmt plot -Sc2p -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT}
    cat battle.dat | gmt text -Dj6p -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} -F+f10p,Palatino-Roman+jCB    
    cat battle.dat | gmt plot -S+4p -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT}

gmt end
# try gmt end show

IRECT='-R-5/20/40/55'
IPROJ='-JM10/2i'

gmt begin inset
  gmt basemap ${IRECT} ${IPROJ} ${OPT} -B+ggrey
  gmt coast ${IRECT}  ${IPROJ} ${OPT} -G${LAND}/${LAND}/${LAND}@${TRANS}
  gmt coast ${IRECT} ${IPROJ} ${OPT} -S${LAKE}/${LAKE}/${LAKE}
  gmt coast ${IRECT} ${IPROJ} ${OPT} -N1,3/0.25p,220/220/220@${TRANS}
  cat city.dat | gmt plot -Sc2p ${IRECT} ${IPROJ} ${OPT}
  cat battle.dat | gmt plot -S+2p ${IRECT} ${IPROJ} ${OPT}
  gmt plot -W0.5p ${IRECT} ${IPROJ} ${OPT} <<EOF
5 47
15 47
15 52
5 52
5 47
EOF
    
gmt end
