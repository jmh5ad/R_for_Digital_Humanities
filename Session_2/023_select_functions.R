
library(dplyr)

word <- c("dream", "dream", "dream")
chapter <- c(1, 2, 3)
paragraph <- c(2, 8, 7)
sentence <- c(3, 1, 2)

myTable <- tibble(word = word, chapter = chapter, paragraph=paragraph, sentence = sentence)

smallTable <- myTable %>% select(chapter, word)
print(smallTable)