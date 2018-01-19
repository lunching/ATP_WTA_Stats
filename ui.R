library(shiny)
library(shinythemes)

shinythemes::themeSelector()
navbarPage(
  theme = shinytheme("cerulean"),
  "Dr. Chang's Tennis",
  # First bar: Title Search
  tabPanel("Title Search",
           sidebarPanel(
             radioButtons("gender_bar1", label = h3("Gender"),
                          choices = list("Men" = 1, "Women" = 2), 
                          selected = 1),
             sliderInput("yr_range_bar1", h3("Year Range:"),
                         min = 1968, max = 2015, value = c(2009,2010)),
             textInput("player_name_bar1", h3("Player's Name"), "Rafael Nadal"),
             actionButton("action_bar1", "Update")
             #submitButton("Update")
           ),
           mainPanel(
             textOutput("Message_bar1"),
             tableOutput("Stat_Table_bar1")
           )
  ),
  # Second bar: Player's year Summary
  tabPanel("Player's Year Summary",
           sidebarPanel(
             radioButtons("gender_bar2", label = h3("Gender"),
                          choices = list("Men" = 1, "Women" = 2), 
                          selected = 1),
             selectInput('yr_bar2', h3('Year'),
                         choices = c(1968:2015), selectize = FALSE),
             textInput("player_name_bar2", h3("Player's Name"), "Rafael Nadal"),
             actionButton("action_bar2", "Update")
           ),
           mainPanel(
             textOutput("Message_bar2"),
             tableOutput("Stat_Table_bar2")
           )
  ),
  # Third bae: Championship Search
  tabPanel("Championship Search",
           sidebarPanel(
             radioButtons("gender_bar3", label = h3("Gender"),
                          choices = list("Men" = 1, "Women" = 2), 
                          selected = 1),
             selectInput("yr_bar3", h3("Year"),
                         choices = c(1968:2015), selectize = FALSE),
             #selectInput("tourney_bar3", h3("Select Tourney"),
             #                choices = NULL),
             selectizeInput("tourney_bar3", h3("Select Tourney(s)"),
                           choices = NULL, multiple = TRUE),
             actionButton("action_bar3", "Update")
             
           ),
           mainPanel(
             tableOutput("Stat_Table_bar3")
             
           )
           
  )
  
)
