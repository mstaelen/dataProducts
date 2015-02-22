#init data
datemin <- "2000-03-01"
datemax <- "2014-03-01"

if(!exists("data"))
  data  <- read.csv2("european-reserves-by-country.csv",sep=",")

##shinyUI
shinyUI(pageWithSidebar(
  headerPanel("European gold reverers by country"),
  sidebarPanel(

    selectInput("country", "Choose the country:",
                names(data)[2:29]),
    radioButtons("period", "the period",
                       c("all period" = "1",
                         "Select period" = "2")),
    
    h4('note: check the period below'),
    dateInput("start", "Start period:",value=datemin,min=datemin,max=datemax),
    dateInput("end", "End period:",value=datemax,min=datemin,max=datemax)
    
  ),
  mainPanel(
    h4('Illustrating outputs'),
    h5('this is the progress of gold reserve for '),
    verbatimTextOutput("country"),
    h5('during'),
    verbatimTextOutput("period"),
    h4('summary'),
    tableOutput("summary"),
    h4('graph'),
    plotOutput('myHist')
  )
))
