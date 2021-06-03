

library(dplyr)

word <- c("dream", "dream", "dream", "life", "life" )
chapter <- c(1, 2, 3, 1, 3)
paragraph <- c(2, 8, 7, 3, 5)
sentence <- c(3, 1, 2, 4, 4)

myTable <- tibble(word = word, chapter = chapter, paragraph=paragraph, sentence = sentence)


mySummary <- myTable %>% 
  group_by(chapter) %>%
  summarize(mean(paragraph))
print(mySummary) 