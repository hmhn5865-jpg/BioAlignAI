# ==========================================
# BioAlignAI Planning Module v4
# ==========================================

plan_task <- function(user_input){
  
  text <- tolower(user_input)
  
  
  # --------------------------------
  # FASTA / FASTQ Analysis
  # --------------------------------
  
  if(grepl("fasta|fastq", text)){
    
    return(
      list(
        task = "fasta_analysis",
        tool = "read_fasta"
      )
    )
    
  }
  
  
  # --------------------------------
  # Combined Alignment + Explanation
  # --------------------------------
  
  if(
    grepl("align|alignment|compare sequence", text) &&
    grepl("explain|why|reason|interpret", text)
  ){
    
    return(
      list(
        task = "alignment_explanation",
        tool = "alignment_explanation"
      )
    )
    
  }
  
  
  # --------------------------------
  # Alignment + Report
  # --------------------------------
  
  if(
    grepl("align|alignment|compare sequence", text) &&
    grepl("report|export|save", text)
  ){
    
    return(
      list(
        task = "alignment_report",
        tool = "alignment_report"
      )
    )
    
  }
  
  
  # --------------------------------
  # Mutation Report
  # --------------------------------
  
  if(
    grepl("report|export|create report|generate report", text) &&
    grepl("mutation|variant|change", text)
  ){
    
    return(
      list(
        task = "mutation_report",
        tool = "export_report"
      )
    )
    
  }
  
  
  # --------------------------------
  # Explainable AI
  # --------------------------------
  
  if(
    grepl("explain|why|reason|reasoning", text) &&
    grepl("mutation|variant|change", text)
  ){
    
    return(
      list(
        task = "explanation",
        tool = "generate_explanation"
      )
    )
    
  }
  
  
  # --------------------------------
  # Protein Impact
  # --------------------------------
  
  if(
    grepl("effect|impact|protein change|amino acid", text) &&
    grepl("mutation|variant|change", text)
  ){
    
    return(
      list(
        task = "protein_impact",
        tool = "analyze_protein_impact"
      )
    )
    
  }
  
  
  # --------------------------------
  # Annotation
  # --------------------------------
  
  if(grepl("annotate|annotation|function", text)){
    
    return(
      list(
        task = "annotation",
        tool = "generate_annotation_report"
      )
    )
    
  }
  
  
  # --------------------------------
  # Translation
  # --------------------------------
  
  if(
    grepl("translate|protein|amino acid|produced", text)
  ){
    
    return(
      list(
        task = "translation",
        tool = "translate_dna"
      )
    )
    
  }
  
  
  # --------------------------------
  # Alignment
  # --------------------------------
  
  if(
    grepl("align|alignment|compare sequence", text)
  ){
    
    return(
      list(
        task = "alignment",
        tool = "traceback_alignment"
      )
    )
    
  }
  
  
  # --------------------------------
  # Mutation Detection
  # --------------------------------
  
  if(
    grepl("mutation|variant|difference|change", text)
  ){
    
    return(
      list(
        task = "mutation_detection",
        tool = "explain_mutation"
      )
    )
    
  }
  
  
  # --------------------------------
  # GC Content
  # --------------------------------
  
  if(
    grepl(
      "gc content|guanine|cytosine|gc percentage",
      text
    )
  ){
    
    return(
      list(
        task = "gc_analysis",
        tool = "calculate_gc_content"
      )
    )
    
  }
  
  
  # --------------------------------
  # Unknown
  # --------------------------------
  
  return(
    list(
      task = "unknown",
      tool = NULL
    )
  )
  
}
