# Part of Honours Project — Skin Cancer (Melanocytic Lesions)

R-based analysis for exploring and classifying melanocytic lesions using principal component analysis (PCA) and classification trees, with a focus on *miR-211* as a diagnostic biomarker. 

---

## Overview

This project combines:

1. *PCA* — Dimensionality reduction and visualisation of multi-variable lesion miRNA expression data (9 microRNA features), comparing distinct lesion groups.
2. *Classification tree* — Conditional inference tree predicting diagnosis from miR-211 expression.
3. *Optimal cutoff* — Youden-index-based threshold for miR-211 to classify diagnosis as Absent or Present.

---

## Repository structure

| File / folder | Purpose |
|---------------|---------|
| PCA for melanocytic lesions.R | PCA on the Overlap dataset; scree plots, variable contributions, biplots. |
| CI tree updated.R | Train/validation split, ctree model on miR-211, and OptimalCutpoints for cutoff. |
| assets/ | Released PCA result figures (4 images). |
| README.md | This file. |

---

## PCA results for melanocytic lesions

The following four PCA biplots compare distinct lesion groups. Arrows represent microRNA variable loadings (e.g. miR.145); ellipses show 95% confidence regions per group.

> *Note:* These images are *non-exhaustive. Only these four figures are released; all other PCA and analysis outputs remain **confidential*.

All four figures are available in the [assets/](assets/) folder:

- [Dysplasia vs Naevus](assets/Rplot_PCA_Dysplasia-Benign.png) — PC1 ~84%, PC2 ~10%
- [Mild vs Severe dysplasia](assets/Rplot_PCA-Mild-Severe-Dysplasia.png) — PC1 ~94%, PC2 ~4.5%
- [Melanoma in situ (MIS) vs Naevus](assets/Rplot_PCA_MIS-Benign.png) — PC1 ~86%, PC2 ~11%
- [Thin melanoma vs Naevus](assets/Rplot_PCA_TM-Benign.png) — PC1 ~86%, PC2 ~10%

---

## Data requirements

Scripts expect the following objects to be available in the R environment (load your data or .RData before running):

- *Overlap* — For PCA: first column = sample IDs (row names), columns 1–9 = numeric microRNA features. Optional Category column for group colouring in biplots.
- *TMD* — For the classification tree: must include Diagnosis and miR.211.
- *TD* — For optimal cutoff: must include miR211 and Diagnosis (recoded as factor with labels "Absent", "Present").

No data files are included in this repository. The dataset is confidential and cannot be disclosed.

---

## How to run

1. Load your data so that Overlap, TMD, and/or TD exist in the R workspace.
2. Install the required packages (see [Dependencies](#dependencies-r-packages)).
3. Run the scripts:
   - PCA for melanocytic lesions.R — for PCA, scree plots, and biplots.
   - CI tree updated.R — for the classification tree and optimal miR-211 cutoff.

---

## Dependencies (R packages)

*PCA script:*

- factoextra, FactoMineR — PCA computation and factor maps
- corrplot — cos² correlation heatmap
- ggbiplot — Enhanced biplots (GitHub only: remotes::install_github("vqv/ggbiplot"))

*Classification tree script:*

- party — Conditional inference trees (ctree)
- OptimalCutpoints — Youden-optimal cutoff for a single biomarker

Install CRAN packages with install.packages("package_name").

---

## Notes

- *Machine-specific path in CI tree updated.R:* The setwd("R:\STARKLAB-Q4846\...") line is Windows-specific. Update or remove it before running on another machine.
- *Possible variable name bug in PCA script:* Lines 16–17 reference pcDysN in fviz_contrib(), which does not exist in the script. Replace with pcOver to match the PCA object created on line 5.

---

## Context

- *Melanocytic lesions:* A spectrum of pigmented skin lesions ranging from benign (common nevi/moles) to malignant (melanoma), including intermediate states such as dysplasia and melanoma in situ (MIS).
- *miR-211:* A microRNA frequently downregulated in melanoma. This project evaluates its utility as a single-variable diagnostic marker, using both a tree model and an optimal cutoff.
- *Institution:* The University of Queensland — Stark Lab, Dermatology (Honours 2022).
