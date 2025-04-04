


data <- readRDS(
    file = here::here("ready-data/data_clean.rds")
)

library(ggplot2)

boxplot <- 
    ggplot(data, 
           aes(x = factor(DEATH_EVENT), 
               y = age, 
               fill = factor(DEATH_EVENT))) +
    geom_boxplot() +
    labs(
        title = "Age Distribution by Death Event",
        x = "Death during follow-up period (0 = Alive, 1 = Dead)",
        y = "Age (Years)",
        fill = "Death Event"
    ) +
    theme_minimal() +
    theme(
        plot.title = element_text(hjust = 0.5, size = 16)
    )

boxplot


ggsave(
    here::here("figures/boxplot-age.png"),
    plot = boxplot,
    device = "png"
)


