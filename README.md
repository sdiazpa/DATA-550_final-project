# DATA-550 Final Project

Santino Diaz-Palma

------------------------------------------------------------------------

## 📚 Brief Description of Contents of Report 📚

Within this report, you will find an analysis based on the dataset from UCI ML Repository. [This dataset](https://archive.ics.uci.edu/dataset/519/heart+failure+clinical+records) explores the medical records of 299 patients who had heart failure. Featured within the dataset are 13 clinic variables with data collected during follow-up periods of the study. A cleaned version of this dataset is stored within the ‘`ready-data`’ folder as a `.rds` file.

------------------------------------------------------------------------

## 🔢 Description of '.R' files listed in folder 'code' 🔢

Codes for building the tables and figures required within the ‘final-report.Rmd’ file are located with the ‘code’ folder. Specifically these codes are highlighted as follows:

| Code file name | Description |
|------------------------------------|------------------------------------|
| 00-clean-data.R | This code file showcases how the ‘data-clean.rds’ file within ‘ready-data’ was created. |
| 01-table-one.r | This code showcases how table one was created. |
| 02-figure-boxplot.R | This code showcases how the boxplot figure was created. |
| 03-regression-models.R | This code showcases how both regression models, and how their output tables (and subsequent figures) were created. |
| 04-render-report.R | This code showcases how the report was rendered. |
| 05-RENV.R | This code showcases how steps for installing, activating, and restoring RENV were completed. |

Table describing code files within ‘code’ folder.

------------------------------------------------------------------------

## 🖍️ **To generate the final report** 🖍️

#### Step 1: Package environment setup. To ensure reproducibility, this report will utilize the R package '`RENV`'.

1.  **In an R console**, use `setwd` and `getwd` to confirm that the working directory is the project directory.
2.  Once inside of the appropriate project directory, navigate to the terminal and run: `make install` .
    -   This should automatically consider if RENV is installed (and if not, it will install it).
    -   Additionally, it will ensure that RENV is activated and package library is restored.

1.  Check if `RENV` is installing by using the following code in the R Console:

    `"renv" %in% row.names(installed.packages())`

    -   IF the output is '`FALSE`', you must install RENV using: `install.packages("renv")`

2.  **In an R console**, use `setwd` and `getwd` to confirm that the working directory is the project directory.

    1.  Once inside of the project directory:
        1.  Run `source("renv/activate.R")`
        2.  Restore the package library using `renv::restore()`.

#### Step 2: Making Final Report

1.  **In the terminal:**

    -   Clear the contents of any (residual) already made products using `‘make clean’`

    -   After all items are cleared from the ‘Tables’ and ‘Figures’ folders, use `‘make’` to complete the final report, titled ‘Final-project.html’.

------------------------------------------------------------------------
