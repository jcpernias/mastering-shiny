library(shiny)

ui <- fluidPage(
  sliderInput("x", label = "If x is", min = 1, max = 50, value = 30),
  sliderInput("y", label = "and if y is", min = 1, max = 50, value = 30),
  "then, (x * y) is", textOutput("product"),
  "and, (x * y + 5) is", textOutput("product_plus5"),
  "and (x * y + 10) is", textOutput("product_plus10")
)

server <- function(input, output, session) {
  xy <- reactive({
    input$x * input$y
  })

  output$product <- renderText({
    xy()
  })
  output$product_plus5 <- renderText({
    xy() + 5
  })
  output$product_plus10 <- renderText({
    xy() + 10
  })
}

shinyApp(ui, server)
