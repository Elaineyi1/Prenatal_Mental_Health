#### Preamble ####
# Purpose: Clean the Dataset from National Library of Medicine
# Author: Boxuan Yi
# Email: boxuan.yi@mail.utoronto.ca
# Date: 24 March 2024
# Prerequisites: None

library(janitor)
library(dplyr)
library(arrow)

raw_data <- clean_names(raw_data) 
raw_data <- raw_data |> 
  select(maternal_age, household_income, edinburgh_postnatal_depression_scale, promis_anxiety, 
         delivery_date_converted_to_month_and_year, birth_length, birth_weight, maternal_education, 
         delivery_mode, language, threaten_life, threaten_baby_danger, threaten_baby_harm)

raw_data_complete <- raw_data[complete.cases(raw_data), ]

raw_data_complete <- raw_data_complete |> filter(household_income != "") |> 
  filter(maternal_education != "") |>
  mutate(month = substr(delivery_date_converted_to_month_and_year, 1, 3),
         year = substr(delivery_date_converted_to_month_and_year, 4, 7),
         age_group = case_when(
           maternal_age < 27 ~ 'Under 27',
           maternal_age >= 27 & maternal_age < 35 ~ '27 to 34',
           maternal_age >= 35 & maternal_age < 40 ~ '35 to 39',
           maternal_age >= 40 ~ '40 and above'),
         income = case_when(
           household_income == "$200,000+" ~ "$200,000+",
           household_income == "$100,000 -$124,999" ~ "$100,000 - $124,999",
           household_income == "$40,000-$69,999" ~ "$40,000 - $69,999",
           household_income == "$70,000-$99,999" ~ "$70,000 - $99,999",
           household_income == "$20,000- $39,999" ~ "$20,000 - $39,999",
           household_income == "$125,000- $149,999" ~ "$125,000 - $149,999",
           household_income == "$150,000 - $174,999" ~ "$150,000 - $174,999",
           household_income == "$175,000- $199,999" ~ "$175,000 - $199,999",
           household_income == "Less than $20, 000" ~ "Less than $20,000"),
         EPDS = edinburgh_postnatal_depression_scale/30,
         PROMIS = (promis_anxiety-7)/28,
         threaten_life = threaten_life/100,
         threaten_baby_danger = threaten_baby_danger/100,
         threaten_baby_harm = threaten_baby_harm/100)

clean_data <- raw_data_complete |>  filter(year == '2020') |> filter(month != 'Apr') |>
  select(age_group, maternal_age, income, maternal_education, birth_weight, birth_length,
         delivery_mode, language, threaten_life, threaten_baby_danger, threaten_baby_harm, 
         month, EPDS, PROMIS) |>
  rename(household_income = income)

write.csv(
  x = clean_data,
  file = "inputs/data/cleaned_mental_health.csv"
)

write_parquet(x = clean_data,
              sink = "inputs/data/cleaned_mental_health.parquet")


