# ==========================================
# BioAlignAI Protein Impact Analysis
# ==========================================

analyze_protein_impact <- function(seq1, seq2) {
  
  seq1 <- toupper(gsub("\\s+", "", seq1))
  seq2 <- toupper(gsub("\\s+", "", seq2))
  
  
  # --------------------------------
  # Translate reference and variant
  # --------------------------------
  
  reference_translation <- translate_dna(seq1)
  variant_translation <- translate_dna(seq2)
  
  
  reference_protein <- reference_translation$Protein
  variant_protein <- variant_translation$Protein
  
  
  # --------------------------------
  # Compare protein sequences
  # --------------------------------
  
  protein_changed <- !identical(
    reference_protein,
    variant_protein
  )
  
  
  # --------------------------------
  # Determine basic protein impact
  # --------------------------------
  
  if (!protein_changed) {
    
    impact <- "Synonymous mutation / No protein-level change"
    
  } else {
    
    impact <- "Protein sequence changed"
    
  }
  
  
  return(
    list(
      
      reference_dna = seq1,
      variant_dna = seq2,
      
      reference_protein = reference_protein,
      variant_protein = variant_protein,
      
      protein_changed = protein_changed,
      
      impact = impact
      
    )
  )
  
}
# ==========================================
# Protein Impact Report
# ==========================================

generate_impact_report <- function(result) {
  
  report <- paste0(
    
    "========================================\n",
    "      BIOALIGNAI PROTEIN IMPACT REPORT\n",
    "========================================\n\n",
    
    "REFERENCE DNA\n",
    "-------------\n",
    result$reference_dna,
    "\n\n",
    
    "VARIANT DNA\n",
    "-----------\n",
    result$variant_dna,
    "\n\n",
    
    "REFERENCE PROTEIN\n",
    "-----------------\n",
    result$reference_protein,
    "\n\n",
    
    "VARIANT PROTEIN\n",
    "---------------\n",
    result$variant_protein,
    "\n\n",
    
    "PROTEIN IMPACT\n",
    "--------------\n",
    result$impact,
    "\n"
    
  )
  
  
  return(report)
  
}