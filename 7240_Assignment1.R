##############################
### GCOM 7240 Assignment 1 ###
##############################

# For this assignment, please answer each question using R code and submit your script via Blackboard. Please save your script using the following naming scheme:

# 7240_Assignment1_Firstname_Lastname.R

# For example, I would save my script as 7240_Assignment1_David_Dobolyi.R

###########################################
# LOAD PACKAGES AND SET WORKING DIRECTORY #
###########################################

library(car)
library(effects)
library(ggplot2)
library(psych)

setwd("~/Downloads")

#############################
# DESCRIPTION AND QUESTIONS #
#############################

# Included with this homework script is a comma-separated values (CSV) file named "Assignment1-data.csv"; the following is a description of the data:

# 40 rows of customer data for a small clothing store in response to a 3-item customer satisfaction survey on 1-7 scale, along with demographics. The columns are:

# ID: the customer's unique ID
# Q1: the response to the first survey question, "Would you recommend our store to a friend?"; responses range from 1 (Not at All) to 7 (Absolutely)
# Q2: the response to the second survey question, "How would rate the quality of the clothes you've bought from our store?"; responses range from 1 (Excellent) to 7 (Terrible)
# Q3: the response to the third survey question, "How would you rate our store overall?"; responses range from 1 (Terrible) to 7 (Excellent)
# A: the customer's age in years
# L: whether or not the customer has a store loyalty card (1 = 'Yes' and 0 = 'No')
# Income: the customer's annual income in thousands (e.g., 40 = $40,000)

##############
# QUESTION 1 #
##############

# Read in the included data file "Assignment1-data.csv" and store it in an object called "dat". Run the str() and summary() commands on the object "dat" and answer the following questions using a comment: 1) what kind of object is this, and 2) what is the range of column Q1?



##############
# QUESTION 2 #
##############

# Convert the loyalty card column into a factor, recode it so that values of 1 are labeled meaningfully as "Yes" and values of 0 are labeled meaningfully as "No", and finally write a command to make certain the reference level is set to "No" (even if it is already set to "No" as it likely will be). HINT: you will need 3 functions to accomplish this task: factor, recode, and relevel (be sure to consult the help for each function, e.g., ?relevel)



##############
# QUESTION 3 #
##############

# Run the structure command on the object "dat" again: what type of data does the column ID consist of? What might be a better type of data to convert it to? (go ahead and do the conversion while you are at it)



##############
# QUESTION 4 #
##############

# Rename the columns A and L to "Age" and "LoyaltyCard" respectively; if you are not sure how to do this, see the bootcamp notes or type "change column name in r" into google



##############
# QUESTION 5 #
##############

# You may have noticed that one of the survey items, Q2, is reverse coded such that low numbers indicate the most positive ratings and high numbers indicate the worst ratings. Reverse the scores in the column to make it consistent with the scale directions in Q1 and Q3; save this is a new variable in the data frame called Q2R. HINT: you can do this either using simple algebra or with the reverse.code function in the psych package; to check your work, the mean of Q2R should be 3.775



##############
# QUESTION 6 #
##############

# Compute the mean of columns Q1, Q2R, and Q3 for each customer and save these into a new column called QMean. HINT: you can do this several ways, but there is a function designed specifically for just this task (and again, to check yourself, the mean for customer ID 222 should be 3)



##############
# QUESTION 7 #
##############

# Create a linear model predicting the mean scale score (i.e., "QMean") from customer age and store this into the object "mod1"; run the following commands on mod1 and discuss the significance of the prediction and the direction of the effect, if applicable, in 1 to 2 sentences: summary(mod1), Anova(mod1), plot(allEffects(mod1))



##############
# QUESTION 8 #
##############

# Create a second linear model, but this time predict mean scale score based on both customer age and whether or not they have a loyalty card. Store this model into the object "mod2" and run the same commands above. Describe the results in 1-2 sentences.



##############
# QUESTION 9 #
##############

# Update the second model you fit in Question 8 to include an interaction between customer age and whether or not they have a loyalty card (i.e., the DV should still be mean scale score). Store this model into the object "mod2.interaction" and interpret the results in a few sentences. For plotting the effects of this model, you may want to try adding a few arguments to make the plot more readable: plot(allEffects(mod2.interaction), multiline = TRUE, ci.style = "bands")



###############
# QUESTION 10 #
###############

# Create a third model, mod3, this time predicting whether or not customers have a loyalty card based on their age and income. Note that you will need to run this model as a glm with a specific type of "family" specified as an argument; explain why this is the case. Run the commands you ran on mod1 and mod2 above and interpret the results of fitting this model in 2-3 sentences.



###############
# QUESTION 11 #
###############

# Use ggplot2 to create a point plot where the Y-axis shows mean scale score (i.e., QMean), the X-axis shows customer age, and the points are colored based on their income and shaped based on whether or not they have a loyalty card. Also do the following:

# (a) facet the plot by adding the following code to see if it helps separate the data better visually: facet_wrap(~ LoyaltyCard)
# (b) add a regression line: geom_smooth(method = "lm", color = "red").

# After you create your plot, compare it to the effect plot you generated in Question 9 earlier: plot(allEffects(mod2.interaction))



###############
# QUESTION 12 #
###############

# Read in the included data file "Assignment1-pca-data.csv" and store it in an object called "dat.survey"; these data consist of seven columns, Survey1 through Survey7, which are the mean scores across seven different personality scales for 240 individuals. Conduct a principle components analysis (PCA) using these data to determine if any of these surveys may be redundant. First, generate a scree plot using fa.parallel() and determine the optimal numbers of principal components to extract. Next, use the principal() function with a "varimax" rotation to conduct a PCA based on the number of components you've decided to extract (this function is found in the psych package). Finally, run fa.diagram() on the resultant PCA object to determine which scales load together, might be redundant, and/or to see if any are particularly valuable. Based on your results, describe your findings/recommendations in a few sentences.


