import System.Environment
import System.Process

-- pushb :
--     git stash push  
--     git switch 
-- popb :
--     git switch 
--     git stash pop

strip = takeWhile (/= '\n')

-- readProcess :: FilePath -> [String] -> String -> IO String
getBranchName    = readProcess "git" ["rev-parse", "--abbrev-ref", "HEAD"] []
gitSwitch branch = readProcess "git" ["switch", branch] []
gitStashPush     = readProcess "git" ["stash" , "push"] [] 

main = do
    branchToSwitch <- strip . head <$> getArgs

    name <- if branchToSwitch == "."
            then getBranchName
            else return branchToSwitch

    sp <- gitStashPush
    sb <- gitSwitch name

    putStrLn $ sp ++ sb
