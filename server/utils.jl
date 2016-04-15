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
    ACAM = "Access-Control-Allow-Method"
    res.headers[ACAO] = "*"
    if haskey(req[:headers], ACRH)
        res.headers[ACAH] = req[:headers][ACRH]
    end
    if haskey(req[:headers], ACRM)
        res.headers[ACAM] = req[:headers][ACRM]
    end
end

export unsub

unsub{T}(x::SubString{T}) = T(x)
