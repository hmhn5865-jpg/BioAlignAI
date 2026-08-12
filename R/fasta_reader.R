# ==========================================
# BioAlignAI FASTA Reader Module
# ==========================================


read_fasta <- function(file_path){
  
  
  lines <- readLines(
    file_path,
    warn = FALSE
  )
  
  
  sequences <- list()
  
  current_name <- NULL
  current_sequence <- ""
  
  
  for(line in lines){
    
    
    if(substr(line,1,1) == ">"){
      
      
      if(!is.null(current_name)){
        
        sequences[[current_name]] <- current_sequence
        
      }
      
      
      current_name <- substring(line,2)
      current_sequence <- ""
      
      
    } else {
      
      
      current_sequence <- paste0(
        current_sequence,
        trimws(line)
      )
      
      
    }
    
    
  }
  
  
  # Store final sequence
  
  if(!is.null(current_name)){
    
    sequences[[current_name]] <- current_sequence
    
  }
  
  
  return(sequences)
  
}
