library(plotly)
library(dplyr)

# Reading data (in the form of a data.frame) from the source
data <- read.csv("https://raw.githubusercontent.com/INFO-498F/a7-survey-data/master/intro_survey_data.csv")

Bar_Graph<- function(data_frame) {
  
# Rendering the second chart, a bar graph
counts <- table(data_frame$What.is.your.current.class.standing.)
return (barplot(counts, main="Class Distribution", 
        xlab="Number of Students per class", col=c("darkblue","red", "yellow", "green")))
}

Bar_Graph(data)
