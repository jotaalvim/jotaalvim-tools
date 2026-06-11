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

getBranchName = readProcess "git" ["rev-parse", "--abbrev-ref", "HEAD"] []

gitSwitch branch = readProcess "git" ["switch", branch] []

gitStashPush     = readProcess "git" ["stash" , "push"] [] 

gitStashPop      = readProcess "git" ["stash" , "pop" ] []


main = do
    branchToSwitch <- head <$> getArgs

    if branchToSwitch == "." 
    then do
        name <- getBranchName 
        _ <- gitStashPush
        _ <- gitSwitch name
        print name
    else do
        _ <- gitStashPush
        _ <- gitSwitch branchToSwitch
        print branchToSwitch
