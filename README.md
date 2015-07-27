#!/usr/bin/env Rscript
options(digits=3)
testdir='/tmp/'
# ANTsRLongTests
# Extended tests of ANTsR-related examples and documentation
repos=c("ANTsTutorial",
        "sccanTutorial")
testdirs=list()
ct=1
for ( x in repos)
  {
  setwd(testdir)
  if ( file.exists(x) )
    {
    print(paste("rm",x))
    system( paste( "rm -r -f ", x ) )
    }
  repo=paste("https://github.com/stnava/",x,".git",sep='')
  clonecmd=paste("git clone",repo)
  print(clonecmd)
  system( clonecmd )
  testdirs[[ct]]=paste(testdir,x,sep='')
  ct=ct+1
  }
rm(list = ls())
setwd("/tmp/ANTsTutorial")
system( source("test.R") )
rm(list = ls())
setwd("/tmp/sccanTutorial")
system( source("test.R") )

# test some stuff from beensetwd(testdir)
system("git clone https://github.com/bkandel/antsASLProcessing.git")
setwd("/tmp/antsASLProcessing")
Rscript -e 'rmarkdown::render("Arterial-spin-labeling.Rmd")'
