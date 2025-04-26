
here::i_am(
    "code/03-regression-models.R"
)


library(ggplot2)
library(gtsummary)

data <- readRDS(
    file = here::here("data/data_clean.rds")
)



#### Regression model 1 ####
mod1 <- glm(
    DEATH_EVENT ~ age + sex + diabetes + smoking,
    data = data,
    family = binomial
)

first_regression_table <- 
    tbl_regression(mod1, exponentiate = TRUE) 

regression_model_one <- ggplot(
    first_regression_table$table_body, 
    aes(x = term, y = estimate, ymin = conf.low, ymax = conf.high)) +
    geom_pointrange() +
    geom_hline(yintercept = 1, linetype = "dashed", color = "red") + 
    coord_flip() +
    labs(title = "Odds Ratios for Model 1", x = "Predictors", y = "Odds Ratio (95% CI)") +
    theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 14)) + 
    theme_minimal()
regression_model_one

#### Regression model 2 #####
mod2 <- glm(DEATH_EVENT ~ age + sex + diabetes + smoking + anaemia + 
                high_blood_pressure + platelets + serum_creatinine + serum_sodium, 
            data = data, 
            family = "binomial")

second_regression_table <- 
    tbl_regression(mod2, exponentiate = TRUE) 

regression_model_two <- ggplot(second_regression_table$table_body, 
           aes(x = term, 
               y = estimate, 
               ymin = conf.low, 
               ymax = conf.high)) +
    geom_pointrange() +
    geom_hline(yintercept = 1, linetype = "dashed", color = "red") + 
    coord_flip() +
    labs(title = "Odds Ratios for Model 2", x = "Predictors", y = "Odds Ratio (95% CI)") +
    theme_minimal()

regression_model_two


#### anova #####
library(broom)
library(gt)

comparison <- anova(mod1, mod2, test = "Chisq")
comparison

p_value_model_2 <- comparison$`Pr(>Chi)`[2]


#### both models and SAVES ####
both_models <- list(
    first = mod1,
    second = mod2
)
saveRDS(
    both_models,
    file = here::here("output/both_models.rds")
)

both_regression_tables <- list(
    first = first_regression_table,
    second = second_regression_table
)

saveRDS(
    both_regression_tables,
    file = here::here("output/both_regression_tables.rds")
)

# saving regression plots
ggsave(
    here::here("output/regression-model-one.png"),
    plot = regression_model_one,
    device = "png"
)

ggsave(
    here::here("output/regression-model-two.png"),
    plot = regression_model_two,
    device = "png"
)

#saving anova items
both_anova <- list (
    anova = comparison,
    p_value_both = p_value_model_2
)

saveRDS(
    both_anova,
    file = here::here("output/anova.rds")
)



