#  Introduction to R Programming 

**Description:** This section gives a general overview of text mining using `tidytext` functions.  The grammar and syntax of the `tidy` functions in R are quite different.  :
*  _tibble_ Data Type,
*  _tidyverse_ Functions
    *  _filter_
    *  _arrange_
    *  _select_
    *  _mutate)_
    *  _summarize_
    *  _group_by_
*  Converting text to words,
*  Counting words,
*  Removing Stop Words
*  Stemming

Use Case: For Learners in the humanities who are interested in learning about text processing.
 (Not intended for researchers)

Difficulty: Beginner

Completion Time: 75 minutes
## Before we get started . . .
There is a function and an operator that you will want to see.
1. **`grepl` Function**:  The `grepl` function is included in base R, and is able to determine if a substring exists in a string.  The format is 
`grepl(substring, string)` It will return a `TRUE` or `FALSE` value.  For example, 
  ```
title  <- "Harry Potter and the Chamber of Secrets"
amberAlert <- grepl('amber', title)
print(amberAlert)
  ```
1. **%in% Operator**:  The "%in%" operator is a way of testing if an string element is in a list.  It also generates a `TRUE` or `FALSE` value.  For example:
```
groceries <- c("bread", "orange juice", "chocolate milk", "bananas")
gotMilk <- "milk" %in% groceries
print(gotMilk)
```
 
# Text Mining in R


## tidytext


The idea behind `tidytext` is that a consistent format for data will make processing it much easier.  In the `tidyverse` of R, data is organized into tables where each column is a variable and each row is an observation.  Another way to think about this is that each row is an item on which we have collected information.  That information is stored in the corresponding columns.

If you are working in a Humanities discipline, a table may not be the natural state your data.  You may have a text document or corpora.  But if you think of the documents as a collection of words, you can create tables of information about those words.  

Suppose that you are interested in where the word _dream_ occurs in your document.  For each occurrence of the word, you could identify the chapter, paragraph, and sentence where the word appears.  This information can be organized as a table.  For example:
 
|word | chapter | paragraph |sentence|
|:----|:--------|:----------|:-------|
|dream| 1| 2|3|
|dream|2|7|2|
|dream|5|8|1|

That would be for just one word.  You could expand the table to include all major words in the document. Let's see how we repr.esent a table of data in R.


## The _tibble_ Data Type

Earlier, we talked about how variables can hold different types of information (e.g., numeric values, strings, lists).  Another type of data that a variable can hold is a _tibble_, which is a table format.  The _tibble_ is the data type used most often for _tidytext_ functions.

If you have worked with _dataframes_, either in R or in other languages, then you are already familiar with _tibbles_.  The creators of the _tibble_ data type started with the _dataframe_ type  and made it easier to use.

We can create a _tibble_ by starting with lists of data that would go in the columns of a table and combining the lists with the `tibble` function.  For example, we can create the table shown in the previous section as follows:
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

<font color=blue>---------------------------------------------------------------</font>

### Activity: Create a tibble
* Open the file `01_tibbles.R` in RStudio and source it.
* Notice that the `print` statement will tell us that the data being printed is a `tibble`, along with the size of the tibble and the type of data stored in each column.

<font color=blue>---------------------------------------------------------------</font>

In the next example, we are reading in a file, _MLK_speech.txt_ and creating a tibble with the line numbers and the lines of the speech.
```
library(dplyr, warn.conflicts = FALSE)

filename <- "../Data/MLK_speech.txt"
MLK_speech <- readLines(filename)

num_lines <- length(MLK_speech)
text_table <- tibble(line=1:num_lines, text=MLK_speech)

print(text_table)

```


<font color=blue>---------------------------------------------------------------</font>

### Activity: Create a tibble
* Open the file `02_tibbles_from_text.R` in RStudio and source it.
* Notice that the `print` statement prints only the first 10 rows of the table.  This is by design so that we aren't overwhelmed when viewing the table.
* 
<font color=blue>---------------------------------------------------------------</font>

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
Suppose that for the MLK speech, we want to look at the lines where the word "dream occurs".  We can select those lines with the `filter` function, but we need a way to determine if the substring "dream" occurs in the string. We can use the `grepl` function.  This function is a part of base R.  The format is `grepl(pattern, string` .  It will determine if the pattern is in the given string.
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
   filter(grepl("dream", text))
   
print(dream_table)
```
<font color=blue>---------------------------------------------------------------</font>

### Activity: Filter Text
* Open the file `03_filter_example.R` in RStudio and source it.
* Notice that the result from the `filter` function is another tibble.
* 
<font color=blue>---------------------------------------------------------------</font>
    
###                                                Example of `arrange` Function
If we want to sort a table based on the contents of a specific column, we can use the `arrange` function
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
<font color=blue>---------------------------------------------------------------</font>

### Activity: Arrange Example
* Open the file `04_arrange_example.R` in RStudio and source it.
* Notice that the default for arranging the data is in increasing order, but we can use the `desc` function if we want the results in decreasing order.

<font color=blue>---------------------------------------------------------------</font>

###                                                Example of `select` Function
The `select` function allows us to choose a subset of the columns.
```
library(dplyr)

word <- c("dream", "dream", "dream")
chapter <- c(1, 2, 3)
paragraph <- c(2, 8, 7)
sentence <- c(3, 1, 2)

myTable <- tibble(word = word, 
chapter = chapter, paragraph=paragraph, sentence = sentence)

smallTable <- myTable %>% select(chapter, word)
print(smallTable)

```
<font color=blue>---------------------------------------------------------------</font>

### Activity: Select Example
* Open the file `05_select_example.R` in RStudio and source it.
* Notice that we can list the columns that we want within the `select`function.

<font color=blue>---------------------------------------------------------------</font>
###                                                Example of `mutate` Function
The 'mutate' function is one of the most used because it allows you to perform computations or apply a function to every element in a column and save the results to another column.
```
library(dplyr, warn.conflicts = FALSE)

## Read in text
filename <- "../Data/MLK_speech.txt"
MLK_speech <- readLines(filename)

## Convert to a tibble
num_lines <- length(MLK_speech)
text_table <- tibble(line=1:num_lines, text=MLK_speech)

## Let's count the number of characters in each line.
text_table <- text_table %>%
  mutate(numChar = nchar(text))

print(text_table)
```
<font color=blue>---------------------------------------------------------------</font>

### Activity: Select Example
* Open the file `06_mutate_example.R` in RStudio and source it.
* Can you filter out the lines with no characters?

<font color=blue>---------------------------------------------------------------</font>
###                                                Example of `summarize` Function
The `summarize` function often is used with a statistical function, like `mean`.
```
library(dplyr, warn.conflicts = FALSE)

word <- c("dream", "dream", "dream")
chapter <- c(1, 2, 3)
paragraph <- c(2, 8, 7)
sentence <- c(3, 1, 2)

myTable <- tibble(word = word, chapter = chapter, paragraph=paragraph, sentence = sentence)


myTable <- myTable %>% summarize(mean(paragraph))
print(myTable)

```
<font color=blue>---------------------------------------------------------------</font>

### Activity: Summarize Example
* Open the file `07_summarize_example.R` in RStudio and source it.

<font color=blue>---------------------------------------------------------------</font>

###                                                Example of `group_by` Function
There will be times when we may want to summarize subsets of the data.  We can use the `group_by` function to perform the summarize on groupings within a column, rather than on the entire column.
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
<font color=blue>---------------------------------------------------------------</font>

### Activity: Summarize Example
* Open the file `08_group_by_example.R` in RStudio and source it.

There are two things to notice in the `group_by` example.  
* First, we can chain together the different functions that we want to perform.  In this example, the _tibble_, `myTable`, is fed into the `group_by` function, which adds group information to the _tibble_.  The new _tibble_ is then fed into the `summarize` function.  By chaining together the _tibble_ operations, we can create an efficient workflow for our data.
* The results in `mySummary` are organized by chapters.  When we specified `group_by(chapter)`,  R will add information to the _tibble_ that will specify subset of the data.  Operations, such as `summarize`,  that follow the `group_by` function will be performed on the subsets.

<font color="blue"> __________________________________________________________________________
 </font>

### Activity:  Combining Steps
For the MLK speech, write an R program that will
*  Read in the data file;
*  Convert the text to a `tibble` of lines
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
<font color="blue"> __________________________________________________________________________
 </font>

### Activity:  Using `unnest_tokens`
* Open the file `09_word_tokens.R` in RStudio and source it.
* Notice that the "tokenizer" does two things to help us:

1. It converts all words to lowercase;

2. It strips out all punctuation.

These steps are important for putting the words into a format that we can analyze.


<font color="blue"> __________________________________________________________________________
 </font>
 


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

<font color="blue"> __________________________________________________________________________
 </font>

### Activity:  Using `unnest_tokens`
* Open the file `10_counting_tokens.R` in RStudio and source it.
* What words appear the most frequently?  Do these words help with the meaning of the text?  What can we do about this?


<font color="blue"> __________________________________________________________________________
 </font>
 


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
   
print(word_counts)
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
You can get the above results by opening `11_removing_stopwords.R` and sourcing it.

Notice that the word "applause" appears to be the most frequently-used word. Let's take a closer look at the lines that contain the word "applause". We can use the `filter` function to do this.

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
Looking through the results, you will notice that the word "[applause]" appears as supplemental information -- it is the audience's reaction, not a word in the speech itself.

There may be times, such as this, when we may want to filter out words that are not in the official `stop_words` list.  We can do this by creating our own list of words and filtering those out, too.

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
If you prefer, you can combine your list with the existing list.  For example:
```
myStopWords <- c("applause", stop_words$word)
```
Then, you would only need to filter out one set of stop words.


<font color="blue"> __________________________________________________________________________
 </font>

### Activity:  Creating a Single Stop Word List
* Open the file `12_creating_stopword_lists.R` in RStudio and save it as `12a_stopword_lists.R`.
* Replace the assignment statement for the `myStopWords` variable with the one that combines "applause" with `stop_words$words`.
* Update the `cleaned_words` assignment so that it only filters out the `myStopWords`.
* Source the code -- the results should be the same as when we filtered out both sets of stop words.


<font color="blue"> __________________________________________________________________________
 </font>
 


## Using Stem Words

Suppose we had the sentences:
> As a child, she loved spending time in the garden, but now she loves to sit in a quiet room, reading a book. She is loving the pandemic because it allows her to have that quiet, alone time.

If we split this into words, remove stop words, and count the word frequencies, we would find that the words "loved", "loves", and "loving" are counted as separate words.  But, we know that these three words are various forms of the verb "love".  There may be times when we want the convert words to a root or stem word **before** we perform a word count.

Converting words to stem words can be done with the `wordStem` function in the `SnowballC` package.

```
library(dplyr, warn.conflicts = FALSE)
library(tidytext)
library(SnowballC)

## Set up text & convert to a tibble
myText <- "As a child, she loved spending time in the garden, but now she loves to sit in a quiet room, reading a book. She is loving the pandemic because it allows her to have that quiet, alone time."
text_table <- tibble(text=myText)

## Convert to words & remove stopwords
data(stop_words)
cleaned_words <- text_table %>%
  unnest_tokens(word, text) %>%
  filter(! word %in% stop_words$word) 

## Create a column with the stem words
  stem_words <- cleaned_words %>%
    mutate(stems=wordStem(word))

print(stem_words)

## Count the words, using the stem words
word_counts <- stem_words %>%
  count(stems) 

print(word_counts)
```
<font color="blue"> __________________________________________________________________________
 </font>

### Activity:  Counting Stem Words
* Open the file `13_stemming.R` in RStudio and source it. 
* Modify the code so that the word counts are in decreasing order.


<font color="blue"> __________________________________________________________________________
 </font>


### Activity:  Putting it all together
* Write an R program that will read in the file `emma_chapter_one.txt`.
* Preprocess the text by converting to a list of stem words with stop words eliminated.
* Determine the word counts of the stem words and print them to the console.
* Create a word cloud of the stem words.


<font color="blue"> __________________________________________________________________________
 </font>
 


### Activity:  Challenge
* Write an R program that will read in the documents: `emma_chapter_one.txt`, `MLK_speech.txt`, and `The_Raven.txt`.
* Create a tibble where a column, named text, is the list of the three texts.  (Hint:  Create a list where each text is an element.  Then, use the list to define a column in the tibble.)
* Preprocess the text by converting to a list of stem words with stop words eliminated.  (Hint:  This will require more than one function to accomplish. )
* Determine the word counts of the stem words and print them to the console.
* Create a word cloud of the stem words.

<font color="blue"> __________________________________________________________________________
 </font>
 