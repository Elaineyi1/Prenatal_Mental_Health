library(arrow)
library(readr)
library(here)

clean_data <- read_csv(
  file = here("inputs/data/cleaned_mental_health.csv"),
  show_col_types = FALSE
)
