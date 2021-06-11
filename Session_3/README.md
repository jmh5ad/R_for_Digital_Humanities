#  Introduction to R Programming 

**Description:** This section provides more functions for text mining and continues with some basic R syntax.
 
*  Sentiment Analysis,
*  Software Controls
  *  conditional (if) statements
  *  for loops
  *  while loops
* Programmer-defined Functions


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

<font color=blue>---------------------------------------------------------------</font>

### Activity: Sentiment of a Sentence
* Open the file `01_sentiment_example.R` in RStudio and source it.
* Modify the sentence to "I really hate scary movies" and apply the sentiment function.  Are the results what you would expect?

<font color=blue>---------------------------------------------------------------</font>

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

# Software Controls

The power behind programming is writing code that will make decisions for us. 

For example. suppose we have written a program that will read in a text file and perform simple analysis on the text.  Except, we have a problem -- unbeknownst to us, the latest text file is empty. We are getting all sorts of strange results with our text analysis.

Wouldn't it have been great if the code could have checked to see that the file was empty before it attempted to do the analysis? This type of control is what we want in our code.

Using software controls, or _control of flow_, is how we build into our program features for making decisions. Common types of control are
* Having the program choose between two or more blocks of statements to execute, depending on conditions of the data; or
* Having the program repeat a block of statements for a specified number of times or while a condition exists in the data.
* 
 
Two structures that allow the control of flow are _conditional statements_ and _loops_. In both structures, we will need to tell the computer what **conditions** are necessary for the code to do its job.

## Conditional Statements

A conditional statement gives the computer the ability to **decide** on a course of action. It also is called a _selection_ or _branch_ statement.
The overall format in R is as follows:

```
if (condition_1){
   statements to perform if condition_1 is true
} else if (condition_2){
   statements to perform if condition_1 is false and condition_2 is true
} else {
   statements to perform if condition_1 and condition_2 are false
} 

```
Both the `else if` block and the `else` block are optional.  
Furthermore, you can have as many `else if` blocks as you need to cover all conditions, but there can be only one `else` block.

<font color=blue>---------------------------------------------------------------</font>

#### Simple *if* example

We may decide that we want the code to perform an action only under one condition:
```
if (temperature > 101.0){
  print("Go to the doctor now!!")
}
   
```
Assuming that the variable `temperature` has a value assigned to it, the computer will determine if the condition is TRUE (i.e., `temperature` is greater than 101.0) or FALSE (i.e., `temperature` is not greater than 101.0). If the condition is true, it will perform the print statement.  If the condition is false,  it will jump over the print statement and continue with any subsequent lines of code.

<font color=blue>---------------------------------------------------------------</font>
#### Simple *if/else* Example
If we want to perform an action if the condition is false, we can use a simple if/else statement.
 
```
if (temperature > 101.0){
  print("Go to the doctor now!!")
} else {
  print("You'll be fine.  Just drink lots of OJ.")
}
   

```
Again, assuming that the variable `temperature` has a value assigned to it, the computer will determine if the statement is TRUE (i.e., `temperature` is greater than 101.0) or FALSE (i.e., `temperature` is not greater than 101.0). Then, it will choose the appropriate print statement to execute.  

<font color=blue>---------------------------------------------------------------</font>

#### Multiple Conditions Example:

Finally, we may want to check for multiple conditions and perform different actions depending on the actual condition.

```
if (temperature > 101.0){
  print("Go to the doctor now!!")
} else if (temperature > 98.7) {
  print("You'll be fine.  Just drink lots of OJ.")
} else if (temperature > 97.2) {
  print("You're normal.")
} else {
  print("I think we need a new thermometer!")
} 

print("That's all I have to say.")
```

In this case, `temperature` is compared with 101.0.  If it is true, the first print statement is performed and the rest of the `else if` and `else` statements are skipped.  If `temperature` is not greater than 101.0, the computer will check the next condition `temperature > 98.7`.  If this condition is true, it will print the `You'll be fine . . .` message.  If the condition is false, it will move onto the next condition.

In general, the computer performs the statement(s) associated with the first true condition.  If all conditions are false and an `else` statement is present, it will perform the `else` statement.

#### Important features to notice:
   - There are parentheses `( )` around each condition;
   - The braces `{ }` enclosing the blocks of statements are optional only if a single statement is listed;
   - The `else` statement does not have a condition attached to it;
 
## Relational Operators

The `condition` in our examples is the comparison of `temperature` with a numeric value. The greater-than sign ( > ) is called a **relational operator**.

A list of the relational operators includes:

|Operation | Symbol |
|---       |---     |
|Greater than | > |
|Less than |  <   |
|Greater than or equal to | >= |
|Less than or equal to    | <= |
|Equal to                 | == |
|Not equal to             | != |





To write good conditions in your code, you must understand the relational operators that are available.  For example, the opposite of `>` is `<=`.  So, we could have written our simple if/else example as follows:
```
if (temperature <= 101.0) {
  print("You'll be fine.  Just drink lots of OJ.")
} else {
  print("Go to the doctor now!!")
}
```
<font color=blue>---------------------------------------------------------------</font>

### Activity:  Creating a Simple If/Else Statement

Write a small program that will 
 - Read the file "emma_chapter_one.txt" into a variable called `text`
 - if the length of the contents of `text` is greater than zero, have it perform some text analysis; otherwise, have it write a message saying that the file is empty. 

<font color=blue>---------------------------------------------------------------</font>

### Activity:  Creating a Simple If/Else Statement

Write a small program that will 
 - Prompt the user to type in a description of the weather (e.g., rainy, sunny)
 - if the description is "rainy", print to the console an apology; if it is "snowing", print to the console a message that school is out; otherwise, print to the console a cheery message
 

    
<font color=blue>---------------------------------------------------------------</font>
## Logical Operators:  &&, ||, !


There may be times when we want to combine more than one condition, or we want to negate a condition.  The keywords `&&` for "and" , `||` for "or" , and `!` for "not" are available to use in our condition statements.


The `&&` requires that both conditions exist; the `||` requires that at least one condition exists.
```
## Read in text
filename <- "../Data/emma_chapter_one.txt"
text <- paste(readLines(filename), collapse=' ')

## Check for keywords
if ( grepl("young", text) && ! grepl("old", text) ){
  print("The text deals with youth" )
}

if ( grepl('live', text) || grepl('die', text) ){
  print("The text deals with life.")
}

if ( grepl('old', text) && grepl('die', text) ){
  print("The text deals with death.")
}
```
<font color=blue>---------------------------------------------------------------</font>

### Activity: Checking for Multiple Conditions
Write a small program that will 
- Read in the excerpt from _Emma_:  "austin_emma_excerpt.txt";
- Have the program determine if the excerpt contains all of the words "mother", "father", "sister", and "brother".
    - If all of these terms are in the text, print a message that the text is family-oriented.
    - If it does not contain all of the words, check to see if it missing the male members of the family:  "father" and "brother".  If it is missing both of these terms, print a message that the text is female-oriented.
     - Otherwise, print a message that the text is mostly family-oriented

<font color=blue>---------------------------------------------------------------</font>

## Loops

Loops allow the program to repeat a block of code for a specified number of times or until a certain condition exists.

###  For Loops

Normally, a for-loop will step through a list or sequence -- that is, a collection of items.  In R, the general syntax of a for-loop is as follows:

```
for (item in list){
    statement(s) that will be performed
}
 ```

For this syntax, `item` is the _loop variable_ and `item in list` is the _loop specification_.  The loop specification tells how the loop variable will take on new values for each iteration of the loop.  That is, for each time through the loop, the loop variable will be assigned one of the elements of the list.    

For example:
```
for (n in 1:5){
  cat("\nValue: ", n, "    Twice Value:  ", 2*n)
}
```
In this example, the loop specification tells us that the variable `n` will be assigned each of the values 1 - 5, one at a time.   It basically starts with the first value, 1,  performs the block of code, and loops back up to the loop specification, where it is assigned the next value in the list.  When it is assigned the value 5, it will perform the block of code and move on to any other lines of code that follow the for-loop.

The loop variable can be used to count the number of times that a task is done; or, it can be an element that we want to process.  For example:

```
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
```

Again, the loop specification tells us that the variable `document` will be assigned each of the titles in the list `my_docs`.  It will perform the block of code for each of those titles.
 
 #### Important features to notice:
   - There are parentheses `( )` around the loop specification;
   - If there is only one statement included in the loop block, the braces `{ }` are optional;
   - The indentation is for human readability.
 
<font color=blue>---------------------------------------------------------------</font>
### Activity: Getting a Count of Words in an Excerpt
Design an R program that will count the numbers of occurrences of the words
_she_ ,
_young_ ,
_was_ ,
_had_
in the Emma excerpt.

Hint:  Create a list of the words of interest, loop through the list, and print the word and its count to the screen.



<font color=blue>---------------------------------------------------------------</font>

### While Loops

The `for` loop allows us to go through a list of items or to specify the number of times the loop is performed.  Suppose we do not have a list or do not know how many times we want to loop.  Suppose we want to continue until we reach a certain condition.  We have a `while` loop to handle these situations.

The general syntax for the `while`loop is

```
while (condition){
   statement(s) to run if condition is true
 }
```

With this syntax, the program will check if the `condition` is true or false.  If it is true, it will perform the statements in the while block.  It then loops back up and re-checks the `condition`.  As long as the `condition` is true, the code will continue to rerun the statement(s).  The loop stops running only when the `condition` is false.

*******************

<font  color=red>

    
WARNING:  You must ensure that the statement(s) modify a variable so that the condition has the chance to become false.  If not, you have an **Infinite loop**.

*******************
</font>

```
library(tidytext)

## Read in the text
filename <- '../Data/austen-emma-excerpt.txt'
raw_text <- readLines(filename)
words_table <- tibble(text=raw_text) %>% unnest_tokens(words, text)


## Loop trough the positions and find where the keyword occurs
keyword <- "mother"
index <- 1
while (words_table$words[index] != keyword){
  index <- index + 1
}

## Display the results
cat("\nThe word", keyword, "first occurs at position", 
index, "in the list of words.")
```

This example was actually a bit dangerous -- what if the word 'mother' was not in our excerpt.  The code would have been stuck in the loop.

We can add another condition to the loop to handle that situation.

```
N <- length(words_table$words)
while(index <= N && words_table$words[index] != keyword){
  . . .
}
```
<font color=blue>---------------------------------------------------------------</font>

### Activity: Adding a Second Condition to the While loop

Modify the previous example so that it checks if `index` is less than `N` (the total number of words) as part of the while condition.

Notice that we have two possibilities for ending the loop -- either the word was found or the loop reached the end of the word list.  

After the loop, add a check to see which situation occurred.  If the loop reached the end of the word list, print that the word was not found; otherwise, print the statement that says where the word occurred.

<font color=blue>---------------------------------------------------------------</font>

## Creating our own Functions
We have seen functions that are included in base R or are part of packages that extend the R capabilities.  We now want to look at how to create our own functions.

There are two primary uses of functions:
 - When we want to break down a large program into smaller, easier to manage pieces; and
 - When we have a group of statements that we need to reuse throughout a program.
 


`

You will find that dividing a long program into functions will make it easier to maintain.
So, let's look at the syntax for writing a function.

## Function Syntax

The format or syntax for writing a function in R is 
```
function_name <- function(parameters){
    statement(s) to execute
   return(result)
}
```

The `parameters` are the pieces of information that are passed into the function.  The function needs that information to do its job.  If you want to return a value or result from the function, you include it in a `return` statement. 

An example of a function is as follows:
```
min_of_3 <- function(a, b, c) {
  if (a < b && a < c){
    the_min = paste("The first grade", a,"is the lowest.")
  } else if (b < c){
    the_min = paste("The second grade", b, "is the lowest.")
  } else{
    the_min <- paste("The third grade", c, "is the lowest.")
  }
  
  return(the_min)
}

```
This code snippet is a "definition" of a function.  It does not do anything until it is called. We call it by using the name of the function and any parameters that it needs. However, the function must be defined in the code before it can be called.  For this reason, we traditionally place all of our function definitions at the top of our file and the "main" code at the end.

``` 
##---------------Function Definitions ----------------------
min_of_3 <- function(a, b, c) {
  if (a < b && a < c){
    the_min = paste("The first grade", a,"is the lowest.")
  } else if (b < c){
    the_min = paste("The second grade", b, "is the lowest.")
  } else{
    the_min <- paste("The third grade", c, "is the lowest.")
  }
  
  return(the_min)
}

##--------------- Main Code ----------------------

grade_1 = 15/17
grade_2 = 30/35
grade_3 = 85/100

print(min_of_3(grade_1, grade_2, grade_3))
```

<font color=blue>---------------------------------------------------------------</font>

### Activity: Creating a search function

In the previous activity, we look at code to find the first location of a keyword in our text.  
* Modify that example so that a "search" function is defined that will take as input parameters the raw_text and the keyword, and will return the position of the keyword or "NA" if the word is not in the text.
* Test the function using the text from _austen-emma-excerpt.txt_ and the keyword _mother_.  Then test with other keywords.  Make sure that you include one that is not in the excerpt.

<font color=blue>---------------------------------------------------------------</font>