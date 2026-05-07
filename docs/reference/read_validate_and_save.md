# given a URL and params, read, validate and save a CSV

in the schemed used by this system, there is an ID column which is the
ID value of the unit of research (usually a publication, but could be a
project, a system) which is repeated for each row in order to positively
ID the row of data to that unit. The sheet may be also named that but
the sheet name is not used for this ID value.

## Usage

``` r
read_validate_and_save(
  url,
  tab_name,
  spec.df,
  csv_folder = "../L0",
  id_column = "id"
)
```

## Arguments

- url:

  string url pointing to a google sheet

- tab_name:

  name of tab in that googlesheet to read

- spec.df:

  previously read in specification

- csv_foler:

  path to folder to save the resulting CSV
