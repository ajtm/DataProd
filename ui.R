
shinyUI(pageWithSidebar(
  headerPanel("Time needed to race the Quarter Mile"),
  sidebarPanel(
	       selectInput("am", label=h4("Transmission Type"),
			   choices=list("Automatic" = 0, "Manual" = 1),
			   selected = 0),
	       radioButtons("cyl", label=h4("No. of Cylinders"),
			   choices=list("4" = 4, "6" = 6, "8" = 8),
			   selected = 4, inline=TRUE),
	       sliderInput("wt", label=h4("Wt. in Tonnes (1.5 - 5)"),
			   min=1.5, max=5, value=2.0, step=0.1),
	       sliderInput("hp", label=h4("Gross Horsepower (55 - 335)"),
			   min=55, max=335, value=100, step=1)

  ),
  mainPanel(
	    h4("About this Shiny application"),
	    helpText("This page predicts the time taken for a car to travel
		     a quarter of a mile, starting from standing. It creates a
		     Linear Regression model on the mtcars dataset, and
		     then uses it for prediction. The predictors used in this
		     model are Transmission type, Number of Cylinders, Weight
		     and Gross Horsepower."),
    		     helpText("The source for this application is available at: https://github.com/ajtm/DataProd"),
	    h4("How to use this Application"),
	    helpText("You can change the parameters using the controls 
		     shown in the sidebar on the left. The predicted time will be
		     updated immediately."),
	    helpText("Transmission Type: Drop-down with values Automatic and Manual"),
	    helpText("No. of Cylinders: Radio-button with values 4, 6 and 8"),
	    helpText("Weight in tonnes: Slider with range 1.5 to 5 in steps of 0.1"),
	    helpText("Gross Horsepower: Slider with range 55 to 335 in steps of 1"),
	hr(),

    h4("Predicted time to travel a quarter mile from standing"),
    verbatimTextOutput("prediction"),
    hr(),
    h4("Disclaimer"),
    helpText("This page has been developed as a part of an assignment and
	     does not claim to provide an accurate prediction.")
  )
))


