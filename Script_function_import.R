#Script du projet R sur l'hydrographie, ce script contiendra à minima les fonctions d'imports

install.packages("happign")
install.packages("sf")
install.packages("dplyr")
install.packages("tmap")
install.packages("terra")

library(terra)
library(happign)
library(sf)
library(dplyr)
library(tmap)


couches_vecteur <- get_layers_metadata("wfs")
couches_raster <- get_layers_metadata("wms-r")

corcieux_casdastre <- get_apicarto_cadastre(88115)

cours_eau_layer <- "BDTOPO_V3:cours_d_eau"
bassin_v_layer <- "BDTOPO_V3:bassin_versant_topographique"
detail_hydro_layer <- "BDTOPO_V3:detail_hydrographique"
noeud_layer <- "BDTOPO_V3:noeud_hydrographique"
plan_eau_layer <- "BDTOPO_V3:plan_d_eau"
surf_hydro_layer <- "BDTOPO_V3:surface_hydrographique"
troncon_hydro_layer <- "BDTOPO_V3:troncon_hydrographique"

carto_bassin_v <- "BDCARTO_V5:bassin_versant_topographique"

cours_eau <- get_wfs(corcieux_casdastre, cours_eau_layer, spatial_filter = "INTERSECTS")
bassin_v<- get_wfs(corcieux_casdastre, bassin_v_layer, spatial_filter = "INTERSECTS")
detail_hydro<- get_wfs(corcieux_casdastre, detail_hydro_layer, spatial_filter = "INTERSECTS")
noeud<- get_wfs(corcieux_casdastre, noeud_layer, spatial_filter = "INTERSECTS")
plan_eau<- get_wfs(corcieux_casdastre, plan_eau_layer, spatial_filter = "INTERSECTS")
surf_hydro<- get_wfs(corcieux_casdastre, surf_hydro_layer, spatial_filter = "INTERSECTS")
troncon_hydro<- get_wfs(corcieux_casdastre, troncon_hydro_layer, spatial_filter = "INTERSECTS")


