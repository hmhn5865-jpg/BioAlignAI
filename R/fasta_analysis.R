# ==========================================
# BioAlignAI FASTA Analysis Pipeline
# ==========================================


analyze_fasta <- function(file_path){
  
  
  fasta_data <- read_fasta(file_path)
  
  
  # Extract sequences
  
  reference <- fasta_data[[1]]
  
  variant <- fasta_data[[2]]
  
  
  # Mutation analysis
  
  mutation_result <- explain_mutation(
    reference,
    variant
  )
  
  
  # Protein impact
  
  protein_result <- analyze_protein_impact(
    reference,
    variant
  )
  
  
  # Generate report
  
  report <- paste0(
    
    "BioAlignAI FASTA Variant Analysis Report\n\n",
    
    "Reference Sequence:\n",
    reference,
    "\n\n",
    
    "Variant Sequence:\n",
    variant,
    "\n\n",
    
    "Mutation Analysis:\n",
    paste(
      capture.output(mutation_result),
      collapse="\n"
    ),
    
    "\n\n",
    
    "Reference Protein:\n",
    protein_result$Reference_Protein,
    
    "\n\n",
    
    "Variant Protein:\n",
    protein_result$Variant_Protein,
    
    "\n\n",
    
    "Effect:\n",
    protein_result$Effect,
    
    "\n\n",
    
    "Interpretation:\n",
    
    ifelse(
      protein_result$Effect == "Silent mutation",
      "The mutation does not change the protein sequence.",
      
      ifelse(
        protein_result$Effect == "Missense mutation",
        "The mutation changes the amino acid sequence and may affect protein function.",
        
        "The mutation introduces a premature stop signal."
      )
    )
    
  )
  
  
  return(report)
  
}
