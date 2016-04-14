using Restful
using HttpServer
import JSON

export json, cors

json(next, r::Resource, req, id) = begin
    req[:body] = JSON.parse(req[:body] |> ASCIIString)
    res = next(req, id)
    isa(res, Union{Dict, Vector}) ? JSON.json(res) : res
end

cors(r::Resource, req, id, res) = res.headers["Access-Control-Allow-Origin"] = "*"
