# ==========================================
# BioAlignAI Local Knowledge Database
# ==========================================


search_database <- function(sequence){
  
  
  sequence <- toupper(sequence)
  
  
  database <- list(
    
    "ATGGCC" = list(
      Gene = "Example_Gene_A",
      Protein = "Example Protein A",
      Function = "Small model protein involved in cellular processes"
    ),
    
    
    "ATGACC" = list(
      Gene = "Example_Gene_A_variant",
      Protein = "Variant Protein A",
      Function = "Protein variant with amino acid change"
    )
    
  )
  
  
  if(sequence %in% names(database)){
    
    
    return(
      database[[sequence]]
    )
    
    
  } else {
    
    
    return(
      list(
        Gene = "Unknown",
        Protein = "Unknown",
        Function = "No database entry found"
      )
    )
    
    
  }
  
  
}
