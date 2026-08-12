
# ==========================================
# BioAlignAI Dashboard
# ==========================================

library(shiny)

source("R/load_all.R")


# ==========================================
# User Interface
# ==========================================

ui <- fluidPage(
  
  titlePanel(
    "🧬 BioAlignAI Dashboard"
  ),
  
  
  sidebarLayout(
    
    sidebarPanel(
      
      textInput(
        "sequence1",
        "Reference DNA Sequence:",
        value = "ATGGCC"
      ),
      
      
      textInput(
        "sequence2",
        "Variant DNA Sequence:",
        value = "ATGACC"
      ),
      
      
      selectInput(
        "analysis",
        "Choose Analysis:",
        choices = c(
          "Sequence Alignment",
          "Mutation Impact",
          "Mutation Explanation",
          "Sequence Annotation",
          "GC Content",
          "Translation",
          "AI Agent Analysis"
        )
      ),
      
      
      conditionalPanel(
        
        condition = "input.analysis == 'AI Agent Analysis'",
        
        textAreaInput(
          "agent_request",
          "Ask BioAlignAI:",
          value = "Analyze the protein impact of mutation ATGGCC to ATGACC",
          rows = 4,
          placeholder = "Example: Align ATGGCC with ATGACC and explain the mutation"
        )
        
      ),
      
      
      actionButton(
        "run",
        "Run BioAnalysis"
      )
      
    ),
    
    
    mainPanel(
      
      h3("BioAlignAI Result"),
      
      verbatimTextOutput(
        "output"
      ),
      
      br(),
      
      h3("Visualization"),
      
      plotOutput(
        "gc_plot"
      )
      
    )
    
  )
  
)


# ==========================================
# Server
# ==========================================

server <- function(input, output){
  
  
  result <- reactiveVal("")
  
  
  observeEvent(
    input$run,
    {
      
      # ==================================
      # Sequence Alignment
      # ==================================
      
      if(input$analysis == "Sequence Alignment"){
        
        alignment_result <- traceback_alignment(
          input$sequence1,
          input$sequence2
        )
        
        
        alignment_analysis <- analyze_alignment(
          alignment_result$alignment1,
          alignment_result$alignment2
        )
        
        
        mutation_text <- ""
        
        
        if(
          length(
            alignment_analysis$mutation_details
          ) > 0
        ){
          
          mutation_text <- paste0(
            "\nMutation Details:\n"
          )
          
          
          for(
            mutation
            in alignment_analysis$mutation_details
          ){
            
            mutation_type <- classify_substitution(
              mutation$reference,
              mutation$variant
            )
            
            
            mutation_explanation <- explain_alignment_mutation(
              mutation$reference,
              mutation$variant,
              mutation$position,
              mutation_type
            )
            
            
            mutation_text <- paste0(
              
              mutation_text,
              
              "Position ",
              mutation$position,
              ": ",
              mutation$reference,
              " → ",
              mutation$variant,
              
              "\nMutation Type: ",
              mutation_type,
              
              "\n\n",
              
              "BIOLOGICAL INTERPRETATION\n",
              "-------------------------\n",
              
              mutation_explanation,
              
              "\n\n"
              
            )
            
          }
          
        } else {
          
          mutation_text <- paste0(
            "\nMutation Details:\n",
            "No nucleotide mismatches detected.\n"
          )
          
        }
        
        
        alignment_text <- paste0(
          
          "NEEDLEMAN-WUNSCH SEQUENCE ALIGNMENT\n",
          "===================================\n\n",
          
          "Reference Sequence:\n",
          alignment_result$alignment1,
          "\n\n",
          
          "Variant Sequence:\n",
          alignment_result$alignment2,
          "\n\n",
          
          "Alignment Score: ",
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
        
        
        result(
          alignment_text
        )
        
      }
      
      
      # ==================================
      # Mutation Impact
      # ==================================
      
      if(input$analysis == "Mutation Impact"){
        
        impact_result <- analyze_protein_impact(
          input$sequence1,
          input$sequence2
        )
        
        
        result(
          generate_impact_report(
            impact_result
          )
        )
        
      }
      
      
      # ==================================
      # Mutation Explanation
      # ==================================
      
      if(input$analysis == "Mutation Explanation"){
        
        result(
          format_dashboard_result(
            generate_explanation(
              input$sequence1,
              input$sequence2
            ),
            input$analysis
          )
        )
        
      }
      
      
      # ==================================
      # Sequence Annotation
      # ==================================
      
      if(input$analysis == "Sequence Annotation"){
        
        dna_result <- annotate_sequence(
          input$sequence1
        )
        
        
        protein_result <- annotate_protein(
          input$sequence1
        )
        
        
        result(
          generate_annotation_report(
            dna_result,
            protein_result
          )
        )
        
      }
      
      
      # ==================================
      # GC Content
      # ==================================
      
      if(input$analysis == "GC Content"){
        
        result(
          generate_gc_report(
            calculate_gc_content(
              input$sequence1
            )
          )
        )
        
      }
      
      
      # ==================================
      # Translation
      # ==================================
      
      if(input$analysis == "Translation"){
        
        translation_result <- translate_dna(
          input$sequence1
        )
        
        
        result(
          generate_translation_report(
            translation_result
          )
        )
        
      }
      
      
      # ==================================
      # AI Agent Analysis
      # ==================================
      
      if(input$analysis == "AI Agent Analysis"){
        
        result(
          agent_brain(
            input$agent_request
          )
        )
        
      }
      
    }
    
  )
  
  
  # ==========================================
  # Text Output
  # ==========================================
  
  output$output <- renderPrint({
    
    result()
    
  })
  
  
  # ==========================================
  # Visualization
  # ==========================================
  
  output$gc_plot <- renderPlot({
    
    req(input$run)
    
    
    if(
      input$analysis == "GC Content"
    ){
      
      plot_gc_content(
        input$sequence1
      )
      
    }
    
    
    if(
      input$analysis == "Sequence Alignment"
    ){
      
      alignment_result <- traceback_alignment(
        input$sequence1,
        input$sequence2
      )
      
      
      plot_alignment(
        alignment_result$alignment1,
        alignment_result$alignment2
      )
      
    }
    
  })
  
}


# ==========================================
# Run Application
# ==========================================

shinyApp(
  ui,
  server
)
