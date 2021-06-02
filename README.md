 ## Thoughts on Programming




### Programming in General

Programming is like creating a recipe -- you start with a list of ingredients (data) and give the computer a list of instructions, telling it exactly what to do with the ingredients. Each step must be clear, precise, and lead to the final product.  

But, instead of a delicious cake or pie as the outcome, the product will be a solution to a problem or, maybe, a set of results that you can interpret later.  A program, like a recipe, should produce the same output when given the same ingredients and instructions.


Computers are very limited in what they can understand. Your set of instructions must be written in a language that the computer can follow. For this workshop, that language will be R.

### R as a Programming Language

As a language, R has a syntax and a grammar. Unlike most natural lnaguages, it has very strict rules for following the syntax. The strict rules  ensure that we are precise in telling the computer what to do.

Learning R means that you must learn

i) the rules of the language, and 

ii) how to translate your thoughts (i.e., instuctions for what needs to be done) into that language. 

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




**NOTE**:  It is important to watch out for typos in variable names.  Typos can make the difference betweeen correct code and code with serious problems.

<font color=blue>---------------------------------------------------------------</font>


  


#### A Closer Look as Assignment Statements

Let's look at the assignment statement:
```
area <- len * wid

```

Before the computer can perform this assignment, the variables `len` and `wid` must have values assigned to them.  So, a better example for that would include the three assignment statements, as shown below:

```{r}
len <- 5
wid <- 4
area <- len * wid

print(area)
```

I also include a `print` statement so that we could see the value stored in the variable `area`.

Next, consider the statement:

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

Then, bring up RStudio, type in and run the code.  Were your guesses correct?
```
size <- 5
print(size)

size <- 2*size
print(size)

size <- size + 11
print(size)

size <- size/7
print(size)
```
What happens to the value stored in the variable `size` each time that there is an assignment statement?

<font color=blue>---------------------------------------------------------------</font>

#### Lists

A variable can hold a list of items.  For example, 

```{r}

groceries <- c("milk", "bread", "bananas")
print(groceries)

```

As you may have noticed in the first statement, the items are enclosed in parentheses, with the letter "c" before the open parenthesis.  The "c" stands for "combine".  In this statement, the computer will create the list of items,  specified inside the parentheses, and save the list to the variable on the left-hand-side of the assignment symbol.

Observing the results from the print statment, we see that the combine command keeps the items as individual strings, rather than combining them as a single string.

In each of the statements below, the variable `x` is assigned a list of values.  Run each of the commands and print `x` to see what it holds.

```
x <- 5:13

x <- seq(1, 20, by=2)

x <- rep(7, 3)

x <- c(1, "abc", 3.14159)

```
Describe in words what is happening in each statement.


### Vector Operations

When a variable is a list of numeric values, we can use the list in a mathematical formula: 

```{r}
x <- 1:5
y <- 2*x

print(x)
print(y)
```

Applying mathematical operations to lists of numbers (also called vectors) is called _**vectorization**_.  It is a very powerful tool for performing analytics on data.




---
## Input & Output



### Input/Output

Programs would not be very useful if they could not share their results with the user or if they did not allow users to provide different inputs.

#### Output

You may have noticed in the previous examples that we used `print()` to display the contents of our variables.  The `print()` statement also can be used to display a string:
```{r}
print("Hello everybody.  I hope you are doing well today!")
```

One drawback of R is that the print statement can only work with one object (e.g., a variable or a string).  If you want to print more than one piece of information, you will need to use `paste()` or `paste0()` to combine the information before printing.

```{r}
len <- 5
wid <- 4
area <- len * wid

print(paste("The area of the rectangle is", area))
```

Another way to have the program print results is to use the `cat()` command.  The `cat()` command automatically converts the objects to characters and concatenates them into a single string.

```{r}
len <- 5
wid <- 4
area <- len * wid

cat("The area of the rectangle is", area)
```

There is one more (somewhat fancy) way to print results.  That is with the `sprintf()` command.  The `sprintf` command allows you to create a sentence with placeholders for the variables.

```{r}
len <- 5
wid <- 4
area <- len * wid

sprintf("The area of the rectangle with length, %d, and width, %d, is %d.", len, wid, area)
```

The `%d` is a generic placeholder for values that are integers only (i.e., no decimal places).  If you have a number with a decimal place, you would `%f` as the placeholder.  For strings, you would use `%s` as the placeholder.

```{r}
Name <- "Louie LeChat"
weight <- 9.65
age <- 8

sprintf("Hello, my name is %s.  I am %d years old and weigh %f pounds", Name, age, weight)
```

Later, we will see how to format the output with sprintf.

#### Reading a Text File

Before you can read a text file into your R program, you must know what format the file is in.  Is it a plain text file or is it in a special format like XML or JSON?  Is the text file organized by lines of text or is it in a table format?  You should know the format of the file before you try reading it into your program.

For now, we are going to look at reading in plain text files.

##### Reading an unformatted text file
I have a file, _austen_emma_excerpt.txt_ that contains the first paragraph of the book _Emma_ by Jane Austen.  We can load the text into R's memory by using the _readLines_ command:

```{r}
raw_text <- readLines("austen_emma_excerpt.txt")
print(raw_text)

```

The `readLines` command will read in the text as separate lines and saves the lines as a list.  

If we prefer to have the text as a single string, we will need to use the `paste` command to concatentate the lines.

```{r}
raw_text <- paste(readLines("austen_emma_excerpt.txt"), collapse="\n")
print(raw_text)
```

The `\n` in the paste command is a formatting character that indicates where new lines will start.
If you want to see the text without the `\n` character, you can use the `cat` command:
```{r}
cat(raw_text)
```




<font color=blue>---------------------------------------------------------------</font>

### Activity:  Reading different formats

Make sure that you have downloaded the file "Books.csv". This file a comma-delimited table with columns for title, author, genre, etc.  You can read the contents of that file with a different read command, specifically:
```
raw_table <- read.csv("Books.csv")

```
Write a program that will read the file "Books.csv" and print the contents to the screen.

<font color=blue>---------------------------------------------------------------</font>

There are other commands for reading formats, like XML, JSON, PDF.  Before we can explore these commands, we need to learn a little bit more about functions and packages in R.



