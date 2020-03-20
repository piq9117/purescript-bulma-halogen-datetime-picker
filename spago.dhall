{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "purescript-bulma-halogen-datetime-picker"
, dependencies =
    [ "console"
    , "datetime"
    , "effect"
    , "halogen"
    , "psci-support"
    , "svg-parser-halogen"
    , "uuid"
    , "web-html"
    ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
