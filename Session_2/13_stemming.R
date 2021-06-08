library(dplyr, warn.conflicts = FALSE)
library(tidytext)
library(SnowballC)

## Set up text & convert to a tibble
myText <- "As a child, she loved spending time in the garden, but now she loves to sit in a quiet room, reading a book. She is loving the pandemic because it allows her to have that quiet, alone time."
text_table <- tibble(text=myText)

## Convert to words & remove stopwords
data(stop_words)
cleaned_words <- text_table %>%
  unnest_tokens(word, text) %>%
  filter(! word %in% stop_words$word) 

## Create a column with the stem words
  stem_words <- cleaned_words %>%
    mutate(stems=wordStem(word))

print(stem_words)

## Count the words, using the stem words
word_counts <- stem_words %>%
  count(stems) 

print(word_counts)

## Your turn!
## Modify the word_counts tibble so that the
## words are listed in decreasing order of 
## occurrence.  Hint:  Remember "arrange" and "desc".