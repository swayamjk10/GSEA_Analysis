# GSEA Analysis (gene set enrichment analysis)

# install packages
BiocManager::install("clusterProfiler", version = "3.20")
BiocManager::install("pathview")
BiocManager::install("enrichplot")
library(clusterProfiler)
library(enrichplot)

# we use ggplot2 to add x axis labels (ex: ridgeplot)
library(ggplot2)

# SET THE DESIRED ORGANISM HERE
organism = "org.Dm.eg.db"
BiocManager::install(organism, character.only = TRUE)
library(organism, character.only = TRUE)


# reading in data from deseq2
df = read.csv("drosphila_example_de.csv", header=TRUE)

# we want the log2 fold change 
original_gene_list <- df$log2FoldChange

# name the vector
names(original_gene_list) <- df$X

# omit any NA values 
gene_list<-na.omit(original_gene_list)

# sort the list in decreasing order (required for clusterProfiler)
gene_list = sort(gene_list, decreasing = TRUE)

gse <- gseGO(geneList=gene_list, 
             ont ="ALL", 
             keyType = "ENSEMBL", 
             nPerm = 10000, 
             minGSSize = 3, 
             maxGSSize = 800, 
             pvalueCutoff = 0.05, 
             verbose = TRUE, 
             OrgDb = organism, 
             pAdjustMethod = "none")

require(DOSE)
dotplot(gse, showCategory=10, split=".sign") + facet_grid(.~.sign)

# downloading package for emapplot
BiocManager::install("enrichplot")
emapplot(gse, showCategory = 10)


# categorySize can be either 'pvalue' or 'geneNum'
cnetplot(gse, categorySize="pvalue", foldChange=gene_list, showCategory = 3)

# The package "ggridges" is required for `ridgeplot()`.
BiocManager::install("ggridges")
ridgeplot(gse) +
  labs(x = "Enrichment Distribution", y = "Signaling Pathway") + 
  theme_minimal(base_size = 12) + # Use a clean theme and adjust base text size
  theme(
    axis.text.y = element_text(size = 10), # Adjust y-axis text size
    axis.text.x = element_text(size = 10), # Adjust x-axis text size
    axis.title = element_text(size = 14)  # Adjust axis title size
  ) +
  scale_x_continuous(expand = c(0.01, 0.01))

# Use the `Gene Set` param for the index in the title, and as the value for geneSetId
gseaplot(gse, by = "all", title = gse$Description[1], geneSetID = 1)

terms <- gse$Description[1:5]

# The package "europepmc" is required for `pmcplot()`.
pmcplot(terms, 2010:2020, proportion=FALSE)



