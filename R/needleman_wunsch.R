# ==========================================
# BioAlignAI Needleman-Wunsch Algorithm
# Step 1: Create Scoring Matrix
# ==========================================


create_alignment_matrix <- function(seq1, seq2,
                                    match = 2,
                                    mismatch = -1,
                                    gap = -2){
  
  rows <- nchar(seq1) + 1
  cols <- nchar(seq2) + 1
  
  
  # Create empty matrix
  matrix_score <- matrix(
    0,
    nrow = rows,
    ncol = cols
  )
  
  
  # Initialize first row
  for(i in 1:rows){
    matrix_score[i,1] <- (i-1) * gap
  }
  
  
  # Initialize first column
  for(j in 1:cols){
    matrix_score[1,j] <- (j-1) * gap
  }
  
  
  return(matrix_score)
  
}
# ==========================================
# Step 2: Fill Alignment Matrix
# ==========================================

fill_alignment_matrix <- function(seq1, seq2,
                                  match = 2,
                                  mismatch = -1,
                                  gap = -2){
  
  matrix_score <- create_alignment_matrix(
    seq1,
    seq2,
    match,
    mismatch,
    gap
  )
  
  
  for(i in 2:nrow(matrix_score)){
    
    for(j in 2:ncol(matrix_score)){
      
      
      base1 <- substr(seq1, i-1, i-1)
      base2 <- substr(seq2, j-1, j-1)
      
      
      if(base1 == base2){
        diagonal <- matrix_score[i-1,j-1] + match
      } else {
        diagonal <- matrix_score[i-1,j-1] + mismatch
      }
      
      
      up <- matrix_score[i-1,j] + gap
      
      left <- matrix_score[i,j-1] + gap
      
      
      matrix_score[i,j] <- max(
        diagonal,
        up,
        left
      )
      
    }
    
  }
  
  
  return(matrix_score)
  
}
# ==========================================
# Step 3: Traceback Alignment
# ==========================================

traceback_alignment <- function(seq1, seq2,
                                match = 2,
                                mismatch = -1,
                                gap = -2){
  
  matrix_score <- fill_alignment_matrix(
    seq1,
    seq2,
    match,
    mismatch,
    gap
  )
  
  
  align1 <- ""
  align2 <- ""
  
  
  i <- nrow(matrix_score)
  j <- ncol(matrix_score)
  
  
  while(i > 1 || j > 1){
    
    
    if(i > 1 && j > 1){
      
      base1 <- substr(seq1,i-1,i-1)
      base2 <- substr(seq2,j-1,j-1)
      
      
      score <- ifelse(
        base1 == base2,
        match,
        mismatch
      )
      
      
      if(matrix_score[i,j] ==
         matrix_score[i-1,j-1] + score){
        
        align1 <- paste0(base1, align1)
        align2 <- paste0(base2, align2)
        
        i <- i - 1
        j <- j - 1
        
        next
      }
    }
    
    
    if(i > 1 &&
       matrix_score[i,j] ==
       matrix_score[i-1,j] + gap){
      
      align1 <- paste0(substr(seq1,i-1,i-1), align1)
      align2 <- paste0("-", align2)
      
      i <- i - 1
      
    } else {
      
      
      align1 <- paste0("-", align1)
      align2 <- paste0(substr(seq2,j-1,j-1), align2)
      
      j <- j - 1
      
    }
    
  }
  
  
  return(list(
    alignment1 = align1,
    alignment2 = align2,
    score = matrix_score[nrow(matrix_score),
                         ncol(matrix_score)]
  ))
  
}
