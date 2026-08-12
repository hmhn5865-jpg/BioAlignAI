# ==========================================
# BioAlignAI Agent Brain v3
# Planner Based Architecture
# ==========================================


agent_brain <- function(user_input){
  
  
  plan <- plan_task(user_input)
 
  # Extract DNA sequences
  sequences <- unlist(
    regmatches(
      toupper(user_input),
      gregexpr("\\b[ATGC]{3,}\\b", toupper(user_input))
    )
  )
  # -------------------------------
  # FASTA Analysis
  # -------------------------------
  
  if(plan$task == "fasta_analysis"){
    
    
    file_name <- regmatches(
      user_input,
      regexpr(
        "[A-Za-z0-9_./-]+\\.fasta",
        user_input
      )
    )
    
    
    return(
      analyze_fasta(file_name)
    )
    
  } 
  # -------------------------------
  # Alignment + Explanation
  # -------------------------------
  
  if(plan$task == "alignment_explanation"){
    
    if(length(sequences) >= 2){
      
      alignment_result <- traceback_alignment(
        sequences[1],
        sequences[2]
      )
      
      
      alignment_analysis <- analyze_alignment(
        alignment_result$alignment1,
        alignment_result$alignment2
      )
      
      
      report <- paste0(
        
        "BIOALIGNAI ALIGNMENT & MUTATION ANALYSIS\n",
        "========================================\n\n",
        
        "Reference: ",
        sequences[1],
        "\n",
        
        "Variant: ",
        sequences[2],
        "\n\n",
        
        "Alignment Score: ",
        alignment_result$score,
        "\n",
        
        "Matches: ",
        alignment_analysis$matches,
        "\n",
        
        "Mismatches: ",
        alignment_analysis$mismatches,
        "\n",
        
        "Gaps: ",
        alignment_analysis$gaps,
        "\n",
        
        "Match Percentage: ",
        round(
          alignment_analysis$match_percentage,
          2
        ),
        "%\n\n"
        
      )
      
      
      if(length(alignment_analysis$mutation_details) > 0){
        
        report <- paste0(
          report,
          "MUTATION INTERPRETATION\n",
          "-----------------------\n\n"
        )
        
        
        for(mutation in alignment_analysis$mutation_details){
          
          mutation_type <- classify_substitution(
            mutation$reference,
            mutation$variant
          )
          
          
          explanation <- explain_alignment_mutation(
            mutation$reference,
            mutation$variant,
            mutation$position,
            mutation_type
          )
          
          
          report <- paste0(
            
            report,
            
            "Position: ",
            mutation$position,
            "\n",
            
            "Change: ",
            mutation$reference,
            " → ",
            mutation$variant,
            "\n",
            
            "Type: ",
            mutation_type,
            "\n\n",
            
            explanation,
            "\n\n"
            
          )
          
        }
        
      } else {
        
        report <- paste0(
          report,
          "No nucleotide mismatches detected.\n"
        )
        
      }
      
      
      return(report)
      
    }
    
  }
  # -------------------------------
  # Alignment Analysis
  # -------------------------------
  
  if(plan$task == "alignment"){
    
    if(length(sequences) >= 2){
      
      # Step 1: Needleman-Wunsch alignment
      alignment_result <- traceback_alignment(
        sequences[1],
        sequences[2]
      )
      
      
      # Step 2: Alignment statistics
      alignment_analysis <- analyze_alignment(
        alignment_result$alignment1,
        alignment_result$alignment2
      )
      
      
      # Step 3: Build mutation information
      mutation_text <- ""
      
      
      if(length(alignment_analysis$mutation_details) > 0){
        
        mutation_text <- paste0(
          "\nMUTATION DETAILS\n",
          "----------------\n"
        )
        
        
        for(mutation in alignment_analysis$mutation_details){
          
          mutation_type <- classify_substitution(
            mutation$reference,
            mutation$variant
          )
          
          
          explanation <- explain_alignment_mutation(
            mutation$reference,
            mutation$variant,
            mutation$position,
            mutation_type
          )
          
          
          mutation_text <- paste0(
            
            mutation_text,
            
            "Position: ",
            mutation$position,
            "\n",
            
            "Reference: ",
            mutation$reference,
            "\n",
            
            "Variant: ",
            mutation$variant,
            "\n",
            
            "Mutation Type: ",
            mutation_type,
            "\n\n",
            
            "INTERPRETATION\n",
            "--------------\n",
            
            explanation,
            "\n\n"
            
          )
          
        }
        
      } else {
        
        mutation_text <- paste0(
          "\nMUTATION DETAILS\n",
          "----------------\n",
          "No nucleotide mismatches detected.\n"
        )
        
      }
      
      
      # Step 4: Complete alignment report
      alignment_report <- paste0(
        
        "========================================\n",
        "       BIOALIGNAI ALIGNMENT REPORT\n",
        "========================================\n\n",
        
        "REFERENCE SEQUENCE\n",
        "------------------\n",
        sequences[1],
        "\n\n",
        
        "VARIANT SEQUENCE\n",
        "----------------\n",
        sequences[2],
        "\n\n",
        
        "ALIGNMENT\n",
        "---------\n",
        alignment_result$alignment1,
        "\n",
        alignment_result$alignment2,
        "\n\n",
        
        "ALIGNMENT SCORE: ",
        alignment_result$score,
        "\n\n",
        
        "ALIGNMENT STATISTICS\n",
        "--------------------\n",
        
        "Alignment Length: ",
        alignment_analysis$alignment_length,
        "\n",
        
        "Matches: ",
        alignment_analysis$matches,
        "\n",
        
        "Mismatches: ",
        alignment_analysis$mismatches,
        "\n",
        
        "Gaps: ",
        alignment_analysis$gaps,
        "\n",
        
        "Match Percentage: ",
        round(
          alignment_analysis$match_percentage,
          2
        ),
        "%\n",
        
        mutation_text
        
      )
      
      
      return(
        alignment_report
      )
      
    }
    
  }
  
  
  
  # -------------------------------
  # GC Content
  # -------------------------------
  
  if(plan$task == "gc_analysis"){
    
    
    if(length(sequences) >= 1){
      
      result <- calculate_gc_content(
        sequences[1]
      )
      
      return(
        generate_gc_report(result)
      )
      
    }
    
  }
  
  
  
  # -------------------------------
  # Translation
  # -------------------------------
  
  if(plan$task == "translation"){
    
    
    if(length(sequences) >= 1){
      
      result <- translate_dna(
        sequences[1]
      )
      
      return(
        generate_translation_report(result)
      )
      
    }
    
  }
  
  
  # -------------------------------
  # Protein Impact
  # -------------------------------
  
  if(plan$task == "protein_impact"){
    
    
    if(length(sequences) >= 2){
      
      
      result <- analyze_protein_impact(
        sequences[1],
        sequences[2]
      )
      
      
      return(
        generate_impact_report(result)
      )
      
      
    }
    
  }
  # -------------------------------
  # Mutation
  # -------------------------------
  
  if(plan$task == "mutation_detection"){
    
    
    if(length(sequences) >= 2){
      
      return(
        explain_mutation(
          sequences[1],
          sequences[2]
        )
      )
      
    }
    
  }
  # -------------------------------
  # Annotation Analysis
  # -------------------------------
  
  if(plan$task == "annotation"){
    
    
    if(length(sequences) >= 1){
      
      
      dna_result <- annotate_sequence(
        sequences[1]
      )
      
      
      protein_result <- annotate_protein(
        sequences[1]
      )
      
      
      return(
        generate_annotation_report(
          dna_result,
          protein_result
        )
      )
      
      
    }
    
  } 
  
  # -------------------------------
  # Explainable AI
  # -------------------------------
  
  if(plan$task == "explanation"){
    
    
    if(length(sequences) >= 2){
      
      
      return(
        generate_explanation(
          sequences[1],
          sequences[2]
        )
      )
      
      
    }
    
  }
  # -------------------------------
  # Mutation Report Export
  # -------------------------------
  
  if(plan$task == "mutation_report"){
    
    
    if(length(sequences) >= 2){
      
      
      report <- generate_explanation(
        sequences[1],
        sequences[2]
      )
      
      
      return(
        export_report(
          report
        )
      )
      
      
    }
    
  }
  return(
    "Sorry, I could not understand the biological task."
  )
  
}
