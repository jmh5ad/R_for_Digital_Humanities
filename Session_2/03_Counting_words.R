library(dplyr, warn.conflicts = FALSE)
library(tidytext)

## Read text
filename <- "../Data/MLK_speech.txt"
MLK_speech <- readLines(filename)

## Convert text to tibble
num_lines <- length(MLK_speech)
text_table <- tibble(line=1:num_lines, text=MLK_speech)

## Create collection of words
text_words <- text_table %>% 
  unnest_tokens(words, text) 

## Determine the word frequencies
word_counts <- text_words %>% count(words, sort=TRUE)
print(head(word_counts))



print(head(text_words))

data(stop_words)

text_words <- text_words %>% 
  anti_join(stop_words, by=c("words"="word"))

print(head(text_words))