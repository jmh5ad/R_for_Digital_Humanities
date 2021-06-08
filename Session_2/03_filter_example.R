library(dplyr, warn.conflicts = FALSE)

## Read in text
filename <- "../Data/MLK_speech.txt"
MLK_speech <- readLines(filename)

## Convert to a tibble
num_lines <- length(MLK_speech)
text_table <- tibble(line=1:num_lines, text=MLK_speech)

## Let's grab any line that has the word "dream"
dream_table <- text_table %>%
  filter(grepl("dream", text))

print(dream_table)