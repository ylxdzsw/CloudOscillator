@resource root_blobs <: root begin
    :name => "blobs"
    :route => "blobs"
    :mixin => [defaultmixin]
end

include("blobs/blob.jl")
