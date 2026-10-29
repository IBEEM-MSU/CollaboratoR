# CollaboratoR Example

``` r

library(CollaboratoR)
```

## Overview

This walks through an example of a collection of example Google Sheets
needed for collaborative data entry, how to configure the software (the
pieces of infromation you need), and how to automatically download and
validate the data.

## Example Data

This walk-through will use a small collection of short files from what’s
known as [*“Fisher’s Iris
data”*](https://en.wikipedia.org/wiki/Iris_flower_data_set) or
*“Anderson’s Iris data”*: a famous data set of measurments of flower
sepals and petals collected by Edgar Anderson on the Gaspé Peninsula in
Quebec (Anderson 1936).

As of this writing, there is a public folder in Google Docs/Workspace
with these files

If this is no longer available (nothing is forever!), in the `raw_data`
folder of this repository\](<https://github.com/IBEEM-MSU/CollaboratoR>)
is a zip file containing XLSX formatted versions of these sheets that
you may upload to your own Google Drive shared folder (full instructions
for recreating our examle data set in Google drive is TBD)

While this data set is small, they are split by species in the sheets to
simulate collaborative data.

## Getting started: setting up data sheets for entry

This package was designed to assist with a workflow that used
spreadsheets for the following functions. After designing the goals and
basic process/protocol for your study, to use spreadshseets to collect
data and use this package, one should include the following types of
sheets in the table below:

[TABLE]

## saved…

The folder for this example project has the following sheets in it

- Iris data entry protocol: ficitious protocol for how measurements may
  be collaboratively entered for validation.
- id_urls : table of data sheets and their associated google urls
- iris_template : example blank data sheet to use for new entries
- iris_setosa, iris_versicolor, iris_virginica : data sheets by species
- measurements_spec : the ‘data dictionary’ list of variables in data
  sheets with descriptions
- species : a single column list of species included in this data
  project, used for both validation steps, and for limiting data in the
  data entry template spreadsheet

## saved… Process: Getting Started

After designing the goals and basic process/protocol for your study, to
use spreadshseets to collect data and use this package, one should
include the following:

- data entry protocol (distinct from the data collection protocol)
- data specification: list of variables included in data entry sheets
- template data sheet, a blank spreadsheet with columns as defined in
  the data specification
- One or more data sheets, creatd from the template
- a table of all data sheets ready for validation

The example sheets above \## Process: CollaboratoR Set

- installing this package and it’s dependencies (Readr, etc)

### Setup/Configuration

- Install using instructions in the project’s
  [README](https://github.com/IBEEM-MSU/CollaboratoR/README.md)
- Information on how to set-up google workspace in the vignette for
  [Google Sheets
  API](https://github.com/IBEEM-MSU/CollaboratoR/articles/google_sheets_api.md)
  setup.\
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
- those sheets that passed validation are committed to git

## References

Edgar Anderson (1936). “The species problem in Iris”. Annals of the
Missouri Botanical Garden. 23 (3): 457–509. Bibcode:1936AnMBG..23..457A.
<doi:10.2307/2394164>. JSTOR 2394164.
