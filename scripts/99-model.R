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

# Depression Model
depression_model <-
  stan_glm(
    EPDS ~ age_group + household_income + language + month,
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
    PROMIS ~ age_group + household_income + language + month,
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
