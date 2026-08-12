# ==========================================
# BioAlignAI Dashboard Formatter
# ==========================================


format_dashboard_result <- function(result, type) {
  
  
  # ----------------------------------------
  # Mutation Impact
  # ----------------------------------------
  
  if (type == "Mutation Impact") {
    
    return(
      paste0(
        
        "========================================\n",
        "      BIOALIGNAI MUTATION IMPACT REPORT\n",
        "========================================\n\n",
        
        "REFERENCE DNA\n",
        "-------------\n",
        result$reference_dna,
        
        "\n\nVARIANT DNA\n",
        "-----------\n",
        result$variant_dna,
        
        "\n\nREFERENCE PROTEIN\n",
        "-----------------\n",
        result$reference_protein,
        
        "\n\nVARIANT PROTEIN\n",
        "---------------\n",
        result$variant_protein,
        
        "\n\nPROTEIN IMPACT\n",
        "--------------\n",
        result$impact,
        
        "\n\nBIOLOGICAL INTERPRETATION\n",
        "-------------------------\n",
        
        if (isTRUE(result$protein_changed)) {
          paste0(
            "The nucleotide change resulted in a change ",
            "in the translated protein sequence."
          )
        } else {
          "The nucleotide change did not alter the translated protein sequence."
        }
        
      )
    )
    
  }
  
  
  # ----------------------------------------
  # Mutation Explanation
  # ----------------------------------------
  
  if (type == "Mutation Explanation") {
    
    return(result)
    
  }
  
  
  # ----------------------------------------
  # Sequence Annotation
  # ----------------------------------------
  
  if (type == "Sequence Annotation") {
    
    return(result)
    
  }
  
  
  # ----------------------------------------
  # GC Content
  # ----------------------------------------
  
  if (type == "GC Content") {
    
    return(result)
    
  }
  
  
  # ----------------------------------------
  # Translation
  # ----------------------------------------
  
  if (type == "Translation") {
    
    return(result)
    
  }
  
  
  # ----------------------------------------
  # Default
  # ----------------------------------------
  
  return(
    "Unable to format result."
  )
  
}
