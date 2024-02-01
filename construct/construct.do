
  * Use the clean dataset
  use "${clone}/data/clean_auto.dta", clear

  * Set version - first step in reproducible randomization
  version 14.1

  * Set seed - second step in reproducible randomization
  set seed 777296	// obtained from bit.ly/stata-random

  * Stable sort - third step in reproducible randomization
  isid make, sort

  * Randomize a treatment dummy
  gen treatment = runiform()
  sort treatment
  replace treatment = (_n/_N > .5)
  tab treatment

  * Restore original sort order
  isid make, sort

  *****************
  * standardize headroom

  qui sum price
  replace price = (price - r(mean)) / r(sd)
  label variable price "Price (z-score)"

  * Save contructed data set
  save "${clone}/data/construted_auto.dta", replace
