@resource blobs_blob <: root_blobs begin
    :name => "blob"
    :route => "*"
    :mixin => [defaultmixin]

    "download a music file"
    :GET => begin
        try
            get("blob/$id")
        catch
            404
        end
    end

    "upload a new music file without any associated infomation"
    :PUT => let
        set("blob/$id", req[:body])
    end
end
