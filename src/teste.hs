{-# LANGUAGE PackageImports #-}

import "cryptonite" Crypto.Hash
import qualified Data.ByteString as B
import Data.List

import System.Directory

--import Cp

--une = uncurry notElem -- . snd >< snd
--addIn2 = cond une cons snd
--mynub = cataList $ inList . (id -|- addIn2)
--repetidos = nub >>= flip (\\)

md5 :: B.ByteString -> Digest MD5 
md5 = hash

repetidos = nubBy(\(_,b)(_,d) -> b == d) >>= flip (\\)

mrf fp = do 
    f <- B.readFile fp
    return (fp , md5 f)
--mrf2 fp = B.readFile fp >>= md5
--mrf = md5 <$> B.readFile
--c <- md5 <$> B.readFile "Cp.hs" -- :: IO (Digest MD5)

cifra = (mapM mrf =<<) . listDirectory

--main2 = (repetidos =<<) . cifra
