# Testing our Datathlon workflow

1. We are creating completely new data tables which go through peer-reviewed code, unit-tests, and a knowledgable curators reviews them from both methodological and documentation point of view. Each genuinly new dataset must receive a new DOI, the updated ones receive a DOI version for each table. This requires their upload table by table to Zenodo, which must be done quasi-manually, with our help. A Zenodo puts somebody responsible for each upload, so only genuinly new datasets that went through unit-tests, and their curator approved them, should get on Zenodo.  `Working_on_Zenodo.Rmd`, see [here](https://rpubs.com/antaldaniel/zenodo-sandbox-setup)

2. In some cases, pre-defined and well-documented datatables can be updated programatically, using the ORCID ID and PAT of their creator.
Every day an R instance runs a script. It checks fornew data in the Eurostat data warehouse (and later in other sources, but this is very straightforward.) The script,using the [indicator](https://github.com/dataobservatory-eu/indicator) package, downloads and corrects /enhances the eurostat indicators, and creates our versions and combinations. Each indicator receives three tables: the statistical table, a metadata table, and a labeling table.I have been perfecting the indicator package today, and I think it will work very well in a few days, but in other cases, we can use whatever code to create release-ready tables. [at one point this should run on a server and be part of the workflow, now it happens locally, but of course, this can be easily added to the github actions. ]  The _indicator_ package currently downloads data from the Eurostat warehouse, runs about 7 enhancements ( forecasting, approximation, imputation, geocode correction ) and documentation functions.  I think that eventually this will be able to create hundreds of official statistics grade new indicators. 

3. Unit testing: this is moving to Github now.

4.The indicators prepared in 1-2 are uploaded in a Sqlite db file to a new_datafolder of repo. 

5. This triggers the first action. The new_data / my_data.db goes to the serverthat runs our datasette instance (Boti). It is parameterized in a way that when a my_data.db arrives, it appends or updates the tables. Here is Boti's test version from today: [http://54.165.46.111:8000/](http://54.165.46.111:8000/)

6. One the [Datasette](http://54.165.46.111:8000/) is updated, we should havea second trigger. 

7. This should start an R script somewhere. It updates an R bookdown longform documentation (see for example [music.dataobservatory.eu](https://music.dataobservatory.eu/)), which created an updated longform documentation to the new datafiles. This can be very straightforward, each table in the Datasette has a place in the longform description (maybe a knitr child markdown template); the table is downloaded from the API, its presentation formats are added to the bookdown html, epub, pdf versions. 

8. The output of the R script is a “book” which has html, pdf, epub formats. This is uploaded to a server (maybe a Github page?)  My current workflow for top-domains is to send it via Github Action to Netlify, but I could never work out Netlify's subdomain management. So I manually send to subdomain version to ftp.  I think eventually using an own server and managing our subdomains is better workflow. 

9. We can partially automate the front-end website, too.  Currently my netlify workflow actually uses Github Action, and  [netlify](https://www.netlify.com/) is razor fast, extremely cheap, and very well integrated with hugo, for example, which we use for the front-end webiste, see [here](https://naughty-jepsen-95cdf2.netlify.app/). 


