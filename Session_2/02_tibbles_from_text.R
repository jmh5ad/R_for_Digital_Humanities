library(dplyr, warn.conflicts = FALSE)

filename <- "../Data/MLK_speech.txt"
MLK_speech <- readLines(filename)

num_lines <- length(MLK_speech)
text_table <- tibble(line=1:num_lines, text=MLK_speech)

print(text_table)