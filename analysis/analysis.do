
  use "${clone}/data/construted_auto.dta", clear

  local texfile "${clone}/output/balance-table.tex"

  iebaltab weight price , savetex("`texfile'") ///
    groupvar(treatment) replace
