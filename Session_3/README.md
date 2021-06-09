#  Introduction to R Programming 

**Description:** This section provides more functions for text mining and continues with some basic R syntax.
 
*  Sentiment Analysis,


Use Case: For Learners in the humanities who are interested in learning about text processing.
 (Not intended for researchers)

Difficulty: Beginner

Completion Time: 75 minutes

# Sentiment Analysis in R
Sentiment Analysis is a  computational technique for detecting the polarity (i.e., positivity  or negativity) of the meaning associated with a phrase, sentence, paragraph, or document.

There are two type of sentiment analysis:  polarity-based and valence based.  The polarity-based analysis defines words as positive, neutral, or negative; where as, with valence-based analysis, words are assigned a "degree" positivity or negativity.  For example, the word "worst" would be considered more negative than the word "bad".

As a caveat, sentiment analysis is very difficult for machines to perform.  They cannot detect sarcasm.  So, the results that we get with sentiment analysis should be used as a guide only.

We are going to look at functions in the `sentimentr` package.  The functions do use a valence-based analysis.  It includes a dictionary of commonly-used words in the English language, along with scores for the words.  The scores can range from -1.0 (most negative) to 1.0 (most positive).  Combinations of words can produce results that are less than -1.0 or greater than 1.0.

Let's look at a simple example:
```
library(sentimentr)
text <- "I hate scary movies."
print(sentiment(text))

```
The result:
```
   element_id sentence_id word_count sentiment
1:          1           1          4    -0.625
```
The result shows us that there is one element (as opposed to a list of elements).  The one element has one sentence wit 4 words.  The sentiment value is -0.625, which is in the negative range.

Now, let's see what happens when we provide an entire text.

```
library(sentimentr)

## Read text
filename <- "../Data/MLK_speech.txt"
MLK_speech <- paste(readLines(filename), collapse=" ")

MLK_sentiment <- sentiment(MLK_speech)
print(head(MLK_sentiment))
```
The results:
```
     element_id sentence_id word_count   sentiment
1:          1           1         27  0.43301270
2:          1           2         19  0.43588989
3:          1           3         28 -0.34016803
4:          1           4         14  0.20044593
5:          1           5         14  0.08017837
6:          1           6         26 -0.39223227

```
Although I "pasted" the text so that it was one long string, the `sentiment` function gives results on a sentence-by-sentence basis.  Some sentences are more negative than others, but it would be nice to have an overall score for the text.  We can get that result by using a `summary` function on the sentiment results:
```
print(summary(MLK_sentiment$sentiment)
```
or
```
print(MLK_sentiment %>% 
    select(sentiment) %>%
    summary())
```

<font color=blue>---------------------------------------------------------------</font>

### Activity: Sentiment of Text
* Open the file `02_sentiment_of_text.R` in RStudio and source it.
* Add a line to get a summary of the sentiment for the entire text.  Are the results what you would expect?

<font color=blue>---------------------------------------------------------------</font>