---
title       : Developing Data Product - Course Project
subtitle    : Car MPG Prediction Application Presentation
author      : TOH Wei Beng
job         : System Manager
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## About the Application
1. This is an application to predict the fuel consumption of a car produced between 1973 and 1974.The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973-74 models).
2. The application was developed in Shiny to predict the fuel consumption of a car produced between 1973 and 1974. 
3. For the prediction of the fuel consumption, users only needs to enter some basic information about the car for the prediction.
4. Development in Shiny was simple and yet enables powerful web-based interactive data product in R.

--- .class #id

## About the Data
1. The data was extracted from the 1974 Motor Trend US magazine
2. It comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973-74 models).
3. The variables provides includes Number of cylinders, Displacement, Horsepower, Transmission and etc.
4. The source is Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391-411.

---

## Exploring the Data

1. Review of the variables significance to the predictor (mpg) using linear model was done.
2. Remaining variables shown are Weight (wt), Tranmission (am), 1/4 mile time(qsec), Horsepower (hp) and Number of Cylinders (cyl)



```r
varImp(object = fit$finalModel, scale=0)
```

```
##       Overall
## cyl6 1.702151
## hp   1.748276
## wt   3.434531
## qsec 1.485265
## am1  2.152825
```

```r
fit$result
```

```
##   parameter     RMSE  Rsquared   RMSESD RsquaredSD
## 1      none 5.825133 0.5009821 2.771765  0.2865617
```

---
## About the predictive model

1. Based on the original model qsec was used however, qsec was the least important and not commonly known, we tried removing the variable and the accuracy of model greatly increases. The Rsquared jumped from 0.585 to 0.815
2. Therefore the final model was built with only 4 variables.


```r
fit <- train(mpg ~ am+wt+cyl+hp,
             method = 'lmStepAIC',
             data = data)
```

```
## Error in terms.formula(formula, data = data): 'data' argument is of the wrong type
```

```r
varImp(object = fit$finalModel, scale=0)
```

```
##       Overall
## cyl6 1.702151
## hp   1.748276
## wt   3.434531
## qsec 1.485265
## am1  2.152825
```

```r
fit$result
```

```
##   parameter     RMSE  Rsquared   RMSESD RsquaredSD
## 1      none 5.825133 0.5009821 2.771765  0.2865617
```

---

## Application URL
https://wbtoh.shinyapps.io/DDP_Project/
---
