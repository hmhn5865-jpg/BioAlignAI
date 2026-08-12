# ==========================================
# BioAlignAI Explainable AI Module
# ==========================================


generate_explanation <- function(
    reference_dna,
    variant_dna
){
  
  
  reference_protein <- translate_dna(
    reference_dna
  )$Protein
  
  
  variant_protein <- translate_dna(
    variant_dna
  )$Protein
  
  
  mutation_result <- explain_mutation(
    reference_dna,
    variant_dna
  )
  
  
  explanation <- paste0(
    
    "BioAlignAI Reasoning Report\n\n",
    
    "Step 1: DNA Comparison\n",
    
    "Reference DNA:\n",
    reference_dna,
    
    "\n\n",
    
    "Variant DNA:\n",
    variant_dna,
    
    
    "\n\n",
    
    "Step 2: Mutation Detection\n",
    
    paste(
      capture.output(mutation_result),
      collapse="\n"
    ),
    
    
    "\n\n",
    
    "Step 3: Protein Comparison\n",
    
    "Reference Protein:\n",
    reference_protein,
    
    
    "\n\n",
    
    "Variant Protein:\n",
    variant_protein,
    
    
    "\n\n",
    
    "Step 4: Biological Interpretation\n",
    
    
    ifelse(
      reference_protein == variant_protein,
      
      "The nucleotide change does not alter the protein sequence (Silent mutation).",
      
      "The nucleotide change alters the amino acid sequence (Missense mutation)."
    )
    
  )
  
  
  return(explanation)
  
}
