library(janeaustenr)
library(dplyr)
library(stringr)
library(tidytext)
library(textdata)

tidy_books <- austen_books() %>%
  group_by(book) %>%
  mutate(linenumber=row_number(),
         chapter=(cumsum(str_detect(text, 
                                    regex("^chapter [\\divxlc]",
                                                ignore_case=TRUE))))) %>%
  ungroup() %>%
  unnest_tokens(words, text)


nrc_joy <- get_sentiments("nrc") %>% 
  filter(sentiment=="joy")

print(nrc_joy)