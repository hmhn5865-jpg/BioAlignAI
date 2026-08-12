# ==========================================
# BioAlignAI Protein Annotation Module
# ==========================================


annotate_protein <- function(dna_sequence){
  
  
  protein_result <- translate_dna(
    dna_sequence
  )
  
  
  annotation <- list(
    
    DNA = dna_sequence,
    
    Protein = protein_result$Protein,
    
    Protein_Length = nchar(
      protein_result$Protein
    ),
    
    Function =
      "Unknown protein function - database search required"
    
  )
  
  
  return(annotation)
  
}
