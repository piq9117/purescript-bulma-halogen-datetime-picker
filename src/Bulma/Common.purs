module Bulma.Common
  ( DateTimePickerSpec
  , PickerState(..)
  , DisplayMode (..)
  , HeaderPosition (..)
  , css
  , defaultSpec
  , pickerStateToString
  , displayModeToString
  , headerPosToString
  ) where

import Prelude
-- import Data.Maybe ( Maybe )
-- UUID
import Data.UUID ( UUID, emptyUUID )
-- Halogen
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP

css :: forall r i. String -> HH.IProp ( class :: String | r ) i
css = HP.class_ <<< HH.ClassName

type DateTimePickerSpec =
  { elemId :: UUID
  , pickerState :: PickerState
  -- , type_ :: String
  -- , color :: String
  , isRange :: String
  -- , allowSameDae :: Boolean
  -- , lang :: String
  -- , dateFormat :: String
  -- , timeFormat :: String
  , displayMode :: DisplayMode
  -- , position :: String
  -- , showHeader :: Boolean
  , headerPosition :: HeaderPosition
  -- , showFooter :: Boolean
  -- , showButtons :: Boolean
  -- , showTodayButton :: Boolean
  -- , showClearButton :: Boolean
  -- , cancelLabel :: String
  -- , clearLabel :: String
  -- , nowLabel :: String
  -- , validateLabel :: String
  -- , enableMonthSwitch :: Boolean
  -- , enableYearSwitch :: Boolean
  -- , startDate :: Maybe String
  -- , endDate :: Maybe String
  -- , minDate :: Maybe String
  -- , maxDate :: Maybe String
  -- , disabledDates :: Array String
  -- , disabledWeekDays :: Maybe String
  -- , weekStart :: Int
  -- , startTime :: Maybe String
  -- , endTime :: Maybe String
  -- , minuteSteps :: Int
  , labelFrom :: String
  -- , labelTo :: String
  -- , closeOnOverlayClick :: Boolean
  -- , closeOnSelect :: Boolean
  -- , closeOnSelect :: Boolean
  -- , toggleOnInputClick :: Boolean
  -- , icons :: Icons
  }

type Icons =
  { previous :: String
  , next :: String
  , time :: String
  , date :: String
  }

defaultSpec :: DateTimePickerSpec
defaultSpec =
  { elemId: emptyUUID
  , pickerState: PickerStateActive
  , labelFrom: mempty
  , isRange: mempty
  , displayMode: DisplayModeHidden
  , headerPosition: HeaderTop
  }

data PickerState
  = PickerStateActive
  | PickerStateHidden

pickerStateToString :: PickerState -> String
pickerStateToString = case _ of
  PickerStateActive -> "is-active"
  PickerStateHidden -> "is-hidden"

data DisplayMode
  = DisplayModeHidden
  | DisplayModeModal
  | DisplayModeEmpty

displayModeToString :: DisplayMode -> String
displayModeToString = case _ of
  DisplayModeHidden -> "is-hidden"
  DisplayModeModal -> "modal"
  DisplayModeEmpty -> mempty

data HeaderPosition
  = HeaderTop
  | HeaderBottom

headerPosToString :: HeaderPosition -> String
headerPosToString = case _ of
  HeaderTop -> ""
  HeaderBottom ->  "has-header-bottom"
