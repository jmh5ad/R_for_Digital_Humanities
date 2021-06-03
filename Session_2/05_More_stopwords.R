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

## Load stop_words
data(stop_words)

## Create my own list of stop words
myStopWords <- c("applause")

## Filter out stop_words
cleaned_words <- text_words %>% 
  filter(! words %in% stop_words$word) %>%
  filter(! words %in% myStopWords)

 
## Determine the word frequencies
word_counts <- cleaned_words %>% count(words, sort=TRUE)
print(head(word_counts))