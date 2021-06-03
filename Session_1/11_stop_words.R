library(tm)


filename <- "../Data/austen-emma-excerpt.txt"
raw_text <- paste(readLines(filename), collapse=" ")

## Cleaning Text
text <- tolower(raw_text)
text <- removeNumbers(text)
text <- removePunctuation(text)
text <- stripWhitespace(text)


words <- unlist(strsplit(text, ' '))
wordSummary <- table(words)

## Remove stopwords
text <- removeWords(text, stopwords("english"))
text <- stripWhitespace(text)

words <- unlist(strsplit(text, ' '))
wordSummary <- table(words)
print(wordSummary)

## Your turn!
## Replace the filename with "../Data/The_Raven.txt" to 
## see the frequencies of the meaningful words in that 
## text.