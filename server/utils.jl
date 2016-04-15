using Restful
using HttpServer
import JSON

export json, cors

json(next, r::Resource, req, id) = begin
    req[:body] = JSON.parse(req[:body] |> UTF8String)
    res = next(req, id)
    isa(res, Union{Dict, Vector}) || return res
    res = res |> JSON.json |> Response
    res.headers["Content-Type"] = "application/json"
    res
end

cors(r::Resource, req, id, res) = begin
    ACAO = "Access-Control-Allow-Origin"
    ACRH = "Access-Control-Request-Headers"
    ACAH = "Access-Control-Allow-Headers"
    ACRM = "Access-Control-Request-Method"
    ACAM = "Access-Control-Allow-Methods"
    res.headers[ACAO] = "*"
    if haskey(req[:headers], ACRH)
        res.headers[ACAH] = req[:headers][ACRH]
    end
    if haskey(req[:headers], ACRM)
        res.headers[ACAM] = req[:headers][ACRM]
    end
end

export unsub, add

unsub{T}(x::SubString{T}) = T(x)

add(i) = x -> x + i

export matchmime

mimedict = Dict(".mp3" => "audio/mpeg",
                ".wma" => "audio/x-ms-wma",
                ".ogg" => "audio/ogg",
                ".oga" => "audio/ogg",
                ".ra"  => "audio/x-pn-realaudio",
                ".midi"=> "audio/midi",
                ".mid" => "audio/midi",
                ".aac" => "audio/x-aac",
                ".flac"=> "audio/x-flac",
                ".wav" => "audio/x-wav")
matchmime(ext) = haskey(mimedict, ext) ? mimedict[ext] : ""
