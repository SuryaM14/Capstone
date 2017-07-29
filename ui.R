#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
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

shinyUI(navbarPage("Coursera Data Science Capstone", 
                   
                   theme = shinytheme("flatly"),
                   
                   ## Tab 1 - Prediction
                   tabPanel("Next Word Prediction",
                            fluidRow(
                              column(3),
                              column(6,
                                     tags$div(textInput("text", 
                                                        label = h3("Enter your text below:"),
                                                        value = ),
                                              tags$span(style="color:grey",("(Enter English words Only)")),
                                              br(),
                                              tags$hr(),
                                              h4("The predicted next word:"),
                                              tags$strong(tags$h3(textOutput("predictedWord"))),
                                              br(),
                                              tags$hr(),
                                              h4("You have entered:"),
                                              tags$em(tags$h4(textOutput("enteredWords"))),
                                              align="center")
                              ),
                              column(3)
                            )
                   ),
                   
                   ## Tab 2 - About 
                   tabPanel("About This Application",
                            fluidRow(
                              column(2,
                                     p("")),
                              column(8,
                                     includeMarkdown("./about/about.md")),
                              column(2,
                                     p(""))
                            )
                   )
  )
)

