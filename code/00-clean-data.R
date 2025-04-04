absolute_path_to_data <- here::here("raw-data", "heart_failure_clinical_records_dataset.csv")
data <- read.csv(absolute_path_to_data, header = TRUE)

library(labelled)
library(gtsummary)
library(dplyr)

#According to the DATA Source Table, the variables need to be recoded as follows:
data <- data |>
    mutate(
        age = as.integer(age), 
        anaemia = factor(anaemia, levels = c(0, 1), labels = c("No", "Yes")),
        diabetes = factor(diabetes, levels = c(0, 1), labels = c("No", "Yes")),
        high_blood_pressure = factor(high_blood_pressure, levels = c(0, 1), labels = c("No", "Yes")),
        serum_sodium = as.integer(serum_sodium),
        sex = factor(sex, levels = c(0, 1), labels = c("Female", "Male")),
        smoking = factor(smoking, levels = c(0, 1), labels = c("No", "Yes")),
        DEATH_EVENT = factor(DEATH_EVENT, levels = c(0, 1), labels = c("Alive", "Dead"))
    )

var_label(data) <- list(
    age = "Age",
    anaemia = "Anaemia",
    creatinine_phosphokinase = "CPK Enzyme Level",
    diabetes = "Diabetes",
    ejection_fraction = "Ejection Fraction",
    high_blood_pressure = "Hypertension",
    platelets = "Platelet Count",
    serum_creatinine = "Serum Creatinine Level",
    serum_sodium = "Serum Sodium Level",
    time = "Length of Follow-Up",
    sex = "Sex",
    smoking = "Smoking Status",
    DEATH_EVENT = "Death"
)

saveRDS(
    data, 
    file = here::here("ready-data/data_clean.rds")
)


