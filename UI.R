library(shiny)
shinyUI(
  pageWithSidebar(
    headerPanel("Developing Data Products Course Project - Car MPG Prediction Application"),
    sidebarPanel(
      h3('Please select values for MPG prediction:'),
      selectInput("am", "Transmission :",
                   list("Auto" = 0,
                        "Manual" = 1)),
      selectInput("cyl", "Cylinder : ",
                   list("4" = 4,
                        "6" = 6,
                        "8" = 8)),
      numericInput("wt", 
                   "Weight (lb/1000) : ", 
                   1.001, 
                   min = 1, 
                   max = 6, 
                   step = 0.001),
      numericInput("hp", 
                   "Gross horsepower : ", 
                   70, 
                   min = 50, 
                   max = 350, 
                   step = 1),
      submitButton("Submit")
        ),
    
    mainPanel(
      tabsetPanel(
        ## subpanel to display the analysis
        tabPanel("Predicted MPG", 
                 h4('Prediction Details'),
                 textOutput("results"),
                 plotOutput("plot", width = "100%")
                 ),
        
        ##Creating a subpanel to display the Data and App
        tabPanel(
          "Instructions",
          h4('1. Select a Transmission Type from the dropdown list.'),
          h4('2. Select a Cyclinder Type from the dropdown list.'),
          h4('3. Select/Enter a Weight of the car.'),
          h4('4. Select/Enter a Horsepower of the car.'),
          h4('5. Click Submit and the Predicted MPG will appear in the "Predicted MPG" tab together with a breakdown of how the predicted mpg rank against the rest of the cars.')
          ),
        tabPanel(
          "About the application",
          h4('Brief Description'),
          div('This is an application to predict the fuel consumption
              of a car produced between 1973 and 1974.The data was extracted from the 1974 Motor Trend US magazine,
              and comprises fuel consumption and 10 aspects of automobile design 
              and performance for 32 automobiles (1973-74 models).'),
          h4('Data Exploration'),
          div('Through data exploration, 
              the variables that have statistical influence 
              to the target Miles Per Gallon (mpg) are 
              Weight (lb/1000) (wt), 
              Number of Cylinder (cyl),
              Gross Horsepower (hp),
              and Transmission (am).'),
          h4('Data Source'),
          div('Henderson and Velleman (1981), 
              Building multiple regression models interactively. 
              Biometrics, 37, 391-411.')
          )
      
    )
)))