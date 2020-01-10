{-# LANGUAGE Trustworthy #-}

-----------------------------------------------------------------------------
-- |
-- Module      :  HumblePrelude
-- Copyright   :  (c) Fumiaki Kinoshita 2020, The University of Glasgow 2001
-- License     :  BSD-style (see the file libraries/base/LICENSE)
--
-- Maintainer  :  fumiexcel@gmail.com
-- Stability   :  experimental
-- Portability :  portable
--
-- The Prelude: a standard module. The Prelude is imported by default
-- into all Haskell modules unless either there is an explicit import
-- statement for it, or the NoImplicitPrelude extension is enabled.
--
-----------------------------------------------------------------------------

module HumblePrelude (

    -- * Standard types, classes and related functions

    -- ** Basic data types
    Bool(False, True),
    (&&), (||), not, otherwise,

    Maybe(Nothing, Just),
    maybe,

    Either(Left, Right),
    either,

    Ordering(LT, EQ, GT),
    Char, String,

    -- *** Tuples
    fst, snd, curry, uncurry,

    -- ** Basic type classes
    Eq((==), (/=)),
    Ord(compare, (<), (<=), (>=), (>), max, min),
    Enum(fromEnum),
    Bounded(minBound, maxBound),

    -- ** Numbers

    -- *** Numeric types
    Int, Integer, Float, Double,
    Rational, Word,

    -- *** Numeric type classes
    Num((+), (-), (*), negate, abs, signum, fromInteger),
    Real(toRational),
    Integral(quot, rem, div, mod, quotRem, divMod, toInteger),
    Fractional((/), recip, fromRational),
    Floating(pi, exp, log, sqrt, (**), logBase, sin, cos, tan,
             asin, acos, atan, sinh, cosh, tanh, asinh, acosh, atanh),
    RealFrac(properFraction, truncate, round, ceiling, floor),
    RealFloat(floatRadix, floatDigits, floatRange, decodeFloat,
              encodeFloat, exponent, significand, scaleFloat, isNaN,
              isInfinite, isDenormalized, isIEEE, isNegativeZero, atan2),

    -- *** Numeric functions
    subtract, even, odd, gcd, lcm, (^), (^^),
    fromIntegral, realToFrac,

    -- ** Semigroups and Monoids
    Semigroup((<>)),
    Monoid(mempty, mconcat),

    -- ** Monads and functors
    Functor(fmap, (<$)), (<$>),
    Applicative(pure, (<*>), (*>), (<*)),
    Monad((>>=)),
    MonadFail,
    mapM_, sequence_, (=<<),

    -- ** Folds and traversals
    Foldable(elem,      -- :: (Foldable t, Eq a) => a -> t a -> Bool
             -- fold,   -- :: Monoid m => t m -> m
             foldMap,   -- :: Monoid m => (a -> m) -> t a -> m
             foldr,     -- :: (a -> b -> b) -> b -> t a -> b
             -- foldr', -- :: (a -> b -> b) -> b -> t a -> b
             foldl,     -- :: (b -> a -> b) -> b -> t a -> b
             -- foldl', -- :: (b -> a -> b) -> b -> t a -> b
             product,   -- :: (Foldable t, Num a) => t a -> a
             sum),      -- :: Num a => t a -> a
             -- toList) -- :: Foldable t => t a -> [a]

    Traversable(traverse, sequenceA, mapM, sequence),

    -- ** Miscellaneous functions
    id, const, (.), flip, ($), until,
    asTypeOf, error, errorWithoutStackTrace,
    seq, ($!),

    -- * Foldable operations
    null, length,
    -- *** Special folds
    and, or, any, all,

    -- ** Show (only for API interoperability)
    Show,

    -- * Basic Input and output
    IO,

    -- *** Files
    FilePath,

  ) where

import Control.Monad
import Control.Monad.Fail
import System.IO
import Data.List
import Data.Either
import Data.Foldable    ( Foldable(..) )
import Data.Functor     ( (<$>) )
import Data.Maybe
import Data.Traversable ( Traversable(..) )
import Data.Tuple

import GHC.Base hiding ( foldr, mapM, sequence )
import GHC.Enum
import GHC.Num
import GHC.Real
import GHC.Float
import GHC.Show
