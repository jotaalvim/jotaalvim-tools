import System.Environment
import System.Process

parseStashInfo = init . head . (drop 3) . words . head . lines

-- readProcess :: FilePath -> [String] -> String -> IO String
gitStashList     = readProcess "git" ["stash", "list" ] []
gitSwitch branch = readProcess "git" ["switch", branch] []
gitStashPop      = readProcess "git" ["stash" , "pop" ] []

main = do
    name <- parseStashInfo <$> gitStashList
    sb <- gitSwitch name 
    sp <- gitStashPop

    putStrLn $ sp ++ sb
