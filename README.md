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
| `00-clean-data.R` | This code file showcases how the ‘data-clean.rds’ file within ‘ready-data’ was created. |
| `01-table-one.r` | This code showcases how table one was created. |
| `02-figure-boxplot.R` | This code showcases how the boxplot figure was created. |
| `03-regression-models.R` | This code showcases how both regression models, and how their output tables (and subsequent figures) were created. |
| `04-render-report.R` | This code showcases how the report was rendered. |
| `05-RENV.R` | This code showcases how steps for installing, activating, and restoring RENV were completed. |

Table describing code files within ‘code’ folder.

------------------------------------------------------------------------

## 🖍️ **To generate the final report** (with Docker) 🖍️

### STEP 1: Build the Docker image using one of the following options:

[ Note: If you get an error about "manifest" then include, you may need to include:

`--platform=linux/amd64` or `--platform=linux/arm64` ]

**OPTION 1**: In terminal, run a make command:

``` bash
  make final_project_image
```

**OPTION 2**: Pull image directly from dockerhub (<https://hub.docker.com/r/sdiazpa/final_project_image>)

``` bash
  docker pull sdiazpa/final_project_image
```

**OPTION 3**: Build image manually

``` bash
 docker build -t sdiazpa/final_project_image .
```

### STEP 2: Create the report:

For Windows users:

```         
make wind_docker_run
```

For Mac users:

```         
make mac_docker_run
```

### STEP 3: Find report in 'reports' folder.

------------------------------------------------------------------------

## 🖍️ **To generate the final report** (w/o Docker) 🖍️

### Step 1: Package environment setup. To ensure reproducibility, this report will utilize the R package '`RENV`'.

1.  **In an R console**, use `setwd` and `getwd` to confirm that the working directory is the project directory.

2.  Once inside of the appropriate project directory, navigate to the terminal and run: `make install` .

    -   This should automatically consider if RENV is installed (and if not, it will install it).
    -   Additionally, it will ensure that RENV is activated and package library is restored.

### Step 2: Making Final Report

1.  **In the terminal:**

    -   Clear the contents of any (residual) already made products using `‘make clean’`

    -   After all items are cleared from the ‘Tables’ and ‘Figures’ folders, use `‘make’` to complete the final report, titled ‘Final-project.html’. It will be available in the main project directory.

------------------------------------------------------------------------
