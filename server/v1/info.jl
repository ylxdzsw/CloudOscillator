@resource root_info <: root begin
    :name => "info"
    :route => "info"
    :mixin => [defaultmixin]

    :GET | json => let
        id = req[:query]["music"] |> unsub
        read(db["info"][id])
    end

    :POST | json => let
        id = model.new(req[:body])
        Dict(:id => id)
    end
end

