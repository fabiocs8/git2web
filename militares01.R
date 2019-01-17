library(data.table)
library(tidyverse)


ObservacoesFiles = list.files(pattern="*bservacoesMilitares.csv")
# CadastroFiles <- list.files(pattern="*adastroMilitares.csv")
# RemuneracaoFiles <- list.files(pattern="*racaoMilitares.csv")
HonorariosFiles <- list.files(pattern="*)Militares.csv")




OBS = data.table(lapply(ObservacoesFiles, fread,dec = ",",check.names = T))
# CAD = data.table(lapply(CadastroFiles, fread,dec = ",",check.names = T))
# REM = data.table(lapply(RemuneracaoFiles, fread,dec = ",",check.names = T))
HON = data.table(lapply(HonorariosFiles, fread,dec = ",",check.names = T))

#unnestHon <- unnest(HON)
HON <- rbindlist(HON$V1)
# CAD <- rbindlist(CAD$V1)
# REM <- rbindlist(REM$V1)
OBS <- rbindlist(OBS$V1)

REM[-.N]

dt <- REM[CAD,on = "Id_SERVIDOR_PORTAL"]

dt[MES==3, .(mean(REMUNERAÇÃO.BÁSICA.BRUTA..R..,na.rm = T),.N), by = "DESCRICAO_CARGO"][order(-V1)]

dt<- dt[OBS,on = "Id_SERVIDOR_PORTAL"]
dt<- dt[HON,on = "Id_SERVIDOR_PORTAL"]

teste1 <- 1

div <- 1

test <- 2

add <-3

