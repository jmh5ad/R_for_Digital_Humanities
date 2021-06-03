library(wordcloud)
options(warn=-1)

filename <- "../Data/emma_chapter_one.txt"
raw_text <- paste(readLines(filename), collapse=" ")


wordcloud(raw_text, scale=c(2, .5),
          random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))

## Your turn!
## Try the same block of code with filename
## changed to "../Data/The_Raven.txt"

