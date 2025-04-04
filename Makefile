#Rule to build report:
final-project.html: final-project.Rmd code/04-render-report.R ready-data/data_clean.rds \
	tables/table_one.rds figures/boxplot-age.png tables/both_models.rds tables/both_regression_tables.rds tables/anova.rds& \
	figures/regression-model-one.png figures/regression-model-two.png&
	Rscript code/04-render-report.R

# rule to create output for table one
tables/table_one.rds: code/01-table-one.R ready-data/data_clean.rds
	Rscript code/01-table-one.R

# rule to create boxplot figure
figures/boxplot-age.png: code/02-figure-boxplot.R ready-data/data_clean.rds
	Rscript code/02-figure-boxplot.R

# rule to create regression models
tables/both_models.rds tables/both_regression_tables.rds tables/anova.rds&: \
	code/03-regression-models.R ready-data/data_clean.rds
	Rscript code/03-regression-models.R
	
# rule to create regression model figures
figures/regression-model-one.png figures/regression-model-two.png&: \
	code/03-regression-models.R ready-data/data_clean.rds
	Rscript code/03-regression-models.R

.PHONY: clean
clean:
	rm -f tables/*.rds && rm -f final-project.html && rm -f figures/*.png