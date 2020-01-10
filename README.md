humble-prelude: get rid of bad habits
====

[![Build Status](https://travis-ci.org/fumieval/humble-prelude.svg?branch=master)](https://travis-ci.org/fumieval/humble-prelude)
[![Hackage](https://img.shields.io/hackage/v/humble-prelude.svg)](https://hackage.haskell.org/package/humble-prelude)
[![Discord](https://img.shields.io/discord/664807830116892674?color=%237095ec&label=Discord&style=plastic)](https://discord.gg/DG93Tgs)

This library aims to be an intersection of the current prelude ands "how it should be in the future". Unlike many other prelude alternatives, this package __does not__:

* Introduce any new abstraction
* Provide new functions
* Reexport a bunch of other libraries

So any Haskell source based on `HumblePrelude` should also be buildable with `Prelude`.

For those who want more convenience, `HumblePrelude.Extras` reexports things that are frequently imported only for a single symbol (e.g. Generic for deriving). But __nothing else__.