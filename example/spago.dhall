{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "my-project"
, dependencies =
    [ "console"
    , "datetime"
    , "effect"
    , "halogen"
    , "psci-support"
    , "svg-parser-halogen"
    , "uuid"
    ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs", "../src/**/*.purs" ]
}
