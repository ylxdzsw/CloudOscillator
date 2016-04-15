@resource info_star <: info begin
    :name => "star"
    :route => "star"
    :mixin => [defaultmixin]

    :GET | json => let
        id = req[:query]["music"] |> unsub
        read(db["info"][id]["star"])
    end
end
