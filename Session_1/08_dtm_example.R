library(tm)
library(ggplot2)

filename <- "../Data/austen-emma-excerpt.txt"
raw_text <- paste(readLines(filename), collapse=" ")

## Cleaning Text
text <- tolower(raw_text)
text <- removeNumbers(text)
text <- removePunctuation(text)
text <- stripWhitespace(text)


words <- unlist(strsplit(text, ' '))
print(table(words))

text <- removeWords(text, stopwords("english"))
text <- stripWhitespace(text)

words <- unlist(strsplit(text, ' '))
wordSummary <- table(words)
print(wordSummary)
word_list <- names(table(words))
word_counts <- as.numeric(wordSummary)

dtm <- data.frame(word=word_list, freq=word_counts)
dtm <- dtm[order(dtm$freq, decreasing=TRUE),]

most_freq <- dtm[1:6, ]

print(ggplot(most_freq,aes(x = word, y = freq)) + 
        geom_bar(stat="identity", fill="steelblue") + coord_flip())

