#Script du projet R sur l'hydrographie, ce script contiendra à minima les fonctions d'imports

library(dplyr)
library(terra)
library(tmap)
library(happign)
library(sf) # simple features packages for handling vector GIS data
#library(httr) # generic webservice package
#library(tidyverse) # a suite of packages for data wrangling, transformation, plotting, ...
#library(ows4R) # interface for OGC webservices

troncons_hydro <- st_read(url(""))

all_layers <- get_layers_metadata("wfs")




