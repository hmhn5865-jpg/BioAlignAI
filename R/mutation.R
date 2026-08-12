# ==========================================
# BioAlignAI Mutation Detection Tool
# ==========================================


detect_mutations <- function(reference, variant){
  
  reference <- toupper(reference)
  variant <- toupper(variant)
  
  
  if(nchar(reference) != nchar(variant)){
    stop("Sequences must have same length.")
  }
  
  
  mutations <- data.frame(
    Position = integer(),
    Reference = character(),
    Variant = character(),
    Type = character()
  )
  
  
  for(i in 1:nchar(reference)){
    
    
    base_ref <- substr(reference,i,i)
    base_var <- substr(variant,i,i)
    
    
    if(base_ref != base_var){
      
      
      mutation_type <- "Substitution"
      
      
      mutations <- rbind(
        mutations,
        data.frame(
          Position = i,
          Reference = base_ref,
          Variant = base_var,
          Type = mutation_type
        )
      )
      
    }
    
  }
  
  
  return(mutations)
  
}
# ==========================================
# Mutation Classification
# ==========================================

classify_substitution <- function(reference, variant) {
  
  reference <- toupper(reference)
  variant <- toupper(variant)
  
  
  # --------------------------------
  # Insertion
  # --------------------------------
  
  if (reference == "-" && variant != "-") {
    return("Insertion")
  }
  
  
  # --------------------------------
  # Deletion
  # --------------------------------
  
  if (reference != "-" && variant == "-") {
    return("Deletion")
  }
  
  
  # --------------------------------
  # Same nucleotide
  # --------------------------------
  
  if (reference == variant) {
    return("No Mutation")
  }
  
  
  # --------------------------------
  # Transition
  # --------------------------------
  
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
        function(x) {
          all(
            c(reference, variant) == x
          )
        }
      )
    )
  ) {
    
    return("Transition")
    
  }
  
  
  # --------------------------------
  # Transversion
  # --------------------------------
  
  return("Transversion")
}