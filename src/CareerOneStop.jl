"""
    CareerOneStop::Module

API wraper for the Career One Stop API.
"""
module CareerOneStop
    using HTTP: URI, request
    using JSON3: JSON3
    for (root, dirs, files) in walkdir(joinpath(@__DIR__))
        for file in files
            if occursin("assets", root) || isequal("CareerOneStop.jl", file)
            else
                include(joinpath(root, file))
            end
        end
    end
    export certificationfinder, skillgap
end
