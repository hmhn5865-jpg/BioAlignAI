# ==========================================
# BioAlignAI Report Generator
# ==========================================


generate_gc_report <- function(result){
  
  report <- paste0(
    
    "BioAlignAI GC Content Report\n\n",
    
    "DNA Sequence:\n",
    result$sequence,
    "\n\n",
    
    "Sequence Length:\n",
    result$length,
    " nucleotides\n\n",
    
    "GC Count:\n",
    result$gc_count,
    "\n\n",
    
    "GC Content:\n",
    result$gc_content,
    "%"
    
  )
  
  return(report)
  
}



generate_translation_report <- function(result){
  
  report <- paste0(
    
    "BioAlignAI Translation Report\n\n",
    
    "DNA Sequence:\n",
    result$DNA,
    "\n\n",
    
    "Protein Sequence:\n",
    result$Protein,
    "\n\n",
    
    "Protein Length:\n",
    nchar(result$Protein),
    " amino acids"
    
  )
  
  return(report)
  
}
