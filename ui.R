#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
# library(rsconnect)
# imports server
source("server.R")


# Define UI for application that draws a histogram
ui <- fluidPage(
  theme = shinytheme("spacelab"),
  #Generates the header
  fluidRow(
    column(4,
           h2(paste("Analisis Covid19", print("🇨🇱")))
    ), #closes column
    
    column(4, offset = 1,
           selectInput("select", label = "Datos a analizar", 
                       choices = list("Casos totales" = 1, 
                                      "Casos activos" = 2, 
                                      "Fallecimientos totales " = 3,
                                      "Test de PCR" = 4,
                                      "Pacientes en UTI" =5
                       ), 
                       selected = 1),
    ),#closes column
    
    column(2, offset = 1,
           dateInput("date", 
                     label = "Fecha",
                     value = "2020-10-05")
    ),#closes column
    
  ),#closes fluidRow
  
  #Generate tabs
  fluidRow(
    # class="",
    tabsetPanel(
      # type= "",
      # ---- First tab to be created ----
      tabPanel("Nacional",
               br(),
               fluidRow(
                 column(3,
                        # Copy the line below to make a date range selector
                        dateRangeInput("dates", label = h3("Rango de Fechas"))
                 ), #closes column
                 # Show a plot of the generated distribution
                 column(9,
                        plotOutput("timeSeries")
                 ) #closes column
               ) #closes fluidRow
      ), #closes tab
      # ---- Second tab to be created ----
      tabPanel("Regional",
               br(),
               fluidRow(# Show a plot of the generated distribution
                 column(1,
                      
                 ),
                 column(10,
                        plotOutput("activosActuales")
                 ), #closes column
                 column(1,
                       
                 )
               )#closes fluidRow
      ), #closes tab
      
      # ---- Third tab to be created ----
      tabPanel("Comunal",
               br(),
               fluidRow(      
                 # Show a plot of the generated distribution
                 column(9,
                        plotOutput("misc2")
                 ), #closes column
                 column(3,
                        
                        # Copy the line below to make a select box 
                        selectInput("selectRegion", label = h3("Elegir Región"), 
                                    choices = list("Arica y Parinacota" = 1,
                                                   "Tarapacá" = 2, 
                                                   "Antofagasta" = 3,
                                                   "Atacama" = 4,
                                                   "Coquimbo" = 5,
                                                   "Valparaíso" = 6,
                                                   "Metropolitana" = 7,
                                                   "O’Higgins" = 8,
                                                   "Maule" = 9,
                                                   "Ñuble" = 10,
                                                   "Biobío" = 11,
                                                   "Araucanía" = 12,
                                                   "Los Ríos" = 13,
                                                   "Los Lagos" = 14,
                                                   "Aysén" = 15,
                                                   "Magallanes" = 16
                                                   ), 
                                    selected = 1),
                        # Copy the chunk below to make a group of checkboxes
                        checkboxGroupInput("checkGroup", label = h3("Comunas a analizar"), 
                                           choices = list("Comuna 1" = 1, "Comuna 2" = 2, "Comuna 3" = 3),
                                           selected = 1),
                 ) #closes column
               )#closes fluidRow
      ), #closes tab
      # ---- Fourth tab to be created ----
      tabPanel("Otros", 
               br(),
               fluidRow(
                 # Show a plot of the generated distribution
                 column(12,
                        plotOutput("misc")
                 )#closes column
               )#closes fluidRow
      )#closes tab
    )#closes tabSetPanel
  )#closes fluidRow
) #closes fluidPage

# Run the application 
shinyApp(ui = ui, server = server, options = list(height = 600))

