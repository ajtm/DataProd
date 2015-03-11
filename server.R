
data(mtcars)
mod <- lm(qsec ~ wt+cyl+hp+am, data=mtcars)

shinyServer(
  function(input, output, session) {
    output$prediction <- renderPrint({
	    wtx <- input$wt
	    hpx <- input$hp
	    ## work around a sliderInput bug that can return illegal values
	    if (class(input$wt) != "numeric") {
	        updateSliderInput(session, "wt", value=1.5)
	        wtx <- 1.5
	    }
	    if (class(input$hp) != "numeric") {
		    updateSliderInput(session, "hp", value=55)
		    hpx <- 55
	    }
	    mpg <- predict(mod, data.frame(wt=wtx,
	                            cyl=as.integer(input$cyl),
				    hp=hpx,
				    am=as.integer(input$am)))
	    paste(round(mpg, 2), "seconds")
      })
    
  }
)

