module Main where

import Prelude
-- Bulma DateTime Picker
import Bulma.DatePicker as DatePicker
-- Effect
import Effect ( Effect )
-- Halogen
import Halogen.Aff as HA
import Halogen.VDom.Driver ( runUI )

main :: Effect Unit
main = HA.runHalogenAff do
  body <- HA.awaitBody
  runUI DatePicker.component unit body
