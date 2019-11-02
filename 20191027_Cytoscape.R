#Package 
#  Chargement des library 
library(tidyverse)
setwd("C:/Users/anmay/OneDrive - Universite de Montreal/Documents/DESS_Bio-INFO/BIF7100/Projet.Cytoscape/Demo_et_data/")

#  Chargement des deux tables de types résultat DEseq2 
lenti_sh <- read_table2("~/R/PCA-cells/counts/sh-lenti.deseq2.tsv")
ntwk_nodes <- read_csv("C:/Users/anmay/OneDrive - Universite de Montreal/Documents/DESS_Bio-INFO/BIF7100/Projet.Cytoscape/H. sapiens (3) default node.csv", 
                                      col_types = cols(`log score` = col_skip(), 
                                                       name = col_skip(), `node type` = col_skip(), 
                                                       `query term` = col_skip(), selected = col_skip(), 
                                                       `shared name` = col_skip()))
wantedID=ntwk_nodes$`gene name`
lenti_sh.df <- lenti_sh %>% filter(symbol %in% wantedID)
setdiff(wantedID, lenti_sh.df$symbol)
lenti_sh.df[is.na(lenti_sh.df)] <- 0
write.table(lenti_sh.df,"sh-lenti.ntwrk_nodes.tsv", quote=F, row.names=F,sep="\t")
