# 🧬 BioAlignAI

**BioAlignAI** is an R/Shiny-based bioinformatics dashboard designed for DNA sequence analysis, mutation analysis, sequence annotation, GC-content analysis, translation, and scientific reporting.

The project combines modular R programming with an interactive Shiny interface to provide a foundation for computational biology and bioinformatics workflows.

## 🚀 Current Version

**BioAlignAI v1.0**

This is the initial working release of the BioAlignAI project.

## 🔬 Features

- 🧬 DNA mutation impact analysis
- 🔎 Mutation explanation
- 🧪 DNA sequence annotation
- 📊 GC-content analysis
- 🧬 DNA-to-protein translation
- 📈 GC-content visualization
- 📝 Scientific analysis reports
- 🧩 Modular R-based architecture
- 🖥️ Interactive R/Shiny dashboard
- 🧬 Sequence alignment functionality
- 📄 FASTA sequence support

## 🖥️ Dashboard

BioAlignAI provides an interactive dashboard where users can enter DNA sequences and select different analysis modules.

### Available Analyses

| Analysis | Description |
|---|---|
| Mutation Impact | Compares reference and variant sequences and evaluates protein-level impact |
| Mutation Explanation | Generates an explanation of the detected mutation |
| Sequence Annotation | Provides sequence and protein annotation |
| GC Content | Calculates GC composition and provides visualization |
| Translation | Translates DNA sequences into protein sequences |

## 🛠️ Technologies

- **R**
- **Shiny**
- **ggplot2**
- **RStudio**
- **Git & GitHub**
- Bioinformatics algorithms and sequence-analysis methods

## 📁 Project Structure

```text
BioAlignAI/
│
├── app.R
├── BioAlignAI.Rproj
├── README.md
├── BioAlignAI_Report.txt
├── test.fasta
│
├── R/
│   ├── alignment.R
│   ├── alignment_analysis.R
│   ├── alignment_visualization.R
│   ├── dashboard_formatter.R
│   ├── fasta_analysis.R
│   ├── fasta_reader.R
│   ├── gc_analysis.R
│   ├── gc_content.R
│   ├── mutation.R
│   ├── mutation_classification.R
│   ├── needleman_wunsch.R
│   ├── protein_annotation.R
│   ├── protein_impact.R
│   ├── report.R
│   ├── scoring.R
│   ├── translation.R
│   ├── visualization.R
│   └── ...
│
├── data/
├── models/
└── www/
