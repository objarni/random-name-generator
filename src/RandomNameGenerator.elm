module RandomNameGenerator exposing (dashConcatenator)


dashConcatenator : List String -> String
dashConcatenator =
    String.join "-"
