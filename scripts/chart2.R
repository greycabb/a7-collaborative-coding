library(plotly)
library(dplyr)

# Rendering the second chart, a bar graph
Bar_Graph <- function(data_frame) {
  
  #sets data into a variable
  counts <- table(data_frame$What.is.your.current.class.standing.)
  
  #returns bar graph
  return (barplot(counts, main="Class Distribution", 
        xlab="Number of Students per class", col=c("darkblue","red", "yellow", "green")))
}

