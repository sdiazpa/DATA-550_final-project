
here::i_am(
    "code/05-RENV.R"
)

if (!("renv" %in% row.names(installed.packages()))) {
    message("'renv' not found. Installing 'renv'...")
    install.packages("renv", dependencies = TRUE, quiet = TRUE)
} else {
    message("'renv' is already installed.")
}

message("Activating renv environment...")
source("renv/activate.R")

message("Restoring package library with renv::restore()...")
renv::restore(prompt = FALSE)

