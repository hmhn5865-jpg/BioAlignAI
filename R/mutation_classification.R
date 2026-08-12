# ==========================================
# BioAlignAI Mutation Classification
# ==========================================

classify_substitution <- function(reference, variant) {
  
  reference <- toupper(reference)
  variant <- toupper(variant)
  
  
  if (reference == variant) {
    return("No Mutation")
  }
  
  
  transitions <- list(
    c("A", "G"),
    c("G", "A"),
    c("C", "T"),
    c("T", "C")
  )
  
  
  if (
    any(
      sapply(
        transitions,
        function(x) all(c(reference, variant) == x)
      )
    )
  ) {
    
    return("Transition")
    
  } else {
    
    return("Transversion")
    
  }
  
}
