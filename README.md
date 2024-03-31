# Prenatal Mentaln Health
## Overview
This paper uses logistic regression to estimate whether a pregnant individual would experience at least moderate level of depression or anxiety at the beginning of the Covid-19 pandemic. The results show that the perceived threats to oneself and the unborn child are strongly correlated to the mental distress. Young pregnant individuals with lower levels of education and from lower-income families are more likely to experience depression.

The dataset used in could be found at https://osf.io/ha5dp/. This raw dataset is uploaded to `inputs/data` and is added to .gitignore.

## File Structure
The repo is structured as:
-  `outputs` contains the files used to generate the paper, including the Quarto document and reference bibliography, as well as the PDF of the paper. 
-  `inputs` contains the cleaned dataset used to analyze in the paper.
-  `model` contains two models, one for depression and one for anxiety.
-  `scripts` contains the R scripts used to simulate, download, clean and test the data, as well as the codes that create the models.
-  `other` contains `sketches`, `llm`, and `datasheet`.

## Packages Installization
The codes used to install packages are in `scripts/01-download.R`, with `#` before each code.

## LLM Usage
ChatGpt was used for correcting grammar. The chat can be found in `other/llm/llm.txt`. No other LLM was used.