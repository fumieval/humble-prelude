{-# LANGUAGE OverloadedStrings #-}
module HumblePrelude.Plugin (plugin) where

import HumblePrelude
import Control.Exception (throwIO)
import GhcPlugins
import HsSyn (hsmodImports, simpleImportDecl)
import Panic (GhcException(..))

plugin :: Plugin
plugin = defaultPlugin
  { parsedResultAction = parsedPlugin
  , pluginRecompile = flagRecompile }

parsedPlugin :: [CommandLineOption] -> ModSummary -> HsParsedModule -> Hsc HsParsedModule
parsedPlugin [name] _ pm = do
  let rep = noLoc $ simpleImportDecl $ mkModuleName name
  pure pm { hpm_module = fmap (\m -> m { hsmodImports = rep:hsmodImports m }) $ hpm_module pm }
parsedPlugin _ _ _ = liftIO $ throwIO
  $ ProgramError "Please specify a module name (e.g -fplugin-opt=HumblePrelude.Plugin:HumblePrelude.Extras)"
