library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Project - Monthly Payment Calculator"),
    sidebarPanel(
        h1('Loan Information'),
        numericInput('APR', 'Annual Interest Rate %', 10, min = 1, max = 25, step = .01),
        
        #sliderInput('APR', 'Interest Rate per Period (Decimal)', 0.1, min=0.001, max=.3, step = .001),
        numericInput('Periods', 'Number of Months', 36, min=1, max=200, step=1),
        #checkboxGroupInput("TimeType", "Months/Years",
                           #c("Months" = 12,
                           #  "Years" = 1
                           #  )),
        numericInput('Loan', 'Loan Amount', 10000, min = 1, max = 1000000),
        submitButton('Submit')
        ),
    mainPanel(
        tabsetPanel(
            tabPanel("Main",                   
                h3('Your Monthly Payment Would Be: '),
                verbatimTextOutput('prediction'),
                plotOutput('newHist')),
            tabPanel("Documentation",
                 p('All you need to do is enter in the loan information in the left side panel and the 
                   monthly payment and outstanding balance graph will be displayed.'),
                 p('You need to click "Submit" button for changes in input to calculate.'),
                 p('You cannot enter a negative number or a 0 for any input.'),
                 p('You can manually enter in higher values than the arrows allow.'),
                 p('Be aware that "Annual Interest Rate" input is not the monthly interest rate. It is the
                yearly rate.'),
                p('This calculator assumes a fixed interest rate.'),
                 p('If all you have on the loan information are in terms of years, be sure to multiply years by
                    12 to get number of months.'),
                p('The "Outstanding Loan Balance" plot is meant to show you the rate at which 
                  your payments are actually reducing loan balance')
    )))))

