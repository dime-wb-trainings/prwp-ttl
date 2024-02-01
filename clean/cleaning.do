
  sysuse auto, clear

  * Conversion rates length
  local in_to_m = 0.0254
  local ft_to_m = 0.3048

  * Conversion rates volume
  local in3_to_m3 = 1.6387E-5
  local ft3_to_m3 = 0.0283168

  * Conversion rates weight
  local lbs_to_kg = 0.453592

  * Change units to metric

  * Inches to meter
  replace headroom = headroom * `in_to_m'
  label variable headroom "Headroom (m)"

  replace length = length * `in_to_m'
  label variable length "Length (m)"

  * Feet to meter
  replace turn = turn * `in_to_m'
  label variable turn "Turn circle (m)"

  * Cubic feet to cubic meters
  replace trunk = trunk * `ft3_to_m3'
  label variable trunk "Trunk space (m3)"

  * Cubic inches to cubic meters
  replace displacement = displacement * `in3_to_m3'
  label variable displacement "Displacement (m3)"

  * Pounds to kg
  replace weight = weight * `lbs_to_kg'
  label variable weight "Weight (kg)"


  save "${clone}/data/clean_auto.dta", replace
