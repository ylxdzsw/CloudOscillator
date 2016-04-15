@resource info <: root begin
    :name => "info"
    :route => "info"
    :mixin => [defaultmixin]

    :GET | json => let
        id = req[:query]["music"] |> unsub
        read(db["info"][id])
    end
end

include("info/mime.jl")
