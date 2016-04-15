using HDF5
import ..config
using ..utils

export create_music, get, set

db = h5open(config.database, isfile(config.database) ? "r+" : "w")

function get(key::ByteString)
    db[key] |> read
end

function set(key::ByteString, v)
    exists(db, key) && o_delete(db, key)
    db[key] = v
end

function set(key::ByteString, f::Function, default)
    ori = exists(db, key) ? get(key) : default
    set(key, f(ori))
end

function create_music(x::Dict)
    id = set("meta/next_id", add(1), 0) - 1
    set("meta/num_music", add(1), 0)
    set("meta/allmusic", x->push!(x,id), Int64[])

    db["info/$id/origin_filename"] = x["filename"]
    db["info/$id/name"] = splitext(x["filename"])[1]
    db["info/$id/mime"] = splitext(x["filename"])[2] |> matchmime
    db["info/$id/upload_time"] = now() |> string

    id
end
