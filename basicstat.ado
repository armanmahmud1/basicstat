	**! version 1.0.0 Arman Mahmud, 21aug2025 
	
	cap program drop basicstat 
	program define basicstat
		syntax using, [EXClude(string)]
	
	** using dataset
	*~~~~~~~~~~~~~~~~~~~~~~~*

	u `using', clear
	
	** type "string"
	*~~~~~~~~~~~~~~~~~~~~~~~*
	
	qui ds, has(type string) 
	loc string_var_all = "`r(varlist)'"
	
	if "`exclude'" != "" {
		loc exc = "`exclude'"
		
		foreach x of loc string_var_all{
			loc found = 0
			foreach y of loc exc{
				if "`x'" == "`y'"{
						loc found = 1
					}
				}
				
			if `found' == 0{
				loc string_final = "`string_final' `x'"
			
			}
		}
	}
	
	if "`exclude'" == "" {
	    loc string_final = "`string_var_all'"
	}
	
	foreach x of loc string_final {
		qui {
		n di as input "Analysis running for `x' (string)"
		preserve
			contract `x'
			ren _freq frequency
			export excel using "basicstat_string_output.xlsx", firstrow(var) sheet(`x') sheetmodify
			n di as result "Analysis completed for `x'"
		restore
		}
	}
	
	** type "non string"
	*~~~~~~~~~~~~~~~~~~~~~~~*
	
	qui ds, not(type string)
	
	loc num_var_all = "`r(varlist)'"
	
	if "`exclude'" != "" {
		loc exc = "`exclude'"
		
		foreach x of loc num_var_all{
			loc found = 0
			foreach y of loc exc{
				if "`x'" == "`y'"{
						loc found = 1
					}
				}
				
			if `found' == 0{
				loc num_final = "`num_final' `x'"
			
			}
		}
	}
	
	if "`exclude'" == "" {
	    loc num_final = "`num_var_all'"
	}
	
	putexcel set "basicstat_numeric_output.xlsx", modify
	
	loc j = 2
		
	foreach x of local num_final{
		qui {
			n di as input "Analysis running for `x' (numeric)"
			count if !missing(`x')
		if `r(N)' > 0 {
			sum `x', detail
		
			putexcel A1 = ("Var_Name")
			putexcel B1 = ("Obs_No")
			putexcel C1 = ("Mean")
			putexcel D1 = ("Sd")
			putexcel E1 = ("Skewness")
			putexcel F1 = ("Kurtosis")
			putexcel G1 = ("Min")
			putexcel H1 = ("Max")
			putexcel I1 = ("p25")
			putexcel J1 = ("p50")
			putexcel K1 = ("p75")
			
			putexcel A`j' = ("`x'")
			putexcel B`j' = (`r(N)')
			putexcel C`j' = (`r(mean)')
			putexcel D`j' = (`r(sd)')
			putexcel E`j' = (`r(skewness)')
			putexcel F`j' = (`r(kurtosis)')
			putexcel G`j' = (`r(min)')
			putexcel H`j' = (`r(max)')
			putexcel I`j' = (`r(p25)')
			putexcel J`j' = (`r(p50)')
			putexcel K`j' = (`r(p75)')
		
			loc j = `j' + 1
			}
			n di as result "Analysis completed for `x'"
		}
	}
	
	end
	

