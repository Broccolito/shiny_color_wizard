# Shiny Color Wizard

Shiny Color Wizard is an interactive Shiny application that allows users to explore and visualize color palettes from the `RColorBrewer` package as well as named R colors. This tool provides a user-friendly interface to view colors, their RGB values, and HEX codes, which can be useful for data visualization, web design, and other applications requiring color selection.

## Features

- **RColorBrewer Palettes**: Choose from various palettes provided by the `RColorBrewer` package and view their colors along with their RGB and HEX codes.
- **Named R Colors**: Explore the named colors available in R, displaying their names, RGB values, and HEX codes.

## Installation

To run the Shiny Color Wizard app locally, follow these steps:

1. **Install R**: Make sure you have R installed. You can download it from [CRAN](https://cran.r-project.org/).

2. **Install Shiny**: Install the `shiny` package if you haven't already.
    ```R
    install.packages("shiny")
    ```

3. **Install RColorBrewer**: Install the `RColorBrewer` package if you haven't already.
    ```R
    install.packages("RColorBrewer")
    ```

4. **Clone the Repository**: Clone this repository to your local machine.
    ```sh
    git clone https://github.com/yourusername/shiny-color-wizard.git
    cd shiny-color-wizard
    ```

## Usage

To run the application, use the following R command in your terminal or R console:
```R
library(shiny)
runApp("path/to/your/shiny-color-wizard")
```
Replace `"path/to/your/shiny-color-wizard"` with the actual path to the directory containing the `shiny-color-wizard` app.

## App Structure

The application is structured into two main panels, each accessible via tabs:

1. **RColorBrewer Palettes**:
    - **Palette Selection**: A dropdown menu to select from available RColorBrewer palettes.
    - **Color Table**: Displays the colors in the selected palette, including a swatch, RGB value, and HEX code.

2. **Named R Colors**:
    - **Color Table**: Displays all named R colors, including their names, color swatch, RGB value, and HEX code.

## Code Explanation

### Helper Functions

- **rgb_to_hex**: Converts RGB values to HEX codes.
    ```R
    rgb_to_hex = function(rgb) {
      rgb = as.integer(rgb)
      sprintf("#%02X%02X%02X", rgb[1], rgb[2], rgb[3])
    }
    ```

### User Interface (UI)

- **UI Layout**: Defined using `fluidPage`, `titlePanel`, and `tabsetPanel`.
- **RColorBrewer Tab**: Contains a `selectInput` for palette selection and a `tableOutput` to display the colors.
- **Named R Colors Tab**: Contains a `tableOutput` to display all named colors.

### Server Logic

- **Render Tables**: Uses `renderTable` to generate HTML tables for displaying color information.
- **Palette Colors**: Extracts and formats colors from the selected RColorBrewer palette.
- **Named Colors**: Extracts and formats named colors from R.

### Application Termination

- **Session End**: Stops the application when the session ends.
    ```R
    session$onSessionEnded(function() {
      stopApp()
    })
    ```

### Running the App

- **shinyApp**: Combines the UI and server components to run the application.
    ```R
    shinyApp(ui = ui, server = server)
    ```

## Contribution

Contributions are welcome! Feel free to fork the repository and submit pull requests.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

---

*Happy Coloring!*

For any questions or suggestions, please contact [wanjun.gu@ucsf.edu].