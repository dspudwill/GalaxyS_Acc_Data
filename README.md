# **GalaxyS_Acc_Data README File**
Author: Dylan Pudwill

**Project Summary:** Retrieve some untidy Samsung Galaxy S Smartphone accelerometer data. The data had to be cleaned and organized before being summarized into a tidy data set that I called `tidyTable`
A full description of the data can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Repo Table of Contents

- README.md (your are here!)
  - Summary of the repo and organization of the project
- CodeBook.md
  - Overview of original raw data as well as `tidyTable` variables and units
- run_analysis.R
  - R script used to process raw data and create `tidyTable` dataset.

# Summary of Galaxy S Smartphone Accelerometer Data and Analysis

## Data:

### Raw Data:
For a really detailed description I refer you to to [this link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) again. The experiment had 30 subjects from the ages of 19-48 years old do up to 6 activities:
```
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING
```
To track the acceleration and angular velocity of the subjects each subject wore a Samsung Galaxy S II phone. The data was saved in .txt files and split into test and training sets, 70% and 30% respectivly. There were almost 30 files in total, however, the files that are important for analysis of this project are as follows:
```
README.txt
activity_labels.txt
features_info.txt
features.txt
test/subject_test.txt
test/X_test.txt
test/y_test.txt
train/subject_train.txt
train/X_train.txt
train/y_train.txt
```
For further details on each file read my CodeBook.md [here](https://github.com/dspudwill/GalaxyS_Acc_Data/blob/master/CodeBook.md)

### tidyTable Dataset:
I created the `tidyTable` dataset with the R script `run_analysis.R` using the `dplyr` R package. The script: combines the test and train data, adds detailed names to each observation in the `activity` column, adds details names to each of the variables from `X_train.txt` and `X_test.txt`, reduces the data set to only required variables, and finally creates a summary data set `tidyTable` which is the averages of all the variables grouped by `subject_id` and `activity`, respectivly. 

## run_analysis.R
My `run_analysis.R` script takes the raw data as input and outputs the tidy dataset `tidyTable`. I outputed my tidy dataset to `tidyTable.txt` to the directory you ran my script in. You can read my data set using `read.table()`. 

An overview of my script is as follows:
1. Download, unzip the raw data. Set working directory. Using [this repo](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/rprog-downloadingFiles.md) for assistance.
2. Load all neccesary files using `read.table()`
3. Added descriptive names for all variables
4. Added descriptive observational values
5. Used `dplyr` to `select()`, `group_by()` and `summarize()` data
6. write tidy dataset to `tidyTable.txt` using `write.table()`

Find my script [here](https://github.com/dspudwill/GalaxyS_Acc_Data/blob/master/run_analysis.R)

## CodeBook.md
The `CodeBook.md` will give a summary of the raw data files utailzed by `run_analysis.R`. Also, `CodeBook.md` will have a summary and the units of all the variables in `tidyTable`.
Find my CodeBook [here](https://github.com/dspudwill/GalaxyS_Acc_Data/blob/master/CodeBook.md)


## References
1. At first I was not sure how to make a README file. [This](https://rpubs.com/AnBey/89354) RPubs page helped me so much! It has a README.md and CodeBook.md for Coursera's Getting and Cleaning Data Project. I followed their formatting for my .md files. 

2. Learning markdown was also new to me. I credit [this website](https://guides.github.com/features/mastering-markdown/#examples) for teaching me everything I used here. 