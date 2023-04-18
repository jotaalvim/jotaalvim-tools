{-# LANGUAGE PackageImports #-}
{-# OPTIONS_GHC -XNPlusKPatterns #-}
{-# OPTIONS_GHC -XMultiParamTypeClasses #-}
{-# OPTIONS_GHC -XFlexibleInstances #-}
{-# OPTIONS_GHC -XFlexibleContexts #-}
{-# OPTIONS_GHC -XNoMonomorphismRestriction #-}

import Cp
import "cryptonite" Crypto.Hash
import qualified Data.ByteString as B
import Data.List
import System.Directory
import System.Process

md5 :: B.ByteString -> Digest MD5 
md5 = hash

repetidos = nubBy (\(_,b)(_,d) -> b == d) >>= flip (\\)

mrf fp = do { f <- B.readFile fp; return (fp , md5 f) }

c = unwords . (:) "rm" -- comando 

t =  sequence . map mrf -- troca

exe = fmap (c . map p1 . repetidos) . ( >>= t)

main = (system  =<<) $ exe $ listDirectory "."
