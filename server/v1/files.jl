@resource files <: root begin
    :name => "files"
    :route => "files"
    :mixin => [defaultmixin]
end

include("files/file.jl")
