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
source("test.R")
print("end ants tutorial")
rm(list = ls())
setwd("/tmp/sccanTutorial")
source("test.R")
print("end sccan tutorial")
# test some stuff from ben
setwd(testdir)
system( paste( "rm -r -f /tmp/antsASLProcessing" ) )
setwd("/tmp/")
system("git clone https://github.com/bkandel/antsASLProcessing.git")
setwd("/tmp/antsASLProcessing")
rmarkdown::render("Arterial-spin-labeling.Rmd")
print("end ben asl")
