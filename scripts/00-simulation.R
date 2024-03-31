# Purpose: Simulate the survey data about prenatal mental health
# Author: Boxuan Yi
# Email: boxuan.yi@mail.utoronto.ca
# Date: 31 March 2024
# Prerequisites: Download and get familiar with the survey dataset

income = c("$200,000+", "$100,000 - $124,999", "$40,000 - $69,999", "$70,000 - $99,999", "$20,000 - $39,999", "$125,000 - $149,999", "$150,000 - $174,999","$175,000 - $199,999", "Less than $20,000")
education = c('Masters degree','Undergraduate degree','College/trade school','Doctoral Degree','High school diploma','Less than high school diploma')
month = c("May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")

simulated_data <-
  tibble("ID" = 1:500,
         "maternal_age" = sample(17:50, 500, replace = TRUE),
         "household_income" = sample(income, 500, replace = TRUE),
         "education" = sample(education, 500, replace = TRUE),
         "birthlength" = sample(40:65, 500, replace = TRUE),
         "birthweight" = sample(2700:4800, 500, replace = TRUE),
         "delivery_mode" = sample(c("c-section", "vaginally"), 500, replace = TRUE),
         "language" = sample(c("English", "French"), 500, replace = TRUE),
         "threaten_life" = sample(0:100, 500, replace = TRUE),
         "threaten_baby_danger" = sample(0:100, 500, replace = TRUE),
         "threaten_baby_harm" = sample(0:100, 500, replace = TRUE),
         "month" = sample(month, 500, replace = TRUE),
         "EPDS" = sample(0:30, 500, replace = TRUE),
         "PROMIS" = sample(7:35, 500, replace = TRUE))
simulated_data
