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
module HumblePrelude.Plugin (Plugin, importPlugin) where

import HumblePrelude
import GhcPlugins hiding ((<>))
import HsSyn (hsmodImports, simpleImportDecl)

-- | A GHC plugin that imports specified modules
importPlugin :: [String] -> Plugin
importPlugin mods = defaultPlugin
  { parsedResultAction = parsedPlugin . (mods<>)
  , pluginRecompile = flagRecompile }

parsedPlugin :: [CommandLineOption] -> ModSummary -> HsParsedModule -> Hsc HsParsedModule
parsedPlugin mods _ pm = do
  let rep = noLoc . simpleImportDecl . mkModuleName <$> mods
  pure pm { hpm_module = fmap (\m -> m { hsmodImports = rep <> hsmodImports m }) $ hpm_module pm }
