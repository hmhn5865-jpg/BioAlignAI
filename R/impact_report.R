# ==========================================
# BioAlignAI Protein Impact Report Generator
# ==========================================


generate_impact_report <- function(result){
  
  
  report <- paste0(
    
    "BioAlignAI Protein Impact Report\n\n",
    
    "Reference DNA:\n",
    result$Reference_DNA,
    "\n\n",
    
    "Variant DNA:\n",
    result$Variant_DNA,
    "\n\n",
    
    "Reference Protein:\n",
    result$Reference_Protein,
    "\n\n",
    
    "Variant Protein:\n",
    result$Variant_Protein,
    "\n\n",
    
    "Mutation Effect:\n",
    result$Effect,
    "\n\n",
    
    "Interpretation:\n",
    
    ifelse(
      result$Effect == "Silent mutation",
      "The nucleotide change does not alter the amino acid sequence.",
      
      ifelse(
        result$Effect == "Missense mutation",
        "The nucleotide change alters the amino acid sequence and may affect protein structure or function.",
        
        "The nucleotide change introduces a premature stop signal and may affect protein production."
      )
    )
    
  )
  
  
  return(report)
  
}
