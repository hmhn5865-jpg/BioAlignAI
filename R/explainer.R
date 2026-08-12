# ==========================================
# BioAlignAI Explanation Module
# ==========================================


explain_alignment <- function(result){
  
  seq1 <- result$alignment1
  seq2 <- result$alignment2
  score <- result$score
  
  
  matches <- 0
  mismatches <- 0
  gaps <- 0
  
  
  for(i in 1:nchar(seq1)){
    
    base1 <- substr(seq1,i,i)
    base2 <- substr(seq2,i,i)
    
    
    if(base1 == "-" || base2 == "-"){
      
      gaps <- gaps + 1
      
    }
    
    else if(base1 == base2){
      
      matches <- matches + 1
      
    }
    
    else{
      
      mismatches <- mismatches + 1
      
    }
    
  }
  
  
  report <- paste0(
    
    "BioAlignAI Alignment Result\n\n",
    
    "Sequence 1:\n",
    seq1,
    "\n\n",
    
    "Sequence 2:\n",
    seq2,
    "\n\n",
    
    "Alignment Score: ",
    score,
    "\n\n",
    
    "Analysis:\n",
    "Matches: ",
    matches,
    "\n",
    
    "Mismatches: ",
    mismatches,
    "\n",
    
    "Gaps: ",
    gaps
    
  )
  
  
  return(report)
  
}
explain_alignment_mutation <- function(
    reference,
    variant,
    position,
    mutation_type
) {
  
  explanation <- paste0(
    
    "ALIGNMENT-BASED MUTATION INTERPRETATION\n",
    "========================================\n\n",
    
    "A nucleotide difference was detected at ",
    "position ",
    position,
    ".\n\n",
    
    "Reference nucleotide: ",
    reference,
    "\n",
    
    "Variant nucleotide: ",
    variant,
    "\n\n",
    
    "Mutation classification: ",
    mutation_type,
    "\n\n",
    
    "The substitution represents a ",
    tolower(mutation_type),
    " between the reference and variant sequences. "
    
  )
  
  
  if (mutation_type == "Transition") {
    
    explanation <- paste0(
      explanation,
      "Transitions involve substitution between nucleotides "
      ,"within the same base class: purine-to-purine or "
      ,"pyrimidine-to-pyrimidine."
    )
    
  } else if (mutation_type == "Transversion") {
    
    explanation <- paste0(
      explanation,
      "Transversions involve substitution between different "
      ,"base classes, such as a purine and a pyrimidine."
    )
    
  } else {
    
    explanation <- paste0(
      explanation,
      "No nucleotide substitution was detected."
    )
    
  }
  
  
  return(explanation)
  
}
