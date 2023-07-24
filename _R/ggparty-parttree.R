#| column: screen-inset
#| fig-width: 12
#| fig-height: 8
#| fig-align: center
penguinct3 <- ctree(
  species ~ bill_length_mm + bill_depth_mm,
  data = penguins,
  control = ctree_control(maxdepth = 4)
)

plot(penguinct3)

didlvlv <- ggparty(penguinct3)$data |>
  as_tibble() |>
  select(id, level)

depth(penguinct3)

# base
ggp <- ggparty(penguinct3) +
  geom_edge(color = "gray80") +
  geom_edge_label(color = "gray50", size = 4)

# 0 node
ggp <- ggp +
  geom_node_plot(
    gglist = list(
      geom_point(
        aes(x = bill_length_mm, y = bill_depth_mm, color = species),
        size = 1, alpha = 0.5
      )
    ),
    id = 1
  )


ggp

for(md in 1:depth(penguinct3)){

  message(md)

  penguinct_aux <- ctree(
    species ~ bill_length_mm + bill_depth_mm,
    data = penguins,
    control = ctree_control(maxdepth = md)
  )

  plot(penguinct_aux)

  didlvlv_aux <-ggparty(penguinct_aux)$data |>
    as_tibble() |>
    select(id, level)

  dparttree_aux <- parttree(penguinct_aux)
  dparttree_aux <- dparttree_aux |>
    as_tibble() |>
    rename(id = node) |>
    select(-path)

  id_aux <- didlvlv |>
    filter(level == md) |>
    pull(id)

  dparttree_aux <- dparttree_aux |>
    mutate(id = id_aux)

  ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm)) +
    geom_parttree(
      data = penguinct_aux,
      aes(fill = species),
      alpha = 0.2,
      color = "gray60",
    ) +
    geom_point(aes(col = species)) +
    theme_minimal()

  ggp <- ggp +
    geom_node_plot(
      id = id_aux,
      gglist = list(
        geom_parttree(
          data = penguinct_aux,
          aes(fill = species),
          alpha = 0.1,
          color = "gray60",
        ),
        geom_rect(
          data = dparttree_aux,
          aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax, fill = species),
          alpha = 0.5, color = "gray40",
        ),
        geom_point(
          aes(x = bill_length_mm, y = bill_depth_mm, color = species),
          size = 1, alpha = 0.5
        ),
        scale_fill_manual(values = colors),
        scale_color_manual(values = colors),
        guides(color = guide_legend(override.aes = list(size = 5))),
        theme_minimal(),
        theme(axis.text = element_text(size = 7)),
        labs(x = NULL, y = NULL)
      )
    )

  ggp

}
