library(tidyverse)

# Read in the data.  Do some cleaning/verification
MaxTemp <- Flag_Temp <- read_csv("https://raw.githubusercontent.com/BuscagliaR/STA_444_v2/master/data-raw/FlagMaxTemp.csv") %>%
  pivot_longer(
    4:34,
    names_to = "Day",
    values_to = "MaxTemp"
  ) %>%
  drop_na() %>%
  mutate(Date = mdy(paste(Month, Day, Year))) %>%
  select(Date, MaxTemp)

# Save the data frame to the data/ directory as MaxTemp.rda
usethis::use_data(MaxTemp)
