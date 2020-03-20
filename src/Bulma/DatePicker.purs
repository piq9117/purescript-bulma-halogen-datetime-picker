module Bulma.DatePicker where

import Prelude

-- Internal
import Bulma.Common ( DateTimePickerSpec )
import Bulma.Common as Common
-- UUID
import Data.UUID as UUID
-- Halogen
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP

type State =
  { options :: DateTimePickerSpec
  }

component :: forall q i o m. H.Component HH.HTML q i o m
component =
  H.mkComponent
  { initialState: const { options: Common.defaultSpec }
  , render
  , eval: H.mkEval $ H.defaultEval
    { handleAction = handleAction }
  }


render :: forall action m. State -> H.ComponentHTML action () m
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
    [ Common.css $ "datetimepicker-wraper" <> Common.displayModeToString st.options.displayMode ]
    [ HH.div
      [ Common.css $ "modal-background" <> Common.displayModeToString st.options.displayMode ]
      []
    , HH.div
      [ Common.css "datetimepicker" ]
      [ HH.div
        [ Common.css $ "datetimepicker-container" <> Common.headerPosToString st.options.headerPosition ]
        []
      ]
    ]
  ]

handleAction :: forall action o m. action -> H.HalogenM State action () o m Unit
handleAction = const $ pure unit

-- export default (data) => {
--   return `<div id='${data.id}'>
--     <div class="datetimepicker-dummy is-hidden">
--       <div class="datetimepicker-dummy-wrapper">
--         <input placeholder="${data.labelFrom}" readonly="readonly" class="datetimepicker-dummy-input${data.isRange ? ' is-datetimepicker-range' : ''}" type="text">
--         ${data.isRange ? `<input placeholder="${data.labelTo}" readonly="readonly" class="datetimepicker-dummy-input" type="text">`: ''}
--       </div>
--       <button class="datetimepicker-clear-button">＋</button>
--     </div>
--     <div class="datetimepicker-wrapper${data.displayMode === 'dialog' ? ' modal' : ''}">
--         <div class="modal-background${data.displayMode === 'dialog' ? '' : ' is-hidden'}"></div>
--         <div class="datetimepicker">
--           <div class="datetimepicker-container${data.headerPosition === 'top' ? '' : ' has-header-bottom'}"></div>
--         </div>
--     </div>
--   </div>`;
-- };
