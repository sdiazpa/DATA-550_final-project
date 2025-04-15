
here::i_am(
    "code/01-table-one.R"
)

data <- readRDS(
    file = here::here("ready-data/data_clean.rds")
)

library(gtsummary)

table_one <- data |>
    select(age, sex, anaemia, diabetes, smoking, high_blood_pressure, 
           creatinine_phosphokinase, ejection_fraction, platelets, 
           serum_creatinine, serum_sodium,
           DEATH_EVENT) |>
    tbl_summary(
        type = list(age ~ "continuous", 
                    sex ~ "categorical",
                    diabetes ~ "categorical",
                    smoking ~ "categorical",
                    anaemia ~ "categorical",
                    high_blood_pressure ~ "categorical",
                    platelets ~ "continuous"
        ),
        by = DEATH_EVENT,
        statistic = list(
            all_continuous() ~ "{mean} ({sd})",
            all_categorical() ~ "{n} / {N} ({p}%)"
        )
    ) |>
    add_overall() |>
    add_p()
table_one


saveRDS(
    table_one,
    file = here::here("tables/table_one.rds")
)



