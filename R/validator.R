# validatR.R functions used to check data columns, data types and run
# validation checks using validate package

require(validate)
require(readr)

#' @export
type_name_to_fn <- function(type_str) {
  if(type_str == 'character') return(readr::col_character)
  if(type_str == 'factor') return(readr::col_factor)
  if(type_str == 'double') return(readr::col_double)
  if(type_str == 'integer') return(readr::col_integer)
  return(NA)
}


#' read a spec sheet of columns descibing data to be validated
#' 
#' @param csv_file a csv with column col_name and col_type
#' @returns data frame that meets criteria
#' @export
read_data_specification<- function(csv_file){
  spec_df <- readr::read_csv(csv_file, show_col_types = FALSE)
  stopifnot("col_name" %in% names(spec_df))
  return(spec_df)
}


#' @export
data_specification_column_spec <- function(spec_df) {
  paste0(substr(spec.df$col_type, 1, 1), collapse = '')
}


#' validate columns against data definition
#'
#' @param data_df data frame following data definition
#' @param spec_df data frame of table specification
#' @export
validate_data_columns<- function(data_df, spec_df){

  stopifnot("col_name" %in% names(spec_df))
  return(  identical(sort(spec_df$col_name), sort(names(data_df))) )

}


#' validate data df
#'
#' use the validate package to check a file against a set of rules
#' @param data_df dataframe of biomass data
#' @param spec_df data frame of table specification
#' @param validation_rules file with validation rules in it.
#' @export
validate_data<- function(data_df, spec_df, validation_rules ){

  if(!validate_data_columns(data_df, spec_df)){
    warning("column names don't match specification")
    #TODO display columns that don't match
  }

  validation_results <- validate::confront(data_df, validation_rules)
  validate::summary(validation_results)

  return(validation_results)

}


#' create validation results from a yaml file
#' 
#' @param data_df data frame of data
#' @param file yaml formatted file with rules for the validate package
#' @returns the outupt from confront function
#' @export
validate_from_file <- function(data_df, file){
  validation_rules <- validate::validator(.file= file)
  validation_results <- validate::confront(data_df, validation_rules)

  validate::summary(validation_results)
  return(validation_results)

}

#' given a URL and params, read, validate and save a CSV
#' 
#' in the schemed used by this system, there is an ID column which is the ID 
#' value of the unit of research (usually a publication, but could be a project, a system)
#' which is repeated for each row in order to positively ID the row of data
#' to that unit. The sheet may be also named that but the sheet name is not used
#' for this ID value.  
#' 
#' @param url string url pointing to a google sheet
#' @param tab_name name of tab in that googlesheet to read
#' @param spec.df  previously read in specification 
#' @param csv_foler path to folder to save the resulting CSV
#' @example 
#' /dontrun {
#' url <- 'https://docs.google.com/spreadsheets/d/some_random_sheet_name
#' filename <- read_and_save(url, tab_name = 'biomass_data', spec.df = commassembly_rules_biomass_str), id_column = "ID_new")
#' }
#' @export
read_validate_and_save<- function(url, tab_name, spec.df, csv_folder = '../L0', id_column = 'id'){

  dir.create(csv_folder, showWarnings = FALSE)

  tryCatch({
    data.df <- read_data_sheet(url,
                               tab_name = tab_name,
                               spec.df = spec.df)

    }, error=function(e) {
       print(e)
       return( NA)
    }
  )

  if(!validate_data_columns(data.df, spec.df)){

  }

  
  id_name = data.df[[id_column]][1]
  csv_file_name <- file.path(csv_folder, paste0(tab_name, '_', id_new, '.csv'))
  # validate here
  
  utils::write.csv(data.df, csv_file_name, row.names = FALSE)
  return(csv_file_name)

}


#' create a report of validation results
#' 
#' @param data.df data frame to validate
#' @param validation_file validations rules
#' @returns string of validation results, empty string if no errors
validation_report<- function(data.df, validation_file){
  confrontation<- validate_from_file(data.df, validation_file)
  validation_summary <- validate::summary(confrontation)
  if(sum(validation_summary$fails) == 0) {
    return("")
  } else {
    # print(validation_summary)
    fails <- dplyr::filter(validation_summary , fails > 0)
    return(fails)
  }
}

