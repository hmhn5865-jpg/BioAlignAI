# ==========================================
# BioAlignAI Visualization
# ==========================================

library(ggplot2)


plot_gc_content <- function(sequence){
  
  
  sequence <- toupper(sequence)
  
  
  bases <- strsplit(sequence, "")[[1]]
  
  
  gc_count <- sum(
    bases %in% c("G","C")
  )
  
  
  total_count <- length(bases)
  
  
  gc_percentage <- round(
    (gc_count / total_count) * 100,
    2
  )
  
  
  at_percentage <- round(
    100 - gc_percentage,
    2
  )
  
  
  data <- data.frame(
    
    Category = c(
      "GC",
      "AT"
    ),
    
    Percentage = c(
      gc_percentage,
      at_percentage
    )
    
  )
  
  
  ggplot(
    data,
    aes(
      x = Category,
      y = Percentage
    )
  ) +
    
    geom_col() +
    
    ylim(
      0,
      100
    ) +
    
    labs(
      title = "GC Content Analysis",
      x = "Base Composition",
      y = "Percentage (%)"
    )
  
}
