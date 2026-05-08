# CollaboratoR Workflow

``` r

library(CollaboratoR)
```

## Overview

As stated on the project main README, this package is to assist data
synthesis research by automating data validation and aggregation
processes for researchers with different skill sets. to use a set of CSV
formatted data file, or optionally employ user-friendly Google Sheets,
as a collaborative data and meta- data entry tool. It features automated
validation of the data using simple data definition table and easy to
write standardized rules, and finally the workflow tracks changes to
data using git.

### Components

- (optionally) Google Sheets to entry of data and meta-data
  - other systems could be used with manual export of CSVs, this package
    has capability of automatically pulling from Google Sheets
- meta-data and data store in common tabular data formats
  - CSV is basis for using version control
  - this package enables use of user-friendly Google Sheets for editing
    these
- R [Readr](https://readr.tidyverse.org/) package for data column name
  and data type validation
- R [Validate package](https://github.com/data-cleaning/validate) for
  data content validation
- git to track changes to data and meta-data via CSV text file
- (optionally) Git service to share results via the web
  - Github or other git services, such as [Gitlab](https://gitlab.com)
  - on premise Gitlab servers could be used ( our institution provides
    <https://gitlab.msu.edu> )

### Setup/Configuration

- Install using instructions in the project’s
  [README](https://github.com/IBEEM-MSU/CollaboratoR/README.md)
- Information on how to set-up google workspace in the vignette for
  [Google Sheets
  API](https://github.com/IBEEM-MSU/CollaboratoR/articles/google_sheets_api.md)
  setup.  
- This package relies on [configuration values in the `.Renviron`
  file](https://github.com/IBEEM-MSU/CollaboratoR/articles/project_configuration.md)

### Workflow Summary

1.  Write your data entry protocol (outside of this system but crucial
    for organization)
2.  Setup Git repositories to hold data as it flows through
3.  Create metadata and configuration

- column definintions for main data sheet (CSV or Googlesheets)
- create validation rules (YAML format)
- data lists such as species lists in CSV or
- list/table for tracking data entry sheets
- CollaboratoR configuration in .Renviron

4.  Enter data into tabular form

- CSV or GoogleSheets
- add entry to list of URIs (Google sheet urls or CSV file paths)

5.  Use CollaboratoR package to accumulate metadata

- read metadata: column specification, list of data sheet URIs
- reads in list of data sheets CSV filename or list of googlesheets URLs
- validation rules written in YAML and stored a RData file

6.  automated validation and report

- read data files (from list of URIs in CSV or Google Sheets)
- data format against schema (from column spec)
- category columns are checked against lists (i.e. species lists)
- data values against rules (from YAML file)
- report errors printed for user

7.  save to git

- those sheets that passed validation are commited to git

8.  combine to master list(s)

- a master database

## Workflow

### Write your data entry protocol

This is beyond the scope of this documentation and package, but crucial
for successful data synthesis projects. The process for finding,
extracting and formatting every data point is crucial. This protocol
will the determine the columns in the datsheet and column definitions in
metadata

### Create metadata and configuration

Create a table describing the columns in the each to data files based on
the protocol. This table must have columns as follows:

| Column | Description |
|----|----|
| col_name | exact name of column as it will appear in the datasheet |
| col_description | human reable description based on your data collection protocol |
| col_type | name of the datatype, see datatype list below |
| example | human readable example for guidance |

    col_name,col_description,col_type,example
    id,"id formed from species group and sample location", character,"SetosaMBG"
    Sepal.L., "Sepal length (mm)", double,5.1
    Sepal.W., "Sepal width (mm)", double,3.5
    Petal.L., "Petal length (mm)", double,1.4
    Petal.W., "Petal width (mm)", double,0.2
    group_id, "grouping variable", factor, "SetosaMBG"
    whos, "collector of measurements", character, "ESA"
    site, "name of the site where the data was collected", character, "Main Site"

- create validation rules (YAML format)
- data lists such as species lists in CSV or
- list/table for tracking data entry sheets
- CollaboratoR configuration in .Renviron

## Enter data into tabular form

- CSV or GoogleSheets
- add entry to list of URIs (Google sheet urls or CSV file paths)

## Use CollaboratoR package to accumulate metadata

- read metadata: column specification, list of data sheet URIs
- reads in list of data sheets CSV filename or list of googlesheets URLs
- validation rules written in YAML and stored a RData file

## Initiate automated validation and report

- read data files (from list of URIs in CSV or Google Sheets)
- data format against schema (from column spec)
- category columns are checked against lists (i.e. species lists)
- data values against rules (from YAML file)
- report errors printed for user \## save to git
- those sheets that passed validation are commited to git

## combine to master list(s)
