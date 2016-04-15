using Restful
using HttpServer
import ..config
using ..model
using ..utils

@resource root begin
    :name => "v1"
    :route => "v1"
    :onreturn => [cors]
    :mixin => [defaultmixin]
end

include("blobs.jl")
include("info.jl")
