
  use "${clone}/data/construted_auto.dta", clear

  * Balance table

  local texfile "${clone}/output/balance-table.tex"
  iebaltab weight price , savetex("`texfile'") ///
    groupvar(treatment) replace

  * Scatter plot
  scatter weight price, name("my_graph", replace)
  graph export "${clone}/output/scatter.png", name("my_graph") replace
