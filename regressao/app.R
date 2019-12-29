                    library(shiny)
                    
                    dados = read.csv("slr12.csv", sep = ";")
                    
                    modelo = lm(CusInic ~ FrqAnual, data = dados)
                    
                    ui <- fluidPage(
                        titlePanel("Previsão de Custo Inicial para Montar a Franquia"),
                        fluidRow(
                            column(4,h2("Dados"), tableOutput("Dados")),
                            column(8, plotOutput("Graf"))
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
                    
                    
                    server <- function(input, output) {
                        output$Graf = renderPlot({
                                plot(CusInic ~ FrqAnual, data = dados)
                                    abline(modelo)
                        })
                        
                            output$Dados = renderTable({head(dados, 10)})
                        
                        observeEvent(input$Processar, {
                            valr = input$NovoValor
                            prev = predict(modelo, data.frame(FrqAnual = eval(parse(text = valr))))
                            prev = paste0("Previsão de custo Inicial R$: ", round(prev, 2))
                            output$Resultado = renderText({prev})
                        })
                    }
                    
                    
                    # Run the application 
                    shinyApp(ui = ui, server = server)
                    
