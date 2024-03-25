#### Preamble ####
# Purpose: Download and Read in Prenatal Mental Health Data from National Library of Medicine
# Author: Boxuan Yi
# Email: boxuan.yi@mail.utoronto.ca
# Date: 24 March 2024
# Prerequisites: Know where to download the dataset

# The dataset was downloaded manually from https://osf.io/ha5dp/, 
# and uploaded as inputs/data/OSFData_Upload_2023_Mar30.csv

# install.packages('rstanarm')
# install.packages('modelsummary')
# install.packages('ggplot2')
# install.packages('dplyr')
# install.packages('readr')
# install.packages('janitor')
# install.packages('arrow')
# install.packages('here')
# install.packages('broom')
# install.packages('knitr')

raw_data <- read.csv("inputs/data/OSFData_Upload_2023_Mar30.csv")