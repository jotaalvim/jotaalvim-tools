{-# LANGUAGE PackageImports #-}
{-# OPTIONS_GHC -XNPlusKPatterns #-}
{-# OPTIONS_GHC -XMultiParamTypeClasses #-}
{-# OPTIONS_GHC -XFlexibleInstances #-}
{-# OPTIONS_GHC -XFlexibleContexts #-}
{-# OPTIONS_GHC -XNoMonomorphismRestriction #-}

import System.Environment
import System.Directory
import System.Process

-- pushb :
--     git stash push  
--     git switch 

-- popb :
-- git switch 
-- git stash pop

-- readProcess :: FilePath -> [String] -> String -> IO String

strip = takeWhile (/= '\n')

getBranchName    = readProcess "git" ["rev-parse", "--abbrev-ref", "HEAD"] []
gitSwitch branch = readProcess "git" ["switch", branch] []
gitStashPush     = readProcess "git" ["stash" , "push"] [] 


main = do
    branchToSwitch <- strip <$> head <$> getArgs

    if branchToSwitch == "." 
    then do
        name <- getBranchName 
        gitStashPush
        gitSwitch name
    else do
        gitStashPush
        gitSwitch branchToSwitch
