
<!-- README.md is generated from README.Rmd. Please edit that file -->

# CollaboratoR

**A Workflow and R package to support collaborative data synthesis
research**

\*Originally created to support meta-analysis for [MSU
IBEEM](https://ibeem.msu.edu) and the
[AvianMetaNetwork](https://github.com/AvianMetaNetwork/AvianMetaNetwork)\*\*

### Authors:

- Patrick S Bills, MSU Institute for Cyber-Enabled Research
- [Alejandra Martinez
  Blancas](https://www.researchgate.net/profile/Alejandra-Martinez-Blancas)
- [Laís Petri](https://www.laispetri.com/)
- [Ashwini Ramesh](https://www.ashwini-ramesh.com/)
- [Amar Deep Tiwari](http://www.amardeeptiwari.com/)
- [Kelly Kapsar, Data Scientist,
  IBEEM](https://kellykapsar.netlify.app/)
- [Phoebe Lehman Zarnetske, PI and Director,
  IBEEM](https://www.communityecologylab.com/)

<!-- badges: start -->

[![NetflixOSS
Lifecycle](https://img.shields.io/osslifecycle/Netflix/osstracker.svg)]()

<!-- previous baged 
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental) -->

<!-- badges: end -->

### Motivation

Performing research data synthesis, such as a meta-analysis, requires
collating and harmonizing data extracted from many different sources but
most frequently scientific publications.  
Collaborative research data synthesis requires a group of scientists to
collectively develop and agree on their goals, type of data extracted,
format of the those data, and to do so extremely consistently across
papers. This package helps to support that efficiently by providing a
workflow using the common CSV format for data definition and data entry,
with support for collaborative editing of CSVs with the user-friendy
Google Sheets.  
The workflow in this project can read directly from Google sheets into
CSVs and validate the structure of a google sheet as well as the data
using the Validate package.

<!-- insert description of the EDI data transform framework here -->

This R package was part of workflow involving a collection of git
repositories organized based on the [thematic
standardization](https://edirepository.org/resources/thematic-standardization)
designed by the [Environmental Data Initiative
(EDI)](https://edirepository.org/) to support the [reseach
lifecycle](https://edirepository.org/resources/creating-metadata-during-the-research-lifecycle).

1.  CollaboratoR: data management code for L0 and L0-\>L1 layer in EDI
    framework
2.  data: version controlled data collection for tracking provenance
    using git, this is the L0 and L1 layers in the EDI framework. the
    CollaboratoR package assists with data transfer and validation from
    Google drive into the data repository.
3.  analysis: R code for reproducible data analysis , L1-\>L2 layers in
    EDI framework, using data in the data repository.

## Components

- (optionally) Google Sheets to entry of data and meta-data
  - other systems could be used with manual export of CSVs, this package
    has capability of automatically pulling from Google Sheets
- CSV tabular files for meta-data and data
  - the Google sheets adapter converts to CSV
- R [Readr](https://readr.tidyverse.org/) package for data column name
  and data type validation
- R [Validate package](https://github.com/data-cleaning/validate) for
  data content validation
- git to track changes to data and meta-data via CSV text file
- (optionally) Github to share results via the web
  - other git services could be used, such as
    [Gitlab](https://gitlab.com)
  - on premise git servers could be use, such as our institution
    provides ( <https://gitlab.msu.edu> )

## Installation - Package

- clone this repository into a [new Rstudio
  project](https://docs.posit.co/ide/user/ide/guide/code/projects.html)
  and open it

- install required packages: This package uses
  [renv](https://rstudio.github.io/renv/) to manage the packages you
  need to install, which creates an `renv.lock` file for you.

  1.  install the renv package: this can go into your R environment used
      for all packages.  
  2.  in R run `renv::restore()` or if that complains about R versions

- Use of Google Workspace “Sheets” services for entering tabular data to
  be read-in by this application requires additional setup (see below)

## Installation - Google Workspace

It’s possible to use this workflow by editing CSV version of the tabular
data. However,  
many of the instructions, functions and tests are designed to work with
Google Drive as that was our preferred way to collaborative edit tabular
data.  
See the vignette in this package “Google Sheets API setup using Google
Cloud”, or in this source code see [Google Sheets Vignette
RMD](vignettes/google_sheets_api.Rmd)

Once set-up you may have to log-in manually prior to running tests or
checks, use the g-drive setup functions.

Note that for safety, this package only reads from google drive and it
never writes to google drive. Therefore it only requests ‘read-only’
access.

## Usage

When reading in data sheets, you provide a URL for a datasheet that
exists in any folder that you have access to. The system will attempt to
log you into to google drive and requests your permission for this code
to access files on your behalf.

``` r
gurl<- 'https://docs.google.com/spreadsheets/d/1w6sYozjybyd53eeiTdigrRTonteQW2KXUNZNmEhQyM8/edit?gid=0#gid=0'
study_data<- read_commrules_sheet(gurl)
```

## References

@article{van2021data, title={Data validation infrastructure for R},
author={van der Loo, Mark PJ and de Jonge, Edwin}, journal={Journal of
Statistical Software}, year={2021}, volume ={97}, issue = {10}, pages =
{1-33}, doi={10.18637/jss.v097.i10}, url =
{<https://www.jstatsoft.org/article/view/v097i10>} }
