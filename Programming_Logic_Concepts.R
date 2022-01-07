# 12/04/21 - José Mayorga
#
# Script name: Programming Logic Concepts
# Total number of sections: 4
# Review time: 45 minutes
# Objective: This script is deigned to outline some basic programming concepts, both logical and 
# conceptual, in order to familiarize you with common programming logic and conventions that will
# enable you to write and understand code in a way that is familiar and easy for everyone.

#### Code Hygiene ####

# Code hygiene is the topic I would like to most emphasize in this module.

# What is code hygiene? 
# Code hygiene can directly be thought of as how clean your code is written. In layman's terms,
# is your code concise, direct and readable? Is your documentation complete and productive towards explaining
# the concepts? Are your variable, function and constants named meaningfully and consistently? These are some
# of the many important questions that outline the importance of code hygiene, anything less complicates
# things for you and anyone who may reference your work. Life is hard enough as it is...let's not make it harder if 
# we can avoid doing so. 

# There is a common statement in the programming world that states: It is two times harder to proofread code than it is
# to write it. This means that when you are writing code that is extremely complex and at the edge of your knowledge, by
# definition, you are incapable of proofing the code, thus why you should always strive to produce the simplest solution
# with concise and consistent documentation, in an effort to reduce downstream confusion.

# Furthermore, documenting your code as you go helps you think logically when writing and can help you clarify many concepts.


### ** Lets dive into a few topics: ** ###

## ___  Variable and function naming ___ ##

# This is a common problem in all aspects of programming. Often times, we will write programs quickly making names insignificant
# or inconsistent to their actual purpose, operating under the assumption that we will fix this later, but we never get around to it.
# The key is to discipline yourself to continuously use meaningful and consistent variable and function names.

# I was taught to create variable names with no underscores and function names with underscores. Variable names can contain
# mixed cases, while function names contain only lowercase. You are welcome to switch up the order, but be consistent in 
# which attributes belong to which group. No spaces in any cases.

# Variable names:
var1
revVar1 # (rev) Revised

calculatedMean
extremelyLongVariable # can be reduced to logical syntax
extLongVar # still understandable

# Function names:
calculated_mean_function # long but meaningful
calc_mean_fun # cleaner

stat_fun # careful your functions do not overlap library functions

# If you are working with a true dataset, try to avoid arbitrary names
dataFrame # not acceptable
carData # provides meaning to actual data representation so everyone knows this function contains car data

## ___ Documentation ___ ##

# You may be tempted to avoid documenting your code when working in a hurry to meet insane deadlines, but
# it is well worth slowing down and documenting your functions, logical flow and variable so that you or anyone else
# can understand your logical flow.

# Function Documentation

# Function to calculate the mean of a dataframe
calc_mean_fun 
# This may seem okay, but it does not discuss the implementation of the function so let's elaborate


# This function is designed to calculate the mean value of numeric data in a dataframe.
# This function takes in a dataframe, calculates the mean value of the first column
# using the base R function 'mean' and returns this value.
calc_mean_fun 
# Although not extremely in depth this is a better explanation

# Variable documentation:

# Declaring variable containing data from the test column from the transferData dataframe
test <- transferData$test

# Creating a character vector of names
nameVec <- c('name1', 'name2', 'false name')

## ___  Logic of the program ___ ##

# Logical flow of your program can make or break your code hygiene and the violation of common logic can
# prove detrimental. Logic of your program should follow the convention of the top-down approach, meaning
# your script should be executed from the top line to the bottom line without interruption because if you're
# jumping back and forth from area to area to execute other portions, how is someone supposed to execute your code?

# Good practices include sectioning important areas with clear documentation, removing unneeded or unnecessary variables and place holders,
# replacing commonly used values or calculations with constant variables or a function that produces the needed values and simplifying 
# everything possible. You win by producing the simplest solution which often times is not necessarily the most elegant or appealing, but 
# the most understanding, functional and fastest solution.

# Find consistency: Similar to variable and function names, make your spacing, quotation marks and other common aspects consistent

# Do not mix:

# Common
section_1_function_1
section_1_function_2
section_1_function_3
section_2_function_1
section_2_function_2
section_2_function_3

# I prefer to separate sections for ease of visualization
section_1_function_1
section_1_function_2
section_1_function_3

section_2_function_1
section_2_function_2
section_2_function_3

# Arithmetic
test[test$value >= 1,] # Space between operator and variables

test[test$value>=1,] # No space between operator and variables
# No space saves keystrokes, but it can also be difficult to distinguish when you're fatigued

# Replacing commonly used values: Say we are checking if a certain column in multiple dataframes is greater than a mean
# value of one dataset, we can simplify the following solution and even make the workflow more easily updated if we
# need to plug in different values.

# In this case, if you have many comparisons and need to update the compareValue dataframe with another dataframe, you will
# need to manually update these functions, which is inefficient for your time.
dataFrame1[dataFrame1$value > mean(compareValue$comp_value),]
dataFrame2[dataFrame2$value > mean(compareValue$comp_value),]
dataFrame3[dataFrame3$value > mean(compareValue$comp_value),]
dataFrame4[dataFrame4$value > mean(compareValue$comp_value),]

# Here is a better solution
compMean <- mean(compareValue$comp_value) # Creating a variable containing the mean of the value we would like to compare, which can be easily updated

dataFrame1[dataFrame1$value > compMean,]
dataFrame2[dataFrame2$value > compMean,]
dataFrame3[dataFrame3$value > compMean,]
dataFrame4[dataFrame4$value > compMean,]

# This is especially valuable when using constants where we'd manually need to update the values
dataFrame1[dataFrame1$value > 1,]
dataFrame2[dataFrame2$value > 1,]
dataFrame3[dataFrame3$value > 1,]
dataFrame4[dataFrame4$value > 1,]

constantComp <- 1 # Creating a variable containing the constant value for comparison

dataFrame1[dataFrame1$value > constantComp,]
dataFrame2[dataFrame2$value > constantComp,]
dataFrame3[dataFrame3$value > constantComp,]
dataFrame4[dataFrame4$value > constantComp,]

# The rest of the Logical flow of a program will be observed as you progress through the course

#### Data Types and Structures ####

# In this section, I am refering to one of Hadley's chapters: http://adv-r.had.co.nz/Data-structures.html
# and the following link: https://www.tutorialspoint.com/r/r_data_types.htm

# Data types: a particular kind of data item, as defined by the values it can take, the programming language used, or the operations that can be performed on it.

# Data structures: a data structure is a data organization, management, and storage format that enables efficient access and modification.

# Variables are used in programming to store commonly used values, whether it be numbers, strings or characters. 
# Variables are simply memory set aside to hold the values place on them. Generally, variables are declared with their type
# i.e. int(var1), double(var2) and str(characters), but in R the variable type is automatically asigned based on the input, and in 
# some cases you will need to overide it.

## ___ Atomic Vectors (Most commonly used): logical, numeric, integer, complex, character and raw ___ ##

# logical
v <- TRUE # Although I prefer the shorthand as T or F
print(class(v))

# numeric
v <- 23.5
print(class(v))

# integer
v <- 21
print(class(v))

# complex
v <- 2+5i
print(class(v))

# character
v <- 'TRUE'
print(class(v))

# raw
v <- charToRaw('Hello')
print(class(v))

# To convert between the different data types, the as.(desired data type) functions can be used
as.numeric(T)
as.numeric(F)

as.character(1)
as.character(2000)

# Create a vector with multiple elements
apple <- c('red','green','yellow')
print(apple)

# Get the class of the vector
print(class(apple))

## ___ A list is like a vector, but can contain many different types of elements ___ ##

# Create a list
list1 <- list(c(2,5,3),21.3,sin)

# Print the list
print(list1)

## ___ A matrix is a two-dimensional dataset of one type ___ ##

# Create a matrix
M = matrix( c('a','a','b','c','b','a'), nrow = 2, ncol = 3, byrow = TRUE)
print(M)

## ___ An array is an extension of a matrix, which can be extended beyond two dimensions ___ ##

# Create an array
a <- array(c('green','yellow'),dim = c(3,3,2))
print(a)

## ___ Factors store a vector along with the distinct values of the elements in the vector as labels. ___ ##
## ___ This can be used to to set an order to the data, which we will apply in the next module. ___ ##

# Create a vector
appleColors <- c('green','green','yellow','red','red','red','green')

# Create a factor object
factorApple <- factor(appleColors)

# Print the factor
print(factorApple)
print(nlevels(factorApple))

## ___ Dataframes, unlike a matrix, can contain columns of different types, i.e. one column can be numeric while the second character and the third logical. ___ ##
## ___ This is the data structure we will most commonly use. ___ ##

# Create the data frame
BMI <- 	data.frame(
  gender = c('Male', 'Male','Female'), 
  height = c(152, 171.5, 165), 
  weight = c(81,93, 78),
  Age = c(42,38,26)
)
print(BMI)

# These are not all the possibilities, but broadly what we will be covering.

#### Base programming functions (if, if-else, for, etc.) #### 

# In this section we will be covering base R functions, but these functions are also applicable in most programming languages.

# Here are the conditonal arguments: '>' (greater than), '<' (less than), '==' (equal to), '>=' (greater than or equal to), '<=' (less than or equal to), '!=' (not equal to [the '!' is a negation meaning it produces the opposite])
# One note, if you can subsititue your '==' comparison for a '!=' to comparison, this is more computationally efficient since the entire value does not need to be compared
# in large datasets or scripts this plays a big role.

## ___ if statements ___ ##

# If statements evaluate a conditional argument, which if true will perform the operation held within the if statement body

# This is true so the text will print
if(2 > 1){
  print('2 is greater than 1')
}

# This is not true so the text will not print
if(2 < 1){
  print('2 is greater than 1')
}

# This is true so the text will print
if(2 >= 2){
  print('2 is greater than or equal to 2')
}

if(2 <= 1){
  print('2 is less than or equal 1')
}

if(2 == 1){
  print('2 is equal to 1')
}

if(2 != 1){
  print('2 is equal to 1')
}

# This can also be applied using conditional arguments, but cannot be scaled across a dataframe
value1 <- 1
value2 <- 2

if(value1 < value2){
  print('true')
}

testDf <- data.frame(
  comp_values = c(2,3,4,5,6)
)

# This will not work because we would need to individually iterate through the dataframe to perform a comparison, row by row. We will evaluate a way around this later.
if(testDf$comp_values > value1){
  print(paste0('Value less than ', value1)) # Here I am concatenating the print statement using paste0 to combine a string with the value with no spaces 
}

# This will work but only comparing all the values in the comp_values column in the dataframe
all(testDf$comp_values > value1) # The all function can be used to perform simple logical comparisons across multiple datasets

# We can also negate the result of a comparison
if(!(2 == 1)){
  print('The opposite of a false comparison is true')
}

# Now let's perform a chain of comparisons:

# && - and (Requires all statements to be true)
# || - or (Requires either statement to be true)

if(2 > 1 && 2 == 2){ # If 2 is greater than 1 AND 2 is equal to 2
  print('Double truth')
}

if(2 > 1 || 2 == 2){ # If 2 is greater than 1 OR 2 is equal to 2
  print('Double truth with no change')
}

if(2 > 1 && 2 == 1){ # If 2 is greater than 1 AND 2 is equal to 1
  print('Double truth')
}

if(2 > 1 || 2 == 1){ # If 2 is greater than 1 OR 2 is equal to 1
  print('Single truth')
}

# The comparisons can be chained to be much longer and even can even be nested when performing complex comparisons

# Here is an example performing three conditional comparisons
if((2 > 1 || 2 == 1) && (2 > 1 && 2 == 2)){ # (If 2 is greater than 1 OR 2 is equal to 1) AND (if 2 is greater than 1 AND 2 is equal to 2)
  print('Total truth')
}

# Notice how the comparison condition changes the outcome
if((2 > 1 && 2 == 1) && (2 > 1 && 2 == 2)){ # (If 2 is greater than 1 AND 2 is equal to 1) AND (if 2 is greater than 1 AND 2 is equal to 2)
  print('Total truth')
}

# Now lets nest an if statement
value <- 3

if(value > 1){
  if(value > 2){
    if(value > 3){
      print('Value is greater than 3')
    }
    print('Value is greater than 2')
  }
  print('Value is greater than 1')
}
# Notice how the function progresses as a series, if the value is greater than 1, the next comparison is performed, if the value is greater than 2 the next comparison
# is performed, then since the value is not greater than three, the if statement is false and the logic continues to the first immediate section, the print statement
# directly under the third if statement, then once this if is complete the program returns to the first if to finish the statement. This is how nesting works layer by layer.

## ___ else if statements ___ ##

# else if  follows a case where a series of comparisons are performed as a chain, similar to a nested if statement, but more understandable and friendly

value <- 3

if(value > 3){
  print('Value is greater than 3')
} else if( value == 2){
  print('Value is equal to 2')
} else if(value > 1){
  print('Value is greater than 1')
} else if(value > 0){
  print('Value is greater than 0') # Notice how this statement is true, but is not printed. This is because once a true condition is found found, the chain is ended
}

if(value > 3){
  print('Value is greater than 3')
} else if( value == 2){
  print('Value is equal to 2')
} else if(value < 1){
  print('Value is less than 1')
} else if(value > 0){
  print('Value is greater than 0') # Now this statement prints
}

# In the case where none of the statements are true, there will be no output
if(value > 3){
  print('Value is greater than 3')
} else if( value == 2){
  print('Value is equal to 2')
} else if(value < 1){
  print('Value is less than 1')
} else if(value < 0){
  print('Value is less than 0') 
}

# In the case where nothing is true, we can set a default condition that will occur independent of logical comparisons
if(value > 3){
  print('Value is greater than 3')
} else if( value == 2){
  print('Value is equal to 2')
} else if(value < 1){
  print('Value is less than 1')
} else if(value < 0){
  print('Value is less than 0') 
} else {
  print('Fallback default; nothing was true')
}

# Later we will observe the ifelse function.

## ___ for statements ___ ##

# For loops iterate through data and can be extremely valuable when performing a series of comparisons or running a series of 
# functions or iterations with different values.

# Here index is our iterator variable containing what iteration we are operating on.
# seq() is a function that generates a sequence of numbers ranging from 1 to 10 stepping by a value of 1
# seq could be replace with 1:10
1:10 # Sequence form 1-10 by 1

for(index in seq(1, 10, 1)){
  print(index)
}

# Generally the index iterator can be used for mathematics
for(index in seq(1, 10, 1)){
  print(3 + index)
}

# We can index a vector
transformationValues <- c(1, 14, 25, 30, 46)

for(index in seq(1, 5, 1)){
  print(transformationValues[index] * 2)
}

# We can be tricky with the index to select specific values
transformationValues <- c(1, 'skip', 14, 'skip', 25, 'skip', 30, 'skip', 46, 'skip')

for(index in seq(1, 10, 1)){
  print(transformationValues[index])
}

for(index in seq(1, 10, 1)){
  if(index %% 2 != 0){ # modulo division: returns the remainder of a division (used to check if a number is even [divisible by two with no remainder])
    print(transformationValues[index])
  }
}

# Let's take a look at loop control statement: break and next
# We can control the iterations of a for loop by using these control statements

# break essentially "breaks" you out of the for loop, terminating its execution
for(index in seq(1, 10, 1)){
  break
  print(index)
}

# Positioning matters
for(index in seq(1, 10, 1)){
  print(index)
  break
}

# next passes up the current iteration
for(index in seq(1, 10, 1)){
  print(index)
  next # Does no good here
}

for(index in seq(1, 10, 1)){
  next # Skips all prior to print
  print(index)
}

for(index in seq(1, 10, 1)){
  if(index %% 2 != 0){ # Skips all odd indices
    next
  }
  print(index)
}

# Now let's nest some loops
# For nesting for loops, we need to be sure to change the name of the iterator variable
for(index in seq(1, 2, 1)){
  for(secIndex in seq(1, 2, 1)){
    print(paste0('Second Index: ', secIndex))
  }
  print(paste0('First Index: ', index))
} # Pay attention to how the print statements appear so that you understand what is going on

# There are many ways to utilize nested loops, but I will leave the application up to you.

#### Self-declared functions #### 

# For this section we will be looking into how to declare our own functions and use them.
# Functions generally perform an operation on a variable or serious of variables passed along.
# They can easily get overly complicated, so be cautious in how you design them.

# Application cases for when to declare a function is when you are repeatedly performing an 
# operation with different values such as plotting multiple datasets using the same plotting function
# or performing transformations on datasets.

# Basically, if you find yourself copy and pasting one operation multiple times, make it into a function
# for easy reference and if an update needs to me made, it can be done so easily and without headache.

# One very important concept is the scope of a variable, of which there are generally two: local and global.
# local variables are variables which only exist in a local environment and cannot be accessed outside of the environment they were created in
# and are deleted when the environment is traversed.
# global variables are variables which exist in all environments and can be accessed and modified in all scopes (this is VERY dangerous and we prefer
# to use local rather than global variables for manipulation).
# I would advise always passing variables by value, creating local variables, rather than by reference, which would mean you are manipulating a global
# variable that could destroy your work.
# Be careful with overlapping variable names from global and local scopes.

# function() is Used to declare a function

# In this function, called simple_math_function, we are receiving in input value and performing a simple
# arithmetic and then printing the value.
simple_math_function <- function(value){
  revValue <- value + 2 # both revValue and value are local variables and cannot be accessed outside of the scope
  print(revValue)
} # You must declare (run) the function prior to calling it

simple_math_function(3)
simple_math_function(2)
simple_math_function(5)
simple_math_function(6)
simple_math_function(7)

# In this function, called simple_math_function, we are receiving in input value and performing a simple
# arithmetic and then returning the value.
simple_math_function <- function(value){
  revValue <- value + 2
  return(revValue)
} # You must declare (run) the function prior to calling it

returnedValue <- simple_math_function(3)
print(returnedValue)
returnedValue <- simple_math_function(6)
print(returnedValue)
returnedValue <- simple_math_function(8)
print(returnedValue)
returnedValue <- simple_math_function(9)
print(returnedValue)


# In order to return multiple values we will be using a vector
simple_math_function <- function(value){
  revValue <- c(value + 2, value * 10, value / 3 )
  return(revValue)
} # You must declare (run) the function prior to calling it

returnedValues <- simple_math_function(3)
print(returnedValues)
print(paste0('Value 1: ', returnedValues[1], ', ',
             'Value 2: ', returnedValues[2], ', ',
             'Value 2: ', returnedValues[3]))

# We can pass multiple variables
simple_math_function <- function(value, transVal1, transVal2){
  revValue <- c(value + 2, value * transVal1, value / transVal2 )
  return(revValue)
} # You must declare (run) the function prior to calling it

returnedValues <- simple_math_function(3, 2, 6)
print(returnedValues)
print(paste0('Value 1: ', returnedValues[1], ', ',
             'Value 2: ', returnedValues[2], ', ',
             'Value 2: ', returnedValues[3]))


# We can set a default for a value in case no value is passed
simple_math_function <- function(value, transVal1, transVal2 = 3){
  revValue <- c(value + 2, value * transVal1, value / transVal2 )
  return(revValue)
} # You must declare (run) the function prior to calling it

returnedValues <- simple_math_function(3, 2) # No third value passed, but we are still covered due to the default
print(returnedValues)
print(paste0('Value 1: ', returnedValues[1], ', ',
             'Value 2: ', returnedValues[2], ', ',
             'Value 2: ', returnedValues[3]))

# Once again, there are many applications for functions, which I will let you experiment with.

