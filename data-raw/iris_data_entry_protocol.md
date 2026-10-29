## CollaboratoR package Tutorial: Data Entry protocol for the Iris Data set

This is an imaginary data entry protocol for 
[*"Fisher's Iris data"*](https://en.wikipedia.org/wiki/Iris_flower_data_set) 
written to demonstrate how to set-up and use use the CollaboratoR package and 
system for collaborative data entry.  See the Vignette "CollaboratoR Example" in 
the R package and website: https://ibeem-msu.github.io/CollaboratoR/  this is not
in any way represents how the data were actually collected and recorded by 
Edgar Anderson in the 1930s and is purely ficitonal.

## Data Entry protocol

For measurement protocol, see Edgar Anderson (1936). "The species problem in Iris". Annals of the Missouri Botanical Garden. 23 (3): 457–509. Bibcode:1936AnMBG..23..457A. doi:10.2307/2394164. JSTOR 2394164.

This protocol is about how one could enter the data into spreadsheets for 

1. There is a different spreadsheet for each Iris species - for now enter only species under observation
   Those species are listed in. The protocol is to keep each species' measurements in it's own spreadsheet to 
   help manage data entry.

2. add an entry to the species list in the sheet called "species"  This is a one
   column sheet with just the scientific name.  The template sheet has a 'drop down' that
   restricts the column to be an entry in this list
   
3.   Add a new spreadsheet when entering data for a species without an existing sheet
   a. make a copy the iris template spreadsheet, with the name of the biomial 
   separated with an underscore (genus_species) in the same folder (you may have to move it). 
   Using sheet names without spaces allows the variables automatically created for those 
   sheets when read into R to be use without quotes (variables can't have spaces in them)

   
4. for each recorded measurement for your species, enter a row of data in the spreadsheet
   following the template.  
   Column "species" is the scientific name name again, standard binomial, the template
   for this column has a drop down that is built from the 'species' sheet (step 2 above)
   *this seems redundant but makes the aggregation of these sheets in code much easier*
   If there is a subspecies, include that (Genus species subspecies).  There is no
   need to italicize as all formatting will be stripped when data is imported
   columns enter the measurements per protocol in Anderson 1936 in columns as listed 
   in the sheet "Measurements Spec"
   
  
5. After completing data entry, or at point where validation is desired, add a
   row for this sheet (Google URL) to the sheet "ID_urls"  This is the list of 
   data sheets that the validation will read from
   - column 1. "who" enter your initials.  This is informational only.  If 
     multiple people enter data in this sheet, add more initials separated by commas
   - column 2. ID  the unique ID value of this sheet.  For this study, that is just the genus_species
     but for others may be a different ID with a protocol for assigning those IDs (
     (for example, per site)
   - column 3. url: copy and paste the url for the sheet this does not have to include the 'edit' portion
   - column 4. notes: optional notes you'd like to make about this sheet, issues, etc
   


