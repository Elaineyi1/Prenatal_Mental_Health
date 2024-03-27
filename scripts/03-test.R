library(arrow)
library(readr)
library(here)

clean_data <- read_csv(
  file = here("inputs/data/cleaned_mental_health.csv"),
  show_col_types = FALSE
)

# Maximum and minimum of scores
max(clean_data$PROMIS) <= 1
max(clean_data$EPDS) <= 1
max(clean_data$threaten_life) <= 1
max(clean_data$threaten_baby_danger) <= 1
max(clean_data$threaten_baby_harm) <= 1

min(clean_data$PROMIS) >= 0
min(clean_data$EPDS) >= 0
min(clean_data$threaten_life) >= 0
min(clean_data$threaten_baby_danger) >= 0
min(clean_data$threaten_baby_harm) >= 0

# Groups and classes
length(unique(clean_data$age_group)) <= 4
length(unique(clean_data$household_income)) <= 9
length(unique(clean_data$maternal_education)) <= 6
is.numeric(clean_data$maternal_age)
is.numeric(clean_data$birth_weight)
is.numeric(clean_data$birth_length)
is.numeric(clean_data$EPDS)
is.numeric(clean_data$PROMIS)

unique(clean_data$language) %in% c("English", "French")
length(unique(clean_data$month)) <= 8
length(unique(clean_data$delivery_mode)) == 2

class(clean_data$language) == "character"
class(clean_data$delivery_mode) == "character"
