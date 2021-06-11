library(tidytext)

## Read in the text
filename <- '../Data/austen-emma-excerpt.txt'
raw_text <- readLines(filename)
words_table <- tibble(text=raw_text) %>% unnest_tokens(words, text)


## Loop trough the positions and find where the keyword occurs
keyword <- "mother"
index <- 1
while (words_table$words[index] != keyword){
  index <- index + 1
}

## Display the results
cat("\nThe word", keyword, "first occurs at position", 
index, "in the list of words.")