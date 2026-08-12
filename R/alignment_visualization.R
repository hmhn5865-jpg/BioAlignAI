# ==========================================
# BioAlignAI Alignment Visualization
# ==========================================

plot_alignment <- function(alignment1, alignment2) {
  
  if (nchar(alignment1) != nchar(alignment2)) {
    stop("Aligned sequences must have the same length.")
  }
  
  
  alignment_length <- nchar(alignment1)
  
  
  positions <- seq_len(alignment_length)
  
  
  # --------------------------------
  # Determine matches
  # --------------------------------
  
  matches <- logical(alignment_length)
  
  
  for (i in positions) {
    
    base1 <- substr(alignment1, i, i)
    base2 <- substr(alignment2, i, i)
    
    matches[i] <- base1 == base2
    
  }
  
  
  # --------------------------------
  # Create empty plot
  # --------------------------------
  
  plot(
    positions,
    rep(1, alignment_length),
    type = "n",
    xlim = c(0.5, alignment_length + 0.5),
    ylim = c(0.4, 3.2),
    xaxt = "n",
    yaxt = "n",
    xlab = "Alignment Position",
    ylab = "",
    main = "BioAlignAI Sequence Alignment"
  )
  
  
  # --------------------------------
  # Position numbers
  # --------------------------------
  
  text(
    positions,
    2.8,
    positions,
    cex = 0.9
  )
  
  
  # --------------------------------
  # Reference sequence
  # --------------------------------
  
  text(
    0.3,
    2.1,
    "Reference:",
    adj = 1,
    font = 2
  )
  
  
  for (i in positions) {
    
    text(
      i,
      2.1,
      substr(alignment1, i, i),
      cex = 1.4
    )
    
  }
  
  
  # --------------------------------
  # Match indicators
  # --------------------------------
  
  for (i in positions) {
    
    if (matches[i]) {
      
      text(
        i,
        1.6,
        "|",
        cex = 1.2
      )
      
    } else {
      
      text(
        i,
        1.6,
        "×",
        cex = 1.2
      )
      
    }
    
  }
  
  
  # --------------------------------
  # Variant sequence
  # --------------------------------
  
  text(
    0.3,
    1.1,
    "Variant:",
    adj = 1,
    font = 2
  )
  
  
  for (i in positions) {
    
    text(
      i,
      1.1,
      substr(alignment2, i, i),
      cex = 1.4
    )
    
  }
  
  
  # --------------------------------
  # Position axis
  # --------------------------------
  
  axis(
    1,
    at = positions,
    labels = positions
  )
  
}
