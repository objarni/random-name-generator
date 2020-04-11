module BasicExample exposing (update)

-- This is what using Random.Name
-- would look like in parts of a
-- TEA web app, with the builtin
-- random name space


update msg model =
    case msg of
        MakeNewName ->
            ( model
            , Random.generate NewName randomName
            )

        NewName newName ->
            ( { model | instanceName = toString newName }
            , Cmd.none
            )
