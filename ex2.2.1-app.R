library(shiny)

ui <- fluidPage(
  verbatimTextOutput("text1"),
  textOutput("text2"),
  verbatimTextOutput("text3"),
  verbatimTextOutput("text4"),
)

server <- function(input, output, session) {
  output$text1 <- renderPrint(summary(mtcars))
  output$text2 <- renderText("Good morning!")
  output$text3 <- renderPrint(t.test(1:5, 2:6))
  output$text4 <- renderPrint(lm(mpg ~ wt, data = mtcars))
}

shinyApp(ui, server)
