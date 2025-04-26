FROM rocker/tidyverse AS base
RUN apt-get update && apt-get install -y \
    pandoc \
    libglpk-dev \
    libmagick++-dev \
    libproj-dev \
    libgdal-dev \
    libsodium-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*




RUN mkdir /project
WORKDIR /project


RUN mkdir code
RUN mkdir output
RUN mkdir data
COPY code code
COPY output ouput
COPY data data
COPY Makefile .
COPY final-project.Rmd .
COPY packages.R .



COPY .Rprofile .
COPY renv.lock .
RUN mkdir -p renv
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json


RUN Rscript -e "renv::restore(prompt = FALSE)"
RUN Rscript packages.R

RUN mkdir report
CMD make && cp final-project.html report

