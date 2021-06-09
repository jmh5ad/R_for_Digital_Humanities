#  Introduction to R Programming 

**Description:** This section gives a general overview of text mining using `tidytext` functions.  The grammar and syntax of the `tidy` functions in R are quite different.  :
*  Variables & Assignment Statements,
*  Variables that Hold Lists & Vectors,
*  Reading Text files and Writing Output to the Console,
*  Existing Functions, 
*  Creating word clouds, 
*  Cleaning Text.

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
 
# Sentiment Analysis in R
Before we start this section, there are two items that you will need to see.


 as follows:
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
text_table <- tibble(line=1:num_lines, ext=MLK_speech)

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

myTable <- tibble(word = word, chapter = 