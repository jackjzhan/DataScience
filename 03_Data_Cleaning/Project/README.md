# Data Cleaning
## John Hopkins Coursera
## Taken by Jack Zhan

This is my Repo for the final project. The goal is to to create a tidy dataset from the HAR dataset. The run_analysis.R script creates the output tidy.txt.

## Review criteria
* The submitted data set is tidy.
* The Github repo contains the required scripts.
* GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
* The README that explains the analysis files is clear and understandable.
* The work submitted for this project is the work of the student who submitted it.

##How the code works
The code uses the HAR dataset files in the ../Dataset directory.</br>
The code uses the two datasets:
```R
library(dplyr)
library(data.table)
```
Code can be run through RStudio or the command line and generates the output tidy.txt.
