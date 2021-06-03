library(dplyr, verbose=FALSE, warn.conflicts = FALSE)

filename <- "../Data/MLK_speech.txt"
MLK_speech <- readLines(filename)

num_lines <- length(MLK_speech)
text_table <- tibble(line=1:num_lines, text=MLK_speech)



library(tidytext)

text_words <- text_table %>% 
  unnest_tokens(words, text) 

print(head(text_words))


text_words <- text_words %>% 
  count(words, sort=TRUE)

print(head(text_words))

data(stop_words)

text_words <- text_words %>% 
  anti_join(stop_words, by=c("words"="word"))

print(head(text_words))