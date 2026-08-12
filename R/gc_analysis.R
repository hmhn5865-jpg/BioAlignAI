# ==========================================
# BioAlignAI GC Content Analysis
# ==========================================


calculate_gc_content <- function(sequence){
  
  sequence <- toupper(sequence)
  
  total_length <- nchar(sequence)
  
  gc_count <- sum(
    strsplit(sequence, "")[[1]] %in% c("G","C")
  )
  
  gc_percentage <- (gc_count / total_length) * 100
  
  
  result <- list(
    Sequence = sequence,
    Length = total_length,
    GC_Count = gc_count,
    GC_Percentage = round(gc_percentage,2)
  )
  
  
  return(result)
  
}
