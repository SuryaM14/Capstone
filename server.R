#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

suppressPackageStartupMessages(c(
  library(shinythemes),
  library(shiny),
  library(tm),
  library(stringr),
  library(markdown),
  library(stylo)))

source("./inputprocess.R")
data4f <- readRDS(file="./data/data4f.rds")
data3f <- readRDS(file="./data/data3f.rds")
data2f <- readRDS(file="./data/data2f.rds")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  wordPrediction <- reactive({
    text <- input$text
    textInput <- cleanInput(text)
    wordCount <- length(textInput)
    wordPrediction <- nextWordPrediction(wordCount,textInput)})
  
  output$predictedWord <- renderPrint(wordPrediction())
  output$enteredWords <- renderText({ input$text }, quoted = FALSE)
})
