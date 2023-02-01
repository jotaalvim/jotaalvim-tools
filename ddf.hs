import System.Environment
import qualified Data.ByteString.Lazy as LB
import Crypto.Hash

import System.Directory

data Mode = Recursive | Local | Help deriving Show

valid_options = ["-r","-h"]

main :: IO ()
main = do
    args <- getArgs
    case (length args) of
        1 -> do 
            let path = head args
            case path of
                "-h" -> putStrLn "help"
                _    -> ddf path Local
        2 -> do 
            let [option,path] = args
            case (elem option valid_options) of
                True  -> ddf path Recursive
                False -> putStrLn "Invalid Option, ddf -h for help"

        _ -> putStrLn "Invalid command, please only give one directory"

ddf :: FilePath -> Mode -> IO()
ddf path Recursive = do
    print "modo recursivo"

ddf path Local = do
    --files <- listDirectory path
    --print files
    content <- LB.readFile path
    let md5Digest = md5 content 
    print md5Digest
    -- removeFile :: FilePath -> IO ()
