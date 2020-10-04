#!/usr/bin/env bash

# Regional Map: Route of Peter the Hermit’s Peasants’ Crusade, 1096 (see Map from Konstam, pages 48-49/ generate Europe, Upper Mediterranean and Western Anatolia Map Shell, perhaps 55 degrees North latitude to 30 degrees south, henceforth called “Europe-Mediterranean Map Shell”)

WEST=20
EAST=50
SOUTH=30
NORTH=55

WIDTH=15c

PROJECTION=-JM35/${WIDTH}

OPT="-V --FONT_ANNOT_PRIMARY=10p"

PEN=0.25p,200/200/200
LINE=-W${PEN}
LAND=255
LAKE=230
TRANS=5

gmt gtd2cpt --show-sharedir

# ETOPO1_Bed_g_gmt4.grd is the NETCDF encoded ETOPO1 dataset downloaded for GMT4 Bedrock

ETOPO1=../ETOPO1_Bed_g_gmt4.grd

if [ ! -f ${ETOPO1} ]
then
    echo "ETOPO1 GRID file is required"
    exit 1
fi

# how to rose
# city and poi points

gmt set PS_LINE_CAP=ROUND PS_LINE_JOIN=ROUND PS_SCALE_X=1 PS_SCALE_Y=1 MAP_ORIGIN_X=1c MAP_ORIGIN_Y=1c

BASEMAP='-B10dg10d -B+gwhite'

gmt begin central_europe
    gmt basemap -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} ${BASEMAP} 

    gmt makecpt -Cgrey -T0/1500
    gmt grdimage ${ETOPO1} -n+c -I+a45+nt1 ${PROJECTION} -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${OPT}

    gmt coast -R${WEST}/${EAST}/${SOUTH}/${NORTH}  ${PROJECTION} ${OPT} -G${LAND}/${LAND}/${LAND}@${TRANS}
    gmt coast -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} -S${LAKE}/${LAKE}/${LAKE} 
    gmt coast -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} ${LINE} 
    gmt coast -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} -I0,1/${PEN}
    # national bounds
    gmt coast -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} -N1/0.25p,225/225/225
    # water bounds
    gmt coast -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} -N3/0.25p,220/220/220@${TRANS}

    echo 10.3333333 36.8666667 14 0 4 LM Carthage | gmt text -F+f11p,Helvetica-Bold+jCB -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT}
    cat cities.dat | gmt text -F+f11p,Helvetica-Bold+jCB -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT}
gmt end

# try gmt end show

#gmt pscoast -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${LINE} -G${LAND}/${LAND}/${LAND} ${PROJECTION} ${OPT} -Na/${PEN} -Ia/${PEN} ${BASEMAP} ${ROSE} > central_europe.ps

#gmt psbasemap -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} ${BASEMAP} > basemap.ps
#gmt pscoast -R${WEST}/${EAST}/${SOUTH}/${NORTH} -G${LAND}/${LAND}/${LAND} ${PROJECTION} ${OPT} > landmass.ps
#gmt pscoast -R${WEST}/${EAST}/${SOUTH}/${NORTH} -S${LAKE}/${LAKE}/${LAKE} ${PROJECTION} ${OPT} > lakemass.ps
#gmt pscoast -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${LINE} ${PROJECTION} ${OPT} > coastline.ps
#gmt pscoast -R${WEST}/${EAST}/${SOUTH}/${NORTH} -Ia/${PEN} ${PROJECTION} ${OPT}  > river.ps
#gmt pscoast -R${WEST}/${EAST}/${SOUTH}/${NORTH} -Na/${PEN} ${PROJECTION} ${OPT} > national.ps


#gmt grd2cpt ${ETOPO1} -Cgrey > project.cpt
#gmt grdimage ${ETOPO1} -n+c -I+a45+nt1 ${PROJECTION} -R${WEST}/${EAST}/${SOUTH}/${NORTH} -Cproject.cpt ${OPT} -K > topo.ps
