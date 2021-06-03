 ## Thoughts on Programming




### Programming in General

Programming is like creating a recipe -- you start with a list of ingredients (data) and give the computer a list of instructions, telling it exactly what to do with the ingredients. Each step must be clear, precise, and lead to the final product.  

But, instead of a delicious cake or pie as the outcome, the product will be a solution to a problem or, maybe, a set of results that you can interpret later.  A program, like a recipe, should produce the same output when given the same ingredients and instructions.


Computers are very limited in what they can understand. Your set of instructions must be written in a language that the computer can follow. For this workshop, that language will be R.

### R as a Programming Language

As a language, R has a syntax and a grammar. Unlike most natural languages, it has very strict rules for following the syntax. The strict rules  ensure that we are precise in telling the computer what to do.

Learning R means that you must learn

i) the rules of the language, and 

ii) how to translate your thoughts (i.e., instructions for what needs to be done) into that language. 

This second step takes lots of practice. You may not get the instructions right on the first try (or even the second or third try).  But, you will get better with practice.

### Logic and Testing

R is an **interpretive** language. The computer will interpret each statement, and follow the instructions required by that statement, before moving on to the next statement.  So, the set of instructions must have a logical flow.  For example, the computer cannot analyze data until it reads in the data.

We also must ensure that the instructions are correct. If we intend to add two number but give the instruction to multiply the two the two numbers, we are giving an incorrect instruction.  The computer will perform the operation even if it is not what you intended.

We can verify the logic and correctness of our instructions by testing the code as we write it.  It helps to start with an outline of the tasks that you want to computer to do. Then, you type the code for each task, you can test it with simple inputs -- values for which we can know what the outcomes should be.  

Testing our code in this manner gives us more confidence that the code works correctly, but for any program of significant length, we cannot guarantee that our code will work 100% of the time.


 

The beauty of programming is that once you have a tested set of instructions, you can reproduce the work that it has done. As you know, **reproducibility** is important for publications.  But more importantly, if your program is written to work on a general set of data (instead of a specific set), then it is also **repeatable**.

Writing a program that is **generalized** will require more thought as you are designing your program, but it will save you time and effort if you can reuse the code for different sets of data.





---
## Variables & Statements
 


### Variables and Assignment Statements

The starting point in any programming language is the **variable**.  Variables are used to store information, including:

* Data
* Results from computations
* Words, Phrases, Sentences, Documents (inside either single or double quotes)
* Images
* Other

Technically, a variable represents a *_memory location_* in the computer, but we can think of it as a label for the data or information that we are using in our program.

Variables are created by *_assigning a value_* to them:

```
   count <- 12
   
   x <- 3.14159
   
   ans <- "You are correct!"
   
   area <- len * wid
   
   size <- size + 2



```

An assignment statement has the form:

```variable <- expression```
    
The `variable` should be on the left-hand-side, followed by the assignment symbol `<-`.  This symbol is a "greater than" sign and a dash, with no spaces between them.  
The `expression` can be a numeric value, a string, an algebraic expression, etc.  We will see many more examples of expressions later.

<font color=blue>---------------------------------------------------------------</font>


#### Variable Names

As the writer of your program, you may choose the names of your variables.  They should be descriptive of the information stored in them (e.g., if the variable hold the name of a file, you could call it filename).

There are a few restrictions for naming variables:


* Variable names may be combinations of letters, underscores, and dots.

* Variable names may begin with a letter or underscore, but **never** a number.

*  Variables names may not contain spaces.

*  Variables names should not be _reserved_ words (i.e., word that are used in the R language, such as "if" and "for").

*  Variables are case sensitive (e.g., myVariable is not the same as Myvariable or MyVariable)




**NOTE**:  It is important to watch out for typos in variable names.  Typos can make the difference between correct code and code with serious problems.

<font color=blue>---------------------------------------------------------------</font>



#### A Closer Look at Assignment Statements

Let's look at the assignment statement:
```
area <- len * wid

```

Before the computer can perform this assignment, the variables `len` and `wid` must have values assigned to them.  So, a better example for that would include the three assignment statements, as shown below:

```
len <- 5
wid <- 4
area <- len * wid

print(area)
```

I also included a `print` statement so that we could see the value stored in the variable `area`.


<font color=blue>---------------------------------------------------------------</font>

### Activity:  Your First R Program
* Start up RStudio and open the file `01_first_program.R`.    
* Click on the "Source" label in the menu bar to run the code to run the code.  Are the results what you expected?
* Follow the instruction to create more lines of code within the program.

<font color=blue>---------------------------------------------------------------</font>

Let's take a closer look at the assignment statement:
```
size <- size + 2
```

To perform this statement, the computer will start with the right-hand-side.  It will go to the memory location labeled "size" and get a copy of the value stored in that location.  It then will add 2 to that value.  The resulting value will then be placed back in the memory location labeled "size".  The original value that was in "size" will be overwritten with the new value.

Again, before this statement can be performed, the variable `size` must have a value assigned to it.

```{r}
size <- 3
size <- size + 2

print(size)
```

For basic R programming, this will be the general workflow:  the computer will start with the expression on the right-hand-side of the assignment symbol, perform any needed operations, and save the result to the variable on the left-hand-side of the variable.



<font color=blue>---------------------------------------------------------------</font>

### Activity:  Assigning Values to Variables

Read through the following snippet of code. Try to figure out what values will be printed to the screen.

  Then, in RStudio, open the file `02_assignments.R` and run the program (by clicking of the `Source` label).  Were your guesses correct?
```
size <- 5
print(size)

size <- 2*size
print(size)

size <- size + 11
print(size)

size <- size/7
print(size)

size <- size^2
print(size)
```
What happens to the value stored in the variable `size` each time that there is an assignment statement?

Note:  This program also shows the arithmetic operations that R can perform:
* Addition: +
* Subtraction: -
* Multiplication: *
* Division: /
* Powers: ^

<font color=blue>---------------------------------------------------------------</font>

#### Lists

A variable can hold a list of items.  For example, 

```

groceries <- c("milk", "bread", "bananas")
print(groceries)

```
Results:
```
[1] "milk"    "bread"   "bananas"
```
As you may have noticed in the first statement, the items are enclosed in parentheses, with the letter "c" before the open parenthesis.  The "c" stands for "combine".  In this statement, the computer will create the list of items, and save the list to the variable on the left-hand-side of the assignment symbol.

Observing the results from the `print` statement, we see that the combine command keeps the items as individual strings, rather than combining them as a single string.

In each of the statements below, the variable `x` is assigned a list of values.  Run each of the commands and print `x` to see what it holds.

<font color=blue>---------------------------------------------------------------</font>

### Activity:  Creating Various Lists

* In RStudio, open the file `03_creating_lists.R` and click on the `Source` label
```
x <- 5:13
print(x)

x <- seq(1, 20, by=2)
print(x)

x <- rep(7, 3)
print(x)

x <- c(1, "abc", 3.14159)
print(x)

```
Describe in words what is happening in each statement.

+ Notice that we have a variety of ways of creating a list of numbers.  
+ Even more interesting is that we can mix "types" in a list.  That is, we can have any combination of integers, strings, and decimal numbers.

### Vector Operations

When a variable is a list of numeric values, we can use the list in a mathematical formula: 

```
x <- 1:5
y <- 2*x

print(x)
print(y)
```

Applying mathematical operations to lists of numbers (also called vectors) is called _**vectorization**_.  It is a very powerful tool for performing analytics on data.

<font color=blue>---------------------------------------------------------------</font>

### Activity:  Vectorizations Example

* In RStudio, open the file `04_vectorizations.R` and click on the `Source` label.
* Read and follow the instructions in the commented section of the program.

<font color=blue>---------------------------------------------------------------</font>

## Input & Output


Programs would not be very useful if they could not share their results with the user or if they did not allow users to provide different inputs.

#### Output

You may have noticed in the previous examples that we used `print()` to display the contents of our variables.  The `print()` statement also can be used to display a string:
```{r}
print("Hello everybody.  I hope you are doing well today!")
```

One drawback of R is that the print statement can only work with one object (e.g., a variable or a string).  If you want to print more than one piece of information, you will need to use `paste()` or `paste0()` to combine the information before printing.  (The `paste()` command automatically separates the pasted elements with a space; whereas, the `paste0()`command does not included any separator.)

<font color=blue>---------------------------------------------------------------</font>

### Activity:  Pasting Output

* Reopen the file `01_first_program.R` and replace the `print(area)` statement with  
```
print(paste("The area of the rectangle is", area))
```
<font color=blue>---------------------------------------------------------------</font>

Another way to have the program print results is to use the `cat()` command.  The `cat()` command automatically converts the objects to characters and concatenates them into a single string.

```
len <- 5
wid <- 4
area <- len * wid

cat("The area of the rectangle is", area)
```
<font color=blue>---------------------------------------------------------------</font>

### Activity:  Using `cat` for Output

* Reopen the file `01_first_program.R` and replace the `print` statement with  
```
cat("The area of the rectangle is", area)
```

<font color=blue>---------------------------------------------------------------</font>

There is one more (somewhat fancier) way to print results.  This technique uses the `sprintf()` command, which allows you to create a string with placeholders for the variables.  In general, the placeholders are a percent sign (`%`)  followed by a letter describing the type of information that will go into the placeholder.  The most commonly-used placeholders are 
* `%d` for integers (digits);
* `%s` for strings;
* `%f`for floating point numbers (numbers with decimals).

The actual items to fill in the placeholders will follow the string.  The order of the items will matter.  The first item will be put in for the first placeholder; the second item for the second placeholder, and so on.
```
len <- 5
wid <- 4
area <- len * wid

cat(sprintf("The area of the rectangle with length, %d, and width, %d, is %d.", len, wid, area))
```

Again, the `%d` is a generic placeholder for values that are integers only (i.e., no decimal places).  If you have a number with a decimal place, you would `%f` as the placeholder.  For strings, you would use `%s` as the placeholder.

<font color=blue>---------------------------------------------------------------</font>

### Activity:  Using `sprintf` for Formatting Output
The following code is in the file `05_sprintf.R`
```
Name <- "Louie LeChat"
weight <- 9.65
age <- 8

cat(sprintf("Hello, my name is %s. I am %d years old and weigh %f pounds", 
        Name, age, weight))

```
* Open RStudio and run the code.
* Follow the instructions in the comment block of the code to vary the output.

<font color=blue>---------------------------------------------------------------</font>


#### Reading a Text File

Before you can read a text file into your R program, you must know what format the file is in.  Is it a plain text file or is it in a special format like XML or JSON?  Is the text file organized by lines of text or is it in a table format?  You should know the format of the file before you try reading it into your program.

For now, we are going to look at reading in plain text files.

##### Reading an unformatted text file
I have a file, _austen-emma-excerpt.txt_(in the _Data_ folder) that contains the first paragraph of the book _Emma_ by Jane Austen.  We can load the text into R's memory by using the _readLines_ command:

```
filename = "../Data/austen-emma-excerpt.txt"
raw_text <- readLines(filename)
print(raw_text)

```

First, notice that the filename contains the "relative" path to get to the file.  The "../Data/" tells the program to go up to the parent folder and then into the "Data" folder.

The `readLines` command will "read in" or "pull in" the text as separate lines and will save the lines as a list in the variable `raw_text`.  

If we prefer to have the text as a single string, we will need to use the `paste` command to concatenate the lines.

```{r}
raw_text <- paste(readLines("austen_emma_excerpt.txt"), collapse="\n")
print(raw_text)
```

The `\n` in the paste command is a formatting character that indicates where new lines will start.
If you want to view the text without the `\n` character visible, you can use the `cat` command rather than the `print` command:
```{r}
cat(raw_text)
```

<font color=blue>---------------------------------------------------------------</font>
### Activity:  Reading a Plain Text File
* In RStudio, open the file `06_read_text.R` and source it.
* Follow the instructions to create a single string for the text.
* Use the `cat` command to display the results.



<font color=blue>---------------------------------------------------------------</font>

### Activity:  Reading different formats

* In RStudio, open the file `07_read_csv.R` and source it.
* The file reads data from a web site and the data does not include a header.  Try to write additional lines of code that will read the file "../Data/Books.csv". This file a comma-delimited table with columns for title, author, genre, etc.  It does have a header in the file.
```

url_path <- "https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data"
data <- read.csv(url_path, header=FALSE)

print(head(data))
```


<font color=blue>---------------------------------------------------------------</font>

There are other commands for reading formats, like XML, JSON, PDF.  Before we can explore these commands, we need to learn a little bit more about functions and packages in R.

## Functions & Packages

In the previous section, we talked about "commands" that allowed us to read in text (`readLines` and `read.csv`) or display it to the console (`print`, `cat`).  These commands are actually _**functions**_ in R.

A function, in any programming language, is a list of instructions that will perform a very specific task.  With functions, such as `readLines` and `print`, someone has written the code and made it available for us to use. Certain functions are so commonly used (like `print`) that they are included as a part of the R programming language (also called "base R").

### Function Syntax

To invoke or call a function, you simply type the function name, followed by parentheses.  If the function needs additional information to do its job, we provide that information inside the parentheses.  

Let's take a closer look at the `print` function:

```
print("Hello World!")
```

In this example, "print" is the name of the function.  It needs one critical piece of information to do its job -- the item to be printed.  That information is included inside the set of parentheses.  

If a function needs more than one piece of information, it will accept the information as a comma-separated list.  We saw this with the `cat` function.

```
area <- 25
cat("The area of the rectangle is", area)
```
### Function Output

Functions like `print` and `cat` perform an action -- namely, writing information to the console.  Other functions may compute or read in values that we would like returned from the function.  If a function produces an *_output_*, then we need to ensure that the output is assigned to a variable. 
 
We saw a function that returns an output when we read a text file:
```
raw_text <- readLines("austen_emma_excerpt.txt")
```
In this example, the function name is "readLines".  The input that it needs is the name of the file "austen_emma_excerpt.txt", and the output of the function (i.e., the text that was read) is assigned to the variable "raw_text".

<font color=blue>---------------------------------------------------------------</font>

### Activity: Basic Functions
There are many, many functions available in R.  Try the following examples (in `08_basic_functions.R`) to see if you can determine what the various functions do:

```
x <- sqrt(25.0)
print(x)

upper_case_text <- toupper("Beware")
print(upper_case_text)

num <- nchar("Harry Potter and the Chamber of Secrets")
print(num)

mySubstring <- substring("Four score and seven years ago", 6, 11)
print(mySubstring)

```

### Packages

In addition to functions that are included as part of base R, there are collections of functions that programmers have created and put into repositories for use by the general public. These collections are called **_packages_**.

Packages are used to "extend" the R programming language by providing functions and even data related to specific tasks. CRAN (the Comprehensive R Archive Network) is a repository where well-tested packages are stored. Currently there are over 17,500 packages in the CRAN repository.

So, how do you find functions that you need to accomplish a specific task?  You can search through the web site 
https://cran.r-project.org/web/views/, which is organized by overarching categories.  However, you may find that searching the internet for a specific task is easier. 

For example, suppose that I have a file in a JSON format.  How could I read in that file?  My first step would be to search the internet for keywords, such as "R programming, read JSON file".  Notice that it is important to include "R programming" or "R package" in the search.  Otherwise, you may get very strange results.

**Note:  This information is provided if you are running R/RStudio on your laptop or desktop**
Continuing with the JSON example, the first couple of hits that I received mention install the "rjson" package.  Just as we had to install R on our computers, we will need to install any packages that we want to use.  If the package is available through the CRAN repository, we can install it simply by typing 
```
install.packages("packageName")
```
in the Console pane of RStudio.  Of course, we would replace "packageName" with the actual name of the package, but we will need to keep the quotes around the package name.

Depending on the size and number of dependencies of the package, it can take anywhere between a few seconds and close to an hour for a package to install.  Fortunately, we only need to install packages once on our computer
**End Note**
<font color=blue>---------------------------------------------------------------</font>

### The `library` Function
Installing packages will simply place the codes associated with the package on our computer.  If we want to use a function from a package, we have two possible techniques for calling the function:
* We could include the package name, followed by two colons, as part of the function name.  For example, if we wanted to use the `str_count` function in the `stringr` package, we could type 
`stringr::str_count()`.  Every time we would want to use a function from `stringr`, we would have to prepend `stringr::` to the function name.
```
filename <- "../Data/austen-emma-excerpt.txt"
raw_text <- paste(readLines(filename),  collapse="\n")

count <- stringr::str_count(raw_text, "Emma")
print(count)
```

* A "cleaner" approach would be to load the package by using the `library` function.  This will load all of the functions within a package into memory, so that the functions can be used without prepending the package name.  Traditionally, all `library` functions are placed at the beginning of the code.

```
library(stringr)

filename <- "../Data/austen-emma-excerpt.txt"
raw_text <- paste(readLines(filename),  collapse="\n"

print(str_count(raw_text, "Emma"))
```
## Word Cloud
Now that we know about packages, we can install and load some interesting packages, such as `wordcloud`.  The `wordcloud` package takes a text and displays the words in different sizes to show the frequency of the words.  The larger the word, the more frequently it appears in the text.

For example:
```
library(wordcloud)
options(warn=-1)

filename <- "../Data/emma_chapter_one.txt"
raw_text <- paste(readLines(filename), collapse=" ")


wordcloud(raw_text, scale=c(2, .5),
          random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))
```
With the `wordcloud` function, I am passing in the `raw_text`, as well as information that helps with the display.
* `scale` gives the range of sizes of the words;
* `random.order` determines whether words are chosen randomly or whether the most frequently used words are chosen first;
* `rot.per` gives the percentage of words that are rotated 90 degrees;
* `color` provides the color palette used for words with different sizes. 

<font color=blue>---------------------------------------------------------------</font>

### Activity: Word Cloud

* Load the file `09_wordcloud.R` into RStudio and source it.
* Rerun the example two or three times.  The cloud will change because it is randomly choosing the placement and orientation of the words.
* Change the filename to "../Data/The_Raven.txt" and resource it.  The cloud should look very different now.

<font color=blue>---------------------------------------------------------------</font>

## The `tm` package
When working with text data, there are several steps that are standard for preparing the data for text analysis.  These steps include:
* Converting text to lower case;
* Removing extra white space;
* Removing numbers;
* Removing punctuation;
* Removing commonly-occurring words;
* Reducing words to a root form.

There is a base function in R, `tolower()`, that will convert the text to lower case, but the rest of these tasks can be performed with functions from the `tm` package.
```
library(tm)

filename <- "../Data/austen-emma-excerpt.txt"
raw_text <- paste(readLines(filename), collapse=" ")

## Cleaning Text
text <- tolower(raw_text)
text <- stripWhitespace(text)
text <- removeNumbers(text)
text <- removePunctuation(text)

```
Let's look at the counts of the remaining words by splitting the words on spaces using the `strsplit` function and displaying a summary by using the `table` function.
```
words <- unlist(strsplit(text, ' '))
wordSummary <- table(words)
print(wordSummary)
```
<font color=blue>---------------------------------------------------------------</font>

### Activity: Word Counts

* Open `10_word_counts.R` in RStudio and source the file.

<font color=blue>---------------------------------------------------------------</font>


You may notice that there are words in the text, like _the_ and _and_ that do not contribute to the overall meaning of the text. 

We can remove these words with the "stopwords" provided by the `tm` package.  We also can specify that we want to use the stopwords for the English language.  

However, when a word is removed, the white space on either side of the word will remain.  But, we can clean that up by using the `stripWhitespace` function.

```
text <- removeWords(text, stopwords("english"))
text <- stripWhitespace(text)

words <- unlist(strsplit(text, ' '))
print(table(words))
```
Now when we look at the table of words, we see a more meaningful list of words.

<font color=blue>---------------------------------------------------------------</font>

### Activity: Stop Word

* Open `11_stop_words.R` in RStudio and source the file.
* Replace the filename with "../Data/The_Raven.txt" and re-source the file.   

<font color=blue>---------------------------------------------------------------</font>
