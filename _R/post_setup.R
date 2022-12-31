# packages ----------------------------------------------------------------
library(tidyverse)
library(ggplot2)
library(showtext)
library(highcharter)

# ggplot2 theme -----------------------------------------------------------
font_add_google("IBM Plex Sans")

showtext_auto()

theme_set(
  theme_minimal(base_size = 10, base_family = "IBM Plex Sans") +
    theme(
      plot.title = element_text(face = "plain"),
      plot.background = element_rect(fill = "#FFFAFA", colour = NA),
      panel.background = element_rect(fill = "#FFFAFA", colour = NA),
      legend.key.width = unit(1.5, "cm")
    )
)

# highcharter theme -------------------------------------------------------
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


