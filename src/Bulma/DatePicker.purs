module Bulma.DatePicker where

import Prelude

-- Internal
import Bulma.Common ( DateTimePickerSpec )
import Bulma.Common as Common
import Bulma.Header as Header
-- UUID
import Data.UUID as UUID
-- Halogen
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP

type State =
  { options :: DateTimePickerSpec
  }

type ChildSlot =
  ( header :: Header.Slot Unit
  )

component :: forall q i o m. H.Component HH.HTML q i o m
component =
  H.mkComponent
  { initialState: const { options: Common.defaultSpec }
  , render
  , eval: H.mkEval $ H.defaultEval
    { handleAction = handleAction }
  }

render :: forall action m. State -> H.ComponentHTML action ChildSlot m
render st =
  HH.div
  [ HP.id_ ( UUID.toString st.options.elemId ) ]
  [ HH.div
    [ Common.css $ "datetimepicker-dummy " <> Common.pickerStateToString st.options.pickerState ]
    [ HH.div
      [ Common.css "datetimepicker-dummy-wrapper" ]
      [ HH.input
        [ Common.css $ "datetimepicker-dummy-input" <>  st.options.isRange
        , HP.placeholder st.options.labelFrom
        , HP.readOnly true
        , HP.type_ HP.InputText
        ]
      ]
    , HH.button
      [ Common.css "datetimepicker-clear-button"]
      [ HH.text "+" ]
    ]
  , HH.div
    [ Common.css $ "datetimepicker-wrapper " <> Common.displayModeToString st.options.displayMode ]
    [ HH.div
      [ Common.css $ "modal-background " <> st.options.isModal ]
      []
    , HH.div
      [ Common.css
        $ "datetimepicker is-datetimepicker-default "
        <> st.options.color
        <> " "
        <> Common.dropDownStateToString st.options.dropDownState
      ]
      [ HH.div
        [ Common.css $ "datetimepicker-container " <> Common.headerPosToString st.options.headerPosition ]
        [ HH.slot Header._header unit Header.component unit absurd ]
      ]
    ]
  ]

handleAction :: forall action o m. action -> H.HalogenM State action ChildSlot o m Unit
handleAction = const $ pure unit

