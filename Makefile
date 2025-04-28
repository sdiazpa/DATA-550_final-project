#Rule to build report:
final-project.html: final-project.Rmd code/04-render-report.R data/data_clean.rds \
	output/table_one.rds output/boxplot-age.png output/both_models.rds output/both_regression_tables.rds output/anova.rds \
	output/regression-model-one.png output/regression-model-two.png
	Rscript code/04-render-report.R

# rule to create output for table one
output/table_one.rds: code/01-table-one.R data/data_clean.rds
	Rscript code/01-table-one.R

# rule to create boxplot figure
output/boxplot-age.png: code/02-figure-boxplot.R data/data_clean.rds
	Rscript code/02-figure-boxplot.R

# rule to create regression models
output/both_models.rds output/both_regression_tables.rds output/anova.rds \
output/regression-model-one.png output/regression-model-two.png: \
	code/03-regression-models.R data/data_clean.rds
	Rscript code/03-regression-models.R
	
# rule to create cleaned data
data/data_clean.rds: code/00-clean-data.R \
	data/heart_failure_clinical_records_dataset.csv
	Rscript code/00-clean-data.R
	
	
.PHONY: clean
clean:
	rm -f output/*.rds && rm -f final-project.html && rm -f output/*.png && rm -f report/*
	
.PHONY: install
install: 
	Rscript -e "renv::restore(prompt = FALSE)"
	Rscript packages.R
	
# rule to perform docker tasks
PROJECTFILES = final-project.Rmd \
	code/05-RENV.R \
	code/00-clean-data.R \
	code/01-table-one.R \
	code/02-figure-boxplot.R \
	code/03-regression-models.R \
	code/04-render-report.R \
	data/heart_failure_clinical_records_dataset.csv \
	Makefile \
	README.md \
	.gitignore
RENVFILES = renv.lock renv/activate.R renv/settings.json .Rprofile
final_project: Dockerfile $(PROJECTFILES) $(RENVFILES)
	docker build -t sdiazpa/final_project .
	touch $@
# windows users:
wind_docker_run:
	docker run -v "$$(pwd)"/report:/project/report sdiazpa/final_project
# mac users:
mac_docker_run:
	docker run --platform linux/amd64 -v "$$(pwd)"/report:/project/report sdiazpa/final_project
