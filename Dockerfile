FROM rocker/tidyverse AS base
RUN apt-get update && apt-get install -y pandoc

RUN mkdir /project
WORKDIR /project


RUN mkdir code
RUN mkdir figures
RUN mkdir tables
RUN mkdir "raw-data"
RUN mkdir "ready-data"
COPY code code
COPY "raw-data" "raw-data"
COPY "ready-data" "ready-data"
COPY Makefile .
COPY "final-project.Rmd".


COPY .Rprofile .
COPY renv.lock .
RUN mkdir -p renv
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json


RUN Rscript -e "05-RENV.R"

RUN mdkir reports
CMD make && cp final-project.html reports

