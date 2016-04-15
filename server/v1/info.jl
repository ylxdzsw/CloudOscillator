@resource root_info <: root begin
    :name => "info"
    :route => "info"
    :mixin => [defaultmixin]

    "get all infomations about a music specified by ?music=:id"
    :GET | json => let
        id = req[:query]["music"] |> unsub
        get("info/$id")
    end

    "create a new music, returns the id"
    :POST | json => let
        id = create_music(req[:body])
        Dict(:id => id)
    end
end

