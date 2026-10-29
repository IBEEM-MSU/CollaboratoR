### Using Excel with R/Collaborator

Microsoft365R connects to OneDrive for Business and SharePoint; pair it with readxl to read workbook sheets. CRAN release2.4.1 added Excel-file support to load_dataframe(). It downloads the workbook and parses it as a data frame, rather than requiring you to call the Excel API directly.

- also install 'httpuv' for R to be able to work with a browser.   

When trying to load "get_business_onedrive()" it requires permission from the 
owners of Microsoft in your institution.  

```
Approval required
AzureR/Microsoft365R
This app requires your admin's approval to:
- Have full access to all files user can access
- Sign in and read user profile
- Maintain access to data you have given it access to
```


Example code

```
# install (once)
install.packages(c("Microsoft365R", "readxl"))
```

then 
```
# note 'readxl' needs to be installed but this one package will use it

library(Microsoft365R)

# Sign in to your work or school Microsoft 365 account
odb <- get_business_onedrive()

# Optionally list files to find the workbook 
# for examle 
odb$list_files("collaborative_project")

# Read a named worksheet into a data frame
# it's not necessary to list them first if you know the
# whole path in OneDrive
dat <- odb$load_dataframe(
  "collaborative_project/iris.xlsx",
  sheet = "Data"
)

```




## sharepoint 


When accessing Sharepoint for the first time, one gets this permission message:

```
Approval required
AzureR/Microsoft365R
This app requires your admin's approval to:
- Read and write all groups
- Read directory data
- Edit or delete items in all site collections
- Create, edit, and delete items and lists in all site collections
- Sign users in
- Maintain access to data you have given it access to
- View users' email address
```

Which type of share drive 

```
site <- get_sharepoint_site(
  site_url = "https://yourtenant.sharepoint.com/sites/yoursite"
)

# get a folder 
site$list_drives()
drv <- site$get_drive("Documents")

dat <- drv$load_dataframe(
  "folder/report.xlsx",
  sheet = "Data"
)
```


note for something: iris data available from https://archive.ics.uci.edu/dataset/53/iris
