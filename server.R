shinyServer(
  function(input, output) {
    data  <- read.csv2("european-reserves-by-country.csv",sep=",")
    data$date <- as.Date(data$date)
    output$country <- renderPrint({input$country})
    output$period <- renderPrint({
           if(input$period==1)
              "2000-03-01 and 2014-03-01"
           else
             paste(input$start,"and",input$end) 
           })
    output$summary  <- renderTable({
      if(input$period==2)
      {
        filter <- data$date > as.Date(input$start) & data$date < as.Date(input$end) 
        
        useDataFilter <- data[filter,c("date",input$country)]
      }
      else
      {
        useDataFilter <- data[,c("date",input$country)]
      }
      summary(useDataFilter)
      
    })
    output$myHist <- renderPlot({
      if(input$period==2)
      {
        filter <- data$date > as.Date(input$start) & data$date < as.Date(input$end) 
      
        useDataFilter <- data[filter,c("date",input$country)]
      }
      else
      {
        useDataFilter <- data[,c("date",input$country)]
      }
      names(useDataFilter)[2]<-"country"
      
      qplot(x=date,y=country,data=useDataFilter,ylab="Gold reserve (Tonnes)",
            main =  input$country )
      
    })
})