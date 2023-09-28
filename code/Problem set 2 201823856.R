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

identification <- identification %>%
  mutate(business_type = case_when(
    GRUPOS4 == "01" ~ "Agricultura",
    GRUPOS4 == "02" ~ "Industria manufacturera",
    GRUPOS4 == "03" ~ "Comercio",
    GRUPOS4 == "04" ~ "Servicios",
    TRUE ~ NA_character_  ))


location <- location %>% mutate(location, local = ifelse(test = P3053>=6 & P3053<8, yes =1, no=0))

## Punto 3


identification_sub <- identification %>%
  filter(business_type == "Industria manufacturera")

location_sub <- location %>% select(DIRECTORIO, SECUENCIA_P, SECUENCIA_ENCUESTA,
                                    P3054, P469, COD_DEPTO, F_EXP)

identification_sub2 <- identification_sub %>% select(DIRECTORIO, SECUENCIA_P, SECUENCIA_ENCUESTA,
                                                     P35,P241,P3032_1,P3032_2,P3032_3,P3033,P3034)

identification_sub <- identification_sub2

rm(identification_sub2)

## Punto 4


identloc1 <- left_join(identification_sub, location_sub,
                      by = c("DIRECTORIO", "SECUENCIA_P", "SECUENCIA_ENCUESTA"))

identloc2 <- inner_join(identification_sub, location_sub,
                         by = c("DIRECTORIO", "SECUENCIA_P", "SECUENCIA_ENCUESTA"))

identloc3 <- merge(identification_sub, location_sub,
                   by = c("DIRECTORIO", "SECUENCIA_P", "SECUENCIA_ENCUESTA"), all.x = TRUE)

identloc4 <- merge(identification_sub, location_sub,
                   by = c("DIRECTORIO", "SECUENCIA_P", "SECUENCIA_ENCUESTA"))
