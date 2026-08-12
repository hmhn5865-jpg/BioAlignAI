files <- c(
  "scoring.R",
  "gap_scoring.R",
  "needleman_wunsch.R",
  "alignment_analysis.R",
  "mutation_classification.R",
  "alignment_visualization.R",
  "explainer.R",
  "gc_content.R",
  "translation.R",
  "mutation.R",
  "protein_impact.R",
  "report.R",
  "planner.R",
  "agent.R",
  "gene_annotation.R",
  "protein_annotation.R",
  "database_connector.R",
  "confidence_score.R",
  "annotation_report.R"
)

for(file in files){
  
  sys.source(
    file.path("R", file),
    envir = .GlobalEnv
  )
  
}

print("BioAlignAI Loaded Successfully!")
