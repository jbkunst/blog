library(tidyverse)

# ggplot2 -----------------------------------------------------------------
library(ggplot2)
library(showtext)
font_add_google("IBM Plex Sans", "ibm")
showtext_auto()

theme_set(
  theme_minimal(base_size = 10) +
    theme(
      strip.background = element_rect(fill = "gray90", colour = NA),
      legend.position = "bottom"
    )
  )

# highcharter -------------------------------------------------------------
library(highcharter)

fntfmly <- '-apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol"'

options(
  highcharter.theme =
    hc_theme_smpl(
      chart = list(style = list(fontFamily = fntfmly)),
      title = list(style = list(fontFamily = fntfmly)),
      subtitle = list(style = list(fontFamily = fntfmly)),
      credits = list(style = list(fontFamily = fntfmly)),
      legend = list(itemStyle = list(fontWeight = "normal",color = "#A2A39C"))
    )
)

rm(fntfmly)


