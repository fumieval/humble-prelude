{-# LANGUAGE OverloadedStrings #-}
-----------------------------------------------------------------------------
-- |
-- Module      :  HumblePrelude.Plugin
-- Copyright   :  (c) Fumiaki Kinoshita 2020
-- License     :  BSD-style (see the file LICENSE)
--
-- Maintainer  :  fumiexcel@gmail.com
-- Stability   :  experimental
-- Portability :  portable
--
-- GHC plugin which adds imports to specified modules
--
-----------------------------------------------------------------------------
module HumblePrelude.Plugin (plugin) where

import HumblePrelude
import GhcPlugins hiding ((<>))
import HsSyn (hsmodImports, simpleImportDecl)

-- | @Usage: -fplugin=HumblePrelude.Plugin@
plugin :: Plugin
plugin = defaultPlugin
  { parsedResultAction = parsedPlugin
  , pluginRecompile = flagRecompile }

parsedPlugin :: [CommandLineOption] -> ModSummary -> HsParsedModule -> Hsc HsParsedModule
parsedPlugin [] ms hpm = parsedPlugin ["HumblePrelude.Extras"] ms hpm
parsedPlugin mods _ pm = do
  let rep = noLoc . simpleImportDecl . mkModuleName <$> mods
  pure pm { hpm_module = fmap (\m -> m { hsmodImports = rep <> hsmodImports m }) $ hpm_module pm }
