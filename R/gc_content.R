# ==========================================
# BioAlignAI GC Content Analyzer
# ==========================================


calculate_gc_content <- function(sequence){
  
  sequence <- toupper(sequence)
  
  
  total_length <- nchar(sequence)
  
  
  gc_count <- sum(
    strsplit(sequence, "")[[1]] %in% c("G","C")
  )
  
  
  gc_percentage <- (gc_count / total_length) * 100
  
  
  return(
    list(
      sequence = sequence,
      length = total_length,
      gc_count = gc_count,
      gc_content = round(gc_percentage, 2)
    )
  )
  
}
