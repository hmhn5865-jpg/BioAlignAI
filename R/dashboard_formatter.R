# ==========================================
# BioAlignAI Dashboard Formatter
# ==========================================


format_dashboard_result <- function(result, type){
  
  
  if(type == "Mutation Impact"){
    
    
    return(
      paste0(
        
        "🧬 BioAlignAI Mutation Impact Report\n\n",
        
        "Reference DNA:\n",
        result$Reference_DNA,
        
        "\n\nVariant DNA:\n",
        result$Variant_DNA,
        
        "\n\nReference Protein:\n",
        result$Reference_Protein,
        
        "\n\nVariant Protein:\n",
        result$Variant_Protein,
        
        "\n\nMutation Effect:\n",
        result$Effect,
        
        "\n\nInterpretation:\n",
        "The nucleotide change alters the amino acid sequence."
        
      )
    )
    
  }
  
  
  
  if(type == "Mutation Explanation"){
    
    return(result)
    
  }
  
  
  
  if(type == "Sequence Annotation"){
    
    return(result)
    
  }
  
  
  
  if(type == "GC Content"){
    
    return(result)
    
  }
  
  
  
  if(type == "Translation"){
    
    return(result)
    
  }
  
  
  
  return(
    "Unable to format result."
  )
  
  
}
