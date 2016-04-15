using HDF5
import ..config

export db, read

function init()
    db = h5open(config.database, "w")
    db["meta/num_music"] = 0
    db["meta/next_id"]   = 0
    db["meta/allmusic"]  = ASCIIString[]
end

db = isfile(config.database) ? h5open(config.database, "r+") : init()

function new(x::Dict)
    id = db["meta/next_id"] |> read
    o_delete(db, "meta/next_id")
    db["meta/next_id"] = id + 1
    id
end
