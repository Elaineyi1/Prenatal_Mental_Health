#### Preamble ####
# Purpose: Create models to estimate the level of depression and anxiety using stan_glm()
# Author: Boxuan Yi
# Email: boxuan.yi@mail.utoronto.ca
# Date: 24 March 2024
# Prerequisites: Have predictors

library(rstanarm)
library(here)

clean_data <- read_csv(
  file = here("inputs/data/cleaned_mental_health.csv"),
  show_col_types = FALSE
)

# Setting levels
age_levels <- c("Under 27", "27 to 34", "35 to 39", "40 and above")
income_levels <- c("Less than $20,000", "$20,000 - $39,999", "$40,000 - $69,999", 
                   "$70,000 - $99,999", "$100,000 - $124,999", "$125,000 - $149,999",
                   "$150,000 - $174,999", "$175,000 - $199,999", "$200,000+")
education_levels <- c("Less than high school diploma", "High school diploma", "College/trade school", 
                      "Undergraduate degree", "Masters degree", "Doctoral Degree")
month_levels <- c("Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
clean_data$age_group <- factor(clean_data$age_group, levels = age_levels)
clean_data$household_income <- factor(clean_data$household_income, levels = income_levels)
clean_data$maternal_education <- factor(clean_data$maternal_education, levels = education_levels)
clean_data$month <- factor(clean_data$month, levels = month_levels)


# Depression Model
depression_model <-
  stan_glm(
    EPDS ~ age_group + household_income + language + maternal_education + threaten_life + threaten_baby_danger,
    data = clean_data,
    family = binomial(link = "logit"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = 
      normal(location = 0, scale = 2.5, autoscale = TRUE),
    seed = 777
  )

saveRDS(
  depression_model,
  file = "model/depression.rds"
)

# Anxiety Model
anxiety_model <-
  stan_glm(
    PROMIS ~ age_group + household_income + language + maternal_education + threaten_life + threaten_baby_danger,
    data = clean_data,
    family = binomial(link = "logit"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = 
      normal(location = 0, scale = 2.5, autoscale = TRUE),
    seed = 777
  )

saveRDS(
  anxiety_model,
  file = "model/anxiety.rds"
)

