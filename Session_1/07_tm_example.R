library(tm)


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

