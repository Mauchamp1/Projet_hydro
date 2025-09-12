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


#Récupérer une couche vecteur de la zone souhaitée :
corcieux_casdastre <- get_apicarto_cadastre(88115)

#Récupération des différentes couches des enjeux hydrique :
cours_eau_layer <- "BDTOPO_V3:cours_d_eau"
bassin_v_layer <- "BDTOPO_V3:bassin_versant_topographique"
detail_hydro_layer <- "BDTOPO_V3:detail_hydrographique"
noeud_layer <- "BDTOPO_V3:noeud_hydrographique"
plan_eau_layer <- "BDTOPO_V3:plan_d_eau"
surf_hydro_layer <- "BDTOPO_V3:surface_hydrographique"
troncon_hydro_layer <- "BDTOPO_V3:troncon_hydrographique"

#test d'une bdcarto-------------------------------------------------------------
carto_bassin_v <- "BDCARTO_V5:bassin_versant_topographique"

#insertion des couches enjeux eau sur la couche vecteur de la zone :
cours_eau <- get_wfs(corcieux_casdastre, cours_eau_layer, spatial_filter = "INTERSECTS")
bassin_v<- get_wfs(corcieux_casdastre, bassin_v_layer, spatial_filter = "INTERSECTS")
detail_hydro<- get_wfs(corcieux_casdastre, detail_hydro_layer, spatial_filter = "INTERSECTS")
noeud<- get_wfs(corcieux_casdastre, noeud_layer, spatial_filter = "INTERSECTS")
plan_eau<- get_wfs(corcieux_casdastre, plan_eau_layer, spatial_filter = "INTERSECTS")
surf_hydro<- get_wfs(corcieux_casdastre, surf_hydro_layer, spatial_filter = "INTERSECTS")
troncon_hydro<- get_wfs(corcieux_casdastre, troncon_hydro_layer, spatial_filter = "INTERSECTS")

#Création de la carte avec les différentes paramètres :
map <- tm_shape(matrice) +
  tm_borders(lwd = 5, col = "black") +
  tm_fill(col = "nom_com", palette = "Set3") +
  tm_text(text = "section_dep",
          size = 0.8, col = "black", 
          offset = c(0, 0),
          fontface = "bold",
          shadow = TRUE,
          fontfamily = "serif")+
  tm_shape(matrice_route) +
  tm_lines(col = "red", lwd = 2)+
  tm_shape(matrice_tronçon)+
  tm_lines(col = "blue", lwd = 2)+
  tm_shape(matrice_etang)+
  tm_fill("blue")

map

#Export de la carte au format PDF ou PNG :



#export des couches en shp ou geopackage :
base <- "C:/Users/230117/Downloads/cours_racine"
export <- file.path(base, "export", "psg.gpkg")
st_write(matrice, export, layer = "matrice")
st_write(matrice_route, export, layer = "matrice_route", append = TRUE)
st_write(matrice_tronçon, export, layer = "matrice_tronçon", append = TRUE)
st_write(matrice_etang, export, layer = "matrice_etang", append = TRUE)
