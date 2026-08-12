# ==========================================
# BioAlignAI Biological Knowledge Layer
# ==========================================


explain_mutation <- function(reference, variant){
  
  
  reference <- toupper(reference)
  variant <- toupper(variant)
  
  
  if(nchar(reference) != nchar(variant)){
    return(
      "Sequences must have equal length for mutation interpretation."
    )
  }
  
  
  mutations <- data.frame(
    Position = integer(),
    Reference = character(),
    Variant = character(),
    Type = character(),
    Classification = character()
  )
  
  
  for(i in 1:nchar(reference)){
    
    
    ref_base <- substr(reference,i,i)
    var_base <- substr(variant,i,i)
    
    
    if(ref_base != var_base){
      
      
      if(
        (ref_base=="A" && var_base=="G") ||
        (ref_base=="G" && var_base=="A") ||
        (ref_base=="C" && var_base=="T") ||
        (ref_base=="T" && var_base=="C")
      ){
        
        classification <- "Transition"
        
      } else {
        
        classification <- "Transversion"
        
      }
      
      
      mutations <- rbind(
        mutations,
        data.frame(
          Position=i,
          Reference=ref_base,
          Variant=var_base,
          Type="Substitution",
          Classification=classification
        )
      )
      
      
    }
    
  }
  
  
  return(mutations)
  
}
