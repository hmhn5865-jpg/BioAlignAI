# =========================================
# Alignment Tool
# =========================================

align_sequences <- function(seq1, seq2, matrix = "DNA"){
  
  cat("=== Alignment Tool Activated ===\n")
  
  cat("Sequence 1:", seq1, "\n")
  cat("Sequence 2:", seq2, "\n")
  cat("Matrix:", matrix, "\n")
  
  if(matrix == "BLOSUM62"){
    if(grepl("^[ATGCUN]+$", toupper(seq1)) &&
       grepl("^[ATGCUN]+$", toupper(seq2))){
      stop("BLOSUM62 is a protein scoring matrix and cannot be used for DNA/RNA sequences.")
    }
  }
  
  return(list(
    status = "success",
    matrix = matrix,
    alignment = "Placeholder alignment"
  ))
}
