using Restful
using HttpServer

module config include("config.jl") end
module utils  include("utils.jl") end
module v1     include("v1/index.jl") end

@resource cloudoscillator begin
    :name => "CloudOscillator"
end

Restful.addsubresource!(cloudoscillator, v1.root)

@async run(Server(cloudoscillator), host=config.host, port=config.port)

