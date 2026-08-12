# ==========================================
# BioAlignAI Report Export Module
# ==========================================


export_report <- function(
    report_text,
    filename = "BioAlignAI_Report.txt"
){
  
  
  writeLines(
    report_text,
    filename
  )
  
  
  return(
    paste(
      "Report successfully saved:",
      filename
    )
  )
  
  
}
