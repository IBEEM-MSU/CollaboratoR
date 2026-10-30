# Google Sheets API setup using Google Cloud

A goal of this package is to enable the use of Cloud-based spreadsheet
editing, such as Google Sheets, for collaborative data entry without
requiring customized, complex data entry applications The package could
also have used MS Office on-line excel editing and that’s a future
feature. The package is curently geared for Google Sheets.

In previous versions of this package, one had to create Google Cloud
projects to enable accessing Google Sheets via APIs and this vignette
had detailed instructions for setting this up. Howeve, this package now
uses the excellent [Googlesheets4](https://googlesheets4.tidyverse.org/)
package from the Posit company, which comes with a built-in default
OAuth app. No extra cloud setup or credentials files are needed.

However, the following set-up for google drive is recommended.

**Create a “shared drive”**: if you create a shared folder inside your
institutional Google Drive/Workspace, and then share that with your
collaborators, there can be problems if you leave your institution. If
your institutional account is revoked (you leave or retire) then your
google drive and all the items within may disappear. However, “Shared
drives” persist. Create a new ‘shared drive’ for your collaborative data
entry project, which may require working with your institutions Google
Workspace administrator (e.g. IT Department).

\*\*Give Collaborators permissions as “content edits”

**Global Access Not necessary** If you want to widely collaborate or
share your data, you may allow “anyone with the link” to read the files
in your folder (we’ve done this for our example project), but this is
not necessary to enable collaborators to read your sheets.

**First access requires web browser** When you or your collaborators
first access your google sheets with this package, it will require a web
browser to log-in with your google credentials. R will attempt to
automatically launch a web browser. For most of us, that will work well.
For those using Linux or command-line access (e.g. on a shared research
computer) this may be a problem and you’ll have to launch a separate
browser process yourself.
