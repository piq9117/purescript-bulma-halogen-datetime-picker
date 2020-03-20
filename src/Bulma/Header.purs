module Bulma.Header where

import Prelude
import Data.Symbol ( SProxy(..) )
-- Internal
import Bulma.Common ( DateTimePickerSpec )
import Bulma.Common as Common
-- Halogen
import Halogen as H
import Halogen.HTML as HH

type State =
  { options :: DateTimePickerSpec
  }

type Slot slot = forall query. H.Slot query Void slot

_header :: SProxy "header"
_header = SProxy

component :: forall q i o m. H.Component HH.HTML q i o m
component =
  H.mkComponent
  { initialState: const { options: Common.defaultSpec }
  , render
  , eval: H.mkEval H.defaultEval
  }

render :: forall action m. State -> H.ComponentHTML action () m
render st =
  HH.div_
  [ fromRangeElement st
  ]

fromRangeElement :: forall a action. State -> HH.HTML a action
fromRangeElement st =
  HH.div
  [ Common.css $ "datetimepicker-header " <> Common.typeToString st.options.type_ ]
  [ HH.div
    [ Common.css "datetimepicker-selection-details" ]
    [ HH.div
      [ Common.css "datetimepicker-selection-from " ]
      [ HH.text st.options.labelFrom ]
    , HH.div
      [ Common.css "datetimepicker-selection-start "]
      [ HH.div
        [ Common.css "datetimepicker-selection-wrapper" ]
        [ HH.div
          [ Common.css "datetimepicker-selection-day" ]
          []
        , HH.div
          [ Common.css "datetimepicker-selection-date" ]
          [ HH.div
            [ Common.css "datetimepicker-selection-month" ]
            []
          , HH.div
            [ Common.css "datetimepicker-selection-weekday" ]
            [ timeElement ]
          ]
        ]
      ]
    ]
  ]

toRangeElement :: forall a action. HH.HTML a action
toRangeElement =
  HH.div
  [ Common.css "datetimepicker-selection-details" ]
  [ HH.div
    [ Common.css "datetimepicker-selection-to " ]
    []
  , HH.div
    [ Common.css "datetimepicker-selection-end" ]
    [ HH.div
      [ Common.css "datetimepicker-selection-wrapper" ]
      [ HH.div
        [ Common.css "datetimepicker-selection-day" ]
        []
      , HH.div
        [ Common.css "datetimepicker-selection-date" ]
        [ HH.div
          [ Common.css "datetimepicker-selection-month"]
          []
        , HH.div
          [ Common.css "datetimepicker-selection-weekday"]
          [ timeElement ]
        ]
      ]
    ]
  ]

timeElement :: forall a action. HH.HTML a action
timeElement =
  HH.div
  [ Common.css "datetimepicker-selection-time" ]
  [ HH.div
    [ Common.css "datetimepicker-selection-time-icon" ]
    [ HH.figure
      [ Common.css "image 16x16" ]
      [ HH.text ""
      ]
    ]
  , HH.div
    [ Common.css "datetimepicker-selection-hour" ]
    []
  ]

