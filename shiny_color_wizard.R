library(shiny)
library(RColorBrewer)

# Helper function to convert RGB to HEX
rgb_to_hex = function(rgb) {
  rgb = as.integer(rgb)
  sprintf("#%02X%02X%02X", rgb[1], rgb[2], rgb[3])
}

# UI
ui = fluidPage(
  titlePanel("Shiny Color Wizard"),
  tabsetPanel(
    tabPanel("RColorBrewer Palettes",
             sidebarLayout(
               sidebarPanel(
                 selectInput("palette", "Choose a Palette:", choices = rownames(brewer.pal.info))
               ),
               mainPanel(
                 tableOutput("colorTable")
               )
             )
    ),
    tabPanel("Named R Colors",
             mainPanel(
               tableOutput("namedColorsTable")
             )
    )
  )
)

# Server
server = function(input, output, session) {
  
  # Table for RColorBrewer palettes
  output$colorTable = renderTable({
    palette_name = input$palette
    palette_colors = brewer.pal(brewer.pal.info[palette_name, "maxcolors"], palette_name)
    
    color_data = sapply(palette_colors, function(color) {
      rgb = col2rgb(color)
      hex = rgb_to_hex(rgb)
      rgb_code = paste0("rgb(", rgb[1,], ",", rgb[2,], ",", rgb[3,], ")")
      data.frame(
        Color = sprintf('<div style="width:50px; height:20px; background-color:%s;"></div>', rgb_code),
        RGB = rgb_code,
        HEX = hex,
        stringsAsFactors = FALSE
      )
    }, simplify = FALSE)
    
    color_table = do.call(rbind, color_data)
    color_table
  }, sanitize.text.function = function(x) x, rownames = TRUE)
  
  # Table for named R colors
  output$namedColorsTable = renderTable({
    named_colors = colors()
    color_data = sapply(named_colors, function(color) {
      rgb = col2rgb(color)
      hex = rgb_to_hex(rgb)
      rgb_code = paste0("rgb(", rgb[1,], ",", rgb[2,], ",", rgb[3,], ")")
      data.frame(
        ColorName = color,
        Color = sprintf('<div style="width:100px; height:20px; background-color:%s;"></div>', rgb_code),
        RGB = rgb_code,
        HEX = hex,
        stringsAsFactors = FALSE
      )
    }, simplify = FALSE)
    
    color_table = do.call(rbind, color_data)
    color_table
  }, sanitize.text.function = function(x) x, rownames = FALSE)
  
  # Stop the app when the session ends
  session$onSessionEnded(function() {
    stopApp()
  })
  
}

# Run the app
shinyApp(ui = ui, server = server)
