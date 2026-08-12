# ==========================================
# BioAlignAI Annotation Report Generator
# With Database Integration
# ==========================================


generate_annotation_report <- function(
    dna_annotation,
    protein_annotation
){
  
  
  database_result <- search_database(
    dna_annotation$Sequence
  )
  confidence_result <- calculate_confidence(
    dna_annotation$Sequence
  )
  
  
  report <- paste0(
    
    "BioAlignAI Sequence Annotation Report\n\n",
    
    "DNA Sequence:\n",
    dna_annotation$Sequence,
    "\n\n",
    
    "Sequence Length:\n",
    dna_annotation$Length,
    " nucleotides\n\n",
    
    "Protein Sequence:\n",
    protein_annotation$Protein,
    "\n\n",
    
    "Protein Length:\n",
    protein_annotation$Protein_Length,
    " amino acids\n\n",
    
    "Gene:\n",
    database_result$Gene,
    "\n\n",
    
    "Protein Name:\n",
    database_result$Protein,
    "\n\n",
    
    "Function:\n",
    database_result$Function,
    
    "\n\n",
    
    "Confidence:\n",
    confidence_result$Confidence,
    "%",
    
    "\n\n",
    
    "Reason:\n",
    confidence_result$Reason
    
  )
  
  
  return(report)
  
}
