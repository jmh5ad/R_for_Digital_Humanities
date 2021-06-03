library(dplyr, warn.conflicts = FALSE)

word <- c("dream", "dream", "dream")
chapter <- c(1, 2, 3)
paragraph <- c(2, 7, 8)
sentence <- c(3, 2, 1)

myTable <- tibble(word = word, 
                  chapter = chapter, 
                  paragraph=paragraph, 
                  sentence = sentence)
print(myTable)