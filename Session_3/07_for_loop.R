library(stringr)

## Set up list of documents and keyword
my_docs = c('../Data/emma_chapter_one.txt', 
            '../Data/The_Raven.txt', 
            '../Data/MLK_speech.txt')
keyword = "dream"

## Loop through the documents and count keyword
for (document in my_docs) {
  text <- paste(readLines(document), collapse = " ")
  N <- str_count(text, keyword)
  cat("\nIn", document, "the word", keyword, "appears", N, "times." )
}
