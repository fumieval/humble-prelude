module HumblePrelude.Extras (
  -- * Control.Applicative
  liftA2
  , Alternative(empty, (<|>))
  -- * Control.Monad
  , guard
  , when
  , unless
  -- * Data.Function
  , (&)
  , fix
  -- * Data.Functor
  , (<&>)
  , void
  -- * Data.Ord
  , comparing
  -- * Data.Foldable
  , traverse_
  , for_
  , foldl'
  -- * Data.Traversable
  , for
  -- * Common types
  , ByteString
  , Constraint
  , Generic
  , MonadIO(liftIO)
  , NFData
  , Proxy(..)
  , Text
  , Type
  , module HumblePrelude
  ) where

import Control.Applicative
import Control.DeepSeq (NFData)
import Control.Monad (guard, when, unless)
import Control.Monad.IO.Class (MonadIO(..))
import Data.ByteString (ByteString)
import Data.Foldable
import Data.Function ((&), fix)
import Data.Functor ((<&>), void)
import Data.Kind (Type, Constraint)
import Data.Ord (comparing)
import Data.Proxy
import Data.Text (Text)
import Data.Traversable
import GHC.Generics (Generic)
import HumblePrelude