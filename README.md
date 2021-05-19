# Testing our Datathlon workflow

## Not Fully Automated Worklow: Data Curation & Templates

This part of the workflow counts on many different contributors who write code on different levels in R, Python, or do not write code at all. Automation will be supported with tutorials, potentially solutions, or even a Shiny app, but not **submission day**, i.e. 21 May.

1. We are creating completely new data tables which go through peer-reviewed code, unit-tests, and a knowledgable curators reviews them from both methodological and documentation point of view. Each genuinely new dataset must receive a new DOI, the updated ones receive a DOI version for each table. This process needs to be calibrated with curators themselves. Here is the [repo](https://github.com/dataobservatory-eu/observatory_data_curators) for the [Automated Observatory Data Curator's Handbook](http://curators.dataobservatory.eu/)

2. Automation for Zenodo uploads (updates) is encouraged, but not always necessary.  A Zenodo puts somebody responsible for each upload, so only genuinly new datasets that went through unit-tests, and their curator approved them, should get on Zenodo. The  `Working_on_Zenodo.Rmd`, see [here](https://rpubs.com/antaldaniel/zenodo-sandbox-setup) will be a tutorial for curators working in R. We should have a Python tutorial, too.

## Fully Automated Workflow 

3. In some cases, pre-defined and well-documented datatables can be updated programatically, using the ORCID ID and PAT of their creator.
Every day an R instance runs a script.  _In the first days, this should be done manually, but we have a template:_ [Curated Indicators](https://rpubs.com/antaldaniel/curated-database-demo).

4. The initial observatory instances will be automatically updated with one script per observatory relying entirely on the  [indicator](https://github.com/dataobservatory-eu/indicator) package. This is now public.
* Indicator should handle eventually all automated R tasks, see [Curated Indicators](https://rpubs.com/antaldaniel/curated-database-demo).
* If necessary, we should have a similar Python library. 
* Indicator will harvest individual uploads from curators, too.

5. Unit testing for the three initial packages, iotables, regions, retroharmonize has been moved to Github now. Feel welcome to raise issues or pick up them. 

6 .The indicators prepared in 1-2 are uploaded in a Sqlite db file _temporarily_ to the _data-raw_ folder of  [indicator](https://github.com/dataobservatory-eu/indicator) the package. See _dmo.db_ for the [Digital Muisc Observatory](https://music.dataobservatory.eu/)

7. The new_data / my_data.db goes to the serverthat runs our datasette instance (Boti). It is parameterized in a way that when a my_data.db arrives, it appends or updates the tables. Here is the test version of the API: http://34.226.91.55 . Any .db file that is transferred to the /home/ubuntu directory of the server will be processed automatically (nonduplicate records added to the dataset).

6. One the [Datasette](http://34.226.91.55) is updated, we should have second trigger. 

7. This should start an R script somewhere. It updates an R bookdown longform documentation (see for example [music.dataobservatory.eu](https://music.dataobservatory.eu/)), which created an updated longform documentation to the new datafiles. This can be very straightforward, each table in the Datasette has a place in the longform description (maybe a knitr child markdown template); the table is downloaded from the API, its presentation formats are added to the bookdown html, epub, pdf versions. 

8. The output of the R script is a “book” which has html, pdf, epub formats. This is uploaded to a server (maybe a Github page?)  My current workflow for top-domains is to send it via Github Action to Netlify, but I could never work out Netlify's subdomain management. So I manually send to subdomain version to ftp.  I think eventually using an own server and managing our subdomains is better workflow. 

9. We can partially automate the front-end website, too.  Currently my netlify workflow actually uses Github Action, and  [netlify](https://www.netlify.com/) is razor fast, extremely cheap, and very well integrated with hugo, for example, which we use for the front-end webiste. We have two websites to maintain [Green Deal Data Observatory](http://greendeal.dataobservatory.eu/) and [Digital Music Observatory](https://greendeal.dataobservatory.eu/)  

## Business Workflow 

An important aspect of the Datathon is the creation of a for-profit business plan or social enterprise plan that makes the maintenance and growth of our observatories sustainable.

a) Create the actual submissions (they will be place in this repo.)

b) Maintain a handbook for partners and the website contents.

