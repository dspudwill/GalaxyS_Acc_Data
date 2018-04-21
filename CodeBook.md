# Code Book
`tidyTable` is my tidy dataset that was created with the `run_analysis.R` script using the raw HARUS data. The raw data can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). A description of the raw data can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

This Code Book will be used to detail the raw and tidy datasets. I will show the units of all the variables in the completed tidy data set as well. 

## Raw Data:
There are up to 30 files overall, but I will only list the important files for this specific project.

-Test Dataset:
  - `test/subject_test.txt`: `subject_id` for each observation measured in test dataset. `numeric` values from 1:30.
  - `test/X_test.txt`: measurement values for each observation measured in test dataset. `numeric` value. Each element has a `numeric` vector with length 561. There are 7352 elements in the dataset.
  - `test/y_test.txt`: `activity` values for each obseration. `numeric` value
-Train Dataset:
  - `train/subject_train.txt`: `subject_id` for each observation measured in train dataset. `numeric` values from 1:30
  - `train/X_train.txt`: measurement values for each observation measured in train dataset. `numeric` value. Each element has a `numeric` vector with length 561. There are 2947 elements in the dataset.
  - `train/y_train.txt`: `activity` values for each obseration. `numeric` value  
-Other Data Files:
  - `features.txt`:A `character` vector with length 561. Each element in the vector corresponds to a column in `test/X_test.txt`(or train) dataset.
  - `activity_labels.txt`: dataset with two columns. First column is `numeric`counter value 1:6. Second column is a `character` string of activity labels
```
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING
```

## Varialbes in R Script
This is a summary of all variables to help you read through the script if need be.

### Data Variables:
1. `act`:two column dataset of `activity_labels.txt`
2. `df`: combination of `subject`, `y_final` and `x_final` using `cbind()`
3. `subject`: combine `subject_train` and `subject_test` using `rbind()`
4. `subject_test`: one column of `numeric` test subject data
5. `subject_train`:one column of `numeric` train subject data
6. `x_final`: combine `x_train` and `x_test` using `rbind()`
7. `x_test`: dataset from `test/X_test.txt`
8. `x_train`:dataset from `train/X_train.txt`
9. `y_final`:combine `y_train` and `y_test` using `rbind()`
10. `y_test`:dataset from `test/y_test.txt`
11. `y_train`:dataset from `train/y_train.txt`
12. `feature.txt`: one column dataset of `features.txt`
13. `tidyTable`: finalized dataset with summary of mean values grouped by `subject_id` and `activity` 

### Value Variables:
1.  `dlMeth`: default `method` with value of `"curl"` for `download.file()` function. If `if` statement is `TRUE` value will be changed to `"wininet"` for Windows machines.
2. `i`: counter variable for `for` loop.
3. `url`: holder varialbe for URL used to downlaod HARUS zip file.

## tidyTable Variable Units and Dictionary

### Units:
- Column[1:2]: categorical variables.
- Column[3:81]: numeric quantitative values that have been **normalized** and **bounded** `[-1,1]`

### Variable Dictionary:
*NOTE: Many of the following variables have X, Y, and Z directions. I will only describe the X direction and leave a note to remind you there are two more variables for Y and Z directions as well. e.g. `tBodyAcc.mean.X_avg` will describe `tBodyAcc.mean.Y_avg` and `tBodyAcc.mean.Z_avg`*

1. `subject_id`: id value for each individual in the experiment.
  - **Range:**1:30
  - **Type:**`numeric`

2. `activity`: character string of activities an individual can preform during the experiment.
  - **Range/Category:** WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
  - **Type:**character

*all variables from 3 - 81 are of type `numeric`*

3. `tBodyAcc.mean.X_avg`*Y & Z*:
  - Average value of the individuals body acceleration in the X direction
4. `tBodyAcc.std.X_avg`*Y & Z*:
  - Standard Deviation of the individuals body acceleration in the X direction
5. `tGravityAcc.mean.X_avg`*Y & Z*:
  - Average value of the gravitational acceleration in the X direction
6. `tGravityAcc.std.X_avg`*Y & Z*:
  - Standard Deviation of the gravitational acceleration in the X direction
7. `tBodyAccJerk.mean.X_avg`*Y & Z*:
  - Average value of the body Jerk signal from acceleration in the X direction. 
8. `tBodyAccJerk.std.X_avg`*Y & Z*:
  - Standard Deviation of the body Jerk signal from acceleration in the X direction.
9. `tBodyGyro.mean.X_avg`*Y & Z*:
  - Average value of the angular velocity in the X direction
10. `tBodyGyro.std.X_avg`*Y & Z*:
  - Standard Deviation of the angular velocity in the X direction
11. `tBodyGyroJerk.mean.X_avg`*Y & Z*:
  - Average value from the body Jerk signal from angular velocity in the X direction
12. `tBodyGyroJerk.std.X_avg`*Y & Z*:
  - Standard Deviation from the body Jerk signal from angular velocity in the X direction
13. `tBodyAccMag.mean._avg`
  - Average value of the magnitude of the body acceleration signal
14. `tBodyAccMag.std._avg`
  - Standard Deviation of the magnitude of the body acceleration signal
15. `tGravityAccMag.mean._avg`
  - Average value of the magnitude of the gravity force acceleration signal
16. `tGravityAccMag.std._avg`
  - Standard Deviation of the magnitude of the gravity force acceleration signal
17. `tBodyAccJerkMag.mean._avg`
  - Average value of the magnitude of the body Jerk signal from acceleration
18. `tBodyAccJerkMag.std._avg`
  - Standard Deviation of the magnitude of the body Jerk signal from acceleration
19. `tBodyGyroMag.mean._avg`
  - Average value of the magnitude of the bodies angular velocity
20. `tBodyGyroMag.std._avg`
  - Standard Deviation of the magnitude of the bodies angular velocity
21. `tBodyGyroJerkMag.mean._avg`
  - Averag value of the magnitude of the body Jerk signal from the angular velocity
22. `tBodyGyroJerkMag.std._avg`
  - Standard Deviation of the magnitude of the body Jerk signal from the angular velocity
23. `fBodyAcc.mean.X_avg`*Y & Z*:
  - Average value of the Fast Fourier Transform of the bodies acceleration in the X direction
24. `fBodyAcc.std.X_avg`*Y & Z*:
  - Standard Deviation of the Fast Fourier Transform of the bodies acceleration in the X direction
25. `fBodyAcc.meanFreq.X_avg`*Y & Z*:
  - Weighted average of the frequency components in the Fast Fourier Transform of the bodies acceleration in the X direction.
26. `fBodyAccJerk.mean.X_avg`*Y & Z*:
  - Mean value of the Fast Fourier Transform of the body Jerk signal from the accleration in the X direction
27. `fBodyAccJerk.std.X_avg`*Y & Z*:
  - Standard Deviation of the Fast Fourier Transform of the body Jerk signal from the accleration
28. `fBodyAccJerk.meanFreq.X_avg`*Y & Z*:
  - Weighted average of the frequency components of the Fast Fourier Transform of the body Jerk signal from the accleration in the X direction.
29. `fBodyGyro.mean.X_avg`*Y & Z*:
  - Average value of the Fast Fourier Transform of the bodies angular velocity in the X direction
30. `fBodyGyro.std.X_avg`*Y & Z*:
  - Standard Deviation of the Fast Fourier Transform of the bodies angular velocity in the X direction
31. `fBodyGyro.meanFreq.X_avg`*Y & Z*:
  - Weighted average of the frequency components of the Fast Fourier Transform of the bodies angular velocity in the X direction
32. `fBodyAccMag.mean._avg`
  - Average value of the magnitude of the Fast Fourier Transform of the bodies acceleration
33. `fBodyAccMag.std._avg`
  - Standard Deviation of the magnitude of the Fast Fourier Transform of the bodies acceleration
34. `fBodyAccMag.meanFreq._avg`
  - Weighted average of the frequency components of the magnitude of the Fast Fourier Transform of the bodies acceleration
35. `fBodyBodyAccJerkMag.mean._avg`
  - Average value of the magnitude of the Fast Fourier Transform of the body Jerk signal from the accleration
36. `fBodyBodyAccJerkMag.std._avg`
  - Standard Deviation of the magnitude of the Fast Fourier Transform of the body Jerk signal from the accleration
37. `fBodyBodyAccJerkMag.meanFreq._avg`
  - Weighted average of the frequency components of the magnitude of the Fast Fourier Transform of the body Jerk signal from the accleration
38. `fBodyBodyGyroMag.mean._avg`
  - Average value of the magnitude of the Fast Fourier Transform of the body angular velocity
39. `fBodyBodyGyroMag.std._avg`
  - Standard Deviation of the magnitude of the Fast Fourier Transform of the body angular velocity
40. `fBodyBodyGyroMag.meanFreq._avg`
  - Weighted average of the frequency components of the magnitude of the Fast Fourier Transform of the body angular velocity
41. `fBodyBodyGyroJerkMag.mean._avg`
  - Average value of the magnitude of the FFT of the body Jerk signal from the angular velocity
42. `fBodyBodyGyroJerkMag.std._avg`
  - Standard Deviation of the magnitude of the FFT of the body Jerk signal from the angular velocity
43. `fBodyBodyGyroJerkMag.meanFreq._avg`
  - Weighted average of the frequency components of the magnitude of the FFT of the body Jerk signal from the angular velocity

## References:
1. I refered to [this](http://rpubs.com/AnBey/89373) codebook for a lot of assistance with explaining the variables.
