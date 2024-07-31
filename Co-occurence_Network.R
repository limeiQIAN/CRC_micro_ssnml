## Network construction 

# Load the phyloseq object
load("pseq.rda")

# Load required libraries
library(ggClusterNet)
library(phyloseq)
library(sna)
library(tidyverse)
library(igraph)
library(ggalt)
library(microeco)
library(magrittr)
library(ggplot2)
library(data.table)
library(ggtree)
library(dplyr)
library(tibble)
library(RColorBrewer)
library(ggpubr)
library(file2meco)
library(ggpubr)

# Construct networks with different correlation thresholds
for (i in c(0.3,0.6,0.8)){
  comparenet <- list()
  comparenet[[i]] = network.2(ps = pseq,
                              N =0,      
                              big = TRUE,
                              maxnode = 5,
                              select_layout = TRUE,
                              layout_net = "model_Gephi2",  
                              r.threshold= i,
                              p.threshold=0.05,
                              label = FALSE,
                              zipi = FALSE,
                              fill = "Kingdom",  ## Phylum or default module
                              ncol = 2
  )
  
} 
comparenet       ## comparenet stores the network plots and correlation information

#### Network hub identification  ------------

# Load additional required libraries
library(file2meco)
library(tidyverse)
library(ggtree)
library(igraph)
library(sna)

# Calculate microbial correlations
result = corMicro(ps = psq,
                  N = 0,
                  method.scale = "TMM",
                  r.threshold=0.6,
                  p.threshold=0.05,
                  method = "spearman"
)

cor = result[[1]]

# Extract edge and node information
result4 = nodeEdge(cor = cor)
edge = result4[[1]]  # Edge file
node = result4[[2]]  # Node file

# Create igraph object
igraph  = igraph::graph_from_data_frame(edge, directed = FALSE, vertices = node)

# Calculate hub scores and extract top 30 hub nodes
hub  = hub_score(igraph)$vector %>%
  sort(decreasing = TRUE) %>%
  head(30) %>%
  as.data.frame()
