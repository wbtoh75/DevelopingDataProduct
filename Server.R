library(shiny)
shinyServer(function(input, output) {
dt <- mtcars
dt$am = as.factor(dt$am)
dt$cyl = as.factor(dt$cyl)
dt$gear = as.factor(dt$gear)
library(caret)
set.seed(2345)
fit <- train(mpg ~ am+wt+cyl+hp,
             method = 'lmStepAIC',
             data = dt)

mpg <- reactive({round(predict(fit,
                          data.frame(
                          am=as.factor(as.numeric(input$am)),
                          cyl=as.factor(as.numeric(input$cyl)),
                          hp=as.numeric(input$hp),
                          wt=as.numeric(input$wt))), digits = 2)})
output$results <- renderText({paste("Predicted MPG for your selection is :", mpg())})

output$plot <-  renderPlot({
  hist(dt$mpg,
       xlab = "Fuel Consumption (mpg)",
       main = "Predicted MPG of your selection vs Fuel Consumption of all cars")
  abline(v=mpg(),col="red")})
})