
## Read in text
filename <- "../Data/emma_chapter_one.txt"
text <- paste(readLines(filename), collapse=' ')

## Check for keywords
if ( grepl("young", text) && ! grepl("old", text) ){
  print("The text deals with youth" )
}

if ( grepl('live', text) || grepl('die', text) ){
  print("The text deals with life.")
}

if ( grepl('old', text) && grepl('die', text) ){
  print("The text deals with death.")
}

