# basicstat
Run this command to know the basic statistics for both string and numeric variables of a dataset.

## Description
This command produces two Excel files, "basicstat_string_output.xlsx" and "basicstat_numeric_output.xlsx", that summarize key statistics from a dataset. For string variables, it generates frequency tables, with each variable placed on its own sheet within the string output file. For numeric variables, the command first checks whether the number of observations is greater than zero. If so, it compiles a comprehensive set of statistics for each variable, including the variable name, number of observations, mean, standard deviation (SD), skewness, kurtosis, minimum and maximum values, and percentiles at the 25th (P25), 50th (P50), and 75th (P75) levels. This structured output provides a quick and organized overview of data.

## Installing process
```
net install basicstat, from("https://raw.githubusercontent.com/armanmahmud1/basicstat/main/") replace
```
## Example code
```
basicstat using "D:\test_dataset\Practice_clean.dta"
```	
```
basicstat using "D:\test_dataset\Practice_clean.dta", exclude(reason_fine_1 reason_fine_2 reason_fine_3 key text_audit submissiondate starttime endtime)
```	
```
help basicstat
```
Note: <br>
1. The command also supports an optional exclude option: if specified, it will omit the listed variables from the output; otherwise, all variables are included by default. For cleaner and more targeted results, using the exclude option. <br>
2. Please check the execution window carefully. The export file has been saved to your current working directory. You’ll find a clickable link to the exported file provided by this package.

## Issues
For any issues, report: https://github.com/armanmahmud1/basicstat/issues
## Author
Arman Mahmud, <br>
Email: armanmahmud.du18@gmail.com, <br>
Web: https://sites.google.com/view/armanmahmud1
