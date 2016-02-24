library(plotly)
library(dplyr)

Bar_Graph<- function(data_frame) {
# Rendering the second chart, a bar graph
counts <- table(data_frame$What.is.your.current.class.standing.)
return (barplot(counts, main="Class Distribution", 
        xlab="Number of Students per class", col=c("darkblue","red", "yellow", "green")))
}

