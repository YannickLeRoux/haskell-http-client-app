{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_bitcoin (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/yannickleroux/Code/Learning/Haskell/bitcoin/.stack-work/install/x86_64-osx/72ab30e0cfd55b36f14ba0cecc5ca6964e52343f1770b32670909a882d996093/8.8.3/bin"
libdir     = "/Users/yannickleroux/Code/Learning/Haskell/bitcoin/.stack-work/install/x86_64-osx/72ab30e0cfd55b36f14ba0cecc5ca6964e52343f1770b32670909a882d996093/8.8.3/lib/x86_64-osx-ghc-8.8.3/bitcoin-0.1.0.0-9QVDD364LCxKS54enNGlz1-bitcoin"
dynlibdir  = "/Users/yannickleroux/Code/Learning/Haskell/bitcoin/.stack-work/install/x86_64-osx/72ab30e0cfd55b36f14ba0cecc5ca6964e52343f1770b32670909a882d996093/8.8.3/lib/x86_64-osx-ghc-8.8.3"
datadir    = "/Users/yannickleroux/Code/Learning/Haskell/bitcoin/.stack-work/install/x86_64-osx/72ab30e0cfd55b36f14ba0cecc5ca6964e52343f1770b32670909a882d996093/8.8.3/share/x86_64-osx-ghc-8.8.3/bitcoin-0.1.0.0"
libexecdir = "/Users/yannickleroux/Code/Learning/Haskell/bitcoin/.stack-work/install/x86_64-osx/72ab30e0cfd55b36f14ba0cecc5ca6964e52343f1770b32670909a882d996093/8.8.3/libexec/x86_64-osx-ghc-8.8.3/bitcoin-0.1.0.0"
sysconfdir = "/Users/yannickleroux/Code/Learning/Haskell/bitcoin/.stack-work/install/x86_64-osx/72ab30e0cfd55b36f14ba0cecc5ca6964e52343f1770b32670909a882d996093/8.8.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "bitcoin_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "bitcoin_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "bitcoin_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "bitcoin_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "bitcoin_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "bitcoin_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
