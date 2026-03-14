# Yiming Honours Project — Cancer (Melanocytic Lesions)

R-based analysis for exploring and classifying melanocytic lesions using principal component analysis (PCA) and classification trees, with a focus on *miR-211* as a diagnostic biomarker.

---

## Overview

This project combines:

1. *PCA* — Dimensionality reduction and visualization of multi-variable lesion data (9 features).
2. *Classification tree* — Predicting diagnosis from miR-211 using conditional inference trees.
3. *Optimal cutoff* — Finding the best miR-211 threshold (Youden index) to classify diagnosis (Absent/Present).

---

## Repository structure

| File | Purpose |
|------|--------|
| PCA for melanocytic lesions.R | PCA on the Overlap dataset; scree plots, variable contributions, biplots. |
| CI tree updated.R | Train/validation split, ctree model on miR-211, and OptimalCutpoints for cutoff. |
| README.md | This file. |

---

## Data requirements

Scripts expect the following objects to be available in the R environment (load your data or .RData before running):

- *Overlap* — For PCA: first column = sample IDs (used as row names), columns 1–9 = numeric features. Optional column Category for grouping in biplots.
- *TMD* — For the classification tree: must include Diagnosis and miR.211.
- *TD* — For optimal cutoff: must include miR211 and Diagnosis (will be used as factor with labels "Absent", "Present").

No data files are included in this repository.

---

## Dependencies (R packages)

*PCA script:*

- factoextra, FactoMineR — PCA and factor maps
- corrplot — Correlation/cos² heatmap
- ggbiplot — Biplots (install via remotes::install_github("vqv/ggbiplot") or devtools::install_github("vqv/ggbiplot"))

*Classification tree script:*

- party — Conditional inference trees (ctree)
- OptimalCutpoints — Youden-optimal cutoff for miR-211

Install with install.packages("package_name") (and GitHub install for ggbiplot as above).

---

## How to run

1. Install the required packages (see Dependencies).
2. Load your data so that Overlap, TMD, and/or TD exist in the workspace.
3. Run the scripts:
   - PCA for melanocytic lesions.R for PCA and biplots.
   - CI tree updated.R for the tree and optimal cutoff (note: it uses setwd() to a Windows path; change or remove as needed for your machine).

---

## Notes

- *Path in CI tree updated.R:* setwd("R:\STARKLAB-Q4846\...") is machine-specific. Update or remove it for your environment.
- *Possible bug in PCA script:* Lines 16–17 use pcDysN in fviz_contrib(); if you get an error, replace with pcOver to match the PCA object created in that script.

---

## Context

- *Melanocytic lesions:* Moles, nevi, melanoma.
- *miR-211:* MicroRNA used here as a predictive feature and for a single-variable diagnostic cutoff.
