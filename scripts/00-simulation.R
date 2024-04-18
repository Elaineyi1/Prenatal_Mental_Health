# Purpose: Simulate the survey data about prenatal mental health
# Author: Boxuan Yi
# Email: boxuan.yi@mail.utoronto.ca
# Date: 31 March 2024
# Prerequisites: Download and get familiar with the survey dataset

# Simulation
income = c("$200,000+", "$100,000 - $124,999", "$40,000 - $69,999", "$70,000 - $99,999", "$20,000 - $39,999", "$125,000 - $149,999", "$150,000 - $174,999","$175,000 - $199,999", "Less than $20,000")
education = c('Masters degree','Undergraduate degree','College/trade school','Doctoral Degree','High school diploma','Less than high school diploma')
month = c("May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")

simulated_data <-
  tibble("ID" = 1:500,
         "maternal_age" = sample(17:50, 500, replace = TRUE),
         "household_income" = sample(income, 500, replace = TRUE),
         "maternal_education" = sample(education, 500, replace = TRUE),
         "birth_length" = sample(40:65, 500, replace = TRUE),
         "birth_weight" = sample(2700:4800, 500, replace = TRUE),
         "delivery_mode" = sample(c("c-section", "vaginally"), 500, replace = TRUE),
         "language" = sample(c("English", "French"), 500, replace = TRUE),
         "threaten_life" = sample(0:100, 500, replace = TRUE),
         "threaten_baby_danger" = sample(0:100, 500, replace = TRUE),
         "threaten_baby_harm" = sample(0:100, 500, replace = TRUE),
         "month" = sample(month, 500, replace = TRUE),
         "Edinburgh_Postnatal_Depression_Scale" = sample(0:30, 500, replace = TRUE),
         "PROMIS_scale" = sample(7:35, 500, replace = TRUE))
simulated_data <- simulated_data |> mutate("EPDS" = Edinburgh_Postnatal_Depression_Scale/30,
                         "PROMIS" = (PROMIS_scale-7)/28)



# Tests
max(simulated_data$PROMIS) <= 1
max(simulated_data$EPDS) <= 1
max(simulated_data$threaten_life) <= 100
max(simulated_data$threaten_baby_danger) <= 100
max(simulated_data$threaten_baby_harm) <= 100

min(simulated_data$PROMIS) >= 0
min(simulated_data$EPDS) >= 0
min(simulated_data$threaten_life) >= 0
min(simulated_data$threaten_baby_danger) >= 0
min(simulated_data$threaten_baby_harm) >= 0

length(unique(simulated_data$household_income)) <= 9
length(unique(simulated_data$maternal_education)) <= 6

stopifnot(is.numeric(simulated_data$maternal_age),
          is.numeric(simulated_data$birth_weight),
          is.numeric(simulated_data$birth_length),
          is.numeric(simulated_data$EPDS),
          length(unique(simulated_data$household_income)) <= 9,
          length(unique(simulated_data$maternal_education)) <= 6,
          is.numeric(simulated_data$PROMIS))

stopifnot(unique(simulated_data$language) %in% c("English", "French"),
          length(unique(simulated_data$month)) <= 8,
          length(unique(simulated_data$delivery_mode)) == 2,
          class(simulated_data$language) == "character",
          class(simulated_data$delivery_mode) == "character")
