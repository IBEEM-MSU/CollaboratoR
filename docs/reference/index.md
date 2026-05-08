# Package index

## All functions

- [`aggregate_csvs()`](https://github.com/IBEEM-MSU/CollaboratoR/reference/aggregate_csvs.md)
  : combine data csvs

- [`as.Date(`*`<flexible>`*`)`](https://github.com/IBEEM-MSU/CollaboratoR/reference/as.Date.flexible.md)
  : flexible character to date converter

- [`errorSaver()`](https://github.com/IBEEM-MSU/CollaboratoR/reference/errorSaver.md)
  : Function wrapper to capture errors and warnings for storing

- [`gdrive_client_setup()`](https://github.com/IBEEM-MSU/CollaboratoR/reference/gdrive_client_setup.md)
  : get a google drive 'client' for authentication from env file

- [`gdrive_setup()`](https://github.com/IBEEM-MSU/CollaboratoR/reference/gdrive_setup.md)
  : connect to your google drive account, required set-up for using the
  google drive packages

- [`get_api_key()`](https://github.com/IBEEM-MSU/CollaboratoR/reference/get_api_key.md)
  : check google cloud api key configuration

- [`get_col_type_from_spec()`](https://github.com/IBEEM-MSU/CollaboratoR/reference/get_col_type_from_spec.md)
  : vector of types from column names, in order

- [`get_drive_email()`](https://github.com/IBEEM-MSU/CollaboratoR/reference/get_drive_email.md)
  : pull drive email from environment

- [`get_gsfile()`](https://github.com/IBEEM-MSU/CollaboratoR/reference/get_gsfile.md)
  : get a google drive file object given path and share drive

- [`gfile_modified_time()`](https://github.com/IBEEM-MSU/CollaboratoR/reference/gfile_modified_time.md)
  : get time stamp for a particular gfile

- [`gsheet_auth_setup()`](https://github.com/IBEEM-MSU/CollaboratoR/reference/gsheet_auth_setup.md)
  : setup authentication for reading google sheet

- [`read_data_csv()`](https://github.com/IBEEM-MSU/CollaboratoR/reference/read_data_csv.md)
  : read in a CSV from L0 folder, using specification spec

- [`read_data_sheet()`](https://github.com/IBEEM-MSU/CollaboratoR/reference/read_data_sheet.md)
  :

  read in google sheet for formatted for specific project, similar to
  how the readr package works for read_csv with a spec sheet data sheet
  features

  - allows you to skip top row(s) of data - allows for sheets that have
    non-data rows that are descriptive

  - numeric columns can have numeric strings and those will be converted
    to NAs, e.g. can indicate "NA" in numeric cells

  - requires a spec sheet that uses names per
    [`type_converter_fun()`](https://github.com/IBEEM-MSU/CollaboratoR/reference/type_converter_fun.md)

- [`read_data_specification()`](https://github.com/IBEEM-MSU/CollaboratoR/reference/read_data_specification.md)
  : read a spec sheet of columns descibing data to be validated

- [`read_gcsv()`](https://github.com/IBEEM-MSU/CollaboratoR/reference/read_gcsv.md)
  : download a CSV file from the project google shared drive and read
  into memory

- [`read_gsheet_by_url()`](https://github.com/IBEEM-MSU/CollaboratoR/reference/read_gsheet_by_url.md)
  : read data in a google sheet from a URL and tab number

- [`read_url_list()`](https://github.com/IBEEM-MSU/CollaboratoR/reference/read_url_list.md)
  : read in the table of google sheet URLs with id

- [`read_validate_and_save()`](https://github.com/IBEEM-MSU/CollaboratoR/reference/read_validate_and_save.md)
  : given a URL and params, read, validate and save a CSV

- [`remove_comment_line()`](https://github.com/IBEEM-MSU/CollaboratoR/reference/remove_comment_line.md)
  : strip row 2 from a csv file, used by data-entry for column
  directions/description.

- [`spec_to_readr_col_types()`](https://github.com/IBEEM-MSU/CollaboratoR/reference/spec_to_readr_col_types.md)
  : convert our specification format to something useable by
  readr::read_csv

- [`type_code_to_readr_code()`](https://github.com/IBEEM-MSU/CollaboratoR/reference/type_code_to_readr_code.md)
  : convert a type name to a readr convert code

- [`type_converter_fun()`](https://github.com/IBEEM-MSU/CollaboratoR/reference/type_converter_fun.md)
  : code to conversion function mapping

- [`validate_all()`](https://github.com/IBEEM-MSU/CollaboratoR/reference/validate_all.md)
  :

  read the list of urls, read, confirm column format, validate and when
  using in development mode, make sure do run
  [`devtools::load_all()`](https://devtools.r-lib.org/reference/load_all.html)
  to get all the CollaboratoR functions loaded save to CSV

- [`validate_data()`](https://github.com/IBEEM-MSU/CollaboratoR/reference/validate_data.md)
  : validate data df

- [`validate_data_columns()`](https://github.com/IBEEM-MSU/CollaboratoR/reference/validate_data_columns.md)
  : validate columns against data definition

- [`validate_from_file()`](https://github.com/IBEEM-MSU/CollaboratoR/reference/validate_from_file.md)
  : create validation results from a yaml file

- [`validation_report()`](https://github.com/IBEEM-MSU/CollaboratoR/reference/validation_report.md)
  : create a report of validation results
