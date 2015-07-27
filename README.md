#!/usr/bin/env Rscript
options(digits=3)
testdir='/tmp/'
setwd(testdir)
# ANTsRLongTests
# Extended tests of ANTsR-related examples and documentation
repos=c("sccanTutorial",
        "ANTsTutorial")
for ( x in repos)
  {
  if ( file.exists(x) )
    {
    print(paste("rm",x))
    system( paste( "rm -r -f ", x ) )
    }
  repo=paste("https://github.com/stnava/",x,".git",sep='')
  clonecmd=paste("git clone",repo)
  print(clonecmd)
  system( clonecmd )
  setwd(paste(testdir,x))
#  rm(list = ls())
  system( source("test.R") )
  }
