module Bulma.DatePicker where

import Prelude

-- Halogen
import Halogen as H
import Halogen.HTML as HH

component :: forall q i o m. H.Component HH.HTML q i o m
component =
  H.mkComponent
  { initialState: identity
  , render
  , eval: H.mkEval H.defaultEval
  }

render :: forall state action m. state -> H.ComponentHTML action () m
render _ =
  HH.h1_ [ HH.text "Hello, World!" ]

-- export default (data) => {
--   return `<div class="datepicker">
--     <div class="datepicker-nav">
--         <button type="button" class="datepicker-nav-previous button is-small is-text">${data.icons.previous}</button>
--         <div class="datepicker-nav-month-year">
--           <div class="datepicker-nav-month"></div>
--           &nbsp;
--           <div class="datepicker-nav-year"></div>
--         </div>
--         <button type="button" class="datepicker-nav-next button is-small is-text">${data.icons.next}</button>
--       </div>
--       <div class="datepicker-body">
--         <div class="datepicker-dates is-active"></div>
--         <div class="datepicker-months"></div>
--         <div class="datepicker-years"></div>
--       </div>
--     </div>`;
-- };
