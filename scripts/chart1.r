install.packages("plotly")
library(plotly)
data_main <- read.csv("https://raw.githubusercontent.com/INFO-498F/a7-survey-data/master/intro_survey_data.csv")
Scatter_Plot <- function(data_frame) {
  return(plot_ly(data = data_frame,  xlab ="students", y = data_main$How.many.countries.have.you.visited.in.your.life., mode = "markers"))
}