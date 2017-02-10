# this is the Ui of shiny web application childGrowthRecorder

library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Recording Your Child's Growth"),
    sidebarPanel(
        textInput("name", label = h4("Child's Name (optional):"), 
                  value = "Child"),
        radioButtons("gender", label = h4("Child's Gender:"),
                     choices = list("Girl" = 0,"Boy" = 1),
                     selected = 0, inline = TRUE),
        
        h4("You Just Recorded:"),
        verbatimTextOutput("present"),
        actionButton("clear", "Clear Recent Record"),
        br(),
        br(),
        selectInput("select", label = h4("Download Data"), 
                    choices = list("Growth Curve" = 1, "Weight Curve" = 2), 
                    selected = 1),
        downloadButton('downloadPlot', 'Download'),
        hr(),
        fluidRow(
            p("Usage: double click to add a record; clear recent botton to
              delete most recent record; download botton to download the 
              drawed plot.")
            ),
        # Create document linkage
        fluidRow(p("World Health Organization: ", 
                   a("Weight-for-age", 
                     href = "http://www.who.int/childgrowth/standards/weight_for_age/en/"),
                   br(),
                   a("Height-for-age", 
                     href = "http://www.who.int/childgrowth/standards/height_for_age/en/"))
        ),
        fluidRow(p("Github: ", 
                   a("code", 
                     href = "https://github.com/fangchun007/recordChildGrowth")
        )),
        width = 3
    ),
    mainPanel(
        tabsetPanel(id = "tabs",
                    tabPanel( 'Growth Curve', value = "tab1",
                              # fluidRow(
                              # Create a space for the plot output
                              plotOutput(
                                  "dynamicPlot", "100%", "600px", dblclick="plot_dblClick"
                              ),
                              # ),
                              checkboxGroupInput("percentiles", label = p("Reference Percentiles"), 
                                                 choices = list("0.1%" = "01", "1%" = "1", "3%" = "3", "5%" = "5",
                                                                "10%" = "10", "15%" = "15", "25%" = "25", "50%" = "50",
                                                                "75%" = "75", "85%" = "85", "90%" = "90", "95%" = "95",
                                                                "97%" = "97", "99%" = "99", "99.9%" = "999"),
                                                 selected = NULL, inline = TRUE)
                    ),
                    tabPanel('Weight Curve', value = "tab2",
                             plotOutput(
                                 "dynamicPlot2", "100%", "600px", dblclick="plot_dblClick"
                             ),
                             checkboxGroupInput("percentiles2", label = p("Reference Percentiles"), 
                                                choices = list("0.1%" = "01", "1%" = "1", "3%" = "3", "5%" = "5",
                                                               "10%" = "10", "15%" = "15", "25%" = "25", "50%" = "50",
                                                               "75%" = "75", "85%" = "85", "90%" = "90", "95%" = "95",
                                                               "97%" = "97", "99%" = "99", "99.9%" = "999"),
                                                selected = NULL, inline = TRUE)
                    )
                    # tabPanel('BMI Calculator', value = "tab3",
                    #          textInput("heightIn", label = h4("Height in cm:"), 
                    #                    value = NULL),
                    #          textInput("weightIn", label = h4("Weight in kg:"), 
                    #                    value = NULL),
                    #          hr(),
                    #          h4("BMI coefficient (kg/m^2)"),
                    #          fluidRow(column(3, verbatimTextOutput("BMIvalue")))
                    #          )
                    
        )
    )
)
)
