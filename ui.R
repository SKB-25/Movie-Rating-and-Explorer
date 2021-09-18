
library(ggvis)


# For dropdown menu
actionLink <- function(inputId, ...) {
  tags$a(href='javascript:void',
         id=inputId,
         class='action-button',
         ...)
}

fluidPage(
  
   
fluidRow(
  column(12,
         wellPanel(style = "background: skyblue",
           tags$div(class="title", titlePanel("Movie Recommendation & Review Analysis"),
           tags$head(tags$style(".title {color: blue;
                                 font-size: 30px;
                                 font-family: Cooper;
                                 font-style: Bold; margin: auto; width: 700px;
                                 }"
           )
           )
         ),
 
      
    

 
),
  
  fluidRow(
    column(3,
           wellPanel(style = "background: #EBF4FA",
                     h4("Filter"),
             selectInput("genre", "Genre (a movie can have multiple genres)",
                         c("All", "Action", "Adventure", "Animation", "Biography", "Comedy",
                           "Crime", "Documentary", "Drama", "Family", "Fantasy", "History",
                           "Horror", "Music", "Musical", "Mystery", "Romance", "Sci-Fi",
                           "Short", "Sport", "Thriller", "War", "Western")
             ),
             sliderInput("year", "Year released", 2010, 2021, value = c(2010, 2021),
                         sep = ""),
             sliderInput("reviews", "Minimum number of reviews on IMDb",
                         10, 300, 80, step = 10),
          
             sliderInput("oscars", "Minimum number of Best Movie of the year Award wins (all categories)",
                         0, 4, 0, step = 1),
             sliderInput("boxoffice", "Crore at Box Office (millions)",
                         0, 800, c(0, 800), step = 1),
            
             textInput("director", "Director name contains (e.g., Yash Chopra)"),
             textInput("cast", "Cast names contains (e.g. Akshay Kumar)")
           ),
           wellPanel(style = "background: lightgreen",
             selectInput("xvar", "X-axis variable", axis_vars, selected = "Meter"),
             selectInput("yvar", "Y-axis variable", axis_vars, selected = "Reviews"),
             tags$small(paste0(
               "Note: This movie rating meter is the proportion of positive reviews",
               " (as judged by the IMDb staff), and the Numeric rating is",
               " a normalized 1-10 score of those reviews which have star ratings",
               " (for example, 3 out of 4 stars)."
             ))
           )
    ),
    
    column(9,
    wellPanel(style = "background: orange",
      
        h4("Project made By SACHIN KUMAR BAGHEL",
        
        )
    )),
 
    column(9,
           ggvisOutput("plot1"),
           
           wellPanel(
             span("Number of movies selected:",
                  textOutput("n_movies")
             )
           )
    ),
   
  )
)))