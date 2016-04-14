@resource file <: files begin
    :name => "file"
    :route => "*"
    :mixin => [defaultmixin]

    :GET => begin
        open(joinpath(filesdir, id)) do fin
            readbytes(fin)
        end
    end
end
