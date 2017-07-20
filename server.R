# Coursera DDP Course Project

portrets <- function(DF,wts,rebal){
        wts <- as.numeric(wts)
        DF <- Return.calculate(DF,method = "discrete")
        DF$portf <- Return.portfolio(DF,weights = wts, rebalance_on=rebal)
        DF[1,] <- 0
        DF
}

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
        DF <- readRDS('./Data/DF.Rds')
        
        getwts <- function(){
                weights <- as.numeric(c(input$w1,input$w2,input$w3,
                                        input$w4, input$w5))
                weights <- weights/sum(weights)
                weights
        }
        
        
        model <- eventReactive(input$action, {
                weights <- getwts()
                rs <- portrets(DF,weights, input$rebal)
                sr <- SharpeRatio(rs$portf)[1,1]
                ar <- Return.annualized(rs$portf)
                md <- maxDrawdown(rs$portf)
                draws <- drawdownsStats(timeSeries(rs$portf))
                maxdd <- interval(start=ymd(draws[1,2]),end=ymd(draws[1,3]))
                wk <- maxdd %/% weeks(1)
                list(rets=rs, AR=ar, SR=sr, MD=md, WK=wk)
        })
        
        output$plot1 <- renderPlotly({
                
                weights <- getwts()
                rets <- portrets(DF,weights, input$rebal)
                df <- cumprod(1+rets)-1
                names(df)[6] <- "Portfolio"
                dfp <- as.data.frame(df) %>%
                        gather(ETF, Cumulative_Return) %>%
                        mutate(Date=rep(time(df),6))
                plot_ly(dfp, x=~Date, y=~Cumulative_Return, color=~ETF, type='scatter', mode='lines')
        })
        output$sharpe <- renderText({
                paste("Sharpe ratio:  ",round(model()$SR,2))
                })
        
        output$maxdd <- renderText({
                paste("Maximum drawdown:  ",round(model()$MD*100,2),"%")
        })
        
        output$recovery <- renderText({
                paste("Recovery time:  ",model()$WK," weeks")
        })
        
        output$annRet <- renderText({
                paste("Annualised return: ", round(model()$AR*100,2),"%")
        })
})
