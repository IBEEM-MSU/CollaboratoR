# pull drive email from environment

convenience method for replacing an empty drive, called by drive_setup

## Usage

``` r
get_drive_email(drive_email = NULL)
```

## Arguments

- drive_email:

  optional str, email address, if not provided will use envronment

## Value

string, the email to use, either what was sent or from the config
