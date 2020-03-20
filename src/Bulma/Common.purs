module Bulma.Common
  ( DateTimePickerSpec
  , PickerState(..)
  , DisplayMode (..)
  , HeaderPosition (..)
  , DateTimePickerType (..)
  , DropDownState (..)
  , Icons (..)
  , css
  , defaultSpec
  , pickerStateToString
  , displayModeToString
  , headerPosToString
  , typeToString
  , dropDownStateToString
  ) where

import Prelude
import Data.Foldable ( foldl )
import Data.Either ( either )
-- Internal
import Bulma.SvgString
-- UUID
import Data.UUID ( UUID, emptyUUID )
-- Halogen
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Halogen.HTML.Core as HC
import Svg.Renderer.Halogen ( parse )

css :: forall r i. String -> HH.IProp ( class :: String | r ) i
css = HP.class_ <<< HH.ClassName

type DateTimePickerSpec =
  { elemId :: UUID
  , pickerState :: PickerState
  , type_ :: DateTimePickerType
  , color :: String
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
  , isModal :: String
  -- , labelTo :: String
  -- , closeOnOverlayClick :: Boolean
  -- , closeOnSelect :: Boolean
  -- , closeOnSelect :: Boolean
  -- , toggleOnInputClick :: Boolean
  , icons :: Icons
  , dropDownState :: DropDownState
  }

type Icons =
  { previous :: forall a action. HH.HTML a action
  , next :: forall a action. HH.HTML a action
  , time :: forall a action. HH.HTML a action
  , date :: forall a action. HH.HTML a action
  }

data DropDownState
  = DropDownActive
  | DropDownHidden

dropDownStateToString :: DropDownState -> String
dropDownStateToString = case _ of
  DropDownActive -> "is-active"
  DropDownHidden -> "is-hidden"


defaultSpec :: DateTimePickerSpec
defaultSpec =
  { elemId: emptyUUID
  , pickerState: PickerStateActive
  , labelFrom: mempty
  , isRange: mempty
  , displayMode: DisplayModeEmpty
  , headerPosition: HeaderTop
  , type_: DateTimePickerDate
  , color: "is-primary"
  , isModal: "is-hidden"
  , dropDownState: DropDownActive
  , icons:
    { previous: previousIcon
    , next: nextIcon
    , time: timeIcon
    , date: dateIcon
    }
  }

data DateTimePickerType
  = DateTimePickerTime
  | DateTimePickerDate
  | DateTimePickerDateTime

typeToString :: DateTimePickerType -> String
typeToString = case _ of
  DateTimePickerTime -> "is-hidden"
  DateTimePickerDate ->  "is-date-only"
  DateTimePickerDateTime -> ""

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

type Style =
  { styleName :: String
  , styleValue :: String
  }

styleProps :: forall r i. Array Style -> HP.IProp ( style :: String | r ) i
styleProps = HH.prop ( HC.PropName "style" )
  <<< foldl (\b a -> a.styleName <> ": " <> a.styleValue <> "; " <> b ) ""

previousIcon :: forall a action. HH.HTML a action
previousIcon = parseSvgString previousSvgString

nextIcon :: forall a action. HH.HTML a action
nextIcon = parseSvgString nextSvgString

timeIcon :: forall a action. HH.HTML a action
timeIcon = parseSvgString timeSvgString

dateIcon :: forall a action. HH.HTML a action
dateIcon = parseSvgString dateSvgString

parseSvgString :: forall a action. String -> HH.HTML a action
parseSvgString =
  either ( const $ HH.text mempty ) identity <<< parse
