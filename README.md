# Prenatal Mentaln Health
## Overview
This paper uses logistic regression to estimate whether a pregnant individual would experience at least moderate level of depression or anxiety at the beginning of the Covid-19 pandemic. The results show that the perceived threats to oneself and the unborn child are strongly correlated to the mental distress. Young pregnant individuals with lower levels of education and from lower-income families are also more likely to experience depression.

The dataset used in this repo could be found at https://osf.io/ha5dp/. 

## File Structure
The repo is structured as:
-  `outputs` contains the files used to generate the paper, including the Quarto document, reference bibliography, and the PDF of the paper. 
-  `inputs` contains both raw and cleaned dataset used to analyze in the paper.
-  `model` contains two models, one for depression and one for anxiety.
-  `scripts` contains the R scripts used to simulate, download, clean and test the data, as well as the codes that create the models.
-  `other` contains `sketches`, `llm`, and `datasheet`.

## Packages Installization
The codes used to install packages are in `scripts/01-download.R`, with `#` before each code.

## LLM Usage
ChatGpt was used for correcting grammar and modifying codes. The chats can be found in `other/llm/llm.txt`. No other LLM was used.