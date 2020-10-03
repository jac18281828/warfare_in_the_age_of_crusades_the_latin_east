#!/usr/bin/env bash

# Regional Map: Route of Peter the Hermit’s Peasants’ Crusade, 1096 (see Map from Konstam, pages 48-49/ generate Europe, Upper Mediterranean and Western Anatolia Map Shell, perhaps 55 degrees North latitude to 30 degrees south, henceforth called “Europe-Mediterranean Map Shell”)

WEST=20
EAST=50
SOUTH=30
NORTH=55

WIDTH=5.5i

PROJECTION=-JM${WIDTH}

OPT="-V -P"

LINE=-W0.25p,200/200/200
LAND=250
LAKE=235

gmt gtd2cpt --show-sharedir

# how to rose
# city and poi points

gmt set PS_LINE_CAP=ROUND PS_LINE_JOIN=ROUND PS_SCALE_X=1 PS_SCALE_Y=1 MAP_ORIGIN_X=1i MAP_ORIGIN_Y=3.5i
gmt psbasemap -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${PROJECTION} ${OPT} -Ba -B+gwhite+t"Les Crusades" ${ROSE} > basemap.ps
gmt pscoast -R${WEST}/${EAST}/${SOUTH}/${NORTH} -G${LAND}/${LAND}/${LAND} ${PROJECTION} ${OPT}  ${ROSE} > landmass.ps
gmt pscoast -R${WEST}/${EAST}/${SOUTH}/${NORTH} -S${LAKE}/${LAKE}/${LAKE} ${PROJECTION} ${OPT} ${ROSE} > lakemass.ps
gmt pscoast -R${WEST}/${EAST}/${SOUTH}/${NORTH} ${LINE} ${PROJECTION} ${OPT} ${ROSE} > coastline.ps
gmt pscoast -R${WEST}/${EAST}/${SOUTH}/${NORTH} -Ia ${PROJECTION} ${OPT}  ${ROSE} > river.ps
gmt pscoast -R${WEST}/${EAST}/${SOUTH}/${NORTH} -Na ${PROJECTION} ${OPT} ${ROSE} > national.ps

# ETOPO1_Bed_g_gmt4.grd is the NETCDF encoded ETOPO1 dataset downloaded for GMT4 Bedrock

gmt grd2cpt ETOPO1_Bed_g_gmt4.grd -Cgrey > project.cpt
gmt grdimage ETOPO1_Bed_g_gmt4.grd -I+a45+nt1 ${PROJECTION} -R${WEST}/${EAST}/${SOUTH}/${NORTH} -Cproject.cpt ${OPT} -K > topo.ps
