library(SnowballC)
myText <- "As a child, she loved spending time in the garden, but now she loves to sit in a quiet room, reading a book. She is loving the pandemic because it allows her to have that quiet, alone time."

text_table <- tibble(text=myText)

data(stop_words)
stem_words <- text_table %>%
  unnest_tokens(word, text) %>%
  filter(! word %in% stop_words$word) %>%
  mutate(stems=wordStem(word))

print(stem_words)

word_counts <- stem_words %>%
  count(stems)

print(word_counts)
