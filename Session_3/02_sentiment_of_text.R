library(sentimentr)

## Read text
filename <- "../Data/MLK_speech.txt"
MLK_speech <- paste(readLines(filename), collapse=" ")

MLK_sentiment <- sentiment(MLK_speech)
print(head(MLK_sentiment))

## Your turn!
## Apply the `summary` function to the sentiment column 
## of MLK_sentiment.

