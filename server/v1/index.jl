using Restful
using HttpServer
using HDF5
using ..config
using ..utils

@resource root begin
    :name => "v1"
    :route => "v1"
    :onreturn => [cors]
    :mixin => [defaultmixin]
end

include("files.jl")
