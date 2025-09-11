#Script du projet R sur l'hydrographie, ce script contiendra à minima les fonctions d'imports

library(dplyr)
library(terra)
library(tmap)
library(happign)
library(sf) # simple features packages for handling vector GIS data
#library(httr) # generic webservice package
#library(tidyverse) # a suite of packages for data wrangling, transformation, plotting, ...
#library(ows4R) # interface for OGC webservices

#essai 1
penmarch <- read_sf(system.file("extdata/penmarch.shp", package = "happign"))

tonc_hydro <- st_read(url("http://id.eaufrance.fr/ddd/ETH/2/TronconHydrographique"),penmarch)

tonc_hydro <- rast(url("http://id.eaufrance.fr/ddd/ETH/2/TronconHydrographique"),penmarch)


#Essai 2 
# URL du service WFS (exemple INSPIRE ou GeoServer)
wfs_url <- "https://services.sandre.eaufrance.fr/geo/topage2019?"

# Lire une couche spécifique
layer_name <- "workspace:layername"

# Importer la couche WFS
data_wfs <- st_read(wfs_url, layer = layer_name)


#Couches geo services (contient plusieur couches troncons hydrographiques)

all_layers <- get_layers_metadata("wfs")




