import System.Environment
import qualified Data.ByteString.Lazy as LB
import Data.Digest.Pure.MD5

main :: IO ()
main = do
    args <- getArgs
    fileContent <- LB.readFile "foo.txt"
    let md5Digest = md5 fileContent
    print md5Digest
