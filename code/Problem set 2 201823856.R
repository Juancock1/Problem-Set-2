## Taller de R Estadistica y Programacion
## Problem-set 2
## Juan Camilo Parada Sandoval - 201823856
## R version 4.3.1
## 29/09/2023

#Ininciamos alistando limpiando y cargando paquetes para trabajar
rm(list=ls())
install.packages('pacman')
library(pacman)
p_load(tidyverse, rio, data.table)

# Punto 1
# Utilizamos los comandos import y export del paquete rio para cargar y exportar las bases de datos necesarias
location <- import(file = "input/Módulo de sitio o ubicación.dta")
identification <- import(file = "input/Módulo de identificación.dta")
export(x=location, file = "output/location.rds")
export(x=identification, file = "output/identification.rds")

# Punto 2


