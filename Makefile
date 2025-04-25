#Rule to build report:
final-project.html: final-project.Rmd code/04-render-report.R ready-data/data_clean.rds \
	tables/table_one.rds figures/boxplot-age.png tables/both_models.rds tables/both_regression_tables.rds tables/anova.rds \
	figures/regression-model-one.png figures/regression-model-two.png
	Rscript code/04-render-report.R

# rule to create output for table one
tables/table_one.rds: code/01-table-one.R ready-data/data_clean.rds
	Rscript code/01-table-one.R

# rule to create boxplot figure
figures/boxplot-age.png: code/02-figure-boxplot.R ready-data/data_clean.rds
	Rscript code/02-figure-boxplot.R

# rule to create regression models
tables/both_models.rds tables/both_regression_tables.rds tables/anova.rds \
figures/regression-model-one.png figures/regression-model-two.png&: \
	code/03-regression-models.R ready-data/data_clean.rds
	Rscript code/03-regression-models.R
	

.PHONY: clean
clean:
	rm -f tables/*.rds && rm -f final-project.html && rm -f figures/*.png 
	
.PHONY: install
install: 
	Rscript code/05-RENV.R
	
	
	
#rule to perform docker tasks
PROJECTFILES = final-project.Rmd \
	code/05-RENV.R \
	code/00-clean-data.R \
	code/01-table-one.R \
	code/02-figure-boxplot \
	code/03-regression-models \
	code/04-render-report \
	ready-data/data_clean \
	Makefile \
	README.md \
	final-project.Rmd \ 
	.gitignore
REVFILES = renv.lock \
	renv/activate.R \
	renv/settings.json \
	.Rprofile

final_project_image: Dockerfile $(PROJECTFILES) $(RENVFILES)
	docker build -t sdiazpa/final_project_image .
	touch $@

#windows users:
wind_docker_run:
	docker run -v /"$$(pwd)/report":/project/report sdiazpa/final_project_image

#mac users:
mac_docker_run:
	docker run -v "$$(pwd)/report":/project/report sdiazpa/final_project_image

	