library(readxl)
library(janitor)
library(tidyverse)
library(scales)
library(lubridate)

poblacion <- read_csv("poblacion.csv") %>%  
  clean_names()

CasosActivosData <- read_csv("https://raw.githubusercontent.com/MinCiencia/Datos-COVID19/master/output/producto25/CasosActualesPorComuna_std.csv") %>% 
  clean_names() %>% 
  mutate(region= ifelse(region=="Aysen","Aysén",region)) %>% 
  mutate(region= ifelse(region=="Tarapaca", "Tarapacá",region)) %>% 
  mutate(region= ifelse(region=="Araucania", "Araucanía",region)) %>% 
  mutate(region= ifelse(region=="Biobio", "Biobío",region)) %>% 
  mutate(region= ifelse(region=="Valparaiso", "Valparaíso",region)) %>% 
  mutate(region= ifelse(region=="Nuble", "Ñuble",region)) %>% 
  mutate(region= ifelse(region=="Del Libertador General Bernardo O’Higgins", "O’Higgins",region)) %>% 
  mutate(region= ifelse(region=="Magallanes y la Antartica", "Magallanes",region)) %>% 
  mutate(region= ifelse(region=="La Araucania", "Araucanía",region)) %>% 
  mutate(region= ifelse(region=="Los Rios", "Los Ríos",region))

# Define server logic required to draw a histogram
server <- function(input, output) {
  # You can access the value of the widget with input$date, e.g.
  output$value <- renderPrint({ input$date })
  
  # You can access the values of the widget (as a vector of Dates)
  # with input$dates, e.g.
  output$value <- renderPrint({ input$dates })
  
  # You can access the values of the widget (as a vector)
  # with input$checkGroup, e.g.
  output$value <- renderPrint({ input$checkGroup })
  
  # You can access the value of the widget with input$selectRegion, e.g.
  output$value <- renderPrint({ input$selectRegion })
  
  # You can access the value of the widget with input$select, e.g.
  output$value <- renderPrint({ input$select })
  
  output$timeSeries <- renderPlot({
    # Dummy data
    data <- data.frame(
      day = as.Date("2017-06-14") - 0:364,
      value = runif(365) + seq(-140, 224)^2 / 10000
    )
    
    # Most basic bubble plot
    p <- ggplot(data, aes(x=day, y=value)) +
      geom_line() + 
      xlab("")
    p
  })
  
  output$activosActuales <- renderPlot({
    CasosActivosData %>% 
      filter(fecha == ymd(input$date)) %>% 
      group_by(region) %>% 
      summarise(total = sum(casos_actuales, na.rm = TRUE)) %>% 
      left_join(poblacion, by = "region")  %>% 
      mutate(por_1000_habitantes = total/(poblacion/1000)) %>% 
      arrange(region)  %>% 
      mutate(region = factor(region, levels = c("Magallanes","Aysén","Los Lagos","Los Ríos","Araucanía","Biobío","Ñuble","Maule","O’Higgins","Metropolitana","Valparaíso","Coquimbo","Atacama","Antofagasta","Tarapacá", "Arica y Parinacota"))) %>% 
      ggplot() +
      geom_col() +
      aes(x= region, 
          y= por_1000_habitantes,
          fill = (por_1000_habitantes)
      ) +
      coord_flip() +
      scale_y_continuous(labels = comma) +
      scale_fill_gradient2(low="darkgray", mid="maroon3", high="maroon4", midpoint = 10) +
      labs(title = "Casos activos de Covid19 en Chile", subtitle = "por cada 1000 habitantes", caption = paste(input$date, " \n MillacuraFA", tag= "")) +
      ylab("") +
      xlab("") +
      labs(x = "", fill = "")+
      # scale_x_discrete(position = "top") +
      # ggrepel::geom_label_repel(
      geom_label(
        aes(label = format(round(por_1000_habitantes, 0), nsmall = 0), 
            y = por_1000_habitantes,
            fontface=2,
        ),
        colour = "white",
        label.padding = unit(0.1, "lines"), # Rectangle size around label
        label.size = 0.1,
        # fill="royalblue",
        position = position_dodge(width = 1),
        hjust = 0.25, 
        # size = 2
      ) +
      theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank()) # +
    #   scale_color_gradientn(colours = rainbow(5)) 
  })
  
  output$misc <- renderPlot({
    qplot(mpg, wt, data = mtcars, colour = cyl)
    # p2 <- qplot(mpg, data = mtcars) + ggtitle("title")
    # p3 <- qplot(mpg, data = mtcars, geom = "dotplot")
    # p4 <- p1 + facet_wrap( ~ carb, nrow = 1) + theme(legend.position = "none") +
    #   ggtitle("facetted plot")
  })
  
  output$misc2 <- renderPlot({
    qplot(mpg, data = mtcars, geom = "dotplot") + facet_wrap( ~ carb, nrow = 1) + theme(legend.position = "none") + ggtitle("facetted plot")
  })
  
}
