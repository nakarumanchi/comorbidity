### Clean datasets to include in the package
# Required packages:
library(readxl)
library(stringr)
library(devtools)

### Dataset #1: ICD-10 codes, 2009 version
# Download dataset
download.file(url = "ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Publications/ICD10/allvalid2009(detailed%20titles%20headings).xls", destfile = "data-raw/allvalid2009.xls")

# Read data in Excel format
icd10_2009 <- readxl::read_excel(
  "data-raw/allvalid2009.xls",
  skip = 7,
  col_names = c("Status", "Code", "ICD.title")
)

# Remove lines where code contains the character "-", i.e. headers:
icd10_2009[grepl("-", icd10_2009$Code), ]
icd10_2009 <- icd10_2009[!grepl("-", icd10_2009$Code), ]

# Produce a "Code.clean" variable with no punctuation
icd10_2009$Code.clean <- stringr::str_replace_all(string = icd10_2009$Code, pattern = "[^[:alnum:]]", replacement = "")

# Re-order the columns
icd10_2009 <- icd10_2009[, c(2, 4, 3, 1)]

# Save data in R format
devtools::use_data(icd10_2009, overwrite = TRUE)

### Dataset #2: ICD-10 codes, 2011 version
# Download dataset
download.file(url = "ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Publications/ICD10/allvalid2011 (detailed%20titles%20headings).xls", destfile = "data-raw/allvalid2011.xls")

# Read data in Excel format
icd10_2011 <- readxl::read_excel(
  "data-raw/allvalid2011.xls",
  skip = 7,
  col_names = c("Status", "Code", "ICD.title")
)

# Remove lines where code contains the character "-", i.e. headers:
icd10_2011[grepl("-", icd10_2011$Code), ]
icd10_2011 <- icd10_2011[!grepl("-", icd10_2011$Code), ]

# Produce a "Code.clean" variable with no punctuation
icd10_2011$Code.clean <- stringr::str_replace_all(string = icd10_2011$Code, pattern = "[^[:alnum:]]", replacement = "")

# Re-order the columns
icd10_2011 <- icd10_2011[, c(2, 4, 3, 1)]

# Save data in R format
devtools::use_data(icd10_2011, overwrite = TRUE)