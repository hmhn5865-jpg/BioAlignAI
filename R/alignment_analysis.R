# ==========================================
# BioAlignAI Alignment Analysis
# ==========================================

analyze_alignment <- function(alignment1, alignment2) {
  
  if (nchar(alignment1) != nchar(alignment2)) {
    stop("Aligned sequences must have the same length.")
  }
  
  matches <- 0
  mismatches <- 0
  gaps <- 0
  
  mutation_positions <- integer(0)
  mutation_details <- list()
  
  insertion_positions <- integer(0)
  insertion_details <- list()
  
  deletion_positions <- integer(0)
  deletion_details <- list()
  
  
  # --------------------------------
  # Analyze every alignment position
  # --------------------------------
  
  for (i in seq_len(nchar(alignment1))) {
    
    base1 <- substr(alignment1, i, i)
    base2 <- substr(alignment2, i, i)
    
    
    # --------------------------------
    # Insertion
    # --------------------------------
    
    if (base1 == "-" && base2 != "-") {
      
      gaps <- gaps + 1
      
      insertion_positions <- c(
        insertion_positions,
        i
      )
      
      insertion_details[[length(insertion_details) + 1]] <- list(
        position = i,
        reference = base1,
        variant = base2
      )
      
    }
    
    
    # --------------------------------
    # Deletion
    # --------------------------------
    
    else if (base1 != "-" && base2 == "-") {
      
      gaps <- gaps + 1
      
      deletion_positions <- c(
        deletion_positions,
        i
      )
      
      deletion_details[[length(deletion_details) + 1]] <- list(
        position = i,
        reference = base1,
        variant = base2
      )
      
    }
    
    
    # --------------------------------
    # Match
    # --------------------------------
    
    else if (base1 == base2) {
      
      matches <- matches + 1
      
    }
    
    
    # --------------------------------
    # Substitution
    # --------------------------------
    
    else {
      
      mismatches <- mismatches + 1
      
      mutation_positions <- c(
        mutation_positions,
        i
      )
      
      mutation_details[[length(mutation_details) + 1]] <- list(
        position = i,
        reference = base1,
        variant = base2
      )
      
    }
    
  }
  
  
  # --------------------------------
  # Alignment statistics
  # --------------------------------
  
  alignment_length <- nchar(alignment1)
  
  match_percentage <- ifelse(
    alignment_length > 0,
    (matches / alignment_length) * 100,
    0
  )
  
  
  # --------------------------------
  # Return analysis
  # --------------------------------
  
  return(
    list(
      alignment_length = alignment_length,
      matches = matches,
      mismatches = mismatches,
      gaps = gaps,
      match_percentage = match_percentage,
      
      mutation_positions = mutation_positions,
      mutation_details = mutation_details,
      
      insertion_positions = insertion_positions,
      insertion_details = insertion_details,
      
      deletion_positions = deletion_positions,
      deletion_details = deletion_details
    )
  )
}
