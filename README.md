Getting-and-Cleaning-Data
==============================
Repository for the assignment of Coursera lectures Getting and Cleaning Data.

Instruction on how to run the scripts
===============================
-1. Download the run_analysis.R file in your working directory and run it in any R command shell or Rstudio session.

-2.  The script first downloads the file in a data subdirectory of your working directory: Link to data set(It is the same link as the one provided in the assignment webpage. The script will create a data subdirectory if there is not one already

-3.  Unzip the downloaded file in the data subdirectory. This will create an additional subdirectory UCI_HAR_Dataset. The script takes into account this file structure (./data/UCI_HAR_Dataset/…) and its subfolders.

-4.  Finally, the script creates both a .csv  and  .txt file called tidy_SamsungDS_Coursera.csv and tidy_SamsungDS_Coursera.txt respectively in your working directory. This is the tidy data set that the assignment required the student to create. The .txt file is created since the Coursera site does not accept .csv format.  Acceptable formats for the site are: txt, png, jpg, gif, pdf.

Note
You will probably be required to load/install the plyr package.

