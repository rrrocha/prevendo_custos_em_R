library(shiny)


ui <- fluidPage(
    titlePanel("Previsão de Custo Inicial para Montar a Franquia"),
    fluidRow(
        column(4,
            h2("Dados"),
            tableOutput("Dados")
            
        ),
        column(8,
            plotOutput("Graf")
            
        )
    ),
    fluidRow(
        column(6,
           h3("Valor Anual da Franquia: "),
           numericInput("NovoValor", "Insira novo valor", 1500, min = 1, max = 99999999),
           actionButton("Processar", "Processar")
        ),
        column(6,
           h1(textOutput("Resultado"))
        )
    )   
)
    


# Define server logic required to draw a histogram
server <- function(input, output) {

    
}

# Run the application 
shinyApp(ui = ui, server = server)
