module Elm.Gen.Elm exposing (alias, aliasDeclaration, aliasExpression, aliasFile, and, append, apply, bool, caseOf, char, comment, compose, composeLeft, cons, customType, declaration, declarationImports, declarationToString, divide, equal, expose, exposeAndGroup, exposeConstructor, exposeConstructorAndGroup, expressionImports, field, file, fileWith, float, fn, fn2, fn3, fn4, fn5, functionWith, get, gt, gte, hex, id_, ifThen, int, intDivide, keep, lambda, lambda2, lambda3, lambda4, lambda5, lambdaWith, letIn, list, lt, lte, maybe, minus, moduleName_, multiply, notEqual, or, parse, pass, pipe, pipeLeft, plus, portIncoming, portOutgoing, power, question, record, skip, slash, string, toString, triple, tuple, typeField, typeVariant, unit, updateRecord, value, valueFrom, valueWith, variant, variantWith, withDocumentation, withType)

{-| 
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Elm" ]


{-| -}
aliasFile : { annotation : Type.Annotation }
aliasFile =
    { annotation = Type.named moduleName_ "File" }


{-| Build a file!

    Elm.file [ "My", "Module" ]
        [ Elm.declaration "placeholder"
            (Elm.string "a fancy string!")
        ]

-}
file : Elm.Expression -> Elm.Expression -> Elm.Expression
file arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "file"
            (Type.function
                [ Type.list Type.string
                , Type.list (Type.namedWith [ "Elm" ] "Declaration" [])
                ]
                (Type.namedWith [ "Elm" ] "File" [])
            )
        )
        [ arg1, arg2 ]


{-| -}
aliasExpression : { annotation : Type.Annotation }
aliasExpression =
    { annotation = Type.named moduleName_ "Expression" }


{-| -}
bool : Elm.Expression -> Elm.Expression
bool arg1 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "bool"
            (Type.function
                [ Type.bool ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1 ]


{-| -}
int : Elm.Expression -> Elm.Expression
int arg1 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "int"
            (Type.function
                [ Type.int ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1 ]


{-| -}
float : Elm.Expression -> Elm.Expression
float arg1 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "float"
            (Type.function
                [ Type.float ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1 ]


{-| -}
char : Elm.Expression -> Elm.Expression
char arg1 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "char"
            (Type.function
                [ Type.namedWith [ "Char" ] "Char" [] ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1 ]


{-| -}
string : Elm.Expression -> Elm.Expression
string arg1 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "string"
            (Type.function
                [ Type.string ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1 ]


{-| -}
hex : Elm.Expression -> Elm.Expression
hex arg1 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "hex"
            (Type.function
                [ Type.int ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1 ]


{-| -}
unit : Elm.Expression
unit =
    Elm.valueWith moduleName_ "unit" (Type.namedWith [ "Elm" ] "Expression" [])


{-| -}
maybe : Elm.Expression -> Elm.Expression
maybe arg1 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "maybe"
            (Type.function
                [ Type.maybe (Type.namedWith [ "Elm" ] "Expression" []) ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1 ]


{-| -}
list : Elm.Expression -> Elm.Expression
list arg1 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "list"
            (Type.function
                [ Type.list (Type.namedWith [ "Elm" ] "Expression" []) ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1 ]


{-| -}
tuple : Elm.Expression -> Elm.Expression -> Elm.Expression
tuple arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "tuple"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-| -}
triple : Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
triple arg1 arg2 arg3 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "triple"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2, arg3 ]


{-| -}
value : Elm.Expression -> Elm.Expression
value arg1 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "value"
            (Type.function
                [ Type.string ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1 ]


{-| -}
valueFrom : Elm.Expression -> Elm.Expression -> Elm.Expression
valueFrom arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "valueFrom"
            (Type.function
                [ Type.list Type.string, Type.string ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-| Add an annotation to a value.

**Note** this may not _literally_ add an annotation to the code, but will inform `elm-prefab`s type inference so that top level values can be auto-annotated.

So, for example, if we have.

    Elm.list
        [ Elm.valueWith myModule "myString" Elm.Annotation.string
        , Elm.valueWith myModule "myOtherString" Elm.Annotation.string
        ]

Then, when that list is generated, it will automatically have the type signature `List String`

-}
valueWith : Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
valueWith arg1 arg2 arg3 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "valueWith"
            (Type.function
                [ Type.list Type.string
                , Type.string
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2, arg3 ]


{-| Sometimes you may need to add a manual type annotation.

    import Elm.Annotation as Type

    Elm.value "myString"
        |> Elm.withType (Type.string)

Though be sure elm-prefab isn't already doing this automatically for you!

-}
withType : Elm.Expression -> Elm.Expression -> Elm.Expression
withType arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "withType"
            (Type.function
                [ Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-| -}
record : Elm.Expression -> Elm.Expression
record arg1 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "record"
            (Type.function
                [ Type.list (Type.namedWith [ "Elm" ] "Field" []) ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1 ]


{-| -}
field : Elm.Expression -> Elm.Expression -> Elm.Expression
field arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "field"
            (Type.function
                [ Type.string, Type.namedWith [ "Elm" ] "Expression" [] ]
                (Type.namedWith [ "Elm" ] "Field" [])
            )
        )
        [ arg1, arg2 ]


{-| -}
typeField : { annotation : Type.Annotation }
typeField =
    { annotation = Type.named moduleName_ "Field" }


{-|

    record
        |> Elm.get "field"

results in

    record.field

-}
get : Elm.Expression -> Elm.Expression -> Elm.Expression
get arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "get"
            (Type.function
                [ Type.string, Type.namedWith [ "Elm" ] "Expression" [] ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-| -}
updateRecord : Elm.Expression -> Elm.Expression -> Elm.Expression
updateRecord arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "updateRecord"
            (Type.function
                [ Type.string
                , Type.list
                    (Type.tuple
                        Type.string
                        (Type.namedWith [ "Elm" ] "Expression" [])
                    )
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-| -}
caseOf : Elm.Expression -> Elm.Expression -> Elm.Expression
caseOf arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "caseOf"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.list
                    (Type.tuple
                        (Type.namedWith [ "Elm" ] "Pattern" [])
                        (Type.namedWith [ "Elm" ] "Expression" [])
                    )
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-| A let block.

Check out `Elm.Let` to add things to it.

    import Elm.Let as Let

    Elm.letIn
        [ Let.value "one" (Elm.int 5)
        , Let.value "two" (Elm.int 10)
        ]
        (Elm.add (Elm.value "one") (Elm.value "two"))

-}
letIn : Elm.Expression -> Elm.Expression -> Elm.Expression
letIn arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "letIn"
            (Type.function
                [ Type.list (Type.namedWith [ "Elm", "Let" ] "Declaration" [])
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-|

    ifThen (Elm.bool True)
        (Elm.string "yes")
        (Elm.string "no")

    if True then
        "yes"

    else
        "no"

-}
ifThen : Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
ifThen arg1 arg2 arg3 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "ifThen"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2, arg3 ]


{-| -}
apply : Elm.Expression -> Elm.Expression -> Elm.Expression
apply arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "apply"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.list (Type.namedWith [ "Elm" ] "Expression" [])
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-| -}
lambda :
    Elm.Expression
    -> Elm.Expression
    -> (Elm.Expression -> Elm.Expression)
    -> Elm.Expression
lambda arg1 arg2 arg3 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "lambda"
            (Type.function
                [ Type.string
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.function
                    [ Type.namedWith [ "Elm" ] "Expression" [] ]
                    (Type.namedWith [ "Elm" ] "Expression" [])
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2, arg3 Elm.pass ]


{-| -}
lambda2 :
    Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
lambda2 arg1 arg2 arg3 arg4 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "lambda2"
            (Type.function
                [ Type.string
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.function
                    [ Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    ]
                    (Type.namedWith [ "Elm" ] "Expression" [])
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2, arg3, arg4 Elm.pass Elm.pass ]


{-| -}
lambda3 :
    Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> (Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
lambda3 arg1 arg2 arg3 arg4 arg5 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "lambda3"
            (Type.function
                [ Type.string
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.function
                    [ Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    ]
                    (Type.namedWith [ "Elm" ] "Expression" [])
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2, arg3, arg4, arg5 Elm.pass Elm.pass Elm.pass ]


{-| -}
lambda4 :
    Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> (Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression)
    -> Elm.Expression
lambda4 arg1 arg2 arg3 arg4 arg5 arg6 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "lambda4"
            (Type.function
                [ Type.string
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.function
                    [ Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    ]
                    (Type.namedWith [ "Elm" ] "Expression" [])
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1
        , arg2
        , arg3
        , arg4
        , arg5
        , arg6 Elm.pass Elm.pass Elm.pass Elm.pass
        ]


{-| -}
lambda5 :
    Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> (Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression)
    -> Elm.Expression
lambda5 arg1 arg2 arg3 arg4 arg5 arg6 arg7 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "lambda5"
            (Type.function
                [ Type.string
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.function
                    [ Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    ]
                    (Type.namedWith [ "Elm" ] "Expression" [])
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1
        , arg2
        , arg3
        , arg4
        , arg5
        , arg6
        , arg7 Elm.pass Elm.pass Elm.pass Elm.pass Elm.pass
        ]


{-| -}
lambdaWith : Elm.Expression -> Elm.Expression -> Elm.Expression
lambdaWith arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "lambdaWith"
            (Type.function
                [ Type.list
                    (Type.tuple
                        (Type.namedWith [ "Elm" ] "Pattern" [])
                        (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                    )
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-| -}
aliasDeclaration : { annotation : Type.Annotation }
aliasDeclaration =
    { annotation = Type.named moduleName_ "Declaration" }


{-| -}
comment : Elm.Expression -> Elm.Expression
comment arg1 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "comment"
            (Type.function
                [ Type.string ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
        )
        [ arg1 ]


{-| -}
declaration : Elm.Expression -> Elm.Expression -> Elm.Expression
declaration arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "declaration"
            (Type.function
                [ Type.string, Type.namedWith [ "Elm" ] "Expression" [] ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
        )
        [ arg1, arg2 ]


{-| Add documentation to a declaration!
-}
withDocumentation : Elm.Expression -> Elm.Expression -> Elm.Expression
withDocumentation arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "withDocumentation"
            (Type.function
                [ Type.string, Type.namedWith [ "Elm" ] "Declaration" [] ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
        )
        [ arg1, arg2 ]


{-| -}
fn :
    Elm.Expression
    -> Elm.Expression
    -> (Elm.Expression -> Elm.Expression)
    -> Elm.Expression
fn arg1 arg2 arg3 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "fn"
            (Type.function
                [ Type.string
                , Type.tuple
                    Type.string
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                , Type.function
                    [ Type.namedWith [ "Elm" ] "Expression" [] ]
                    (Type.namedWith [ "Elm" ] "Expression" [])
                ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
        )
        [ arg1, arg2, arg3 Elm.pass ]


{-| -}
fn2 :
    Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
fn2 arg1 arg2 arg3 arg4 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "fn2"
            (Type.function
                [ Type.string
                , Type.tuple
                    Type.string
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                , Type.tuple
                    Type.string
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                , Type.function
                    [ Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    ]
                    (Type.namedWith [ "Elm" ] "Expression" [])
                ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
        )
        [ arg1, arg2, arg3, arg4 Elm.pass Elm.pass ]


{-| -}
fn3 :
    Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> (Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
fn3 arg1 arg2 arg3 arg4 arg5 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "fn3"
            (Type.function
                [ Type.string
                , Type.tuple
                    Type.string
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                , Type.tuple
                    Type.string
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                , Type.tuple
                    Type.string
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                , Type.function
                    [ Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    ]
                    (Type.namedWith [ "Elm" ] "Expression" [])
                ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
        )
        [ arg1, arg2, arg3, arg4, arg5 Elm.pass Elm.pass Elm.pass ]


{-| -}
fn4 :
    Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> (Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression)
    -> Elm.Expression
fn4 arg1 arg2 arg3 arg4 arg5 arg6 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "fn4"
            (Type.function
                [ Type.string
                , Type.tuple
                    Type.string
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                , Type.tuple
                    Type.string
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                , Type.tuple
                    Type.string
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                , Type.tuple
                    Type.string
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                , Type.function
                    [ Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    ]
                    (Type.namedWith [ "Elm" ] "Expression" [])
                ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
        )
        [ arg1
        , arg2
        , arg3
        , arg4
        , arg5
        , arg6 Elm.pass Elm.pass Elm.pass Elm.pass
        ]


{-| -}
fn5 :
    Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> (Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression)
    -> Elm.Expression
fn5 arg1 arg2 arg3 arg4 arg5 arg6 arg7 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "fn5"
            (Type.function
                [ Type.string
                , Type.tuple
                    Type.string
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                , Type.tuple
                    Type.string
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                , Type.tuple
                    Type.string
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                , Type.tuple
                    Type.string
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                , Type.tuple
                    Type.string
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                , Type.function
                    [ Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    ]
                    (Type.namedWith [ "Elm" ] "Expression" [])
                ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
        )
        [ arg1
        , arg2
        , arg3
        , arg4
        , arg5
        , arg6
        , arg7 Elm.pass Elm.pass Elm.pass Elm.pass Elm.pass
        ]


{-| -}
functionWith :
    Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
functionWith arg1 arg2 arg3 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "functionWith"
            (Type.function
                [ Type.string
                , Type.list
                    (Type.tuple
                        (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                        (Type.namedWith [ "Elm" ] "Pattern" [])
                    )
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
        )
        [ arg1, arg2, arg3 ]


{-| A custom type declaration.

    Elm.customType "MyType"
        [ Elm.variant "One"
        , Elm.variantWith "Two" [ Elm.Annotation.list Elm.Annotation.string ]
        ]

Will result in

    type MyType
        = One
        | Two (List String)

-}
customType : Elm.Expression -> Elm.Expression -> Elm.Expression
customType arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "customType"
            (Type.function
                [ Type.string
                , Type.list (Type.namedWith [ "Elm" ] "Variant" [])
                ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
        )
        [ arg1, arg2 ]


{-| -}
typeVariant : { annotation : Type.Annotation }
typeVariant =
    { annotation = Type.named moduleName_ "Variant" }


{-| -}
variant : Elm.Expression -> Elm.Expression
variant arg1 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "variant"
            (Type.function
                [ Type.string ]
                (Type.namedWith [ "Elm" ] "Variant" [])
            )
        )
        [ arg1 ]


{-| -}
variantWith : Elm.Expression -> Elm.Expression -> Elm.Expression
variantWith arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "variantWith"
            (Type.function
                [ Type.string
                , Type.list
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                ]
                (Type.namedWith [ "Elm" ] "Variant" [])
            )
        )
        [ arg1, arg2 ]


{-| A custom type declaration.

    import Elm.Annotation as Type

    Elm.alias "MyAlias"
        (Type.record
            [ ( "one", Type.string )
            , ( "two", Type.int )
            , ( "three", Type.var "content" )
            ]
        )

Should result in

    type alias MyAlias content =
        { one : String
        , two : Int
        , three : content
        }

-}
alias : Elm.Expression -> Elm.Expression -> Elm.Expression
alias arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "alias"
            (Type.function
                [ Type.string
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
        )
        [ arg1, arg2 ]


{-| -}
expose : Elm.Expression -> Elm.Expression
expose arg1 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "expose"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Declaration" [] ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
        )
        [ arg1 ]


{-| -}
exposeConstructor : Elm.Expression -> Elm.Expression
exposeConstructor arg1 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "exposeConstructor"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Declaration" [] ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
        )
        [ arg1 ]


{-| -}
exposeAndGroup : Elm.Expression -> Elm.Expression -> Elm.Expression
exposeAndGroup arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "exposeAndGroup"
            (Type.function
                [ Type.string, Type.namedWith [ "Elm" ] "Declaration" [] ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
        )
        [ arg1, arg2 ]


{-| -}
exposeConstructorAndGroup : Elm.Expression -> Elm.Expression -> Elm.Expression
exposeConstructorAndGroup arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "exposeConstructorAndGroup"
            (Type.function
                [ Type.string, Type.namedWith [ "Elm" ] "Declaration" [] ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
        )
        [ arg1, arg2 ]


{-| Same as [file](#file), but you have more control over how the module comment is generated!

Pass in a function that determines how to render a `@doc` comment.

Each exposed item is grouped based on the string used in [exposeAndGroup](#exposeAndGroup)

-}
fileWith : Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
fileWith arg1 arg2 arg3 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "fileWith"
            (Type.function
                [ Type.list Type.string
                , Type.record
                    [ ( "docs"
                      , Type.function
                            [ Type.list
                                (Type.record
                                    [ ( "group", Type.maybe Type.string )
                                    , ( "members", Type.list Type.string )
                                    ]
                                )
                            ]
                            Type.string
                      )
                    , ( "aliases"
                      , Type.list
                            (Type.tuple (Type.list Type.string) Type.string)
                      )
                    ]
                , Type.list (Type.namedWith [ "Elm" ] "Declaration" [])
                ]
                (Type.namedWith [ "Elm" ] "File" [])
            )
        )
        [ arg1, arg2, arg3 ]


{-| `==`
-}
equal : Elm.Expression -> Elm.Expression -> Elm.Expression
equal arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "equal"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-| `/=`
-}
notEqual : Elm.Expression -> Elm.Expression -> Elm.Expression
notEqual arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "notEqual"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-| `++`
-}
append : Elm.Expression -> Elm.Expression -> Elm.Expression
append arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "append"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-| `::`
-}
cons : Elm.Expression -> Elm.Expression -> Elm.Expression
cons arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "cons"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-| `+`
-}
plus : Elm.Expression -> Elm.Expression -> Elm.Expression
plus arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "plus"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-| `-`
-}
minus : Elm.Expression -> Elm.Expression -> Elm.Expression
minus arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "minus"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-| `*`
-}
multiply : Elm.Expression -> Elm.Expression -> Elm.Expression
multiply arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "multiply"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-| `/`
-}
divide : Elm.Expression -> Elm.Expression -> Elm.Expression
divide arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "divide"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-| `//`
-}
intDivide : Elm.Expression -> Elm.Expression -> Elm.Expression
intDivide arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "intDivide"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-| The to-the-power-of operator `^`
-}
power : Elm.Expression -> Elm.Expression -> Elm.Expression
power arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "power"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-| `<`
-}
lt : Elm.Expression -> Elm.Expression -> Elm.Expression
lt arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "lt"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-| `>`
-}
gt : Elm.Expression -> Elm.Expression -> Elm.Expression
gt arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "gt"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-| `<=`
-}
lte : Elm.Expression -> Elm.Expression -> Elm.Expression
lte arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "lte"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-| `>=`
-}
gte : Elm.Expression -> Elm.Expression -> Elm.Expression
gte arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "gte"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-| `&&`
-}
and : Elm.Expression -> Elm.Expression -> Elm.Expression
and arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "and"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-| `||`
-}
or : Elm.Expression -> Elm.Expression -> Elm.Expression
or arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "or"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-| `|>`

    Elm.value "thang"
        |> Elm.pipe (Elm.value "thang2")
        |> Elm.pipe (Elm.value "thang3")

Results in

    thang
        |> thang2
        |> thang3

-}
pipe : Elm.Expression -> Elm.Expression -> Elm.Expression
pipe arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "pipe"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-| `<|`
-}
pipeLeft : Elm.Expression -> Elm.Expression -> Elm.Expression
pipeLeft arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "pipeLeft"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-| `>>`
-}
compose : Elm.Expression -> Elm.Expression -> Elm.Expression
compose arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "compose"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-| `<<`
-}
composeLeft : Elm.Expression -> Elm.Expression -> Elm.Expression
composeLeft arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "composeLeft"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-| used in the `elm/parser` library

`|=`

-}
keep : Elm.Expression -> Elm.Expression -> Elm.Expression
keep arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "keep"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-| `|.`
-}
skip : Elm.Expression -> Elm.Expression -> Elm.Expression
skip arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "skip"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-| `</>` used in url parsing
-}
slash : Elm.Expression -> Elm.Expression -> Elm.Expression
slash arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "slash"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-| `<?>` used in url parsing
-}
question : Elm.Expression -> Elm.Expression -> Elm.Expression
question arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "question"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
        )
        [ arg1, arg2 ]


{-|

    import Elm.Annotation as Type

    Elm.portIncoming "receiveMessageFromTheWorld"
        [ Type.string
        , Type.int
        ]

Results in

    port receiveMessageFromTheWorld :
            (String -> Int -> msg)
                -> Sub msg

**Note** You generally only need one incoming and one outgoing port!

If you want to vary the messages going in and out of your app, don't use a huge number of ports, instead write Json encoders and decoders.

This will give you more flexibility in the future and save you having to wire up a bunch of stuff.

**Another note** - You may need to expose your port explicitly using `Elm.expose`

-}
portIncoming : Elm.Expression -> Elm.Expression -> Elm.Expression
portIncoming arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "portIncoming"
            (Type.function
                [ Type.string
                , Type.list
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
        )
        [ arg1, arg2 ]


{-| Create a port that can send messages to the outside world!

    import Elm.Annotation as Type

    Elm.portOutgoing "tellTheWorld" Type.string

will generate

    port tellTheWorld : String -> Cmd msg

-}
portOutgoing : Elm.Expression -> Elm.Expression -> Elm.Expression
portOutgoing arg1 arg2 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "portOutgoing"
            (Type.function
                [ Type.string
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
        )
        [ arg1, arg2 ]


{-| -}
parse : Elm.Expression -> Elm.Expression
parse arg1 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "parse"
            (Type.function
                [ Type.string ]
                (Type.namedWith
                    [ "Result" ]
                    "Result"
                    [ Type.string
                    , Type.record
                        [ ( "declarations"
                          , Type.list
                                (Type.namedWith [ "Elm" ] "Declaration" [])
                          )
                        ]
                    ]
                )
            )
        )
        [ arg1 ]


{-| -}
toString : Elm.Expression -> Elm.Expression
toString arg1 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "toString"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" [] ]
                Type.string
            )
        )
        [ arg1 ]


{-| -}
expressionImports : Elm.Expression -> Elm.Expression
expressionImports arg1 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "expressionImports"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" [] ]
                Type.string
            )
        )
        [ arg1 ]


{-| -}
declarationToString : Elm.Expression -> Elm.Expression
declarationToString arg1 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "declarationToString"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Declaration" [] ]
                Type.string
            )
        )
        [ arg1 ]


{-| -}
declarationImports : Elm.Expression -> Elm.Expression
declarationImports arg1 =
    Elm.apply
        (Elm.valueWith
            moduleName_
            "declarationImports"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Declaration" [] ]
                Type.string
            )
        )
        [ arg1 ]


{-| -}
pass : Elm.Expression
pass =
    Elm.valueWith moduleName_ "pass" (Type.namedWith [ "Elm" ] "Expression" [])


{-| Every value/function in this module in case you need to refer to it directly. -}
id_ :
    { file : Elm.Expression
    , bool : Elm.Expression
    , int : Elm.Expression
    , float : Elm.Expression
    , char : Elm.Expression
    , string : Elm.Expression
    , hex : Elm.Expression
    , unit : Elm.Expression
    , maybe : Elm.Expression
    , list : Elm.Expression
    , tuple : Elm.Expression
    , triple : Elm.Expression
    , value : Elm.Expression
    , valueFrom : Elm.Expression
    , valueWith : Elm.Expression
    , withType : Elm.Expression
    , record : Elm.Expression
    , field : Elm.Expression
    , get : Elm.Expression
    , updateRecord : Elm.Expression
    , caseOf : Elm.Expression
    , letIn : Elm.Expression
    , ifThen : Elm.Expression
    , apply : Elm.Expression
    , lambda : Elm.Expression
    , lambda2 : Elm.Expression
    , lambda3 : Elm.Expression
    , lambda4 : Elm.Expression
    , lambda5 : Elm.Expression
    , lambdaWith : Elm.Expression
    , comment : Elm.Expression
    , declaration : Elm.Expression
    , withDocumentation : Elm.Expression
    , fn : Elm.Expression
    , fn2 : Elm.Expression
    , fn3 : Elm.Expression
    , fn4 : Elm.Expression
    , fn5 : Elm.Expression
    , functionWith : Elm.Expression
    , customType : Elm.Expression
    , variant : Elm.Expression
    , variantWith : Elm.Expression
    , alias : Elm.Expression
    , expose : Elm.Expression
    , exposeConstructor : Elm.Expression
    , exposeAndGroup : Elm.Expression
    , exposeConstructorAndGroup : Elm.Expression
    , fileWith : Elm.Expression
    , equal : Elm.Expression
    , notEqual : Elm.Expression
    , append : Elm.Expression
    , cons : Elm.Expression
    , plus : Elm.Expression
    , minus : Elm.Expression
    , multiply : Elm.Expression
    , divide : Elm.Expression
    , intDivide : Elm.Expression
    , power : Elm.Expression
    , lt : Elm.Expression
    , gt : Elm.Expression
    , lte : Elm.Expression
    , gte : Elm.Expression
    , and : Elm.Expression
    , or : Elm.Expression
    , pipe : Elm.Expression
    , pipeLeft : Elm.Expression
    , compose : Elm.Expression
    , composeLeft : Elm.Expression
    , keep : Elm.Expression
    , skip : Elm.Expression
    , slash : Elm.Expression
    , question : Elm.Expression
    , portIncoming : Elm.Expression
    , portOutgoing : Elm.Expression
    , parse : Elm.Expression
    , toString : Elm.Expression
    , expressionImports : Elm.Expression
    , declarationToString : Elm.Expression
    , declarationImports : Elm.Expression
    , pass : Elm.Expression
    }
id_ =
    { file =
        Elm.valueWith
            moduleName_
            "file"
            (Type.function
                [ Type.list Type.string
                , Type.list (Type.namedWith [ "Elm" ] "Declaration" [])
                ]
                (Type.namedWith [ "Elm" ] "File" [])
            )
    , bool =
        Elm.valueWith
            moduleName_
            "bool"
            (Type.function
                [ Type.bool ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , int =
        Elm.valueWith
            moduleName_
            "int"
            (Type.function
                [ Type.int ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , float =
        Elm.valueWith
            moduleName_
            "float"
            (Type.function
                [ Type.float ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , char =
        Elm.valueWith
            moduleName_
            "char"
            (Type.function
                [ Type.namedWith [ "Char" ] "Char" [] ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , string =
        Elm.valueWith
            moduleName_
            "string"
            (Type.function
                [ Type.string ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , hex =
        Elm.valueWith
            moduleName_
            "hex"
            (Type.function
                [ Type.int ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , unit =
        Elm.valueWith
            moduleName_
            "unit"
            (Type.namedWith [ "Elm" ] "Expression" [])
    , maybe =
        Elm.valueWith
            moduleName_
            "maybe"
            (Type.function
                [ Type.maybe (Type.namedWith [ "Elm" ] "Expression" []) ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , list =
        Elm.valueWith
            moduleName_
            "list"
            (Type.function
                [ Type.list (Type.namedWith [ "Elm" ] "Expression" []) ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , tuple =
        Elm.valueWith
            moduleName_
            "tuple"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , triple =
        Elm.valueWith
            moduleName_
            "triple"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , value =
        Elm.valueWith
            moduleName_
            "value"
            (Type.function
                [ Type.string ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , valueFrom =
        Elm.valueWith
            moduleName_
            "valueFrom"
            (Type.function
                [ Type.list Type.string, Type.string ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , valueWith =
        Elm.valueWith
            moduleName_
            "valueWith"
            (Type.function
                [ Type.list Type.string
                , Type.string
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , withType =
        Elm.valueWith
            moduleName_
            "withType"
            (Type.function
                [ Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , record =
        Elm.valueWith
            moduleName_
            "record"
            (Type.function
                [ Type.list (Type.namedWith [ "Elm" ] "Field" []) ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , field =
        Elm.valueWith
            moduleName_
            "field"
            (Type.function
                [ Type.string, Type.namedWith [ "Elm" ] "Expression" [] ]
                (Type.namedWith [ "Elm" ] "Field" [])
            )
    , get =
        Elm.valueWith
            moduleName_
            "get"
            (Type.function
                [ Type.string, Type.namedWith [ "Elm" ] "Expression" [] ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , updateRecord =
        Elm.valueWith
            moduleName_
            "updateRecord"
            (Type.function
                [ Type.string
                , Type.list
                    (Type.tuple
                        Type.string
                        (Type.namedWith [ "Elm" ] "Expression" [])
                    )
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , caseOf =
        Elm.valueWith
            moduleName_
            "caseOf"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.list
                    (Type.tuple
                        (Type.namedWith [ "Elm" ] "Pattern" [])
                        (Type.namedWith [ "Elm" ] "Expression" [])
                    )
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , letIn =
        Elm.valueWith
            moduleName_
            "letIn"
            (Type.function
                [ Type.list (Type.namedWith [ "Elm", "Let" ] "Declaration" [])
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , ifThen =
        Elm.valueWith
            moduleName_
            "ifThen"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , apply =
        Elm.valueWith
            moduleName_
            "apply"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.list (Type.namedWith [ "Elm" ] "Expression" [])
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , lambda =
        Elm.valueWith
            moduleName_
            "lambda"
            (Type.function
                [ Type.string
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.function
                    [ Type.namedWith [ "Elm" ] "Expression" [] ]
                    (Type.namedWith [ "Elm" ] "Expression" [])
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , lambda2 =
        Elm.valueWith
            moduleName_
            "lambda2"
            (Type.function
                [ Type.string
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.function
                    [ Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    ]
                    (Type.namedWith [ "Elm" ] "Expression" [])
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , lambda3 =
        Elm.valueWith
            moduleName_
            "lambda3"
            (Type.function
                [ Type.string
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.function
                    [ Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    ]
                    (Type.namedWith [ "Elm" ] "Expression" [])
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , lambda4 =
        Elm.valueWith
            moduleName_
            "lambda4"
            (Type.function
                [ Type.string
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.function
                    [ Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    ]
                    (Type.namedWith [ "Elm" ] "Expression" [])
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , lambda5 =
        Elm.valueWith
            moduleName_
            "lambda5"
            (Type.function
                [ Type.string
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                , Type.function
                    [ Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    ]
                    (Type.namedWith [ "Elm" ] "Expression" [])
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , lambdaWith =
        Elm.valueWith
            moduleName_
            "lambdaWith"
            (Type.function
                [ Type.list
                    (Type.tuple
                        (Type.namedWith [ "Elm" ] "Pattern" [])
                        (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                    )
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , comment =
        Elm.valueWith
            moduleName_
            "comment"
            (Type.function
                [ Type.string ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
    , declaration =
        Elm.valueWith
            moduleName_
            "declaration"
            (Type.function
                [ Type.string, Type.namedWith [ "Elm" ] "Expression" [] ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
    , withDocumentation =
        Elm.valueWith
            moduleName_
            "withDocumentation"
            (Type.function
                [ Type.string, Type.namedWith [ "Elm" ] "Declaration" [] ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
    , fn =
        Elm.valueWith
            moduleName_
            "fn"
            (Type.function
                [ Type.string
                , Type.tuple
                    Type.string
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                , Type.function
                    [ Type.namedWith [ "Elm" ] "Expression" [] ]
                    (Type.namedWith [ "Elm" ] "Expression" [])
                ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
    , fn2 =
        Elm.valueWith
            moduleName_
            "fn2"
            (Type.function
                [ Type.string
                , Type.tuple
                    Type.string
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                , Type.tuple
                    Type.string
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                , Type.function
                    [ Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    ]
                    (Type.namedWith [ "Elm" ] "Expression" [])
                ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
    , fn3 =
        Elm.valueWith
            moduleName_
            "fn3"
            (Type.function
                [ Type.string
                , Type.tuple
                    Type.string
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                , Type.tuple
                    Type.string
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                , Type.tuple
                    Type.string
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                , Type.function
                    [ Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    ]
                    (Type.namedWith [ "Elm" ] "Expression" [])
                ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
    , fn4 =
        Elm.valueWith
            moduleName_
            "fn4"
            (Type.function
                [ Type.string
                , Type.tuple
                    Type.string
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                , Type.tuple
                    Type.string
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                , Type.tuple
                    Type.string
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                , Type.tuple
                    Type.string
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                , Type.function
                    [ Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    ]
                    (Type.namedWith [ "Elm" ] "Expression" [])
                ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
    , fn5 =
        Elm.valueWith
            moduleName_
            "fn5"
            (Type.function
                [ Type.string
                , Type.tuple
                    Type.string
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                , Type.tuple
                    Type.string
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                , Type.tuple
                    Type.string
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                , Type.tuple
                    Type.string
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                , Type.tuple
                    Type.string
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                , Type.function
                    [ Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    , Type.namedWith [ "Elm" ] "Expression" []
                    ]
                    (Type.namedWith [ "Elm" ] "Expression" [])
                ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
    , functionWith =
        Elm.valueWith
            moduleName_
            "functionWith"
            (Type.function
                [ Type.string
                , Type.list
                    (Type.tuple
                        (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                        (Type.namedWith [ "Elm" ] "Pattern" [])
                    )
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
    , customType =
        Elm.valueWith
            moduleName_
            "customType"
            (Type.function
                [ Type.string
                , Type.list (Type.namedWith [ "Elm" ] "Variant" [])
                ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
    , variant =
        Elm.valueWith
            moduleName_
            "variant"
            (Type.function
                [ Type.string ]
                (Type.namedWith [ "Elm" ] "Variant" [])
            )
    , variantWith =
        Elm.valueWith
            moduleName_
            "variantWith"
            (Type.function
                [ Type.string
                , Type.list
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                ]
                (Type.namedWith [ "Elm" ] "Variant" [])
            )
    , alias =
        Elm.valueWith
            moduleName_
            "alias"
            (Type.function
                [ Type.string
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
    , expose =
        Elm.valueWith
            moduleName_
            "expose"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Declaration" [] ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
    , exposeConstructor =
        Elm.valueWith
            moduleName_
            "exposeConstructor"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Declaration" [] ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
    , exposeAndGroup =
        Elm.valueWith
            moduleName_
            "exposeAndGroup"
            (Type.function
                [ Type.string, Type.namedWith [ "Elm" ] "Declaration" [] ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
    , exposeConstructorAndGroup =
        Elm.valueWith
            moduleName_
            "exposeConstructorAndGroup"
            (Type.function
                [ Type.string, Type.namedWith [ "Elm" ] "Declaration" [] ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
    , fileWith =
        Elm.valueWith
            moduleName_
            "fileWith"
            (Type.function
                [ Type.list Type.string
                , Type.record
                    [ ( "docs"
                      , Type.function
                            [ Type.list
                                (Type.record
                                    [ ( "group", Type.maybe Type.string )
                                    , ( "members", Type.list Type.string )
                                    ]
                                )
                            ]
                            Type.string
                      )
                    , ( "aliases"
                      , Type.list
                            (Type.tuple (Type.list Type.string) Type.string)
                      )
                    ]
                , Type.list (Type.namedWith [ "Elm" ] "Declaration" [])
                ]
                (Type.namedWith [ "Elm" ] "File" [])
            )
    , equal =
        Elm.valueWith
            moduleName_
            "equal"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , notEqual =
        Elm.valueWith
            moduleName_
            "notEqual"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , append =
        Elm.valueWith
            moduleName_
            "append"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , cons =
        Elm.valueWith
            moduleName_
            "cons"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , plus =
        Elm.valueWith
            moduleName_
            "plus"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , minus =
        Elm.valueWith
            moduleName_
            "minus"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , multiply =
        Elm.valueWith
            moduleName_
            "multiply"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , divide =
        Elm.valueWith
            moduleName_
            "divide"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , intDivide =
        Elm.valueWith
            moduleName_
            "intDivide"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , power =
        Elm.valueWith
            moduleName_
            "power"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , lt =
        Elm.valueWith
            moduleName_
            "lt"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , gt =
        Elm.valueWith
            moduleName_
            "gt"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , lte =
        Elm.valueWith
            moduleName_
            "lte"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , gte =
        Elm.valueWith
            moduleName_
            "gte"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , and =
        Elm.valueWith
            moduleName_
            "and"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , or =
        Elm.valueWith
            moduleName_
            "or"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , pipe =
        Elm.valueWith
            moduleName_
            "pipe"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , pipeLeft =
        Elm.valueWith
            moduleName_
            "pipeLeft"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , compose =
        Elm.valueWith
            moduleName_
            "compose"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , composeLeft =
        Elm.valueWith
            moduleName_
            "composeLeft"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , keep =
        Elm.valueWith
            moduleName_
            "keep"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , skip =
        Elm.valueWith
            moduleName_
            "skip"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , slash =
        Elm.valueWith
            moduleName_
            "slash"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , question =
        Elm.valueWith
            moduleName_
            "question"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" []
                , Type.namedWith [ "Elm" ] "Expression" []
                ]
                (Type.namedWith [ "Elm" ] "Expression" [])
            )
    , portIncoming =
        Elm.valueWith
            moduleName_
            "portIncoming"
            (Type.function
                [ Type.string
                , Type.list
                    (Type.namedWith [ "Elm", "Annotation" ] "Annotation" [])
                ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
    , portOutgoing =
        Elm.valueWith
            moduleName_
            "portOutgoing"
            (Type.function
                [ Type.string
                , Type.namedWith [ "Elm", "Annotation" ] "Annotation" []
                ]
                (Type.namedWith [ "Elm" ] "Declaration" [])
            )
    , parse =
        Elm.valueWith
            moduleName_
            "parse"
            (Type.function
                [ Type.string ]
                (Type.namedWith
                    [ "Result" ]
                    "Result"
                    [ Type.string
                    , Type.record
                        [ ( "declarations"
                          , Type.list
                                (Type.namedWith [ "Elm" ] "Declaration" [])
                          )
                        ]
                    ]
                )
            )
    , toString =
        Elm.valueWith
            moduleName_
            "toString"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" [] ]
                Type.string
            )
    , expressionImports =
        Elm.valueWith
            moduleName_
            "expressionImports"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Expression" [] ]
                Type.string
            )
    , declarationToString =
        Elm.valueWith
            moduleName_
            "declarationToString"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Declaration" [] ]
                Type.string
            )
    , declarationImports =
        Elm.valueWith
            moduleName_
            "declarationImports"
            (Type.function
                [ Type.namedWith [ "Elm" ] "Declaration" [] ]
                Type.string
            )
    , pass =
        Elm.valueWith
            moduleName_
            "pass"
            (Type.namedWith [ "Elm" ] "Expression" [])
    }

