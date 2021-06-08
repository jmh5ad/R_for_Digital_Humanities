
library(dplyr, warn.conflicts = FALSE)

## Read in text
filename <- "../Data/MLK_speech.txt"
MLK_speech <- readLines(filename)

## Convert to a tibble
num_lines <- length(MLK_speech)
text_table <- tibble(line=1:num_lines, text=MLK_speech)

## Let's count the number of characters in each line
text_table <- text_table %>%
  mutate(numChar = nchar(text))

print(text_table)

## Your turn!
## It appears tht there are extra linefeeds in the text.
## Can you figure out how to filter the "dream_table" so
## that only lines with characters are kept?