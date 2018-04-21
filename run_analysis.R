##Data Cleaning Project

## Summary: 1. Downloads the data and sets the working directory itself
##          2. It compresses test and training sets
##          3. Selects only important data specified from project description 
##          4. Gives descriptive names to activity observations and all vars
##          5. Creates a tidy data set (tidyTable) grouped by subject_id 
##              and activity with averages of all columns

library(dplyr)

##Downloading file if file "DataCleanProject.zip" does not exist
dlMeth <- "curl" # sets default for OSX / Linux
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(substr(Sys.getenv("OS"),1,7) == "Windows") dlMeth <- "wininet"
if(!file.exists("DataCleanProject.zip")) {
    download.file(url,
        "DataCleanProject.zip",  # stores file in R working directory
        method=dlMeth, # use OS-appropriate method
        mode="w")        # "w" means "write," and is used for text files
}

##unzipping file and setting working dir
unzip(zipfile = "DataCleanProject.zip")
setwd("UCI\ HAR\ Dataset")

##combinded data of test and train sets
x_train <- read.table("train/X_train.txt")
x_test <- read.table("test/X_test.txt")
x_final <- rbind(x_train, x_test)

##combined activity id's for test and train sets
y_train <- read.table("train/y_train.txt")
y_test <- read.table("test/y_test.txt")
y_final <- rbind(y_train, y_test)
 
##combined subject id's for test and train sets
subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")
subject <- rbind(subject_train, subject_test)

##feature names for 561 columns in x df
feature <- read.table("features.txt", colClasses = "character")
feature = feature[[2]]

##activity labels// used to add descriptive names
act <- read.table("activity_labels.txt")

##make.names creates valid column names for select to search through
names(x_final) <- make.names(names = feature, unique=TRUE, allow_ = TRUE) 

##removes excess '.'
names(x_final) <- gsub('([[:punct:]])\\1+', '\\1', names(x_final))

##combines all df into one df with columns: subject_id, activity, x1...x561
df <- cbind(subject, y_final, x_final)
names(df)[1] = "subject_id"
names(df)[2] = "activity"

##changing activity observations to desriptive names
for(i in seq_along(df[[2]])) {
    if (df[[2]][i] == 1) {
        df[[2]][i] = "WALKING"
    } else if (df[[2]][i] == 2) {
        df[[2]][i] = "WALKING_UPSTAIRS" 
    } else if (df[[2]][i] == 3) {
        df[[2]][i] = "WALKING_DOWNSTAIRS"
    } else if (df[[2]][i] == 4) {
        df[[2]][i] = "SITTING"
    } else if (df[[2]][i] == 5) {
        df[[2]][i] = "STANDING"
    } else if (df[[2]][i] == 6) {
        df[[2]][i] = "LAYING"
    } else {
        df[[2]][i] = NA
    }
}

##select columns of interest using dplyr and regular expressions
##new <- select(df, grep("*mean*|*std*|subject_id|activity", names(df)))

##summarize data grouped by subject and activity
tidyTable <- df %>%
    select(grep("*mean*|*std*|subject_id|activity", names(df))) %>% 
    group_by_at(vars(subject_id, activity)) %>%
    summarise_at(.vars = names(.)[3:81], .funs = c(avg="mean"))

##outputing the tidy data to 'tidyTable.txt' to the current directory
write.table(tidyTable, "tidyTable.txt", sep="\t", row.names = FALSE)

writeLines("\nYour order is ready! A fresh plate of tidy data is served via 'tidyTable'")
writeLines("\nOr you can also enjoy your tidy data to go with 'tidyTable.txt")
writeLines("\nBon Appetit and happy grading! :)")