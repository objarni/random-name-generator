module AdvancedExample exposing (update)

-- This is what using Random.Name
-- would look like in parts of a
-- TEA web app, with a custom
-- random name space


update msg model =
    let
        mySpace =
            space
                { starts = dimension "2" "3" [ "4", "5" ]
                , mids = dimension "happy" "humble" [ "stubborn" ]
                , ends = dimension "monkeys" "owls" []
                }

        myRandomizer =
            randomNameWithSpace mySpace
    in
    case msg of
        MakeNewName ->
            ( model
            , Random.generate NewName myRandomizer
            )

        NewName newName ->
            ( { model | instanceName = toString newName }
            , Cmd.none
            )
