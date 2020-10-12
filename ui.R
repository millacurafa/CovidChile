#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
# library(rsconnect)
# imports server
source("server.R")



# Define UI for application that draws a histogram
ui <- fluidPage(
    
    fluidRow(
      column(4,
             titlePanel("Analisis Covid19")),
      column(2, offset = 6,
             dateInput("date", 
                       label = "Fecha",
                       value = "2020-10-05")),
      
    ),
    fluidRow(
    tabsetPanel(
               # ---- First tab to be created ----
               tabPanel("Nacional",
                        sidebarLayout(
                          sidebarPanel(
                          # Copy the line below to make a date range selector
                          dateRangeInput("dates", label = h3("Rango de Fechas")),
                          
                          ),
                        # Show a plot of the generated distribution
                        mainPanel(
                            # plotOutput("activosActuales")
                        )
                        
                        )
               ),
               # ---- Second tab to be created ----
               tabPanel("Regional",
                        # Show a plot of the generated distribution
                        mainPanel(
                          plotOutput("activosActuales")
                        )
               ),
               
               # ---- Third tab to be created ----
               tabPanel("Comunal",
                       sidebarLayout(
                         
                         # Show a plot of the generated distribution
                         mainPanel(
                           # plotOutput("activosActuales")
                         ),
                         sidebarPanel(
                           # Copy the chunk below to make a group of checkboxes
                           checkboxGroupInput("checkGroup", label = h3("Checkbox group"), 
                                              choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3),
                                              selected = 1),
                         )
                       ) 
               ),
               # ---- Fourth tab to be created ----
               tabPanel("Otros", 
                        # Show a plot of the generated distribution
                        mainPanel(""
                         
                        )
               )
              
        
    )

)
)

# Run the application 
shinyApp(ui = ui, server = server)
