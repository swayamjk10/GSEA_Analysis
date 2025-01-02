# GSEA_Analysis
Gene Set Enrichment Analysis (GSEA) identifies if a predefined set of genes, such as those linked to a GO term or KEGG pathway, shows significant differences between two biological states. This R Notebook demonstrates GSEA using the clusterProfiler package with Drosophila organism data for analysis and visualization.

# Gene Set Enrichment Analysis (GSEA) Pipeline

This repository contains an R script for performing **Gene Set Enrichment Analysis (GSEA)** using the `clusterProfiler`, `enrichplot`, and other related packages in R. The script demonstrates a complete workflow from data preprocessing to visualization.

## Features

- Reads gene expression data from a CSV file.
- Prepares a ranked gene list based on log2 fold changes.
- Performs GSEA using the `gseGO` function.
- Generates informative visualizations:
  - **Dot Plot**
  - **Enrichment Map Plot**
  - **Category Network Plot**
  - **Ridge Plot**
  - **GSEA Plot**
  - **PMC Plot** for related publications.

## Requirements

- R (version 4.0 or later)
- The following R packages:
  - `clusterProfiler`
  - `pathview`
  - `enrichplot`
  - `ggplot2`
  - `ggridges`
  - `DOSE`
  - `europepmc`

## Output
The script produces the following plots:

- **Dot Plot:** Visualizes the top enriched categories.
- **Enrichment Map Plot:** Displays relationships between enriched terms.
- **Category Network Plot:** Highlights gene-category associations.
- **Ridge Plot:** Shows the distribution of enriched pathways.
- **GSEA Plot:** Summarizes the enrichment for a specific gene set.
- **PMC Plot:** Lists related publications over time.

Install the required packages using:
```r
BiocManager::install(c("clusterProfiler", "pathview", "enrichplot", "DOSE", "ggridges", "europepmc"))
```

```bash
git clone https://github.com/swayamjk10/GSEA_Analysis.git
cd GSEA_Analysis
```

