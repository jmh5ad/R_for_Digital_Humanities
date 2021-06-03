library(janeaustenr)
library(dplyr)
library(stringr)
library(tidytext)

head(austen_books())

## How many books are in this collection?

all_books <- austen_books()
print(all_books %>% distinct(book))

## Add line numbers to the text
all_books <- all_books %>% 
  group_by(book) %>%
  mutate(linenumber = row_number())
  
print(all_books)

## Add chapter numbers to the text
all_books <- all_books %>%
  mutate(chapter = cumsum(str_detect(text, 
                                     regex("^chapter [\\divxlc]",
                                           ignore_case = TRUE)))) %>%
  ungroup()
print(all_books)

tidy_books <- all_books %>% 
  unnest_tokens(word, text)

data(stop_words)
tidy_books <- tidy_books %>% filter(! word %in% stop_words$word)
tidy_books

word_counts <- tidy_books %>% count(word, sort=TRUE)
print(word_counts)

library(ggplot2)
print(word_counts %>% filter(n > 600) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(n, word)) + 
  geom_col() + 
  labs(y=NULL))
