* Make sure that repkit is installed
* If not, prompt user to install it from ssc
cap which repkit
if _rc == 111 {
    di as error "{pstd}You need to have {cmd:repkit} installed to run this project. Click {stata ssc install repkit} to do so.{p_end}"
    exit
}

* Kristoffer's root path
if "`c(username)'" == "wb462869" {
    global clone "C:\Users\wb462869\github\prwp-ttl"
}
else if "`c(username)'" == "" {
    global clone ""
}

* Set up adofolder
repado using "${clone}/ado"


******************************************
* Run all code for this project


* Set up data
do "${clone}/clean/cleaning.do"

* Construct data
do "${clone}/construct/construct.do"

* Analyze data
do "${clone}/analysis/analysis.do"