library(dplyr)

# This function takes in a dataset as a parameter,
# then returns a list of information about that dataset

# Values calculated from the data:
#   1) Total number of students
#   2) Total number of freshmen, sophomores, juniors, seniors
#   3) Proportions of total each class standing makes up
#   4) Total number of each level of general programming experience
#   5) Proportion of total each level of experience makes up
#   6) Total number of countries visited
#   7) average number of countries visited by students

summarise_data <- function(data) {
  
  # 1) Modify all the column names so they aren't as verbose
  # Columns are grouped into 3 categories based on what the column entails
  colnames(data) <- c(
    #_____Category 1: Class & Major & OS________________________
    "Class_standing",      # What is your current class standing
    "Interested_in_major", # Are you interested in applying to the Informatics major?
    "OS",                  # Operating system
    
    #_____Category 2: Programming experience____________________
    "Commandline_exp",     # What is your familiarity with: using the command-line / terminal
    "Version_control_exp", # What is your familiarity with: using git for version control?
    "Markdown_exp",        # What is your familiarity with: Creating documents with Markdown
    "R_exp",               # What is your familiarity with: Using the R programming language
    "Programming_exp",     # What is your programming experience?
    
    #_____Category 3: Extra_____________________________________
    "Countries_visited",   # How many countries have you visited in your life?
    "Dog_or_cat_person",   # Do you consider yourself: cat person/dog person/both
    "Seahawks_fan"         # Are you a Seahawks fan?
    )
  data$count <- 1
  
  # Now assemble a list of information about the data:
  returnList <- list()
  
  # Get total number of students
  students <- length(rownames(data))
  
  #___________________________________
  # Group by class standing
  bcs <- group_by(data, Class_standing) %>%
    summarise(
      total = sum(count),
      proportion = format(round(total / students, 4))
    )
  
  # Each year student enrollment in this class
  class_standing_info <- c(
    freshmen <- bcs$total[bcs$Class_standing == "Freshman"],
    sophomores <- bcs$total[bcs$Class_standing == "Sophomore"],
    juniors <- bcs$total[bcs$Class_standing == "Junior"],
    seniors <- bcs$total[bcs$Class_standing == "Senior"]
  )
  
  #___________________________________
  # Group by programming experience
  exp <- group_by(data, Programming_exp) %>%
    summarise(
      total = sum(count),
      proportion = format(round(total / students, 4))
    )
  
  #Levels of programming experience
  programming_exp_info <- c(
    no_experience <- exp$total[exp$Programming_exp == "Never written code"],
    some_experience <- exp$total[exp$Programming_exp == "Experimented a bit with simple programming"],
    moderate_experience <- exp$total[exp$Programming_exp == "Moderate experience with a scripting language (Python, R, JavaScript, Java, etc.)"],
    high_experience <- exp$total[exp$Programming_exp == "Lots of experience with a scripting language (Python, R, JavaScript, Java, etc.)"]
  )
  
  #___________________________________
  # Total number of countries visited
  total_countries_visited <- sum(data$Countries_visited)
  
  # Average number of countries visited (rounded to 2 decimal places)
  average_countries_visited <- format(round(mean(data$Countries_visited), 2))
  
  #___________________________________
  # Return a list of information
  # http://www.r-tutor.com/r-introduction/list/named-list-members
  returnList <- as.list(c(
    students_enrolled = students,
    class_standing = class_standing_info,
    programming_experience = programming_exp_info,
    total_countries_visited = total_countries_visited,
    average_countries_visited = average_countries_visited
  ))
  # print(returnList)
  return(returnList)
}



