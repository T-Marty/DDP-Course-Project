#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  titlePanel("Portfolio Analysis"),
  sidebarLayout(
    sidebarPanel(
            selectInput(inputId="rebal", label = "Rebalance Frequency",
                        choices=c("days", "weeks", "months", "years"), 
                        selected = "years"),
            sliderInput(inputId="w1", label = "VEU", value = 0.2, min=0,
                         max = 1, step=0.1),
            sliderInput(inputId="w2", label = "SPX", value = 0.2, min=0,
                         max = 1, step=0.1),
            sliderInput(inputId="w3", label = "GOLD",value = 0.2, min=0,
                         max = 1, step=0.1),
            sliderInput(inputId="w4", label = "ASX", value = 0.2, min=0,
                         max = 1, step=0.1),
            sliderInput(inputId="w5", label = "VGB", value = 0.2, min=0,
                        max = 1, step=0.1),
            actionButton("action", 'Analyse Portfolio')
    ),
    mainPanel(
            h3("Cumulative Return History"),
            plotlyOutput("plot1"),
            h4("Portfolio Metrics"),
            textOutput("annRet"),
            textOutput("sharpe"),
            textOutput("maxdd"),
            textOutput("recovery")
    )
  )
))
