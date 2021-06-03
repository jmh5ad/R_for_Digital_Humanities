# Text Mining in R


## tidytext


The idea behind `tidytext` is that a consistent format for data will make processing it much easier.  In the `tidyverse` of R, data is organized into tables where each column is a variable and each row is an observation.  Another way to think about this is that each row is an item on which we have collected information.  That information is stored in the corresponding column.

If you are working in a Humanities discipline, a table may not be the natural state your data.  You may have a text document or corpora.  But if you think of the documents as a collection of words, you can create tables of information about those words.  

Suppose that you are interested in where the word _dream_ occurs in your document.  For each occurrence of the word, you could identify the chapter, paragraph, and sentence where the word appears.  This information can be organized as a table.  For example:
 
|word | chapter | paragraph |sentence|
|:----|:--------|:----------|:-------|
|dream| 1| 2|3|
|dream|2|7|2|
|dream|5|8|1|

That would be for just one word.  You could expand the table to include all major words in the document. Let's see how we repr.esent a table of data in R.


## The _tibble_ Data Type

Earlier, we talked about how variables can hold different types of information (e.g., numeric values, strings, lists).  Another type of data that a variable can hold is a _tibble_, which a table format.  The _tibble_ is the data type used most often for _tidytext_functions.

If you have worked with _dataframes_, either in R or in other languages, then you are already familiar with _tibbles_.  The creators of the _tibble_ data type started with the _dataframe_ type  and made it easier to use.

We can create a _tibble_ by starting with lists of data that would go in the columns of a table and combining the lists with the `tibble` function.  For example, we can create the table from the previous section as follows:
```
library(dplyr)

word <- c("dream", "dream", "dream")
chapter <- c(1, 2, 3)
paragraph <- c(2, 8, 7)
sentence <- c(3, 1, 2)

myTable <- tibble(word = word, chapter = chapter, paragraph=paragraph, sentence = sentence)

print(myTable)
```
Why do we have `word = word` and `chapter = chapter` inside of the `tibble` parentheses?  The word to the left of the equals represents the column name in the table.  The word to the right of the equals is the variable holding the data to be assigned to that column. I chose to give the lists the same name as the column header.  They are not required to be the same.  The actual format is

`tibble(col_name_1 = data_list_1, col_name_2 = dat_list_2, ... )`
You can have as many columns as you need to represent the measurements of the observations.


In the next example, we are reading in a file, _MLK_speech.txt_ and creating a tibble with the line numbers and the lines of the speech.
```
library(dplyr, warn.conflicts = FALSE)

filename <- "../Data/MLK_speech.txt"
MLK_speech <- readLines(filename)

num_lines <- length(MLK_speech)
text_table <- tibble(line=1:num_lines, text=MLK_speech)

head(text_table)

```
For the functions provided in the _tidytext_ package, we will need for the text to be in a _tibble_ format.

## Applying functions to _tibbles_
One of the nice features of _tibbles_ is how we can apply functions to the columns.  There are five key functions for manipulating _tibbles_.  The functions can be summarized as follows:
|Name |               Function |
|------ | -----------------------------------------------------|
|filter | for selecting row with specific values or characteristics |       
|arrange |  for re-ordering rows according to a given criterium    
|select        | for choosing specific columns  to manipulate      |   
|  mutate     |     for creating a new column                               |
| summarize    |  for creating a summary of given columns              |

There also is a `group_by` command for applying functions on subsets of data.

We can feed a _tibble_ into each of these functions by using a "pipe" notation:  `%>%`

Let's see these functions in action.

### Example of `filter` Function
```
library(dplyr, warn.conflicts = FALSE)

## Read in text
filename <- "../Data/MLK_speech.txt"
MLK_speech <- readLines(filename)

## Convert to a tibble
num_lines <- length(MLK_speech)
text_table <- tibble(line=1:num_lines, text=MLK_speech)

## Let's grab any line that has the word "dream"
dream_table <- text_table %>%
   filter(grepl("dream", word))
   
print(dream_table)
```
    
###                                                Example of `arrange` Function

```
library(dplyr)

word <- c("dream", "dream", "dream")
chapter <- c(1, 2, 3)
paragraph <- c(2, 8, 7)
sentence <- c(3, 1, 2)

myTable <- tibble(word = word, chapter = chapter, paragraph=paragraph, sentence = sentence)

myTable <- myTable %>% arrange(sentence)
print(myTable)

myTable <- myTable %>% arrange(desc(chapter))
print(myTable)
```

###                                                Example of `select` Function
```
library(dplyr)

word <- c("dream", "dream", "dream")
chapter <- c(1, 2, 3)
paragraph <- c(2, 8, 7)
sentence <- c(3, 1, 2)

myTable <- tibble(word = word, chapter = chapter, paragraph=paragraph, sentence = sentence)

smallTable <- myTable %>% select(chapter, word)
print(smallTable)

```
###                                                Example of `mutate` Function
```
library(dplyr, warn.conflicts = FALSE)

## Read in text
filename <- "../Data/MLK_speech.txt"
MLK_speech <- readLines(filename)

## Convert to a tibble
num_lines <- length(MLK_speech)
text_table <- tibble(line=1:num_lines, text=MLK_speech)

## Let's grab any line that has the word "dream"
dream_table <- text_table %>%
  mutate(numChar = nchar(text))

print(dream_table)
```
###                                                Example of `summarize` Function
```
library(dplyr)

word <- c("dream", "dream", "dream")
chapter <- c(1, 2, 3)
paragraph <- c(2, 8, 7)
sentence <- c(3, 1, 2)

myTable <- tibble(word = word, chapter = chapter, paragraph=paragraph, sentence = sentence)


myTable <- myTable %>% summarize(mean(paragraph))
print(myTable)

```
###                                                Example of `group_by` Function
```
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

```
There are two things to notice in the `group_by` example.  
* First, we can chain together the different functions that we want to perform.  In this example, the _tibble_, `myTable`, is feed into the `group_by` function, which adds group information to the _tibble_.  The new _tibble_ is then fed into the `summarize` function.  By chaining together the _tibble_ operations, we can create an efficient workflow for our data.
* The results in `mySummary` are organized by chapters.  When we specified `group_by(chapter)`,  R will add information to the _tibble_ that will specify subset of the data.  Operations, such as `summarize`,  that follow the `group_by` function will be performed on the subsets.

<font color="blue"> __________________________________________________________________________
 </font>

### Activity
For the MLK speech, write an R program that will
*  Read in the data file;
*  Convert the text to a tibble of lines
*  Add a column that has the number of character in each line
*  Filter the lines that have the word "dream" in them
*  Arrange them in descending order (i.e., line with most characters first)
*  Select only the columns with the number of characters and the text
*  Print the results
*  Average the number of characters and print the results

<font color="blue"> __________________________________________________________________________
 </font>
## Converting text to words

When analyzing text, there are steps that are frequently done to "clean" the text.  This includes removing all punctuation, converting words to all lower case, and splitting the text into the individual words.  


The  _tidytext_ package provides us with the `unnest_tokens` function to help us with these tasks.


```
library(dplyr,  warn.conflicts = FALSE)
library(tidytext)

## Read in text
filename <- "../Data/MLK_speech.txt"
MLK_speech <- readLines(filename)

## Convert text to tibble
num_lines <- length(MLK_speech)
text_table <- tibble(line=1:num_lines, text=MLK_speech)

## Create collection of words
text_words <- text_table %>% 
  unnest_tokens(words, text) 

print(head(text_words))
```

Notice that the "tokenizer" does two things to help us:

1. It converts all words to lowercase;

2. It strips out all punctuation.

These steps are important for putting the words into a format that we can analyze.

##  Counting Words

One of the first steps in analyzing text is determining the most frequently-used words.  The _tidyverse_ package provides a _count_ function that will count each distinct word in the text and sort the words so that the most frequently-used words appear first.

```{r}
library(dplyr,  warn.conflicts = FALSE)
library(tidytext)

## Read in text
filename <- "../Data/MLK_speech.txt"
MLK_speech <- readLines(filename)

## Convert text to tibble
num_lines <- length(MLK_speech)
text_table <- tibble(line=1:num_lines, text=MLK_speech)

## Create collection of words
text_words <- text_table %>% 
  unnest_tokens(words, text) 
  
## Determine the word frequencies
word_counts <- text_words %>% count(words, sort=TRUE)
print(head(word_counts))
```
What words appear the most frequently?  Do these words help with the meaning of the text?  What can we do about this?

## Removing Stop Words
Words like _the_ and _and_ do not give us any insight into the meaning of the text.  It would be best if we could eliminate these types of words.

The `tidytext` package includes a list (actually three lists) of words that are commonly used in the English language.  These collections of words are called "stop_words".  They are the words that you want to "stop counting" when you are looking at word frequencies.

It is quite common to remove stop words **before** performing analysis.  

You can load the "stop_words" provided with the _tidytext_ package by using the `data` function:

```{r}
data(stop_words)
```

Next, we can remove the `stop_words` from our list with the `filter` function.

```{r}
text_words <- text_words %>% 
  filter(! words %in% stop_words$word)

head(text_words)
```
In this example, we are comparing the columns named `words` in `text_words` to the column named `word` in `stop_words`.  The `!` is a negation, meaning that we are interested in the words that are **not** in the list of stop_words.  The filter function will keep any words that satisfy that condition.

Putting this all together, we have a better idea of the contents of the speech:
```
library(dplyr, warn.conflicts = FALSE)
library(tidytext)

## Read text
filename <- "../Data/MLK_speech.txt"
MLK_speech <- readLines(filename)

## Convert text to tibble
num_lines <- length(MLK_speech)
text_table <- tibble(line=1:num_lines, text=MLK_speech)

## Create collection of words
text_words <- text_table %>% 
  unnest_tokens(words, text) 

## Load stop_words
data(stop_words)
cleaned_words <- text_words %>% 
  filter(! words %in% stop_words$word)

## Determine the word frequencies
word_counts <- cleaned_words %>% 
   count(words, sort=TRUE)
   
print(head(word_counts))
```
The results:
```
A tibble: 6 x 2 
words        n
<chr>    <int>
1 applause    25
2 lord        24
3 freedom     20
4 yeah        20
5 ring        15
6 negro       13

```

Notice that the word "applause" appears to be the most frequent. We can filter the lines where "applause" appears in the text:
```
library(dplyr, warn.conflicts = FALSE)
library(tidytext)

## Read text
filename <- "../Data/MLK_speech.txt"
MLK_speech <- readLines(filename)

## Convert text to tibble
num_lines <- length(MLK_speech)
text_table <- tibble(line=1:num_lines, text=MLK_speech)

print(text_table %>% filter(grepl("applause", text)))
```
Looking through the results, you will notice that "[applause]" appears as supplemental information -- it is the audiences reaction, not a word in the speech itself.

There may be time, such as this, when we may want to filter out words that are not in the official `stop_words` list.  We can do this by creating our own list of words and filtering those out, too.

## Creating Our Own Stop Words

Creating a list of stop words can be done quite simply by starting a list (e.g., `myStopWords`) and filtering those words as well as the `stop_words` from `tidytext`.
```
## Load stop_words
data(stop_words)

## Create my own list of stop words
myStopWords <- c("applause")

## Filter out stop_words
cleaned_words <- text_words %>% 
  filter(! words %in% stop_words$word) %>%
  filter(! words %in% myStopWords)
```

## Using Stem Words

Suppose we had the sentences:
> As a child, she loved spending time in the garden, but now she loves to sit in a quiet room, reading a book. She is loving the pandemic because it allows her to have that quiet, alone time.

If we split this into words, remove stop words, and count the word frequencies, we would find that the words "loved", "loves", and "loving" are counted as separate words.  But, we know that these three words are various forms of the verb "love".  There may be times when we want the convert words to a root or stem word **before** we perform a word count.

Converting words to stem words can be done with the `wordStem` function in the `SnowballC` package.
```
library(SnowballC)
myText <- "As a child, she loved spending time in the garden, but now she loves to sit in a quiet room, reading a book. She is loving the pandemic because it allows her to have that quiet, alone time."

text_table <- tibble(text=myText)

data(stop_words)
stem_words <- text_table %>%
  unnest_tokens(word, text) %>%
  filter(! word %in% stop_words$word) %>%
  mutate(stems=wordStem(word))

print(stem_words)

word_counts <- stem_words %>%
  count(stems)

print(word_counts)
```