
##---------------Define Functions ----------------------
min_of_3 <- function(a, b, c) {
  if (a < b && a < c){
    the_min = paste("The first grade", a,"is the lowest.")
  } else if (b < c){
    the_min = paste("The second grade", b, "is the lowest.")
  } else{
    the_min <- paste("The third grade", c, "is the lowest.")
  }
  
  return(the_min)
}

##--------------- Main Code ----------------------

grade_1 = 15/17
grade_2 = 30/35
grade_3 = 85/100

print(min_of_3(grade_1, grade_2, grade_3))