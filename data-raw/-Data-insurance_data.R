## code to prepare `../../Data/insurance_data` dataset goes here

raw_dat <- read.csv("data-raw/insurance_data.csv") |>
  dplyr::mutate(MARITAL_STATUS = ifelse(MARITAL_STATUS == "Y", 1, 0)) |>
  dplyr::mutate(EMPLOYMENT_STATUS = ifelse(EMPLOYMENT_STATUS == "Y", 1, 0))

LI_data <- raw_dat |>
  dplyr::filter(INSURANCE_TYPE == "Life")

HI_data <- raw_dat |>
  dplyr::filter(INSURANCE_TYPE == "Health")

PI_data <- raw_dat |>
  dplyr::filter(INSURANCE_TYPE == "Property")

usethis::use_data(LI_data, HI_data, PI_data, overwrite = TRUE)
