getwd()


library(optiRum)

myfun <- function(per, int, loan, pymt) {
    a <- loan
    paid <- 0
    p <- c()
    for(x in 1:per){
        a <- a * (1+int)
        a <- a - pymt
        p[x] <- a
    }
    p
    
}

shinyServer(
    function(input, output) {
        w <- reactive({input$APR / 100})
        t <- reactive({w()/12})
        output$prediction <- renderPrint({-1 * PMT(t(), input$Periods, input$Loan)})
        pymts <- reactive({-1 * PMT(t(), input$Periods, input$Loan)})
        output$test <- renderPrint({pymts()})
        y <- reactive({myfun(input$Periods, t(), input$Loan, pymts())})
        z <- reactive({c(input$Loan, y())})
        e <- reactive({input$Periods})
        output$newHist <- renderPlot({
            plot(0:e(), z(), type = "l", lwd= 3, main = "Outstanding Loan Balance", xlab="Month Number",
                 ylab="Outstanding Balance $")
            grid()
            }
    )})

    
    
    
    
    
    
