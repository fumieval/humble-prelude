humble-prelude: the worst prelude alternative
====

[![Build Status](https://travis-ci.org/fumieval/humble-prelude.svg?branch=master)](https://travis-ci.org/fumieval/humble-prelude)
[![Hackage](https://img.shields.io/hackage/v/humble-prelude.svg)](https://hackage.haskell.org/package/humble-prelude)
[![Discord](https://img.shields.io/discord/664807830116892674?color=%237095ec&label=Discord&style=plastic)](https://discord.gg/DG93Tgs)

This library aims to be an intersection of the current prelude ands "how it should be in the future". Unlike many other prelude alternatives, this package __does not__:

* Introduce any new abstraction
* Provide new functions
* Reexport a bunch of other libraries

Instead it's a subset of Prelude. Any Haskell source based on `HumblePrelude` should also be buildable with `Prelude`.

For those who want more convenience, `HumblePrelude.Extras` reexports things that are frequently imported only for one or two symbols (e.g. Generic for deriving). But __nothing else__.

Plugin
----

One of the well-known problems of Prelude alternatives is the tempo loss of importing the module itself.
humble-prelude offers a GHC plugin that imports any module specified in the flag. Add the following lines into your cabal file:

```
  ghc-options: -fplugin=HumblePrelude.Plugin
  default-extensions: NoImplicitPrelude
```

Recommended libraries to complement this package
----

* Transmit byte sequence efficiently into a handle or a socket, or a new ByteString: [mason](https://hackage.haskell.org/package/mason)
* Print something in a human-readable format: [prettyprinter](https://hackage.haskell.org/package/prettyprinter)
* Concurrency, exceptions, process handling and file operations: [unliftio](https://hackage.haskell.org/package/unliftio)
* Safely obtain minimum/maximum values: [lens:Control.Lens.Fold](http://hackage.haskell.org/package/lens-4.18.1/docs/Control-Lens-Fold.html#v:minimumOf)
* Parsing: [attoparsec](https://hackage.haskell.org/package/attoparsec)
* Manipulating non-empty structures: [semigroupoids](http://hackage.haskell.org/package/semigroupoids)
* Generic filters: [witherable](https://hackage.haskell.org/package/witherable)