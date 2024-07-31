### Diversity Analysis

# Load the dataset
load("dataset.rda")

# Load required libraries
library(microeco)
library(magrittr)
library(ggplot2)
library(data.table)
library(ggtree)
library(dplyr)
library(tibble)
library(ggpubr)
library(vegan)
library(reshape)

## Alpha diversity

# Prepare data
otu <- t(dataset$otu_table)
sample <- dataset$sample_table
tax <- dataset$tax_table

# Calculate Shannon diversity
Shannon = as.data.frame(diversity(otu, "shannon"))
datagroup <- sample$Disease
data_alpha=cbind(Shannon, datagroup)

# Create alpha diversity boxplot
alpha_boxplot = ggboxplot(dataalpha, x="Disease", order = c("CTR","CRC"), y="Shannon",
                          color = "Disease", palette =c("turquoise4", "slateblue4"), add = "jitter") +
  labs(title="Alpha diversity", y="Shannon index") +
  theme(legend.text=element_text(size=12),
        axis.title.x=element_text(vjust=2, size=0, face = "bold"),
        axis.text.x=element_text(vjust=0.5, size=15, face = "bold"),
        axis.text.y=element_text(vjust=2, size=20, face = "bold"),
        axis.title.y=element_text(vjust=2, size=20, face = "bold")) +
  theme(axis.text.x = element_text(angle = 30, hjust = 0.5, vjust = 0.5)) +
  stat_compare_means() +
  scale_fill_manual(values=c(CTR="red", Adenoma="blue", CRC="green")) +
  ylim(0,7)

print(alpha_boxplot)

## Beta diversity

# Calculate beta diversity
t1 <- trans_beta$new(dataset = dataset, group = "Disease", measure = "bray")
t1$cal_ordination(ordination = "PCoA")

# Perform MANOVA
t1$cal_manova(
  cal_manova_all = TRUE,
  cal_manova_paired = FALSE,
  cal_manova_set = NULL,
  p_adjust_method = "fdr",
)
print(t1$res_manova$`Pr(>F)`[1])  ## P value 

# LEfSe Analysis
t1 <- trans_diff$new(dataset = dataset, method = "lefse", group = "Disease", taxa_level = "Species")

# Plot differential abundance bar plot
g1 <- t1$plot_diff_bar(use_number = 1:30, group_order = c("CTR","CRC"), color_values = c("turquoise4","slateblue4"))

# Plot abundance of significant taxa
t1$res_diff %<>% subset(Significance %in% "***")
g2 <- t1$plot_diff_abund(group_order = c("CTR","CRC"), select_taxa = t1$plot_diff_bar_taxa, 
                         add_sig = T, add_sig_label = "Significance", color_values = c("turquoise4","slateblue4"))

