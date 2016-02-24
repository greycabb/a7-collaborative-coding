<<<<<<< 4d309aeeef9edc2f8f5c27566315fb4a4f1344be
=======
#install.packages("plotly")
>>>>>>> feb 24
library(plotly)

Scatter_Plot <- function(data_frame) {
  
  x <- list(
    title = "# Student"
  )
  y <- list(
    title = "Countries visited"
  )
  
  countries_visited <- data_frame$How.many.countries.have.you.visited.in.your.life.
  return((plot_ly(data_frame,
                 y = countries_visited,
                 mode = "markers")
  ) %>%
    layout(xaxis = x, yaxis = y, title = "How many countries each student has visited"))
}

