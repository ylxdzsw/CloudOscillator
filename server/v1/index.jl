using Restful
using HttpServer
using HDF5
using ..config
using ..utils

db = h5open("../pool/metadata.h5", "r+")

@resource root begin
    :name => "v1"
    :route => "v1"
    :onreturn => [cors]
    :mixin => [defaultmixin]
end

include("files.jl")
include("info.jl")
