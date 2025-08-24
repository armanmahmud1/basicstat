{smcl}
{* *! version 1.0.0 Arman Mahmud 24aug2025}{...}
{hline}
help for {bf:basicstat} {right:To know the basic statistics of a dataset }
{hline}

{title:Title}

{p 4 4 2}
{bf:basicstat:} Run this command to know the basic statistics for both string and numeric variables of a dataset.

{title:Description}

{p 4 4 2}
{cmd:basicstat} command produces two Excel files, "basicstat_string_output.xlsx" and "basicstat_numeric_output.xlsx", that summarize key statistics from a dataset. For string variables, it generates frequency tables, with each variable placed on its own sheet within the string output file. For numeric variables, the command first checks whether the number of observations is greater than zero. If so, it compiles a comprehensive set of statistics for each variable, including the variable name, number of observations, mean, standard deviation (SD), skewness, kurtosis, minimum and maximum values, and percentiles at the 25th (P25), 50th (P50), and 75th (P75) levels. This structured output provides a quick and organized overview of data.

{title:Example}

	basicstat using "D:\test_dataset\Practice_clean.dta"
	
	basicstat using "D:\test_dataset\Practice_clean.dta", exclude(reason_fine_1 reason_fine_2 reason_fine_3 key text_audit submissiondate starttime endtime)
	
Note: The command also supports an optional exclude option: if specified, it will omit the listed variables from the output; otherwise, all variables are included by default. For cleaner and more targeted results, using the exclude option.

{title:Author}

{p 4 4 2}
Arman Mahmud{p_end}
{p 4 4 2}
Email: {browse "mailto:armanmahmud.du18@gmail.com":armanmahmud.du18@gmail.com}{p_end}
{p 4 4 2}
Web: {browse "https://sites.google.com/view/armanmahmud1/":website}{p_end}
