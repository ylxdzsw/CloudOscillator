@resource blobs_blob <: root_blobs begin
    :name => "blob"
    :route => "*"
    :mixin => [defaultmixin]

    :GET => begin
        db["blob/$id"] |> read
    end

    :PUT => let
        db["blob/$id"] = req[:body]
    end
end
