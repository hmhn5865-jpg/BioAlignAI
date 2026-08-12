# ==========================================
# BioAlignAI Scoring Tool
# ==========================================

score_alignment <- function(seq1, seq2,
                            match = 2,
                            mismatch = -1){
  
  if(nchar(seq1) != nchar(seq2)){
    stop("Sequences must have the same length.")
  }
  
  score <- 0
  
  for(i in 1:nchar(seq1)){
    
    base1 <- substr(seq1, i, i)
    base2 <- substr(seq2, i, i)
    
    if(base1 == base2){
      score <- score + match
    } else {
      score <- score + mismatch
    }
    
  }
  
  return(score)
  
}